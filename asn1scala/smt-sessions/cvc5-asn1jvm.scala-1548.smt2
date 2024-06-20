; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43506 () Bool)

(assert start!43506)

(declare-fun b!205526 () Bool)

(declare-fun res!172292 () Bool)

(declare-fun e!140624 () Bool)

(assert (=> b!205526 (=> (not res!172292) (not e!140624))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!205526 (= res!172292 (not (= i!590 nBits!348)))))

(declare-fun b!205527 () Bool)

(declare-fun e!140627 () Bool)

(declare-datatypes ((array!10364 0))(
  ( (array!10365 (arr!5485 (Array (_ BitVec 32) (_ BitVec 8))) (size!4555 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8218 0))(
  ( (BitStream!8219 (buf!5060 array!10364) (currentByte!9569 (_ BitVec 32)) (currentBit!9564 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!17564 0))(
  ( (tuple2!17565 (_1!9437 BitStream!8218) (_2!9437 Bool)) )
))
(declare-fun lt!321111 () tuple2!17564)

(declare-fun lt!321110 () tuple2!17564)

(assert (=> b!205527 (= e!140627 (= (_2!9437 lt!321111) (_2!9437 lt!321110)))))

(declare-fun b!205528 () Bool)

(declare-fun e!140625 () Bool)

(declare-fun lt!321101 () tuple2!17564)

(declare-fun lt!321105 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!205528 (= e!140625 (= (bitIndex!0 (size!4555 (buf!5060 (_1!9437 lt!321101))) (currentByte!9569 (_1!9437 lt!321101)) (currentBit!9564 (_1!9437 lt!321101))) lt!321105))))

(declare-fun b!205529 () Bool)

(declare-fun e!140631 () Bool)

(assert (=> b!205529 (= e!140624 (not e!140631))))

(declare-fun res!172285 () Bool)

(assert (=> b!205529 (=> res!172285 e!140631)))

(declare-fun lt!321107 () (_ BitVec 64))

(declare-fun lt!321098 () (_ BitVec 64))

(assert (=> b!205529 (= res!172285 (not (= lt!321107 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!321098))))))

(declare-datatypes ((Unit!14667 0))(
  ( (Unit!14668) )
))
(declare-datatypes ((tuple2!17566 0))(
  ( (tuple2!17567 (_1!9438 Unit!14667) (_2!9438 BitStream!8218)) )
))
(declare-fun lt!321104 () tuple2!17566)

(assert (=> b!205529 (= lt!321107 (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321104))) (currentByte!9569 (_2!9438 lt!321104)) (currentBit!9564 (_2!9438 lt!321104))))))

(declare-fun thiss!1204 () BitStream!8218)

(assert (=> b!205529 (= lt!321098 (bitIndex!0 (size!4555 (buf!5060 thiss!1204)) (currentByte!9569 thiss!1204) (currentBit!9564 thiss!1204)))))

(declare-fun e!140629 () Bool)

(assert (=> b!205529 e!140629))

(declare-fun res!172282 () Bool)

(assert (=> b!205529 (=> (not res!172282) (not e!140629))))

(assert (=> b!205529 (= res!172282 (= (size!4555 (buf!5060 thiss!1204)) (size!4555 (buf!5060 (_2!9438 lt!321104)))))))

(declare-fun lt!321112 () Bool)

(declare-fun appendBit!0 (BitStream!8218 Bool) tuple2!17566)

