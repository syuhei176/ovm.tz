#include "../types/ovm_event_types.ligo"
#include "../models/emit_event.ligo"

function submit_action (const submit_params: submit_params; const s: ovm_storage) : context is
begin
  const l2_block_number: nat = submit_params.block_number;
  const root: string = submit_params.root;

  // Validation
  if source =/= s.operator_address then failwith("source should be registered operator address") else skip;
  if l2_block_number =/= s.current_block + 1n then failwith("block_number should be next block") else skip;


  // State Update
  s.commitments[l2_block_number] := root;
  s.current_block := l2_block_number;

  // Event
  const submitted_event: event_params = SubmittedEvent((
    l2_block_number,
    root
  ));

  s.events_storage := emit_event(s.events_storage, "BlockSubmitted", submitted_event);
end with ((nil : list(operation)), s)