(assert (=> b!205529 (= lt!321104 (appendBit!0 thiss!1204 lt!321112))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!205529 (= lt!321112 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!205530 () Bool)

(declare-fun e!140630 () Bool)

(declare-datatypes ((tuple2!17568 0))(
  ( (tuple2!17569 (_1!9439 BitStream!8218) (_2!9439 BitStream!8218)) )
))
(declare-fun lt!321113 () tuple2!17568)

(declare-fun readBitPure!0 (BitStream!8218) tuple2!17564)

(assert (=> b!205530 (= e!140630 (= (_2!9437 (readBitPure!0 (_1!9439 lt!321113))) lt!321112))))

(declare-fun lt!321103 () tuple2!17568)

(declare-fun lt!321108 () tuple2!17566)

(declare-fun reader!0 (BitStream!8218 BitStream!8218) tuple2!17568)

(assert (=> b!205530 (= lt!321103 (reader!0 (_2!9438 lt!321104) (_2!9438 lt!321108)))))

(assert (=> b!205530 (= lt!321113 (reader!0 thiss!1204 (_2!9438 lt!321108)))))

(assert (=> b!205530 e!140627))

(declare-fun res!172279 () Bool)

(assert (=> b!205530 (=> (not res!172279) (not e!140627))))

(assert (=> b!205530 (= res!172279 (= (bitIndex!0 (size!4555 (buf!5060 (_1!9437 lt!321111))) (currentByte!9569 (_1!9437 lt!321111)) (currentBit!9564 (_1!9437 lt!321111))) (bitIndex!0 (size!4555 (buf!5060 (_1!9437 lt!321110))) (currentByte!9569 (_1!9437 lt!321110)) (currentBit!9564 (_1!9437 lt!321110)))))))

(declare-fun lt!321106 () Unit!14667)

(declare-fun lt!321099 () BitStream!8218)

(declare-fun readBitPrefixLemma!0 (BitStream!8218 BitStream!8218) Unit!14667)

(assert (=> b!205530 (= lt!321106 (readBitPrefixLemma!0 lt!321099 (_2!9438 lt!321108)))))

(assert (=> b!205530 (= lt!321110 (readBitPure!0 (BitStream!8219 (buf!5060 (_2!9438 lt!321108)) (currentByte!9569 thiss!1204) (currentBit!9564 thiss!1204))))))

(assert (=> b!205530 (= lt!321111 (readBitPure!0 lt!321099))))

(declare-fun e!140626 () Bool)

(assert (=> b!205530 e!140626))

(declare-fun res!172289 () Bool)

(assert (=> b!205530 (=> (not res!172289) (not e!140626))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!205530 (= res!172289 (invariant!0 (currentBit!9564 thiss!1204) (currentByte!9569 thiss!1204) (size!4555 (buf!5060 (_2!9438 lt!321104)))))))

(assert (=> b!205530 (= lt!321099 (BitStream!8219 (buf!5060 (_2!9438 lt!321104)) (currentByte!9569 thiss!1204) (currentBit!9564 thiss!1204)))))

(declare-fun b!205531 () Bool)

(declare-fun res!172290 () Bool)

(assert (=> b!205531 (=> res!172290 e!140630)))

(declare-fun lt!321109 () (_ BitVec 64))

(assert (=> b!205531 (= res!172290 (or (not (= (size!4555 (buf!5060 (_2!9438 lt!321108))) (size!4555 (buf!5060 thiss!1204)))) (not (= lt!321109 (bvsub (bvadd lt!321098 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun res!172280 () Bool)

(assert (=> start!43506 (=> (not res!172280) (not e!140624))))

(assert (=> start!43506 (= res!172280 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43506 e!140624))

(assert (=> start!43506 true))

(declare-fun e!140623 () Bool)

(declare-fun inv!12 (BitStream!8218) Bool)

(assert (=> start!43506 (and (inv!12 thiss!1204) e!140623)))

(declare-fun b!205532 () Bool)

(declare-fun res!172278 () Bool)

(assert (=> b!205532 (=> res!172278 e!140630)))

(declare-fun isPrefixOf!0 (BitStream!8218 BitStream!8218) Bool)

(assert (=> b!205532 (= res!172278 (not (isPrefixOf!0 (_2!9438 lt!321104) (_2!9438 lt!321108))))))

(declare-fun b!205533 () Bool)

(declare-fun e!140628 () Bool)

(assert (=> b!205533 (= e!140629 e!140628)))

(declare-fun res!172284 () Bool)

(assert (=> b!205533 (=> (not res!172284) (not e!140628))))

(declare-fun lt!321102 () (_ BitVec 64))

(assert (=> b!205533 (= res!172284 (= lt!321105 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!321102)))))

(assert (=> b!205533 (= lt!321105 (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321104))) (currentByte!9569 (_2!9438 lt!321104)) (currentBit!9564 (_2!9438 lt!321104))))))

(assert (=> b!205533 (= lt!321102 (bitIndex!0 (size!4555 (buf!5060 thiss!1204)) (currentByte!9569 thiss!1204) (currentBit!9564 thiss!1204)))))

(declare-fun b!205534 () Bool)

(declare-fun res!172291 () Bool)

(assert (=> b!205534 (=> (not res!172291) (not e!140624))))

(assert (=> b!205534 (= res!172291 (invariant!0 (currentBit!9564 thiss!1204) (currentByte!9569 thiss!1204) (size!4555 (buf!5060 thiss!1204))))))

(declare-fun b!205535 () Bool)

(declare-fun res!172286 () Bool)

(assert (=> b!205535 (=> (not res!172286) (not e!140624))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!205535 (= res!172286 (validate_offset_bits!1 ((_ sign_extend 32) (size!4555 (buf!5060 thiss!1204))) ((_ sign_extend 32) (currentByte!9569 thiss!1204)) ((_ sign_extend 32) (currentBit!9564 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!205536 () Bool)

(declare-fun res!172283 () Bool)

(assert (=> b!205536 (=> res!172283 e!140630)))

(assert (=> b!205536 (= res!172283 (not (isPrefixOf!0 thiss!1204 (_2!9438 lt!321104))))))

(declare-fun b!205537 () Bool)

(declare-fun array_inv!4296 (array!10364) Bool)

(assert (=> b!205537 (= e!140623 (array_inv!4296 (buf!5060 thiss!1204)))))

(declare-fun b!205538 () Bool)

(declare-fun res!172288 () Bool)

(assert (=> b!205538 (=> res!172288 e!140630)))

(assert (=> b!205538 (= res!172288 (not (invariant!0 (currentBit!9564 (_2!9438 lt!321108)) (currentByte!9569 (_2!9438 lt!321108)) (size!4555 (buf!5060 (_2!9438 lt!321108))))))))

(declare-fun b!205539 () Bool)

(assert (=> b!205539 (= e!140628 e!140625)))

(declare-fun res!172277 () Bool)

(assert (=> b!205539 (=> (not res!172277) (not e!140625))))

(assert (=> b!205539 (= res!172277 (and (= (_2!9437 lt!321101) lt!321112) (= (_1!9437 lt!321101) (_2!9438 lt!321104))))))

(declare-fun readerFrom!0 (BitStream!8218 (_ BitVec 32) (_ BitVec 32)) BitStream!8218)

(assert (=> b!205539 (= lt!321101 (readBitPure!0 (readerFrom!0 (_2!9438 lt!321104) (currentBit!9564 thiss!1204) (currentByte!9569 thiss!1204))))))

(declare-fun b!205540 () Bool)

(assert (=> b!205540 (= e!140626 (invariant!0 (currentBit!9564 thiss!1204) (currentByte!9569 thiss!1204) (size!4555 (buf!5060 (_2!9438 lt!321108)))))))

(declare-fun b!205541 () Bool)

(assert (=> b!205541 (= e!140631 e!140630)))

(declare-fun res!172287 () Bool)

(assert (=> b!205541 (=> res!172287 e!140630)))

(assert (=> b!205541 (= res!172287 (not (= lt!321109 (bvsub (bvsub (bvadd lt!321107 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!205541 (= lt!321109 (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321108))) (currentByte!9569 (_2!9438 lt!321108)) (currentBit!9564 (_2!9438 lt!321108))))))

(assert (=> b!205541 (isPrefixOf!0 thiss!1204 (_2!9438 lt!321108))))

(declare-fun lt!321100 () Unit!14667)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8218 BitStream!8218 BitStream!8218) Unit!14667)

(assert (=> b!205541 (= lt!321100 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9438 lt!321104) (_2!9438 lt!321108)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8218 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17566)

(assert (=> b!205541 (= lt!321108 (appendBitsLSBFirstLoopTR!0 (_2!9438 lt!321104) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!205542 () Bool)

(declare-fun res!172281 () Bool)

(assert (=> b!205542 (=> (not res!172281) (not e!140628))))

(assert (=> b!205542 (= res!172281 (isPrefixOf!0 thiss!1204 (_2!9438 lt!321104)))))

(assert (= (and start!43506 res!172280) b!205535))

(assert (= (and b!205535 res!172286) b!205534))

(assert (= (and b!205534 res!172291) b!205526))

(assert (= (and b!205526 res!172292) b!205529))

(assert (= (and b!205529 res!172282) b!205533))

(assert (= (and b!205533 res!172284) b!205542))

(assert (= (and b!205542 res!172281) b!205539))

(assert (= (and b!205539 res!172277) b!205528))

(assert (= (and b!205529 (not res!172285)) b!205541))

(assert (= (and b!205541 (not res!172287)) b!205538))

(assert (= (and b!205538 (not res!172288)) b!205531))

(assert (= (and b!205531 (not res!172290)) b!205532))

(assert (= (and b!205532 (not res!172278)) b!205536))

(assert (= (and b!205536 (not res!172283)) b!205530))

(assert (= (and b!205530 res!172289) b!205540))

(assert (= (and b!205530 res!172279) b!205527))

(assert (= start!43506 b!205537))

(declare-fun m!316785 () Bool)

(assert (=> b!205542 m!316785))

(declare-fun m!316787 () Bool)

(assert (=> b!205534 m!316787))

(assert (=> b!205536 m!316785))

(declare-fun m!316789 () Bool)

(assert (=> b!205528 m!316789))

(declare-fun m!316791 () Bool)

(assert (=> b!205535 m!316791))

(declare-fun m!316793 () Bool)

(assert (=> b!205532 m!316793))

(declare-fun m!316795 () Bool)

(assert (=> b!205538 m!316795))

(declare-fun m!316797 () Bool)

(assert (=> b!205533 m!316797))

(declare-fun m!316799 () Bool)

(assert (=> b!205533 m!316799))

(declare-fun m!316801 () Bool)

(assert (=> b!205530 m!316801))

(declare-fun m!316803 () Bool)

(assert (=> b!205530 m!316803))

(declare-fun m!316805 () Bool)

(assert (=> b!205530 m!316805))

(declare-fun m!316807 () Bool)

(assert (=> b!205530 m!316807))

(declare-fun m!316809 () Bool)

(assert (=> b!205530 m!316809))

(declare-fun m!316811 () Bool)

(assert (=> b!205530 m!316811))

(declare-fun m!316813 () Bool)

(assert (=> b!205530 m!316813))

(declare-fun m!316815 () Bool)

(assert (=> b!205530 m!316815))

(declare-fun m!316817 () Bool)

(assert (=> b!205530 m!316817))

(declare-fun m!316819 () Bool)

(assert (=> start!43506 m!316819))

(assert (=> b!205529 m!316797))

(assert (=> b!205529 m!316799))

(declare-fun m!316821 () Bool)

(assert (=> b!205529 m!316821))

(declare-fun m!316823 () Bool)

(assert (=> b!205541 m!316823))

(declare-fun m!316825 () Bool)

(assert (=> b!205541 m!316825))

(declare-fun m!316827 () Bool)

(assert (=> b!205541 m!316827))

(declare-fun m!316829 () Bool)

(assert (=> b!205541 m!316829))

(declare-fun m!316831 () Bool)

(assert (=> b!205537 m!316831))

(declare-fun m!316833 () Bool)

(assert (=> b!205540 m!316833))

(declare-fun m!316835 () Bool)

(assert (=> b!205539 m!316835))

(assert (=> b!205539 m!316835))

(declare-fun m!316837 () Bool)

(assert (=> b!205539 m!316837))

(push 1)

(assert (not b!205532))

(assert (not b!205536))

(assert (not b!205533))

(assert (not start!43506))

(assert (not b!205542))

(assert (not b!205539))

(assert (not b!205540))

(assert (not b!205534))

(assert (not b!205530))

(assert (not b!205529))

(assert (not b!205528))

(assert (not b!205541))

(assert (not b!205535))

(assert (not b!205537))

(assert (not b!205538))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!70039 () Bool)

(declare-fun e!140728 () Bool)

(assert (=> d!70039 e!140728))

(declare-fun res!172450 () Bool)

(assert (=> d!70039 (=> (not res!172450) (not e!140728))))

(declare-fun lt!321377 () (_ BitVec 64))

(declare-fun lt!321378 () (_ BitVec 64))

(declare-fun lt!321379 () (_ BitVec 64))

(assert (=> d!70039 (= res!172450 (= lt!321379 (bvsub lt!321377 lt!321378)))))

(assert (=> d!70039 (or (= (bvand lt!321377 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!321378 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!321377 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!321377 lt!321378) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!70039 (= lt!321378 (remainingBits!0 ((_ sign_extend 32) (size!4555 (buf!5060 (_2!9438 lt!321104)))) ((_ sign_extend 32) (currentByte!9569 (_2!9438 lt!321104))) ((_ sign_extend 32) (currentBit!9564 (_2!9438 lt!321104)))))))

(declare-fun lt!321381 () (_ BitVec 64))

(declare-fun lt!321376 () (_ BitVec 64))

(assert (=> d!70039 (= lt!321377 (bvmul lt!321381 lt!321376))))

(assert (=> d!70039 (or (= lt!321381 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!321376 (bvsdiv (bvmul lt!321381 lt!321376) lt!321381)))))

(assert (=> d!70039 (= lt!321376 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70039 (= lt!321381 ((_ sign_extend 32) (size!4555 (buf!5060 (_2!9438 lt!321104)))))))

(assert (=> d!70039 (= lt!321379 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9569 (_2!9438 lt!321104))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9564 (_2!9438 lt!321104)))))))

(assert (=> d!70039 (invariant!0 (currentBit!9564 (_2!9438 lt!321104)) (currentByte!9569 (_2!9438 lt!321104)) (size!4555 (buf!5060 (_2!9438 lt!321104))))))

(assert (=> d!70039 (= (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321104))) (currentByte!9569 (_2!9438 lt!321104)) (currentBit!9564 (_2!9438 lt!321104))) lt!321379)))

(declare-fun b!205714 () Bool)

(declare-fun res!172449 () Bool)

(assert (=> b!205714 (=> (not res!172449) (not e!140728))))

(assert (=> b!205714 (= res!172449 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!321379))))

(declare-fun b!205715 () Bool)

(declare-fun lt!321380 () (_ BitVec 64))

(assert (=> b!205715 (= e!140728 (bvsle lt!321379 (bvmul lt!321380 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205715 (or (= lt!321380 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!321380 #b0000000000000000000000000000000000000000000000000000000000001000) lt!321380)))))

(assert (=> b!205715 (= lt!321380 ((_ sign_extend 32) (size!4555 (buf!5060 (_2!9438 lt!321104)))))))

(assert (= (and d!70039 res!172450) b!205714))

(assert (= (and b!205714 res!172449) b!205715))

(declare-fun m!317057 () Bool)

(assert (=> d!70039 m!317057))

(declare-fun m!317059 () Bool)

(assert (=> d!70039 m!317059))

(assert (=> b!205533 d!70039))

(declare-fun d!70041 () Bool)

(declare-fun e!140729 () Bool)

(assert (=> d!70041 e!140729))

(declare-fun res!172452 () Bool)

(assert (=> d!70041 (=> (not res!172452) (not e!140729))))

(declare-fun lt!321384 () (_ BitVec 64))

(declare-fun lt!321385 () (_ BitVec 64))

(declare-fun lt!321383 () (_ BitVec 64))

(assert (=> d!70041 (= res!172452 (= lt!321385 (bvsub lt!321383 lt!321384)))))

(assert (=> d!70041 (or (= (bvand lt!321383 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!321384 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!321383 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!321383 lt!321384) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70041 (= lt!321384 (remainingBits!0 ((_ sign_extend 32) (size!4555 (buf!5060 thiss!1204))) ((_ sign_extend 32) (currentByte!9569 thiss!1204)) ((_ sign_extend 32) (currentBit!9564 thiss!1204))))))

(declare-fun lt!321387 () (_ BitVec 64))

(declare-fun lt!321382 () (_ BitVec 64))

(assert (=> d!70041 (= lt!321383 (bvmul lt!321387 lt!321382))))

(assert (=> d!70041 (or (= lt!321387 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!321382 (bvsdiv (bvmul lt!321387 lt!321382) lt!321387)))))

(assert (=> d!70041 (= lt!321382 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70041 (= lt!321387 ((_ sign_extend 32) (size!4555 (buf!5060 thiss!1204))))))

(assert (=> d!70041 (= lt!321385 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9569 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9564 thiss!1204))))))

(assert (=> d!70041 (invariant!0 (currentBit!9564 thiss!1204) (currentByte!9569 thiss!1204) (size!4555 (buf!5060 thiss!1204)))))

(assert (=> d!70041 (= (bitIndex!0 (size!4555 (buf!5060 thiss!1204)) (currentByte!9569 thiss!1204) (currentBit!9564 thiss!1204)) lt!321385)))

(declare-fun b!205716 () Bool)

(declare-fun res!172451 () Bool)

(assert (=> b!205716 (=> (not res!172451) (not e!140729))))

(assert (=> b!205716 (= res!172451 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!321385))))

(declare-fun b!205717 () Bool)

(declare-fun lt!321386 () (_ BitVec 64))

(assert (=> b!205717 (= e!140729 (bvsle lt!321385 (bvmul lt!321386 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205717 (or (= lt!321386 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!321386 #b0000000000000000000000000000000000000000000000000000000000001000) lt!321386)))))

(assert (=> b!205717 (= lt!321386 ((_ sign_extend 32) (size!4555 (buf!5060 thiss!1204))))))

(assert (= (and d!70041 res!172452) b!205716))

(assert (= (and b!205716 res!172451) b!205717))

(declare-fun m!317061 () Bool)

(assert (=> d!70041 m!317061))

(assert (=> d!70041 m!316787))

(assert (=> b!205533 d!70041))

(declare-fun d!70043 () Bool)

(declare-fun res!172459 () Bool)

(declare-fun e!140734 () Bool)

(assert (=> d!70043 (=> (not res!172459) (not e!140734))))

(assert (=> d!70043 (= res!172459 (= (size!4555 (buf!5060 thiss!1204)) (size!4555 (buf!5060 (_2!9438 lt!321104)))))))

(assert (=> d!70043 (= (isPrefixOf!0 thiss!1204 (_2!9438 lt!321104)) e!140734)))

(declare-fun b!205724 () Bool)

(declare-fun res!172460 () Bool)

(assert (=> b!205724 (=> (not res!172460) (not e!140734))))

(assert (=> b!205724 (= res!172460 (bvsle (bitIndex!0 (size!4555 (buf!5060 thiss!1204)) (currentByte!9569 thiss!1204) (currentBit!9564 thiss!1204)) (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321104))) (currentByte!9569 (_2!9438 lt!321104)) (currentBit!9564 (_2!9438 lt!321104)))))))

(declare-fun b!205725 () Bool)

(declare-fun e!140735 () Bool)

(assert (=> b!205725 (= e!140734 e!140735)))

(declare-fun res!172461 () Bool)

(assert (=> b!205725 (=> res!172461 e!140735)))

(assert (=> b!205725 (= res!172461 (= (size!4555 (buf!5060 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!205726 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10364 array!10364 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!205726 (= e!140735 (arrayBitRangesEq!0 (buf!5060 thiss!1204) (buf!5060 (_2!9438 lt!321104)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4555 (buf!5060 thiss!1204)) (currentByte!9569 thiss!1204) (currentBit!9564 thiss!1204))))))

(assert (= (and d!70043 res!172459) b!205724))

(assert (= (and b!205724 res!172460) b!205725))

(assert (= (and b!205725 (not res!172461)) b!205726))

(assert (=> b!205724 m!316799))

(assert (=> b!205724 m!316797))

(assert (=> b!205726 m!316799))

(assert (=> b!205726 m!316799))

(declare-fun m!317063 () Bool)

(assert (=> b!205726 m!317063))

(assert (=> b!205542 d!70043))

(declare-fun d!70045 () Bool)

(declare-fun res!172462 () Bool)

(declare-fun e!140736 () Bool)

(assert (=> d!70045 (=> (not res!172462) (not e!140736))))

(assert (=> d!70045 (= res!172462 (= (size!4555 (buf!5060 (_2!9438 lt!321104))) (size!4555 (buf!5060 (_2!9438 lt!321108)))))))

(assert (=> d!70045 (= (isPrefixOf!0 (_2!9438 lt!321104) (_2!9438 lt!321108)) e!140736)))

(declare-fun b!205727 () Bool)

(declare-fun res!172463 () Bool)

(assert (=> b!205727 (=> (not res!172463) (not e!140736))))

(assert (=> b!205727 (= res!172463 (bvsle (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321104))) (currentByte!9569 (_2!9438 lt!321104)) (currentBit!9564 (_2!9438 lt!321104))) (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321108))) (currentByte!9569 (_2!9438 lt!321108)) (currentBit!9564 (_2!9438 lt!321108)))))))

(declare-fun b!205728 () Bool)

(declare-fun e!140737 () Bool)

(assert (=> b!205728 (= e!140736 e!140737)))

(declare-fun res!172464 () Bool)

(assert (=> b!205728 (=> res!172464 e!140737)))

(assert (=> b!205728 (= res!172464 (= (size!4555 (buf!5060 (_2!9438 lt!321104))) #b00000000000000000000000000000000))))

(declare-fun b!205729 () Bool)

(assert (=> b!205729 (= e!140737 (arrayBitRangesEq!0 (buf!5060 (_2!9438 lt!321104)) (buf!5060 (_2!9438 lt!321108)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321104))) (currentByte!9569 (_2!9438 lt!321104)) (currentBit!9564 (_2!9438 lt!321104)))))))

(assert (= (and d!70045 res!172462) b!205727))

(assert (= (and b!205727 res!172463) b!205728))

(assert (= (and b!205728 (not res!172464)) b!205729))

(assert (=> b!205727 m!316797))

(assert (=> b!205727 m!316823))

(assert (=> b!205729 m!316797))

(assert (=> b!205729 m!316797))

(declare-fun m!317065 () Bool)

(assert (=> b!205729 m!317065))

(assert (=> b!205532 d!70045))

(declare-fun d!70047 () Bool)

(assert (=> d!70047 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4555 (buf!5060 thiss!1204))) ((_ sign_extend 32) (currentByte!9569 thiss!1204)) ((_ sign_extend 32) (currentBit!9564 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4555 (buf!5060 thiss!1204))) ((_ sign_extend 32) (currentByte!9569 thiss!1204)) ((_ sign_extend 32) (currentBit!9564 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17217 () Bool)

(assert (= bs!17217 d!70047))

(assert (=> bs!17217 m!317061))

(assert (=> b!205535 d!70047))

(assert (=> b!205536 d!70043))

(declare-fun d!70049 () Bool)

(assert (=> d!70049 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9564 thiss!1204) (currentByte!9569 thiss!1204) (size!4555 (buf!5060 thiss!1204))))))

(declare-fun bs!17218 () Bool)

(assert (= bs!17218 d!70049))

(assert (=> bs!17218 m!316787))

(assert (=> start!43506 d!70049))

(declare-fun d!70051 () Bool)

(assert (=> d!70051 (= (invariant!0 (currentBit!9564 thiss!1204) (currentByte!9569 thiss!1204) (size!4555 (buf!5060 thiss!1204))) (and (bvsge (currentBit!9564 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9564 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9569 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9569 thiss!1204) (size!4555 (buf!5060 thiss!1204))) (and (= (currentBit!9564 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9569 thiss!1204) (size!4555 (buf!5060 thiss!1204)))))))))

(assert (=> b!205534 d!70051))

(declare-fun d!70053 () Bool)

(assert (=> d!70053 (= (invariant!0 (currentBit!9564 (_2!9438 lt!321108)) (currentByte!9569 (_2!9438 lt!321108)) (size!4555 (buf!5060 (_2!9438 lt!321108)))) (and (bvsge (currentBit!9564 (_2!9438 lt!321108)) #b00000000000000000000000000000000) (bvslt (currentBit!9564 (_2!9438 lt!321108)) #b00000000000000000000000000001000) (bvsge (currentByte!9569 (_2!9438 lt!321108)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9569 (_2!9438 lt!321108)) (size!4555 (buf!5060 (_2!9438 lt!321108)))) (and (= (currentBit!9564 (_2!9438 lt!321108)) #b00000000000000000000000000000000) (= (currentByte!9569 (_2!9438 lt!321108)) (size!4555 (buf!5060 (_2!9438 lt!321108))))))))))

(assert (=> b!205538 d!70053))

(declare-fun d!70055 () Bool)

(declare-fun e!140738 () Bool)

(assert (=> d!70055 e!140738))

(declare-fun res!172466 () Bool)

(assert (=> d!70055 (=> (not res!172466) (not e!140738))))

(declare-fun lt!321389 () (_ BitVec 64))

(declare-fun lt!321390 () (_ BitVec 64))

(declare-fun lt!321391 () (_ BitVec 64))

(assert (=> d!70055 (= res!172466 (= lt!321391 (bvsub lt!321389 lt!321390)))))

(assert (=> d!70055 (or (= (bvand lt!321389 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!321390 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!321389 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!321389 lt!321390) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70055 (= lt!321390 (remainingBits!0 ((_ sign_extend 32) (size!4555 (buf!5060 (_1!9437 lt!321101)))) ((_ sign_extend 32) (currentByte!9569 (_1!9437 lt!321101))) ((_ sign_extend 32) (currentBit!9564 (_1!9437 lt!321101)))))))

(declare-fun lt!321393 () (_ BitVec 64))

(declare-fun lt!321388 () (_ BitVec 64))

(assert (=> d!70055 (= lt!321389 (bvmul lt!321393 lt!321388))))

(assert (=> d!70055 (or (= lt!321393 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!321388 (bvsdiv (bvmul lt!321393 lt!321388) lt!321393)))))

(assert (=> d!70055 (= lt!321388 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70055 (= lt!321393 ((_ sign_extend 32) (size!4555 (buf!5060 (_1!9437 lt!321101)))))))

(assert (=> d!70055 (= lt!321391 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9569 (_1!9437 lt!321101))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9564 (_1!9437 lt!321101)))))))

(assert (=> d!70055 (invariant!0 (currentBit!9564 (_1!9437 lt!321101)) (currentByte!9569 (_1!9437 lt!321101)) (size!4555 (buf!5060 (_1!9437 lt!321101))))))

(assert (=> d!70055 (= (bitIndex!0 (size!4555 (buf!5060 (_1!9437 lt!321101))) (currentByte!9569 (_1!9437 lt!321101)) (currentBit!9564 (_1!9437 lt!321101))) lt!321391)))

(declare-fun b!205730 () Bool)

(declare-fun res!172465 () Bool)

(assert (=> b!205730 (=> (not res!172465) (not e!140738))))

(assert (=> b!205730 (= res!172465 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!321391))))

(declare-fun b!205731 () Bool)

(declare-fun lt!321392 () (_ BitVec 64))

(assert (=> b!205731 (= e!140738 (bvsle lt!321391 (bvmul lt!321392 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205731 (or (= lt!321392 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!321392 #b0000000000000000000000000000000000000000000000000000000000001000) lt!321392)))))

(assert (=> b!205731 (= lt!321392 ((_ sign_extend 32) (size!4555 (buf!5060 (_1!9437 lt!321101)))))))

(assert (= (and d!70055 res!172466) b!205730))

(assert (= (and b!205730 res!172465) b!205731))

(declare-fun m!317067 () Bool)

(assert (=> d!70055 m!317067))

(declare-fun m!317069 () Bool)

(assert (=> d!70055 m!317069))

(assert (=> b!205528 d!70055))

(declare-fun d!70057 () Bool)

(assert (=> d!70057 (= (array_inv!4296 (buf!5060 thiss!1204)) (bvsge (size!4555 (buf!5060 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!205537 d!70057))

(declare-fun d!70059 () Bool)

(declare-fun e!140739 () Bool)

(assert (=> d!70059 e!140739))

(declare-fun res!172468 () Bool)

(assert (=> d!70059 (=> (not res!172468) (not e!140739))))

(declare-fun lt!321397 () (_ BitVec 64))

(declare-fun lt!321395 () (_ BitVec 64))

(declare-fun lt!321396 () (_ BitVec 64))

(assert (=> d!70059 (= res!172468 (= lt!321397 (bvsub lt!321395 lt!321396)))))

(assert (=> d!70059 (or (= (bvand lt!321395 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!321396 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!321395 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!321395 lt!321396) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70059 (= lt!321396 (remainingBits!0 ((_ sign_extend 32) (size!4555 (buf!5060 (_1!9437 lt!321111)))) ((_ sign_extend 32) (currentByte!9569 (_1!9437 lt!321111))) ((_ sign_extend 32) (currentBit!9564 (_1!9437 lt!321111)))))))

(declare-fun lt!321399 () (_ BitVec 64))

(declare-fun lt!321394 () (_ BitVec 64))

(assert (=> d!70059 (= lt!321395 (bvmul lt!321399 lt!321394))))

(assert (=> d!70059 (or (= lt!321399 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!321394 (bvsdiv (bvmul lt!321399 lt!321394) lt!321399)))))

(assert (=> d!70059 (= lt!321394 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70059 (= lt!321399 ((_ sign_extend 32) (size!4555 (buf!5060 (_1!9437 lt!321111)))))))

(assert (=> d!70059 (= lt!321397 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9569 (_1!9437 lt!321111))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9564 (_1!9437 lt!321111)))))))

(assert (=> d!70059 (invariant!0 (currentBit!9564 (_1!9437 lt!321111)) (currentByte!9569 (_1!9437 lt!321111)) (size!4555 (buf!5060 (_1!9437 lt!321111))))))

(assert (=> d!70059 (= (bitIndex!0 (size!4555 (buf!5060 (_1!9437 lt!321111))) (currentByte!9569 (_1!9437 lt!321111)) (currentBit!9564 (_1!9437 lt!321111))) lt!321397)))

(declare-fun b!205732 () Bool)

(declare-fun res!172467 () Bool)

(assert (=> b!205732 (=> (not res!172467) (not e!140739))))

(assert (=> b!205732 (= res!172467 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!321397))))

(declare-fun b!205733 () Bool)

(declare-fun lt!321398 () (_ BitVec 64))

(assert (=> b!205733 (= e!140739 (bvsle lt!321397 (bvmul lt!321398 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205733 (or (= lt!321398 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!321398 #b0000000000000000000000000000000000000000000000000000000000001000) lt!321398)))))

(assert (=> b!205733 (= lt!321398 ((_ sign_extend 32) (size!4555 (buf!5060 (_1!9437 lt!321111)))))))

(assert (= (and d!70059 res!172468) b!205732))

(assert (= (and b!205732 res!172467) b!205733))

(declare-fun m!317071 () Bool)

(assert (=> d!70059 m!317071))

(declare-fun m!317073 () Bool)

(assert (=> d!70059 m!317073))

(assert (=> b!205530 d!70059))

(declare-fun d!70061 () Bool)

(declare-fun e!140744 () Bool)

(assert (=> d!70061 e!140744))

(declare-fun res!172476 () Bool)

(assert (=> d!70061 (=> (not res!172476) (not e!140744))))

(declare-fun lt!321454 () tuple2!17568)

(assert (=> d!70061 (= res!172476 (isPrefixOf!0 (_1!9439 lt!321454) (_2!9439 lt!321454)))))

(declare-fun lt!321457 () BitStream!8218)

(assert (=> d!70061 (= lt!321454 (tuple2!17569 lt!321457 (_2!9438 lt!321108)))))

(declare-fun lt!321449 () Unit!14667)

(declare-fun lt!321450 () Unit!14667)

(assert (=> d!70061 (= lt!321449 lt!321450)))

(assert (=> d!70061 (isPrefixOf!0 lt!321457 (_2!9438 lt!321108))))

(assert (=> d!70061 (= lt!321450 (lemmaIsPrefixTransitive!0 lt!321457 (_2!9438 lt!321108) (_2!9438 lt!321108)))))

(declare-fun lt!321445 () Unit!14667)

(declare-fun lt!321455 () Unit!14667)

(assert (=> d!70061 (= lt!321445 lt!321455)))

(assert (=> d!70061 (isPrefixOf!0 lt!321457 (_2!9438 lt!321108))))

(assert (=> d!70061 (= lt!321455 (lemmaIsPrefixTransitive!0 lt!321457 thiss!1204 (_2!9438 lt!321108)))))

(declare-fun lt!321448 () Unit!14667)

(declare-fun e!140745 () Unit!14667)

(assert (=> d!70061 (= lt!321448 e!140745)))

(declare-fun c!10185 () Bool)

(assert (=> d!70061 (= c!10185 (not (= (size!4555 (buf!5060 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!321451 () Unit!14667)

(declare-fun lt!321459 () Unit!14667)

(assert (=> d!70061 (= lt!321451 lt!321459)))

(assert (=> d!70061 (isPrefixOf!0 (_2!9438 lt!321108) (_2!9438 lt!321108))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8218) Unit!14667)

(assert (=> d!70061 (= lt!321459 (lemmaIsPrefixRefl!0 (_2!9438 lt!321108)))))

(declare-fun lt!321446 () Unit!14667)

(declare-fun lt!321441 () Unit!14667)

(assert (=> d!70061 (= lt!321446 lt!321441)))

(assert (=> d!70061 (= lt!321441 (lemmaIsPrefixRefl!0 (_2!9438 lt!321108)))))

(declare-fun lt!321440 () Unit!14667)

(declare-fun lt!321444 () Unit!14667)

(assert (=> d!70061 (= lt!321440 lt!321444)))

(assert (=> d!70061 (isPrefixOf!0 lt!321457 lt!321457)))

(assert (=> d!70061 (= lt!321444 (lemmaIsPrefixRefl!0 lt!321457))))

(declare-fun lt!321453 () Unit!14667)

(declare-fun lt!321442 () Unit!14667)

(assert (=> d!70061 (= lt!321453 lt!321442)))

(assert (=> d!70061 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!70061 (= lt!321442 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!70061 (= lt!321457 (BitStream!8219 (buf!5060 (_2!9438 lt!321108)) (currentByte!9569 thiss!1204) (currentBit!9564 thiss!1204)))))

(assert (=> d!70061 (isPrefixOf!0 thiss!1204 (_2!9438 lt!321108))))

(assert (=> d!70061 (= (reader!0 thiss!1204 (_2!9438 lt!321108)) lt!321454)))

(declare-fun b!205744 () Bool)

(declare-fun Unit!14686 () Unit!14667)

(assert (=> b!205744 (= e!140745 Unit!14686)))

(declare-fun b!205745 () Bool)

(declare-fun lt!321447 () Unit!14667)

(assert (=> b!205745 (= e!140745 lt!321447)))

(declare-fun lt!321456 () (_ BitVec 64))

(assert (=> b!205745 (= lt!321456 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!321452 () (_ BitVec 64))

(assert (=> b!205745 (= lt!321452 (bitIndex!0 (size!4555 (buf!5060 thiss!1204)) (currentByte!9569 thiss!1204) (currentBit!9564 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10364 array!10364 (_ BitVec 64) (_ BitVec 64)) Unit!14667)

(assert (=> b!205745 (= lt!321447 (arrayBitRangesEqSymmetric!0 (buf!5060 thiss!1204) (buf!5060 (_2!9438 lt!321108)) lt!321456 lt!321452))))

(assert (=> b!205745 (arrayBitRangesEq!0 (buf!5060 (_2!9438 lt!321108)) (buf!5060 thiss!1204) lt!321456 lt!321452)))

(declare-fun b!205746 () Bool)

(declare-fun res!172477 () Bool)

(assert (=> b!205746 (=> (not res!172477) (not e!140744))))

(assert (=> b!205746 (= res!172477 (isPrefixOf!0 (_2!9439 lt!321454) (_2!9438 lt!321108)))))

(declare-fun b!205747 () Bool)

(declare-fun res!172475 () Bool)

(assert (=> b!205747 (=> (not res!172475) (not e!140744))))

(assert (=> b!205747 (= res!172475 (isPrefixOf!0 (_1!9439 lt!321454) thiss!1204))))

(declare-fun b!205748 () Bool)

(declare-fun lt!321443 () (_ BitVec 64))

(declare-fun lt!321458 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8218 (_ BitVec 64)) BitStream!8218)

(assert (=> b!205748 (= e!140744 (= (_1!9439 lt!321454) (withMovedBitIndex!0 (_2!9439 lt!321454) (bvsub lt!321443 lt!321458))))))

(assert (=> b!205748 (or (= (bvand lt!321443 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!321458 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!321443 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!321443 lt!321458) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205748 (= lt!321458 (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321108))) (currentByte!9569 (_2!9438 lt!321108)) (currentBit!9564 (_2!9438 lt!321108))))))

(assert (=> b!205748 (= lt!321443 (bitIndex!0 (size!4555 (buf!5060 thiss!1204)) (currentByte!9569 thiss!1204) (currentBit!9564 thiss!1204)))))

(assert (= (and d!70061 c!10185) b!205745))

(assert (= (and d!70061 (not c!10185)) b!205744))

(assert (= (and d!70061 res!172476) b!205747))

(assert (= (and b!205747 res!172475) b!205746))

(assert (= (and b!205746 res!172477) b!205748))

(declare-fun m!317075 () Bool)

(assert (=> d!70061 m!317075))

(declare-fun m!317077 () Bool)

(assert (=> d!70061 m!317077))

(assert (=> d!70061 m!316825))

(declare-fun m!317079 () Bool)

(assert (=> d!70061 m!317079))

(declare-fun m!317081 () Bool)

(assert (=> d!70061 m!317081))

(declare-fun m!317083 () Bool)

(assert (=> d!70061 m!317083))

(declare-fun m!317085 () Bool)

(assert (=> d!70061 m!317085))

(declare-fun m!317087 () Bool)

(assert (=> d!70061 m!317087))

(declare-fun m!317089 () Bool)

(assert (=> d!70061 m!317089))

(declare-fun m!317091 () Bool)

(assert (=> d!70061 m!317091))

(declare-fun m!317093 () Bool)

(assert (=> d!70061 m!317093))

(assert (=> b!205745 m!316799))

(declare-fun m!317095 () Bool)

(assert (=> b!205745 m!317095))

(declare-fun m!317097 () Bool)

(assert (=> b!205745 m!317097))

(declare-fun m!317099 () Bool)

(assert (=> b!205747 m!317099))

(declare-fun m!317101 () Bool)

(assert (=> b!205748 m!317101))

(assert (=> b!205748 m!316823))

(assert (=> b!205748 m!316799))

(declare-fun m!317103 () Bool)

(assert (=> b!205746 m!317103))

(assert (=> b!205530 d!70061))

(declare-fun d!70069 () Bool)

(declare-datatypes ((tuple2!17586 0))(
  ( (tuple2!17587 (_1!9448 Bool) (_2!9448 BitStream!8218)) )
))
(declare-fun lt!321462 () tuple2!17586)

(declare-fun readBit!0 (BitStream!8218) tuple2!17586)

(assert (=> d!70069 (= lt!321462 (readBit!0 (_1!9439 lt!321113)))))

(assert (=> d!70069 (= (readBitPure!0 (_1!9439 lt!321113)) (tuple2!17565 (_2!9448 lt!321462) (_1!9448 lt!321462)))))

(declare-fun bs!17219 () Bool)

(assert (= bs!17219 d!70069))

(declare-fun m!317105 () Bool)

(assert (=> bs!17219 m!317105))

(assert (=> b!205530 d!70069))

(declare-fun d!70071 () Bool)

(declare-fun e!140746 () Bool)

(assert (=> d!70071 e!140746))

(declare-fun res!172479 () Bool)

(assert (=> d!70071 (=> (not res!172479) (not e!140746))))

(declare-fun lt!321477 () tuple2!17568)

(assert (=> d!70071 (= res!172479 (isPrefixOf!0 (_1!9439 lt!321477) (_2!9439 lt!321477)))))

(declare-fun lt!321480 () BitStream!8218)

(assert (=> d!70071 (= lt!321477 (tuple2!17569 lt!321480 (_2!9438 lt!321108)))))

(declare-fun lt!321472 () Unit!14667)

(declare-fun lt!321473 () Unit!14667)

(assert (=> d!70071 (= lt!321472 lt!321473)))

(assert (=> d!70071 (isPrefixOf!0 lt!321480 (_2!9438 lt!321108))))

(assert (=> d!70071 (= lt!321473 (lemmaIsPrefixTransitive!0 lt!321480 (_2!9438 lt!321108) (_2!9438 lt!321108)))))

(declare-fun lt!321468 () Unit!14667)

(declare-fun lt!321478 () Unit!14667)

(assert (=> d!70071 (= lt!321468 lt!321478)))

(assert (=> d!70071 (isPrefixOf!0 lt!321480 (_2!9438 lt!321108))))

(assert (=> d!70071 (= lt!321478 (lemmaIsPrefixTransitive!0 lt!321480 (_2!9438 lt!321104) (_2!9438 lt!321108)))))

(declare-fun lt!321471 () Unit!14667)

(declare-fun e!140747 () Unit!14667)

(assert (=> d!70071 (= lt!321471 e!140747)))

(declare-fun c!10186 () Bool)

(assert (=> d!70071 (= c!10186 (not (= (size!4555 (buf!5060 (_2!9438 lt!321104))) #b00000000000000000000000000000000)))))

(declare-fun lt!321474 () Unit!14667)

(declare-fun lt!321482 () Unit!14667)

(assert (=> d!70071 (= lt!321474 lt!321482)))

(assert (=> d!70071 (isPrefixOf!0 (_2!9438 lt!321108) (_2!9438 lt!321108))))

(assert (=> d!70071 (= lt!321482 (lemmaIsPrefixRefl!0 (_2!9438 lt!321108)))))

(declare-fun lt!321469 () Unit!14667)

(declare-fun lt!321464 () Unit!14667)

(assert (=> d!70071 (= lt!321469 lt!321464)))

(assert (=> d!70071 (= lt!321464 (lemmaIsPrefixRefl!0 (_2!9438 lt!321108)))))

(declare-fun lt!321463 () Unit!14667)

(declare-fun lt!321467 () Unit!14667)

(assert (=> d!70071 (= lt!321463 lt!321467)))

(assert (=> d!70071 (isPrefixOf!0 lt!321480 lt!321480)))

(assert (=> d!70071 (= lt!321467 (lemmaIsPrefixRefl!0 lt!321480))))

(declare-fun lt!321476 () Unit!14667)

(declare-fun lt!321465 () Unit!14667)

(assert (=> d!70071 (= lt!321476 lt!321465)))

(assert (=> d!70071 (isPrefixOf!0 (_2!9438 lt!321104) (_2!9438 lt!321104))))

(assert (=> d!70071 (= lt!321465 (lemmaIsPrefixRefl!0 (_2!9438 lt!321104)))))

(assert (=> d!70071 (= lt!321480 (BitStream!8219 (buf!5060 (_2!9438 lt!321108)) (currentByte!9569 (_2!9438 lt!321104)) (currentBit!9564 (_2!9438 lt!321104))))))

(assert (=> d!70071 (isPrefixOf!0 (_2!9438 lt!321104) (_2!9438 lt!321108))))

(assert (=> d!70071 (= (reader!0 (_2!9438 lt!321104) (_2!9438 lt!321108)) lt!321477)))

(declare-fun b!205749 () Bool)

(declare-fun Unit!14687 () Unit!14667)

(assert (=> b!205749 (= e!140747 Unit!14687)))

(declare-fun b!205750 () Bool)

(declare-fun lt!321470 () Unit!14667)

(assert (=> b!205750 (= e!140747 lt!321470)))

(declare-fun lt!321479 () (_ BitVec 64))

(assert (=> b!205750 (= lt!321479 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!321475 () (_ BitVec 64))

(assert (=> b!205750 (= lt!321475 (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321104))) (currentByte!9569 (_2!9438 lt!321104)) (currentBit!9564 (_2!9438 lt!321104))))))

(assert (=> b!205750 (= lt!321470 (arrayBitRangesEqSymmetric!0 (buf!5060 (_2!9438 lt!321104)) (buf!5060 (_2!9438 lt!321108)) lt!321479 lt!321475))))

(assert (=> b!205750 (arrayBitRangesEq!0 (buf!5060 (_2!9438 lt!321108)) (buf!5060 (_2!9438 lt!321104)) lt!321479 lt!321475)))

(declare-fun b!205751 () Bool)

(declare-fun res!172480 () Bool)

(assert (=> b!205751 (=> (not res!172480) (not e!140746))))

(assert (=> b!205751 (= res!172480 (isPrefixOf!0 (_2!9439 lt!321477) (_2!9438 lt!321108)))))

(declare-fun b!205752 () Bool)

(declare-fun res!172478 () Bool)

(assert (=> b!205752 (=> (not res!172478) (not e!140746))))

(assert (=> b!205752 (= res!172478 (isPrefixOf!0 (_1!9439 lt!321477) (_2!9438 lt!321104)))))

(declare-fun lt!321466 () (_ BitVec 64))

(declare-fun b!205753 () Bool)

(declare-fun lt!321481 () (_ BitVec 64))

(assert (=> b!205753 (= e!140746 (= (_1!9439 lt!321477) (withMovedBitIndex!0 (_2!9439 lt!321477) (bvsub lt!321466 lt!321481))))))

(assert (=> b!205753 (or (= (bvand lt!321466 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!321481 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!321466 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!321466 lt!321481) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205753 (= lt!321481 (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321108))) (currentByte!9569 (_2!9438 lt!321108)) (currentBit!9564 (_2!9438 lt!321108))))))

(assert (=> b!205753 (= lt!321466 (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321104))) (currentByte!9569 (_2!9438 lt!321104)) (currentBit!9564 (_2!9438 lt!321104))))))

(assert (= (and d!70071 c!10186) b!205750))

(assert (= (and d!70071 (not c!10186)) b!205749))

(assert (= (and d!70071 res!172479) b!205752))

(assert (= (and b!205752 res!172478) b!205751))

(assert (= (and b!205751 res!172480) b!205753))

(declare-fun m!317107 () Bool)

(assert (=> d!70071 m!317107))

(declare-fun m!317109 () Bool)

(assert (=> d!70071 m!317109))

(assert (=> d!70071 m!316793))

(declare-fun m!317111 () Bool)

(assert (=> d!70071 m!317111))

(declare-fun m!317113 () Bool)

(assert (=> d!70071 m!317113))

(declare-fun m!317115 () Bool)

(assert (=> d!70071 m!317115))

(declare-fun m!317117 () Bool)

(assert (=> d!70071 m!317117))

(declare-fun m!317119 () Bool)

(assert (=> d!70071 m!317119))

(assert (=> d!70071 m!317089))

(assert (=> d!70071 m!317091))

(declare-fun m!317121 () Bool)

(assert (=> d!70071 m!317121))

(assert (=> b!205750 m!316797))

(declare-fun m!317123 () Bool)

(assert (=> b!205750 m!317123))

(declare-fun m!317125 () Bool)

(assert (=> b!205750 m!317125))

(declare-fun m!317127 () Bool)

(assert (=> b!205752 m!317127))

(declare-fun m!317129 () Bool)

(assert (=> b!205753 m!317129))

(assert (=> b!205753 m!316823))

(assert (=> b!205753 m!316797))

(declare-fun m!317131 () Bool)

(assert (=> b!205751 m!317131))

(assert (=> b!205530 d!70071))

(declare-fun d!70073 () Bool)

(declare-fun e!140757 () Bool)

(assert (=> d!70073 e!140757))

(declare-fun res!172495 () Bool)

(assert (=> d!70073 (=> (not res!172495) (not e!140757))))

(declare-fun lt!321511 () tuple2!17564)

(declare-fun lt!321510 () tuple2!17564)

(assert (=> d!70073 (= res!172495 (= (bitIndex!0 (size!4555 (buf!5060 (_1!9437 lt!321511))) (currentByte!9569 (_1!9437 lt!321511)) (currentBit!9564 (_1!9437 lt!321511))) (bitIndex!0 (size!4555 (buf!5060 (_1!9437 lt!321510))) (currentByte!9569 (_1!9437 lt!321510)) (currentBit!9564 (_1!9437 lt!321510)))))))

(declare-fun lt!321512 () Unit!14667)

(declare-fun lt!321509 () BitStream!8218)

(declare-fun choose!50 (BitStream!8218 BitStream!8218 BitStream!8218 tuple2!17564 tuple2!17564 BitStream!8218 Bool tuple2!17564 tuple2!17564 BitStream!8218 Bool) Unit!14667)

(assert (=> d!70073 (= lt!321512 (choose!50 lt!321099 (_2!9438 lt!321108) lt!321509 lt!321511 (tuple2!17565 (_1!9437 lt!321511) (_2!9437 lt!321511)) (_1!9437 lt!321511) (_2!9437 lt!321511) lt!321510 (tuple2!17565 (_1!9437 lt!321510) (_2!9437 lt!321510)) (_1!9437 lt!321510) (_2!9437 lt!321510)))))

(assert (=> d!70073 (= lt!321510 (readBitPure!0 lt!321509))))

(assert (=> d!70073 (= lt!321511 (readBitPure!0 lt!321099))))

(assert (=> d!70073 (= lt!321509 (BitStream!8219 (buf!5060 (_2!9438 lt!321108)) (currentByte!9569 lt!321099) (currentBit!9564 lt!321099)))))

(assert (=> d!70073 (invariant!0 (currentBit!9564 lt!321099) (currentByte!9569 lt!321099) (size!4555 (buf!5060 (_2!9438 lt!321108))))))

(assert (=> d!70073 (= (readBitPrefixLemma!0 lt!321099 (_2!9438 lt!321108)) lt!321512)))

(declare-fun b!205768 () Bool)

(assert (=> b!205768 (= e!140757 (= (_2!9437 lt!321511) (_2!9437 lt!321510)))))

(assert (= (and d!70073 res!172495) b!205768))

(declare-fun m!317135 () Bool)

(assert (=> d!70073 m!317135))

(declare-fun m!317137 () Bool)

(assert (=> d!70073 m!317137))

(declare-fun m!317139 () Bool)

(assert (=> d!70073 m!317139))

(assert (=> d!70073 m!316807))

(declare-fun m!317141 () Bool)

(assert (=> d!70073 m!317141))

(declare-fun m!317143 () Bool)

(assert (=> d!70073 m!317143))

(assert (=> b!205530 d!70073))

(declare-fun d!70077 () Bool)

(declare-fun e!140758 () Bool)

(assert (=> d!70077 e!140758))

(declare-fun res!172497 () Bool)

(assert (=> d!70077 (=> (not res!172497) (not e!140758))))

(declare-fun lt!321515 () (_ BitVec 64))

(declare-fun lt!321516 () (_ BitVec 64))

(declare-fun lt!321514 () (_ BitVec 64))

(assert (=> d!70077 (= res!172497 (= lt!321516 (bvsub lt!321514 lt!321515)))))

(assert (=> d!70077 (or (= (bvand lt!321514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!321515 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!321514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!321514 lt!321515) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70077 (= lt!321515 (remainingBits!0 ((_ sign_extend 32) (size!4555 (buf!5060 (_1!9437 lt!321110)))) ((_ sign_extend 32) (currentByte!9569 (_1!9437 lt!321110))) ((_ sign_extend 32) (currentBit!9564 (_1!9437 lt!321110)))))))

(declare-fun lt!321518 () (_ BitVec 64))

(declare-fun lt!321513 () (_ BitVec 64))

(assert (=> d!70077 (= lt!321514 (bvmul lt!321518 lt!321513))))

(assert (=> d!70077 (or (= lt!321518 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!321513 (bvsdiv (bvmul lt!321518 lt!321513) lt!321518)))))

(assert (=> d!70077 (= lt!321513 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70077 (= lt!321518 ((_ sign_extend 32) (size!4555 (buf!5060 (_1!9437 lt!321110)))))))

(assert (=> d!70077 (= lt!321516 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9569 (_1!9437 lt!321110))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9564 (_1!9437 lt!321110)))))))

(assert (=> d!70077 (invariant!0 (currentBit!9564 (_1!9437 lt!321110)) (currentByte!9569 (_1!9437 lt!321110)) (size!4555 (buf!5060 (_1!9437 lt!321110))))))

(assert (=> d!70077 (= (bitIndex!0 (size!4555 (buf!5060 (_1!9437 lt!321110))) (currentByte!9569 (_1!9437 lt!321110)) (currentBit!9564 (_1!9437 lt!321110))) lt!321516)))

(declare-fun b!205769 () Bool)

(declare-fun res!172496 () Bool)

(assert (=> b!205769 (=> (not res!172496) (not e!140758))))

(assert (=> b!205769 (= res!172496 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!321516))))

(declare-fun b!205770 () Bool)

(declare-fun lt!321517 () (_ BitVec 64))

(assert (=> b!205770 (= e!140758 (bvsle lt!321516 (bvmul lt!321517 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205770 (or (= lt!321517 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!321517 #b0000000000000000000000000000000000000000000000000000000000001000) lt!321517)))))

(assert (=> b!205770 (= lt!321517 ((_ sign_extend 32) (size!4555 (buf!5060 (_1!9437 lt!321110)))))))

(assert (= (and d!70077 res!172497) b!205769))

(assert (= (and b!205769 res!172496) b!205770))

(declare-fun m!317145 () Bool)

(assert (=> d!70077 m!317145))

(declare-fun m!317147 () Bool)

(assert (=> d!70077 m!317147))

(assert (=> b!205530 d!70077))

(declare-fun d!70079 () Bool)

(declare-fun lt!321519 () tuple2!17586)

(assert (=> d!70079 (= lt!321519 (readBit!0 lt!321099))))

(assert (=> d!70079 (= (readBitPure!0 lt!321099) (tuple2!17565 (_2!9448 lt!321519) (_1!9448 lt!321519)))))

(declare-fun bs!17220 () Bool)

(assert (= bs!17220 d!70079))

(declare-fun m!317149 () Bool)

(assert (=> bs!17220 m!317149))

(assert (=> b!205530 d!70079))

(declare-fun d!70081 () Bool)

(declare-fun lt!321520 () tuple2!17586)

(assert (=> d!70081 (= lt!321520 (readBit!0 (BitStream!8219 (buf!5060 (_2!9438 lt!321108)) (currentByte!9569 thiss!1204) (currentBit!9564 thiss!1204))))))

(assert (=> d!70081 (= (readBitPure!0 (BitStream!8219 (buf!5060 (_2!9438 lt!321108)) (currentByte!9569 thiss!1204) (currentBit!9564 thiss!1204))) (tuple2!17565 (_2!9448 lt!321520) (_1!9448 lt!321520)))))

(declare-fun bs!17221 () Bool)

(assert (= bs!17221 d!70081))

(declare-fun m!317151 () Bool)

(assert (=> bs!17221 m!317151))

(assert (=> b!205530 d!70081))

(declare-fun d!70083 () Bool)

(assert (=> d!70083 (= (invariant!0 (currentBit!9564 thiss!1204) (currentByte!9569 thiss!1204) (size!4555 (buf!5060 (_2!9438 lt!321104)))) (and (bvsge (currentBit!9564 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9564 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9569 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9569 thiss!1204) (size!4555 (buf!5060 (_2!9438 lt!321104)))) (and (= (currentBit!9564 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9569 thiss!1204) (size!4555 (buf!5060 (_2!9438 lt!321104))))))))))

(assert (=> b!205530 d!70083))

(declare-fun d!70085 () Bool)

(declare-fun e!140759 () Bool)

(assert (=> d!70085 e!140759))

(declare-fun res!172499 () Bool)

(assert (=> d!70085 (=> (not res!172499) (not e!140759))))

(declare-fun lt!321522 () (_ BitVec 64))

(declare-fun lt!321524 () (_ BitVec 64))

(declare-fun lt!321523 () (_ BitVec 64))

(assert (=> d!70085 (= res!172499 (= lt!321524 (bvsub lt!321522 lt!321523)))))

(assert (=> d!70085 (or (= (bvand lt!321522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!321523 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!321522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!321522 lt!321523) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70085 (= lt!321523 (remainingBits!0 ((_ sign_extend 32) (size!4555 (buf!5060 (_2!9438 lt!321108)))) ((_ sign_extend 32) (currentByte!9569 (_2!9438 lt!321108))) ((_ sign_extend 32) (currentBit!9564 (_2!9438 lt!321108)))))))

(declare-fun lt!321526 () (_ BitVec 64))

(declare-fun lt!321521 () (_ BitVec 64))

(assert (=> d!70085 (= lt!321522 (bvmul lt!321526 lt!321521))))

(assert (=> d!70085 (or (= lt!321526 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!321521 (bvsdiv (bvmul lt!321526 lt!321521) lt!321526)))))

(assert (=> d!70085 (= lt!321521 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70085 (= lt!321526 ((_ sign_extend 32) (size!4555 (buf!5060 (_2!9438 lt!321108)))))))

(assert (=> d!70085 (= lt!321524 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9569 (_2!9438 lt!321108))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9564 (_2!9438 lt!321108)))))))

(assert (=> d!70085 (invariant!0 (currentBit!9564 (_2!9438 lt!321108)) (currentByte!9569 (_2!9438 lt!321108)) (size!4555 (buf!5060 (_2!9438 lt!321108))))))

(assert (=> d!70085 (= (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321108))) (currentByte!9569 (_2!9438 lt!321108)) (currentBit!9564 (_2!9438 lt!321108))) lt!321524)))

(declare-fun b!205771 () Bool)

(declare-fun res!172498 () Bool)

(assert (=> b!205771 (=> (not res!172498) (not e!140759))))

(assert (=> b!205771 (= res!172498 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!321524))))

(declare-fun b!205772 () Bool)

(declare-fun lt!321525 () (_ BitVec 64))

(assert (=> b!205772 (= e!140759 (bvsle lt!321524 (bvmul lt!321525 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205772 (or (= lt!321525 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!321525 #b0000000000000000000000000000000000000000000000000000000000001000) lt!321525)))))

(assert (=> b!205772 (= lt!321525 ((_ sign_extend 32) (size!4555 (buf!5060 (_2!9438 lt!321108)))))))

(assert (= (and d!70085 res!172499) b!205771))

(assert (= (and b!205771 res!172498) b!205772))

(declare-fun m!317153 () Bool)

(assert (=> d!70085 m!317153))

(assert (=> d!70085 m!316795))

(assert (=> b!205541 d!70085))

(declare-fun d!70087 () Bool)

(declare-fun res!172503 () Bool)

(declare-fun e!140762 () Bool)

(assert (=> d!70087 (=> (not res!172503) (not e!140762))))

(assert (=> d!70087 (= res!172503 (= (size!4555 (buf!5060 thiss!1204)) (size!4555 (buf!5060 (_2!9438 lt!321108)))))))

(assert (=> d!70087 (= (isPrefixOf!0 thiss!1204 (_2!9438 lt!321108)) e!140762)))

(declare-fun b!205776 () Bool)

(declare-fun res!172504 () Bool)

(assert (=> b!205776 (=> (not res!172504) (not e!140762))))

(assert (=> b!205776 (= res!172504 (bvsle (bitIndex!0 (size!4555 (buf!5060 thiss!1204)) (currentByte!9569 thiss!1204) (currentBit!9564 thiss!1204)) (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321108))) (currentByte!9569 (_2!9438 lt!321108)) (currentBit!9564 (_2!9438 lt!321108)))))))

(declare-fun b!205777 () Bool)

(declare-fun e!140763 () Bool)

(assert (=> b!205777 (= e!140762 e!140763)))

(declare-fun res!172505 () Bool)

(assert (=> b!205777 (=> res!172505 e!140763)))

(assert (=> b!205777 (= res!172505 (= (size!4555 (buf!5060 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!205778 () Bool)

(assert (=> b!205778 (= e!140763 (arrayBitRangesEq!0 (buf!5060 thiss!1204) (buf!5060 (_2!9438 lt!321108)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4555 (buf!5060 thiss!1204)) (currentByte!9569 thiss!1204) (currentBit!9564 thiss!1204))))))

(assert (= (and d!70087 res!172503) b!205776))

(assert (= (and b!205776 res!172504) b!205777))

(assert (= (and b!205777 (not res!172505)) b!205778))

(assert (=> b!205776 m!316799))

(assert (=> b!205776 m!316823))

(assert (=> b!205778 m!316799))

(assert (=> b!205778 m!316799))

(declare-fun m!317157 () Bool)

(assert (=> b!205778 m!317157))

(assert (=> b!205541 d!70087))

(declare-fun d!70091 () Bool)

(assert (=> d!70091 (isPrefixOf!0 thiss!1204 (_2!9438 lt!321108))))

(declare-fun lt!321531 () Unit!14667)

(declare-fun choose!30 (BitStream!8218 BitStream!8218 BitStream!8218) Unit!14667)

(assert (=> d!70091 (= lt!321531 (choose!30 thiss!1204 (_2!9438 lt!321104) (_2!9438 lt!321108)))))

(assert (=> d!70091 (isPrefixOf!0 thiss!1204 (_2!9438 lt!321104))))

(assert (=> d!70091 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9438 lt!321104) (_2!9438 lt!321108)) lt!321531)))

(declare-fun bs!17222 () Bool)

(assert (= bs!17222 d!70091))

(assert (=> bs!17222 m!316825))

(declare-fun m!317159 () Bool)

(assert (=> bs!17222 m!317159))

(assert (=> bs!17222 m!316785))

(assert (=> b!205541 d!70091))

(declare-fun b!205864 () Bool)

(declare-fun res!172580 () Bool)

(declare-fun lt!321864 () tuple2!17566)

(assert (=> b!205864 (= res!172580 (= (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321864))) (currentByte!9569 (_2!9438 lt!321864)) (currentBit!9564 (_2!9438 lt!321864))) (bvadd (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321104))) (currentByte!9569 (_2!9438 lt!321104)) (currentBit!9564 (_2!9438 lt!321104))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!140820 () Bool)

(assert (=> b!205864 (=> (not res!172580) (not e!140820))))

(declare-fun b!205865 () Bool)

(declare-fun e!140818 () (_ BitVec 64))

(assert (=> b!205865 (= e!140818 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!205866 () Bool)

(assert (=> b!205866 (= e!140818 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!205867 () Bool)

(declare-fun res!172583 () Bool)

(declare-fun e!140814 () Bool)

(assert (=> b!205867 (=> (not res!172583) (not e!140814))))

(declare-fun lt!321823 () (_ BitVec 64))

(declare-fun lt!321851 () tuple2!17566)

(declare-fun lt!321841 () (_ BitVec 64))

(assert (=> b!205867 (= res!172583 (= (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321851))) (currentByte!9569 (_2!9438 lt!321851)) (currentBit!9564 (_2!9438 lt!321851))) (bvsub lt!321823 lt!321841)))))

(assert (=> b!205867 (or (= (bvand lt!321823 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!321841 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!321823 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!321823 lt!321841) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205867 (= lt!321841 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!321869 () (_ BitVec 64))

(declare-fun lt!321847 () (_ BitVec 64))

(assert (=> b!205867 (= lt!321823 (bvadd lt!321869 lt!321847))))

(assert (=> b!205867 (or (not (= (bvand lt!321869 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!321847 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!321869 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!321869 lt!321847) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205867 (= lt!321847 ((_ sign_extend 32) nBits!348))))

(assert (=> b!205867 (= lt!321869 (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321104))) (currentByte!9569 (_2!9438 lt!321104)) (currentBit!9564 (_2!9438 lt!321104))))))

(declare-fun b!205868 () Bool)

(declare-fun res!172576 () Bool)

(assert (=> b!205868 (=> (not res!172576) (not e!140814))))

(assert (=> b!205868 (= res!172576 (isPrefixOf!0 (_2!9438 lt!321104) (_2!9438 lt!321851)))))

(declare-fun d!70093 () Bool)

(assert (=> d!70093 e!140814))

(declare-fun res!172572 () Bool)

(assert (=> d!70093 (=> (not res!172572) (not e!140814))))

(assert (=> d!70093 (= res!172572 (invariant!0 (currentBit!9564 (_2!9438 lt!321851)) (currentByte!9569 (_2!9438 lt!321851)) (size!4555 (buf!5060 (_2!9438 lt!321851)))))))

(declare-fun e!140815 () tuple2!17566)

(assert (=> d!70093 (= lt!321851 e!140815)))

(declare-fun c!10198 () Bool)

(assert (=> d!70093 (= c!10198 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!70093 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!70093 (= (appendBitsLSBFirstLoopTR!0 (_2!9438 lt!321104) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!321851)))

(declare-fun b!205869 () Bool)

(declare-fun e!140816 () Bool)

(declare-fun lt!321874 () tuple2!17564)

(declare-fun lt!321837 () tuple2!17564)

(assert (=> b!205869 (= e!140816 (= (_2!9437 lt!321874) (_2!9437 lt!321837)))))

(declare-fun b!205870 () Bool)

(declare-fun e!140813 () Bool)

(declare-fun lt!321852 () (_ BitVec 64))

(assert (=> b!205870 (= e!140813 (validate_offset_bits!1 ((_ sign_extend 32) (size!4555 (buf!5060 (_2!9438 lt!321104)))) ((_ sign_extend 32) (currentByte!9569 (_2!9438 lt!321104))) ((_ sign_extend 32) (currentBit!9564 (_2!9438 lt!321104))) lt!321852))))

(declare-fun b!205871 () Bool)

(declare-fun res!172577 () Bool)

(declare-fun call!3267 () Bool)

(assert (=> b!205871 (= res!172577 call!3267)))

(assert (=> b!205871 (=> (not res!172577) (not e!140820))))

(declare-fun b!205872 () Bool)

(declare-fun e!140819 () Bool)

(declare-datatypes ((tuple2!17588 0))(
  ( (tuple2!17589 (_1!9449 BitStream!8218) (_2!9449 (_ BitVec 64))) )
))
(declare-fun lt!321822 () tuple2!17588)

(declare-fun lt!321840 () tuple2!17568)

(assert (=> b!205872 (= e!140819 (= (_1!9449 lt!321822) (_2!9439 lt!321840)))))

(declare-fun b!205873 () Bool)

(declare-fun res!172573 () Bool)

(assert (=> b!205873 (=> (not res!172573) (not e!140814))))

(assert (=> b!205873 (= res!172573 (= (size!4555 (buf!5060 (_2!9438 lt!321104))) (size!4555 (buf!5060 (_2!9438 lt!321851)))))))

(declare-fun b!205874 () Bool)

(declare-fun lt!321834 () tuple2!17566)

(assert (=> b!205874 (= e!140815 (tuple2!17567 (_1!9438 lt!321834) (_2!9438 lt!321834)))))

(declare-fun lt!321825 () Bool)

(assert (=> b!205874 (= lt!321825 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205874 (= lt!321864 (appendBit!0 (_2!9438 lt!321104) lt!321825))))

(declare-fun res!172575 () Bool)

(assert (=> b!205874 (= res!172575 (= (size!4555 (buf!5060 (_2!9438 lt!321104))) (size!4555 (buf!5060 (_2!9438 lt!321864)))))))

(assert (=> b!205874 (=> (not res!172575) (not e!140820))))

(assert (=> b!205874 e!140820))

(declare-fun lt!321842 () tuple2!17566)

(assert (=> b!205874 (= lt!321842 lt!321864)))

(assert (=> b!205874 (= lt!321834 (appendBitsLSBFirstLoopTR!0 (_2!9438 lt!321842) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!321868 () Unit!14667)

(assert (=> b!205874 (= lt!321868 (lemmaIsPrefixTransitive!0 (_2!9438 lt!321104) (_2!9438 lt!321842) (_2!9438 lt!321834)))))

(assert (=> b!205874 (isPrefixOf!0 (_2!9438 lt!321104) (_2!9438 lt!321834))))

(declare-fun lt!321853 () Unit!14667)

(assert (=> b!205874 (= lt!321853 lt!321868)))

(assert (=> b!205874 (invariant!0 (currentBit!9564 (_2!9438 lt!321104)) (currentByte!9569 (_2!9438 lt!321104)) (size!4555 (buf!5060 (_2!9438 lt!321842))))))

(declare-fun lt!321848 () BitStream!8218)

(assert (=> b!205874 (= lt!321848 (BitStream!8219 (buf!5060 (_2!9438 lt!321842)) (currentByte!9569 (_2!9438 lt!321104)) (currentBit!9564 (_2!9438 lt!321104))))))

(assert (=> b!205874 (invariant!0 (currentBit!9564 lt!321848) (currentByte!9569 lt!321848) (size!4555 (buf!5060 (_2!9438 lt!321834))))))

(declare-fun lt!321862 () BitStream!8218)

(assert (=> b!205874 (= lt!321862 (BitStream!8219 (buf!5060 (_2!9438 lt!321834)) (currentByte!9569 lt!321848) (currentBit!9564 lt!321848)))))

(assert (=> b!205874 (= lt!321874 (readBitPure!0 lt!321848))))

(assert (=> b!205874 (= lt!321837 (readBitPure!0 lt!321862))))

(declare-fun lt!321839 () Unit!14667)

(assert (=> b!205874 (= lt!321839 (readBitPrefixLemma!0 lt!321848 (_2!9438 lt!321834)))))

(declare-fun res!172582 () Bool)

(assert (=> b!205874 (= res!172582 (= (bitIndex!0 (size!4555 (buf!5060 (_1!9437 lt!321874))) (currentByte!9569 (_1!9437 lt!321874)) (currentBit!9564 (_1!9437 lt!321874))) (bitIndex!0 (size!4555 (buf!5060 (_1!9437 lt!321837))) (currentByte!9569 (_1!9437 lt!321837)) (currentBit!9564 (_1!9437 lt!321837)))))))

(assert (=> b!205874 (=> (not res!172582) (not e!140816))))

(assert (=> b!205874 e!140816))

(declare-fun lt!321866 () Unit!14667)

(assert (=> b!205874 (= lt!321866 lt!321839)))

(declare-fun lt!321824 () tuple2!17568)

(assert (=> b!205874 (= lt!321824 (reader!0 (_2!9438 lt!321104) (_2!9438 lt!321834)))))

(declare-fun lt!321838 () tuple2!17568)

(assert (=> b!205874 (= lt!321838 (reader!0 (_2!9438 lt!321842) (_2!9438 lt!321834)))))

(declare-fun lt!321821 () tuple2!17564)

(assert (=> b!205874 (= lt!321821 (readBitPure!0 (_1!9439 lt!321824)))))

(assert (=> b!205874 (= (_2!9437 lt!321821) lt!321825)))

(declare-fun lt!321827 () Unit!14667)

(declare-fun Unit!14688 () Unit!14667)

(assert (=> b!205874 (= lt!321827 Unit!14688)))

(declare-fun lt!321854 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!205874 (= lt!321854 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!321872 () (_ BitVec 64))

(assert (=> b!205874 (= lt!321872 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!321875 () Unit!14667)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8218 array!10364 (_ BitVec 64)) Unit!14667)

(assert (=> b!205874 (= lt!321875 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9438 lt!321104) (buf!5060 (_2!9438 lt!321834)) lt!321872))))

(assert (=> b!205874 (validate_offset_bits!1 ((_ sign_extend 32) (size!4555 (buf!5060 (_2!9438 lt!321834)))) ((_ sign_extend 32) (currentByte!9569 (_2!9438 lt!321104))) ((_ sign_extend 32) (currentBit!9564 (_2!9438 lt!321104))) lt!321872)))

(declare-fun lt!321860 () Unit!14667)

(assert (=> b!205874 (= lt!321860 lt!321875)))

(declare-fun lt!321845 () tuple2!17588)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8218 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17588)

(assert (=> b!205874 (= lt!321845 (readNBitsLSBFirstsLoopPure!0 (_1!9439 lt!321824) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!321854))))

(declare-fun lt!321833 () (_ BitVec 64))

(assert (=> b!205874 (= lt!321833 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!321863 () Unit!14667)

(assert (=> b!205874 (= lt!321863 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9438 lt!321842) (buf!5060 (_2!9438 lt!321834)) lt!321833))))

(assert (=> b!205874 (validate_offset_bits!1 ((_ sign_extend 32) (size!4555 (buf!5060 (_2!9438 lt!321834)))) ((_ sign_extend 32) (currentByte!9569 (_2!9438 lt!321842))) ((_ sign_extend 32) (currentBit!9564 (_2!9438 lt!321842))) lt!321833)))

(declare-fun lt!321859 () Unit!14667)

(assert (=> b!205874 (= lt!321859 lt!321863)))

(declare-fun lt!321826 () tuple2!17588)

(assert (=> b!205874 (= lt!321826 (readNBitsLSBFirstsLoopPure!0 (_1!9439 lt!321838) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!321854 (ite (_2!9437 lt!321821) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!321820 () tuple2!17588)

(assert (=> b!205874 (= lt!321820 (readNBitsLSBFirstsLoopPure!0 (_1!9439 lt!321824) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!321854))))

(declare-fun c!10197 () Bool)

(assert (=> b!205874 (= c!10197 (_2!9437 (readBitPure!0 (_1!9439 lt!321824))))))

(declare-fun lt!321855 () tuple2!17588)

(assert (=> b!205874 (= lt!321855 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9439 lt!321824) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!321854 e!140818)))))

(declare-fun lt!321849 () Unit!14667)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8218 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14667)

(assert (=> b!205874 (= lt!321849 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9439 lt!321824) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!321854))))

(assert (=> b!205874 (and (= (_2!9449 lt!321820) (_2!9449 lt!321855)) (= (_1!9449 lt!321820) (_1!9449 lt!321855)))))

(declare-fun lt!321843 () Unit!14667)

(assert (=> b!205874 (= lt!321843 lt!321849)))

(assert (=> b!205874 (= (_1!9439 lt!321824) (withMovedBitIndex!0 (_2!9439 lt!321824) (bvsub (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321104))) (currentByte!9569 (_2!9438 lt!321104)) (currentBit!9564 (_2!9438 lt!321104))) (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321834))) (currentByte!9569 (_2!9438 lt!321834)) (currentBit!9564 (_2!9438 lt!321834))))))))

(declare-fun lt!321865 () Unit!14667)

(declare-fun Unit!14689 () Unit!14667)

(assert (=> b!205874 (= lt!321865 Unit!14689)))

(assert (=> b!205874 (= (_1!9439 lt!321838) (withMovedBitIndex!0 (_2!9439 lt!321838) (bvsub (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321842))) (currentByte!9569 (_2!9438 lt!321842)) (currentBit!9564 (_2!9438 lt!321842))) (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321834))) (currentByte!9569 (_2!9438 lt!321834)) (currentBit!9564 (_2!9438 lt!321834))))))))

(declare-fun lt!321844 () Unit!14667)

(declare-fun Unit!14690 () Unit!14667)

(assert (=> b!205874 (= lt!321844 Unit!14690)))

(assert (=> b!205874 (= (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321104))) (currentByte!9569 (_2!9438 lt!321104)) (currentBit!9564 (_2!9438 lt!321104))) (bvsub (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321842))) (currentByte!9569 (_2!9438 lt!321842)) (currentBit!9564 (_2!9438 lt!321842))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!321831 () Unit!14667)

(declare-fun Unit!14691 () Unit!14667)

(assert (=> b!205874 (= lt!321831 Unit!14691)))

(assert (=> b!205874 (= (_2!9449 lt!321845) (_2!9449 lt!321826))))

(declare-fun lt!321832 () Unit!14667)

(declare-fun Unit!14692 () Unit!14667)

(assert (=> b!205874 (= lt!321832 Unit!14692)))

(assert (=> b!205874 (invariant!0 (currentBit!9564 (_2!9438 lt!321834)) (currentByte!9569 (_2!9438 lt!321834)) (size!4555 (buf!5060 (_2!9438 lt!321834))))))

(declare-fun lt!321850 () Unit!14667)

(declare-fun Unit!14693 () Unit!14667)

(assert (=> b!205874 (= lt!321850 Unit!14693)))

(assert (=> b!205874 (= (size!4555 (buf!5060 (_2!9438 lt!321104))) (size!4555 (buf!5060 (_2!9438 lt!321834))))))

(declare-fun lt!321873 () Unit!14667)

(declare-fun Unit!14694 () Unit!14667)

(assert (=> b!205874 (= lt!321873 Unit!14694)))

(assert (=> b!205874 (= (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321834))) (currentByte!9569 (_2!9438 lt!321834)) (currentBit!9564 (_2!9438 lt!321834))) (bvsub (bvadd (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321104))) (currentByte!9569 (_2!9438 lt!321104)) (currentBit!9564 (_2!9438 lt!321104))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!321828 () Unit!14667)

(declare-fun Unit!14695 () Unit!14667)

(assert (=> b!205874 (= lt!321828 Unit!14695)))

(declare-fun lt!321870 () Unit!14667)

(declare-fun Unit!14696 () Unit!14667)

(assert (=> b!205874 (= lt!321870 Unit!14696)))

(assert (=> b!205874 (= lt!321840 (reader!0 (_2!9438 lt!321104) (_2!9438 lt!321834)))))

(declare-fun lt!321858 () (_ BitVec 64))

(assert (=> b!205874 (= lt!321858 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!321867 () Unit!14667)

(assert (=> b!205874 (= lt!321867 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9438 lt!321104) (buf!5060 (_2!9438 lt!321834)) lt!321858))))

(assert (=> b!205874 (validate_offset_bits!1 ((_ sign_extend 32) (size!4555 (buf!5060 (_2!9438 lt!321834)))) ((_ sign_extend 32) (currentByte!9569 (_2!9438 lt!321104))) ((_ sign_extend 32) (currentBit!9564 (_2!9438 lt!321104))) lt!321858)))

(declare-fun lt!321829 () Unit!14667)

(assert (=> b!205874 (= lt!321829 lt!321867)))

(assert (=> b!205874 (= lt!321822 (readNBitsLSBFirstsLoopPure!0 (_1!9439 lt!321840) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!172578 () Bool)

(assert (=> b!205874 (= res!172578 (= (_2!9449 lt!321822) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!205874 (=> (not res!172578) (not e!140819))))

(assert (=> b!205874 e!140819))

(declare-fun lt!321836 () Unit!14667)

(declare-fun Unit!14697 () Unit!14667)

(assert (=> b!205874 (= lt!321836 Unit!14697)))

(declare-fun b!205875 () Bool)

(declare-fun Unit!14698 () Unit!14667)

(assert (=> b!205875 (= e!140815 (tuple2!17567 Unit!14698 (_2!9438 lt!321104)))))

(declare-fun lt!321830 () Unit!14667)

(assert (=> b!205875 (= lt!321830 (lemmaIsPrefixRefl!0 (_2!9438 lt!321104)))))

(assert (=> b!205875 call!3267))

(declare-fun lt!321871 () Unit!14667)

(assert (=> b!205875 (= lt!321871 lt!321830)))

(declare-fun b!205876 () Bool)

(declare-fun e!140817 () Bool)

(assert (=> b!205876 (= e!140814 e!140817)))

(declare-fun res!172574 () Bool)

(assert (=> b!205876 (=> (not res!172574) (not e!140817))))

(declare-fun lt!321846 () tuple2!17588)

(assert (=> b!205876 (= res!172574 (= (_2!9449 lt!321846) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!321857 () tuple2!17568)

(assert (=> b!205876 (= lt!321846 (readNBitsLSBFirstsLoopPure!0 (_1!9439 lt!321857) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!321861 () Unit!14667)

(declare-fun lt!321835 () Unit!14667)

(assert (=> b!205876 (= lt!321861 lt!321835)))

(assert (=> b!205876 (validate_offset_bits!1 ((_ sign_extend 32) (size!4555 (buf!5060 (_2!9438 lt!321851)))) ((_ sign_extend 32) (currentByte!9569 (_2!9438 lt!321104))) ((_ sign_extend 32) (currentBit!9564 (_2!9438 lt!321104))) lt!321852)))

(assert (=> b!205876 (= lt!321835 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9438 lt!321104) (buf!5060 (_2!9438 lt!321851)) lt!321852))))

(assert (=> b!205876 e!140813))

(declare-fun res!172581 () Bool)

(assert (=> b!205876 (=> (not res!172581) (not e!140813))))

(assert (=> b!205876 (= res!172581 (and (= (size!4555 (buf!5060 (_2!9438 lt!321104))) (size!4555 (buf!5060 (_2!9438 lt!321851)))) (bvsge lt!321852 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205876 (= lt!321852 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!205876 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!205876 (= lt!321857 (reader!0 (_2!9438 lt!321104) (_2!9438 lt!321851)))))

(declare-fun bm!3264 () Bool)

(assert (=> bm!3264 (= call!3267 (isPrefixOf!0 (_2!9438 lt!321104) (ite c!10198 (_2!9438 lt!321104) (_2!9438 lt!321864))))))

(declare-fun b!205877 () Bool)

(assert (=> b!205877 (= e!140817 (= (_1!9449 lt!321846) (_2!9439 lt!321857)))))

(declare-fun b!205878 () Bool)

(declare-fun lt!321856 () tuple2!17564)

(assert (=> b!205878 (= lt!321856 (readBitPure!0 (readerFrom!0 (_2!9438 lt!321864) (currentBit!9564 (_2!9438 lt!321104)) (currentByte!9569 (_2!9438 lt!321104)))))))

(declare-fun res!172579 () Bool)

(assert (=> b!205878 (= res!172579 (and (= (_2!9437 lt!321856) lt!321825) (= (_1!9437 lt!321856) (_2!9438 lt!321864))))))

(declare-fun e!140821 () Bool)

(assert (=> b!205878 (=> (not res!172579) (not e!140821))))

(assert (=> b!205878 (= e!140820 e!140821)))

(declare-fun b!205879 () Bool)

(assert (=> b!205879 (= e!140821 (= (bitIndex!0 (size!4555 (buf!5060 (_1!9437 lt!321856))) (currentByte!9569 (_1!9437 lt!321856)) (currentBit!9564 (_1!9437 lt!321856))) (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321864))) (currentByte!9569 (_2!9438 lt!321864)) (currentBit!9564 (_2!9438 lt!321864)))))))

(assert (= (and d!70093 c!10198) b!205875))

(assert (= (and d!70093 (not c!10198)) b!205874))

(assert (= (and b!205874 res!172575) b!205864))

(assert (= (and b!205864 res!172580) b!205871))

(assert (= (and b!205871 res!172577) b!205878))

(assert (= (and b!205878 res!172579) b!205879))

(assert (= (and b!205874 res!172582) b!205869))

(assert (= (and b!205874 c!10197) b!205866))

(assert (= (and b!205874 (not c!10197)) b!205865))

(assert (= (and b!205874 res!172578) b!205872))

(assert (= (or b!205875 b!205871) bm!3264))

(assert (= (and d!70093 res!172572) b!205873))

(assert (= (and b!205873 res!172573) b!205867))

(assert (= (and b!205867 res!172583) b!205868))

(assert (= (and b!205868 res!172576) b!205876))

(assert (= (and b!205876 res!172581) b!205870))

(assert (= (and b!205876 res!172574) b!205877))

(declare-fun m!317261 () Bool)

(assert (=> b!205868 m!317261))

(declare-fun m!317263 () Bool)

(assert (=> b!205870 m!317263))

(declare-fun m!317265 () Bool)

(assert (=> bm!3264 m!317265))

(declare-fun m!317267 () Bool)

(assert (=> b!205867 m!317267))

(assert (=> b!205867 m!316797))

(assert (=> b!205875 m!317121))

(declare-fun m!317269 () Bool)

(assert (=> b!205878 m!317269))

(assert (=> b!205878 m!317269))

(declare-fun m!317271 () Bool)

(assert (=> b!205878 m!317271))

(declare-fun m!317273 () Bool)

(assert (=> b!205864 m!317273))

(assert (=> b!205864 m!316797))

(declare-fun m!317275 () Bool)

(assert (=> b!205879 m!317275))

(assert (=> b!205879 m!317273))

(declare-fun m!317277 () Bool)

(assert (=> b!205876 m!317277))

(declare-fun m!317279 () Bool)

(assert (=> b!205876 m!317279))

(declare-fun m!317281 () Bool)

(assert (=> b!205876 m!317281))

(declare-fun m!317283 () Bool)

(assert (=> b!205876 m!317283))

(declare-fun m!317285 () Bool)

(assert (=> b!205876 m!317285))

(declare-fun m!317287 () Bool)

(assert (=> b!205876 m!317287))

(declare-fun m!317289 () Bool)

(assert (=> d!70093 m!317289))

(declare-fun m!317291 () Bool)

(assert (=> b!205874 m!317291))

(declare-fun m!317293 () Bool)

(assert (=> b!205874 m!317293))

(declare-fun m!317295 () Bool)

(assert (=> b!205874 m!317295))

(declare-fun m!317297 () Bool)

(assert (=> b!205874 m!317297))

(declare-fun m!317299 () Bool)

(assert (=> b!205874 m!317299))

(declare-fun m!317301 () Bool)

(assert (=> b!205874 m!317301))

(declare-fun m!317303 () Bool)

(assert (=> b!205874 m!317303))

(declare-fun m!317305 () Bool)

(assert (=> b!205874 m!317305))

(declare-fun m!317307 () Bool)

(assert (=> b!205874 m!317307))

(declare-fun m!317309 () Bool)

(assert (=> b!205874 m!317309))

(declare-fun m!317311 () Bool)

(assert (=> b!205874 m!317311))

(declare-fun m!317313 () Bool)

(assert (=> b!205874 m!317313))

(declare-fun m!317315 () Bool)

(assert (=> b!205874 m!317315))

(declare-fun m!317317 () Bool)

(assert (=> b!205874 m!317317))

(assert (=> b!205874 m!317277))

(declare-fun m!317319 () Bool)

(assert (=> b!205874 m!317319))

(declare-fun m!317321 () Bool)

(assert (=> b!205874 m!317321))

(assert (=> b!205874 m!317279))

(declare-fun m!317323 () Bool)

(assert (=> b!205874 m!317323))

(declare-fun m!317325 () Bool)

(assert (=> b!205874 m!317325))

(declare-fun m!317327 () Bool)

(assert (=> b!205874 m!317327))

(assert (=> b!205874 m!316797))

(declare-fun m!317329 () Bool)

(assert (=> b!205874 m!317329))

(declare-fun m!317331 () Bool)

(assert (=> b!205874 m!317331))

(declare-fun m!317333 () Bool)

(assert (=> b!205874 m!317333))

(declare-fun m!317335 () Bool)

(assert (=> b!205874 m!317335))

(declare-fun m!317337 () Bool)

(assert (=> b!205874 m!317337))

(declare-fun m!317339 () Bool)

(assert (=> b!205874 m!317339))

(declare-fun m!317341 () Bool)

(assert (=> b!205874 m!317341))

(declare-fun m!317343 () Bool)

(assert (=> b!205874 m!317343))

(declare-fun m!317345 () Bool)

(assert (=> b!205874 m!317345))

(declare-fun m!317347 () Bool)

(assert (=> b!205874 m!317347))

(declare-fun m!317349 () Bool)

(assert (=> b!205874 m!317349))

(assert (=> b!205874 m!317327))

(declare-fun m!317351 () Bool)

(assert (=> b!205874 m!317351))

(assert (=> b!205541 d!70093))

(declare-fun d!70103 () Bool)

(declare-fun lt!321876 () tuple2!17586)

(assert (=> d!70103 (= lt!321876 (readBit!0 (readerFrom!0 (_2!9438 lt!321104) (currentBit!9564 thiss!1204) (currentByte!9569 thiss!1204))))))

(assert (=> d!70103 (= (readBitPure!0 (readerFrom!0 (_2!9438 lt!321104) (currentBit!9564 thiss!1204) (currentByte!9569 thiss!1204))) (tuple2!17565 (_2!9448 lt!321876) (_1!9448 lt!321876)))))

(declare-fun bs!17225 () Bool)

(assert (= bs!17225 d!70103))

(assert (=> bs!17225 m!316835))

(declare-fun m!317353 () Bool)

(assert (=> bs!17225 m!317353))

(assert (=> b!205539 d!70103))

(declare-fun d!70105 () Bool)

(declare-fun e!140824 () Bool)

(assert (=> d!70105 e!140824))

(declare-fun res!172587 () Bool)

(assert (=> d!70105 (=> (not res!172587) (not e!140824))))

(assert (=> d!70105 (= res!172587 (invariant!0 (currentBit!9564 (_2!9438 lt!321104)) (currentByte!9569 (_2!9438 lt!321104)) (size!4555 (buf!5060 (_2!9438 lt!321104)))))))

(assert (=> d!70105 (= (readerFrom!0 (_2!9438 lt!321104) (currentBit!9564 thiss!1204) (currentByte!9569 thiss!1204)) (BitStream!8219 (buf!5060 (_2!9438 lt!321104)) (currentByte!9569 thiss!1204) (currentBit!9564 thiss!1204)))))

(declare-fun b!205882 () Bool)

(assert (=> b!205882 (= e!140824 (invariant!0 (currentBit!9564 thiss!1204) (currentByte!9569 thiss!1204) (size!4555 (buf!5060 (_2!9438 lt!321104)))))))

(assert (= (and d!70105 res!172587) b!205882))

(assert (=> d!70105 m!317059))

(assert (=> b!205882 m!316805))

(assert (=> b!205539 d!70105))

(declare-fun d!70107 () Bool)

(assert (=> d!70107 (= (invariant!0 (currentBit!9564 thiss!1204) (currentByte!9569 thiss!1204) (size!4555 (buf!5060 (_2!9438 lt!321108)))) (and (bvsge (currentBit!9564 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9564 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9569 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9569 thiss!1204) (size!4555 (buf!5060 (_2!9438 lt!321108)))) (and (= (currentBit!9564 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9569 thiss!1204) (size!4555 (buf!5060 (_2!9438 lt!321108))))))))))

(assert (=> b!205540 d!70107))

(assert (=> b!205529 d!70039))

(assert (=> b!205529 d!70041))

(declare-fun b!205892 () Bool)

(declare-fun res!172596 () Bool)

(declare-fun e!140829 () Bool)

(assert (=> b!205892 (=> (not res!172596) (not e!140829))))

(declare-fun lt!321887 () (_ BitVec 64))

(declare-fun lt!321885 () tuple2!17566)

(declare-fun lt!321888 () (_ BitVec 64))

(assert (=> b!205892 (= res!172596 (= (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321885))) (currentByte!9569 (_2!9438 lt!321885)) (currentBit!9564 (_2!9438 lt!321885))) (bvadd lt!321887 lt!321888)))))

(assert (=> b!205892 (or (not (= (bvand lt!321887 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!321888 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!321887 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!321887 lt!321888) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205892 (= lt!321888 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!205892 (= lt!321887 (bitIndex!0 (size!4555 (buf!5060 thiss!1204)) (currentByte!9569 thiss!1204) (currentBit!9564 thiss!1204)))))

(declare-fun d!70109 () Bool)

(assert (=> d!70109 e!140829))

(declare-fun res!172597 () Bool)

(assert (=> d!70109 (=> (not res!172597) (not e!140829))))

(assert (=> d!70109 (= res!172597 (= (size!4555 (buf!5060 thiss!1204)) (size!4555 (buf!5060 (_2!9438 lt!321885)))))))

(declare-fun choose!16 (BitStream!8218 Bool) tuple2!17566)

(assert (=> d!70109 (= lt!321885 (choose!16 thiss!1204 lt!321112))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!70109 (validate_offset_bit!0 ((_ sign_extend 32) (size!4555 (buf!5060 thiss!1204))) ((_ sign_extend 32) (currentByte!9569 thiss!1204)) ((_ sign_extend 32) (currentBit!9564 thiss!1204)))))

(assert (=> d!70109 (= (appendBit!0 thiss!1204 lt!321112) lt!321885)))

(declare-fun b!205894 () Bool)

(declare-fun e!140830 () Bool)

(assert (=> b!205894 (= e!140829 e!140830)))

(declare-fun res!172598 () Bool)

(assert (=> b!205894 (=> (not res!172598) (not e!140830))))

(declare-fun lt!321886 () tuple2!17564)

(assert (=> b!205894 (= res!172598 (and (= (_2!9437 lt!321886) lt!321112) (= (_1!9437 lt!321886) (_2!9438 lt!321885))))))

(assert (=> b!205894 (= lt!321886 (readBitPure!0 (readerFrom!0 (_2!9438 lt!321885) (currentBit!9564 thiss!1204) (currentByte!9569 thiss!1204))))))

(declare-fun b!205893 () Bool)

(declare-fun res!172599 () Bool)

(assert (=> b!205893 (=> (not res!172599) (not e!140829))))

(assert (=> b!205893 (= res!172599 (isPrefixOf!0 thiss!1204 (_2!9438 lt!321885)))))

(declare-fun b!205895 () Bool)

(assert (=> b!205895 (= e!140830 (= (bitIndex!0 (size!4555 (buf!5060 (_1!9437 lt!321886))) (currentByte!9569 (_1!9437 lt!321886)) (currentBit!9564 (_1!9437 lt!321886))) (bitIndex!0 (size!4555 (buf!5060 (_2!9438 lt!321885))) (currentByte!9569 (_2!9438 lt!321885)) (currentBit!9564 (_2!9438 lt!321885)))))))

(assert (= (and d!70109 res!172597) b!205892))

(assert (= (and b!205892 res!172596) b!205893))

(assert (= (and b!205893 res!172599) b!205894))

(assert (= (and b!205894 res!172598) b!205895))

(declare-fun m!317355 () Bool)

(assert (=> b!205895 m!317355))

(declare-fun m!317357 () Bool)

(assert (=> b!205895 m!317357))

(declare-fun m!317359 () Bool)

(assert (=> b!205893 m!317359))

(declare-fun m!317361 () Bool)

(assert (=> b!205894 m!317361))

(assert (=> b!205894 m!317361))

(declare-fun m!317363 () Bool)

(assert (=> b!205894 m!317363))

(declare-fun m!317365 () Bool)

(assert (=> d!70109 m!317365))

(declare-fun m!317367 () Bool)

(assert (=> d!70109 m!317367))

(assert (=> b!205892 m!317357))

(assert (=> b!205892 m!316799))

(assert (=> b!205529 d!70109))

(push 1)

(assert (not d!70073))

(assert (not d!70091))

(assert (not d!70059))

(assert (not d!70093))

(assert (not b!205878))

(assert (not b!205751))

(assert (not b!205747))

(assert (not d!70069))

(assert (not b!205753))

(assert (not b!205868))

(assert (not b!205750))

(assert (not b!205778))

(assert (not b!205870))

(assert (not d!70105))

(assert (not d!70061))

(assert (not b!205745))

(assert (not b!205776))

(assert (not d!70041))

(assert (not b!205874))

(assert (not bm!3264))

(assert (not d!70077))

(assert (not b!205867))

(assert (not b!205729))

(assert (not b!205893))

(assert (not d!70049))

(assert (not b!205876))

(assert (not b!205724))

(assert (not b!205746))

(assert (not b!205879))

(assert (not d!70055))

(assert (not d!70081))

(assert (not d!70079))

(assert (not d!70047))

(assert (not b!205875))

(assert (not d!70071))

(assert (not d!70103))

(assert (not b!205864))

(assert (not d!70109))

(assert (not d!70085))

(assert (not b!205895))

(assert (not b!205752))

(assert (not b!205727))

(assert (not b!205892))

(assert (not b!205894))

(assert (not b!205726))

(assert (not b!205748))

(assert (not b!205882))

(assert (not d!70039))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

