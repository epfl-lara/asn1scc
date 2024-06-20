; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34480 () Bool)

(assert start!34480)

(declare-fun b!163659 () Bool)

(declare-fun res!136378 () Bool)

(declare-fun e!113037 () Bool)

(assert (=> b!163659 (=> res!136378 e!113037)))

(declare-datatypes ((array!8152 0))(
  ( (array!8153 (arr!4572 (Array (_ BitVec 32) (_ BitVec 8))) (size!3651 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6458 0))(
  ( (BitStream!6459 (buf!4103 array!8152) (currentByte!7656 (_ BitVec 32)) (currentBit!7651 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!11358 0))(
  ( (Unit!11359) )
))
(declare-datatypes ((tuple2!14536 0))(
  ( (tuple2!14537 (_1!7859 Unit!11358) (_2!7859 BitStream!6458)) )
))
(declare-fun lt!256763 () tuple2!14536)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun thiss!1577 () BitStream!6458)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!163659 (= res!136378 (not (= (bitIndex!0 (size!3651 (buf!4103 (_2!7859 lt!256763))) (currentByte!7656 (_2!7859 lt!256763)) (currentBit!7651 (_2!7859 lt!256763))) (bvadd (bitIndex!0 (size!3651 (buf!4103 thiss!1577)) (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577)) ((_ sign_extend 32) nBits!511)))))))

(declare-fun b!163660 () Bool)

(declare-fun e!113038 () Bool)

(declare-fun e!113041 () Bool)

(assert (=> b!163660 (= e!113038 (not e!113041))))

(declare-fun res!136376 () Bool)

(assert (=> b!163660 (=> res!136376 e!113041)))

(declare-fun lt!256760 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163660 (= res!136376 (not (byteRangesEq!0 (select (arr!4572 (buf!4103 thiss!1577)) (currentByte!7656 thiss!1577)) lt!256760 #b00000000000000000000000000000000 (currentBit!7651 thiss!1577))))))

(declare-fun lt!256764 () array!8152)

(declare-fun arrayRangesEq!585 (array!8152 array!8152 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163660 (arrayRangesEq!585 (buf!4103 thiss!1577) lt!256764 #b00000000000000000000000000000000 (currentByte!7656 thiss!1577))))

(declare-fun lt!256761 () Unit!11358)

(declare-fun arrayUpdatedAtPrefixLemma!193 (array!8152 (_ BitVec 32) (_ BitVec 8)) Unit!11358)

(assert (=> b!163660 (= lt!256761 (arrayUpdatedAtPrefixLemma!193 (buf!4103 thiss!1577) (currentByte!7656 thiss!1577) lt!256760))))

(assert (=> b!163660 (= lt!256764 (array!8153 (store (arr!4572 (buf!4103 thiss!1577)) (currentByte!7656 thiss!1577) lt!256760) (size!3651 (buf!4103 thiss!1577))))))

(declare-fun lt!256762 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163660 (= lt!256760 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4572 (buf!4103 thiss!1577)) (currentByte!7656 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7651 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256762)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256762))))))

(assert (=> b!163660 (= lt!256762 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7651 thiss!1577) nBits!511)))))

(declare-fun b!163661 () Bool)

(declare-fun res!136377 () Bool)

(assert (=> b!163661 (=> (not res!136377) (not e!113038))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163661 (= res!136377 (validate_offset_bits!1 ((_ sign_extend 32) (size!3651 (buf!4103 thiss!1577))) ((_ sign_extend 32) (currentByte!7656 thiss!1577)) ((_ sign_extend 32) (currentBit!7651 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun res!136374 () Bool)

(assert (=> start!34480 (=> (not res!136374) (not e!113038))))

(assert (=> start!34480 (= res!136374 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34480 e!113038))

(assert (=> start!34480 true))

(declare-fun e!113040 () Bool)

(declare-fun inv!12 (BitStream!6458) Bool)

(assert (=> start!34480 (and (inv!12 thiss!1577) e!113040)))

(declare-fun b!163662 () Bool)

(declare-fun res!136375 () Bool)

(assert (=> b!163662 (=> (not res!136375) (not e!113038))))

(assert (=> b!163662 (= res!136375 (bvsle (bvadd (currentBit!7651 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163663 () Bool)

(assert (=> b!163663 (= e!113041 e!113037)))

(declare-fun res!136380 () Bool)

(assert (=> b!163663 (=> res!136380 e!113037)))

(assert (=> b!163663 (= res!136380 (not (= (size!3651 (buf!4103 thiss!1577)) (size!3651 (buf!4103 (_2!7859 lt!256763))))))))

(declare-fun moveBitIndex!0 (BitStream!6458 (_ BitVec 64)) tuple2!14536)

(assert (=> b!163663 (= lt!256763 (moveBitIndex!0 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163664 () Bool)

(declare-fun res!136379 () Bool)

(assert (=> b!163664 (=> res!136379 e!113037)))

(declare-fun isPrefixOf!0 (BitStream!6458 BitStream!6458) Bool)

(assert (=> b!163664 (= res!136379 (not (isPrefixOf!0 thiss!1577 (_2!7859 lt!256763))))))

(declare-fun b!163665 () Bool)

(declare-datatypes ((tuple2!14538 0))(
  ( (tuple2!14539 (_1!7860 BitStream!6458) (_2!7860 BitStream!6458)) )
))
(declare-fun lt!256759 () tuple2!14538)

(assert (=> b!163665 (= e!113037 (validate_offset_bits!1 ((_ sign_extend 32) (size!3651 (buf!4103 (_1!7860 lt!256759)))) ((_ sign_extend 32) (currentByte!7656 (_1!7860 lt!256759))) ((_ sign_extend 32) (currentBit!7651 (_1!7860 lt!256759))) ((_ sign_extend 32) nBits!511)))))

(declare-fun reader!0 (BitStream!6458 BitStream!6458) tuple2!14538)

(assert (=> b!163665 (= lt!256759 (reader!0 thiss!1577 (_2!7859 lt!256763)))))

(declare-fun b!163666 () Bool)

(declare-fun array_inv!3392 (array!8152) Bool)

(assert (=> b!163666 (= e!113040 (array_inv!3392 (buf!4103 thiss!1577)))))

(assert (= (and start!34480 res!136374) b!163661))

(assert (= (and b!163661 res!136377) b!163662))

(assert (= (and b!163662 res!136375) b!163660))

(assert (= (and b!163660 (not res!136376)) b!163663))

(assert (= (and b!163663 (not res!136380)) b!163659))

(assert (= (and b!163659 (not res!136378)) b!163664))

(assert (= (and b!163664 (not res!136379)) b!163665))

(assert (= start!34480 b!163666))

(declare-fun m!259757 () Bool)

(assert (=> b!163666 m!259757))

(declare-fun m!259759 () Bool)

(assert (=> b!163664 m!259759))

(declare-fun m!259761 () Bool)

(assert (=> b!163659 m!259761))

(declare-fun m!259763 () Bool)

(assert (=> b!163659 m!259763))

(declare-fun m!259765 () Bool)

(assert (=> b!163660 m!259765))

(declare-fun m!259767 () Bool)

(assert (=> b!163660 m!259767))

(assert (=> b!163660 m!259765))

(declare-fun m!259769 () Bool)

(assert (=> b!163660 m!259769))

(declare-fun m!259771 () Bool)

(assert (=> b!163660 m!259771))

(declare-fun m!259773 () Bool)

(assert (=> b!163660 m!259773))

(declare-fun m!259775 () Bool)

(assert (=> b!163660 m!259775))

(declare-fun m!259777 () Bool)

(assert (=> b!163660 m!259777))

(declare-fun m!259779 () Bool)

(assert (=> b!163660 m!259779))

(declare-fun m!259781 () Bool)

(assert (=> b!163663 m!259781))

(declare-fun m!259783 () Bool)

(assert (=> b!163665 m!259783))

(declare-fun m!259785 () Bool)

(assert (=> b!163665 m!259785))

(declare-fun m!259787 () Bool)

(assert (=> b!163661 m!259787))

(declare-fun m!259789 () Bool)

(assert (=> start!34480 m!259789))

(push 1)

(assert (not b!163660))

(assert (not b!163665))

(assert (not start!34480))

(assert (not b!163664))

(assert (not b!163666))

(assert (not b!163661))

(assert (not b!163659))

(assert (not b!163663))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56475 () Bool)

(assert (=> d!56475 (= (array_inv!3392 (buf!4103 thiss!1577)) (bvsge (size!3651 (buf!4103 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!163666 d!56475))

(declare-fun d!56477 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56477 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3651 (buf!4103 thiss!1577))) ((_ sign_extend 32) (currentByte!7656 thiss!1577)) ((_ sign_extend 32) (currentBit!7651 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3651 (buf!4103 thiss!1577))) ((_ sign_extend 32) (currentByte!7656 thiss!1577)) ((_ sign_extend 32) (currentBit!7651 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!13984 () Bool)

(assert (= bs!13984 d!56477))

(declare-fun m!259809 () Bool)

(assert (=> bs!13984 m!259809))

(assert (=> b!163661 d!56477))

(declare-fun d!56479 () Bool)

(assert (=> d!56479 (= (byteRangesEq!0 (select (arr!4572 (buf!4103 thiss!1577)) (currentByte!7656 thiss!1577)) lt!256760 #b00000000000000000000000000000000 (currentBit!7651 thiss!1577)) (or (= #b00000000000000000000000000000000 (currentBit!7651 thiss!1577)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4572 (buf!4103 thiss!1577)) (currentByte!7656 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7651 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!256760) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7651 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13985 () Bool)

(assert (= bs!13985 d!56479))

(declare-fun m!259813 () Bool)

(assert (=> bs!13985 m!259813))

(declare-fun m!259819 () Bool)

(assert (=> bs!13985 m!259819))

(assert (=> b!163660 d!56479))

(declare-fun d!56483 () Bool)

(declare-fun res!136411 () Bool)

(declare-fun e!113069 () Bool)

(assert (=> d!56483 (=> res!136411 e!113069)))

(assert (=> d!56483 (= res!136411 (= #b00000000000000000000000000000000 (currentByte!7656 thiss!1577)))))

(assert (=> d!56483 (= (arrayRangesEq!585 (buf!4103 thiss!1577) lt!256764 #b00000000000000000000000000000000 (currentByte!7656 thiss!1577)) e!113069)))

(declare-fun b!163697 () Bool)

(declare-fun e!113070 () Bool)

(assert (=> b!163697 (= e!113069 e!113070)))

(declare-fun res!136412 () Bool)

(assert (=> b!163697 (=> (not res!136412) (not e!113070))))

(assert (=> b!163697 (= res!136412 (= (select (arr!4572 (buf!4103 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4572 lt!256764) #b00000000000000000000000000000000)))))

(declare-fun b!163698 () Bool)

(assert (=> b!163698 (= e!113070 (arrayRangesEq!585 (buf!4103 thiss!1577) lt!256764 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7656 thiss!1577)))))

(assert (= (and d!56483 (not res!136411)) b!163697))

(assert (= (and b!163697 res!136412) b!163698))

(declare-fun m!259825 () Bool)

(assert (=> b!163697 m!259825))

(declare-fun m!259827 () Bool)

(assert (=> b!163697 m!259827))

(declare-fun m!259829 () Bool)

(assert (=> b!163698 m!259829))

(assert (=> b!163660 d!56483))

(declare-fun d!56489 () Bool)

(declare-fun e!113077 () Bool)

(assert (=> d!56489 e!113077))

(declare-fun res!136419 () Bool)

(assert (=> d!56489 (=> (not res!136419) (not e!113077))))

(assert (=> d!56489 (= res!136419 (and (bvsge (currentByte!7656 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7656 thiss!1577) (size!3651 (buf!4103 thiss!1577)))))))

(declare-fun lt!256806 () Unit!11358)

(declare-fun choose!193 (array!8152 (_ BitVec 32) (_ BitVec 8)) Unit!11358)

(assert (=> d!56489 (= lt!256806 (choose!193 (buf!4103 thiss!1577) (currentByte!7656 thiss!1577) lt!256760))))

(assert (=> d!56489 (and (bvsle #b00000000000000000000000000000000 (currentByte!7656 thiss!1577)) (bvslt (currentByte!7656 thiss!1577) (size!3651 (buf!4103 thiss!1577))))))

(assert (=> d!56489 (= (arrayUpdatedAtPrefixLemma!193 (buf!4103 thiss!1577) (currentByte!7656 thiss!1577) lt!256760) lt!256806)))

(declare-fun b!163705 () Bool)

(assert (=> b!163705 (= e!113077 (arrayRangesEq!585 (buf!4103 thiss!1577) (array!8153 (store (arr!4572 (buf!4103 thiss!1577)) (currentByte!7656 thiss!1577) lt!256760) (size!3651 (buf!4103 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7656 thiss!1577)))))

(assert (= (and d!56489 res!136419) b!163705))

(declare-fun m!259831 () Bool)

(assert (=> d!56489 m!259831))

(assert (=> b!163705 m!259775))

(declare-fun m!259833 () Bool)

(assert (=> b!163705 m!259833))

(assert (=> b!163660 d!56489))

(declare-fun d!56491 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56491 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7651 thiss!1577) (currentByte!7656 thiss!1577) (size!3651 (buf!4103 thiss!1577))))))

(declare-fun bs!13988 () Bool)

(assert (= bs!13988 d!56491))

(declare-fun m!259841 () Bool)

(assert (=> bs!13988 m!259841))

(assert (=> start!34480 d!56491))

(declare-fun d!56495 () Bool)

(declare-fun lt!256899 () (_ BitVec 32))

(assert (=> d!56495 (= lt!256899 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!256898 () (_ BitVec 32))

(assert (=> d!56495 (= lt!256898 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!113105 () Bool)

(assert (=> d!56495 e!113105))

(declare-fun res!136455 () Bool)

(assert (=> d!56495 (=> (not res!136455) (not e!113105))))

(declare-fun moveBitIndexPrecond!0 (BitStream!6458 (_ BitVec 64)) Bool)

(assert (=> d!56495 (= res!136455 (moveBitIndexPrecond!0 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun Unit!11373 () Unit!11358)

(declare-fun Unit!11374 () Unit!11358)

(declare-fun Unit!11375 () Unit!11358)

(assert (=> d!56495 (= (moveBitIndex!0 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577)) ((_ sign_extend 32) nBits!511)) (ite (bvslt (bvadd (currentBit!7651 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577))) lt!256899) #b00000000000000000000000000000000) (tuple2!14537 Unit!11373 (BitStream!6459 (buf!4103 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577))) (bvsub (bvadd (currentByte!7656 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577))) lt!256898) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!256899 (currentBit!7651 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577)))))) (ite (bvsge (bvadd (currentBit!7651 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577))) lt!256899) #b00000000000000000000000000001000) (tuple2!14537 Unit!11374 (BitStream!6459 (buf!4103 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577))) (bvadd (currentByte!7656 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577))) lt!256898 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7651 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577))) lt!256899) #b00000000000000000000000000001000))) (tuple2!14537 Unit!11375 (BitStream!6459 (buf!4103 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577))) (bvadd (currentByte!7656 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577))) lt!256898) (bvadd (currentBit!7651 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577))) lt!256899))))))))

(declare-fun b!163745 () Bool)

(declare-fun e!113104 () Bool)

(assert (=> b!163745 (= e!113105 e!113104)))

(declare-fun res!136456 () Bool)

(assert (=> b!163745 (=> (not res!136456) (not e!113104))))

(declare-fun lt!256897 () (_ BitVec 64))

(declare-fun lt!256895 () tuple2!14536)

(assert (=> b!163745 (= res!136456 (= (bvadd lt!256897 ((_ sign_extend 32) nBits!511)) (bitIndex!0 (size!3651 (buf!4103 (_2!7859 lt!256895))) (currentByte!7656 (_2!7859 lt!256895)) (currentBit!7651 (_2!7859 lt!256895)))))))

(assert (=> b!163745 (or (not (= (bvand lt!256897 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!511) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!256897 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!256897 ((_ sign_extend 32) nBits!511)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!163745 (= lt!256897 (bitIndex!0 (size!3651 (buf!4103 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577)))) (currentByte!7656 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577))) (currentBit!7651 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577)))))))

(declare-fun lt!256896 () (_ BitVec 32))

(declare-fun lt!256900 () (_ BitVec 32))

(declare-fun Unit!11376 () Unit!11358)

(declare-fun Unit!11377 () Unit!11358)

(declare-fun Unit!11378 () Unit!11358)

(assert (=> b!163745 (= lt!256895 (ite (bvslt (bvadd (currentBit!7651 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577))) lt!256896) #b00000000000000000000000000000000) (tuple2!14537 Unit!11376 (BitStream!6459 (buf!4103 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577))) (bvsub (bvadd (currentByte!7656 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577))) lt!256900) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!256896 (currentBit!7651 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577)))))) (ite (bvsge (bvadd (currentBit!7651 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577))) lt!256896) #b00000000000000000000000000001000) (tuple2!14537 Unit!11377 (BitStream!6459 (buf!4103 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577))) (bvadd (currentByte!7656 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577))) lt!256900 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7651 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577))) lt!256896) #b00000000000000000000000000001000))) (tuple2!14537 Unit!11378 (BitStream!6459 (buf!4103 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577))) (bvadd (currentByte!7656 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577))) lt!256900) (bvadd (currentBit!7651 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577))) lt!256896))))))))

(assert (=> b!163745 (= lt!256896 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!163745 (= lt!256900 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!163746 () Bool)

(assert (=> b!163746 (= e!113104 (and (= (size!3651 (buf!4103 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577)))) (size!3651 (buf!4103 (_2!7859 lt!256895)))) (= (buf!4103 (BitStream!6459 lt!256764 (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577))) (buf!4103 (_2!7859 lt!256895)))))))

(assert (= (and d!56495 res!136455) b!163745))

(assert (= (and b!163745 res!136456) b!163746))

(declare-fun m!259867 () Bool)

(assert (=> d!56495 m!259867))

(declare-fun m!259869 () Bool)

(assert (=> b!163745 m!259869))

(declare-fun m!259871 () Bool)

(assert (=> b!163745 m!259871))

(assert (=> b!163663 d!56495))

(declare-fun d!56519 () Bool)

(assert (=> d!56519 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3651 (buf!4103 (_1!7860 lt!256759)))) ((_ sign_extend 32) (currentByte!7656 (_1!7860 lt!256759))) ((_ sign_extend 32) (currentBit!7651 (_1!7860 lt!256759))) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3651 (buf!4103 (_1!7860 lt!256759)))) ((_ sign_extend 32) (currentByte!7656 (_1!7860 lt!256759))) ((_ sign_extend 32) (currentBit!7651 (_1!7860 lt!256759)))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!13992 () Bool)

(assert (= bs!13992 d!56519))

(declare-fun m!259873 () Bool)

(assert (=> bs!13992 m!259873))

(assert (=> b!163665 d!56519))

(declare-fun b!163772 () Bool)

(declare-fun e!113117 () Unit!11358)

(declare-fun lt!256989 () Unit!11358)

(assert (=> b!163772 (= e!113117 lt!256989)))

(declare-fun lt!256994 () (_ BitVec 64))

(assert (=> b!163772 (= lt!256994 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!256985 () (_ BitVec 64))

(assert (=> b!163772 (= lt!256985 (bitIndex!0 (size!3651 (buf!4103 thiss!1577)) (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!8152 array!8152 (_ BitVec 64) (_ BitVec 64)) Unit!11358)

(assert (=> b!163772 (= lt!256989 (arrayBitRangesEqSymmetric!0 (buf!4103 thiss!1577) (buf!4103 (_2!7859 lt!256763)) lt!256994 lt!256985))))

(declare-fun arrayBitRangesEq!0 (array!8152 array!8152 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163772 (arrayBitRangesEq!0 (buf!4103 (_2!7859 lt!256763)) (buf!4103 thiss!1577) lt!256994 lt!256985)))

(declare-fun e!113118 () Bool)

(declare-fun lt!256982 () tuple2!14538)

(declare-fun lt!256988 () (_ BitVec 64))

(declare-fun b!163773 () Bool)

(declare-fun lt!256976 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!6458 (_ BitVec 64)) BitStream!6458)

(assert (=> b!163773 (= e!113118 (= (_1!7860 lt!256982) (withMovedBitIndex!0 (_2!7860 lt!256982) (bvsub lt!256976 lt!256988))))))

(assert (=> b!163773 (or (= (bvand lt!256976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!256988 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!256976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!256976 lt!256988) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!163773 (= lt!256988 (bitIndex!0 (size!3651 (buf!4103 (_2!7859 lt!256763))) (currentByte!7656 (_2!7859 lt!256763)) (currentBit!7651 (_2!7859 lt!256763))))))

(assert (=> b!163773 (= lt!256976 (bitIndex!0 (size!3651 (buf!4103 thiss!1577)) (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577)))))

(declare-fun b!163771 () Bool)

(declare-fun res!136476 () Bool)

(assert (=> b!163771 (=> (not res!136476) (not e!113118))))

(assert (=> b!163771 (= res!136476 (isPrefixOf!0 (_1!7860 lt!256982) thiss!1577))))

(declare-fun d!56521 () Bool)

(assert (=> d!56521 e!113118))

(declare-fun res!136477 () Bool)

(assert (=> d!56521 (=> (not res!136477) (not e!113118))))

(assert (=> d!56521 (= res!136477 (isPrefixOf!0 (_1!7860 lt!256982) (_2!7860 lt!256982)))))

(declare-fun lt!256977 () BitStream!6458)

(assert (=> d!56521 (= lt!256982 (tuple2!14539 lt!256977 (_2!7859 lt!256763)))))

(declare-fun lt!256979 () Unit!11358)

(declare-fun lt!256978 () Unit!11358)

(assert (=> d!56521 (= lt!256979 lt!256978)))

(assert (=> d!56521 (isPrefixOf!0 lt!256977 (_2!7859 lt!256763))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!6458 BitStream!6458 BitStream!6458) Unit!11358)

(assert (=> d!56521 (= lt!256978 (lemmaIsPrefixTransitive!0 lt!256977 (_2!7859 lt!256763) (_2!7859 lt!256763)))))

(declare-fun lt!256987 () Unit!11358)

(declare-fun lt!256986 () Unit!11358)

(assert (=> d!56521 (= lt!256987 lt!256986)))

(assert (=> d!56521 (isPrefixOf!0 lt!256977 (_2!7859 lt!256763))))

(assert (=> d!56521 (= lt!256986 (lemmaIsPrefixTransitive!0 lt!256977 thiss!1577 (_2!7859 lt!256763)))))

(declare-fun lt!256980 () Unit!11358)

(assert (=> d!56521 (= lt!256980 e!113117)))

(declare-fun c!8573 () Bool)

(assert (=> d!56521 (= c!8573 (not (= (size!3651 (buf!4103 thiss!1577)) #b00000000000000000000000000000000)))))

(declare-fun lt!256991 () Unit!11358)

(declare-fun lt!256990 () Unit!11358)

(assert (=> d!56521 (= lt!256991 lt!256990)))

(assert (=> d!56521 (isPrefixOf!0 (_2!7859 lt!256763) (_2!7859 lt!256763))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!6458) Unit!11358)

(assert (=> d!56521 (= lt!256990 (lemmaIsPrefixRefl!0 (_2!7859 lt!256763)))))

(declare-fun lt!256983 () Unit!11358)

(declare-fun lt!256995 () Unit!11358)

(assert (=> d!56521 (= lt!256983 lt!256995)))

(assert (=> d!56521 (= lt!256995 (lemmaIsPrefixRefl!0 (_2!7859 lt!256763)))))

(declare-fun lt!256984 () Unit!11358)

(declare-fun lt!256993 () Unit!11358)

(assert (=> d!56521 (= lt!256984 lt!256993)))

(assert (=> d!56521 (isPrefixOf!0 lt!256977 lt!256977)))

(assert (=> d!56521 (= lt!256993 (lemmaIsPrefixRefl!0 lt!256977))))

(declare-fun lt!256981 () Unit!11358)

(declare-fun lt!256992 () Unit!11358)

(assert (=> d!56521 (= lt!256981 lt!256992)))

(assert (=> d!56521 (isPrefixOf!0 thiss!1577 thiss!1577)))

(assert (=> d!56521 (= lt!256992 (lemmaIsPrefixRefl!0 thiss!1577))))

(assert (=> d!56521 (= lt!256977 (BitStream!6459 (buf!4103 (_2!7859 lt!256763)) (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577)))))

(assert (=> d!56521 (isPrefixOf!0 thiss!1577 (_2!7859 lt!256763))))

(assert (=> d!56521 (= (reader!0 thiss!1577 (_2!7859 lt!256763)) lt!256982)))

(declare-fun b!163774 () Bool)

(declare-fun Unit!11379 () Unit!11358)

(assert (=> b!163774 (= e!113117 Unit!11379)))

(declare-fun b!163775 () Bool)

(declare-fun res!136475 () Bool)

(assert (=> b!163775 (=> (not res!136475) (not e!113118))))

(assert (=> b!163775 (= res!136475 (isPrefixOf!0 (_2!7860 lt!256982) (_2!7859 lt!256763)))))

(assert (= (and d!56521 c!8573) b!163772))

(assert (= (and d!56521 (not c!8573)) b!163774))

(assert (= (and d!56521 res!136477) b!163771))

(assert (= (and b!163771 res!136476) b!163775))

(assert (= (and b!163775 res!136475) b!163773))

(assert (=> b!163772 m!259763))

(declare-fun m!259911 () Bool)

(assert (=> b!163772 m!259911))

(declare-fun m!259913 () Bool)

(assert (=> b!163772 m!259913))

(declare-fun m!259915 () Bool)

(assert (=> b!163771 m!259915))

(declare-fun m!259917 () Bool)

(assert (=> b!163775 m!259917))

(declare-fun m!259919 () Bool)

(assert (=> d!56521 m!259919))

(declare-fun m!259921 () Bool)

(assert (=> d!56521 m!259921))

(declare-fun m!259923 () Bool)

(assert (=> d!56521 m!259923))

(declare-fun m!259925 () Bool)

(assert (=> d!56521 m!259925))

(declare-fun m!259927 () Bool)

(assert (=> d!56521 m!259927))

(assert (=> d!56521 m!259759))

(declare-fun m!259929 () Bool)

(assert (=> d!56521 m!259929))

(declare-fun m!259931 () Bool)

(assert (=> d!56521 m!259931))

(declare-fun m!259933 () Bool)

(assert (=> d!56521 m!259933))

(declare-fun m!259935 () Bool)

(assert (=> d!56521 m!259935))

(declare-fun m!259937 () Bool)

(assert (=> d!56521 m!259937))

(declare-fun m!259939 () Bool)

(assert (=> b!163773 m!259939))

(assert (=> b!163773 m!259761))

(assert (=> b!163773 m!259763))

(assert (=> b!163665 d!56521))

(declare-fun d!56527 () Bool)

(declare-fun res!136485 () Bool)

(declare-fun e!113124 () Bool)

(assert (=> d!56527 (=> (not res!136485) (not e!113124))))

(assert (=> d!56527 (= res!136485 (= (size!3651 (buf!4103 thiss!1577)) (size!3651 (buf!4103 (_2!7859 lt!256763)))))))

(assert (=> d!56527 (= (isPrefixOf!0 thiss!1577 (_2!7859 lt!256763)) e!113124)))

(declare-fun b!163782 () Bool)

(declare-fun res!136484 () Bool)

(assert (=> b!163782 (=> (not res!136484) (not e!113124))))

(assert (=> b!163782 (= res!136484 (bvsle (bitIndex!0 (size!3651 (buf!4103 thiss!1577)) (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577)) (bitIndex!0 (size!3651 (buf!4103 (_2!7859 lt!256763))) (currentByte!7656 (_2!7859 lt!256763)) (currentBit!7651 (_2!7859 lt!256763)))))))

(declare-fun b!163783 () Bool)

(declare-fun e!113123 () Bool)

(assert (=> b!163783 (= e!113124 e!113123)))

(declare-fun res!136486 () Bool)

(assert (=> b!163783 (=> res!136486 e!113123)))

(assert (=> b!163783 (= res!136486 (= (size!3651 (buf!4103 thiss!1577)) #b00000000000000000000000000000000))))

(declare-fun b!163784 () Bool)

(assert (=> b!163784 (= e!113123 (arrayBitRangesEq!0 (buf!4103 thiss!1577) (buf!4103 (_2!7859 lt!256763)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3651 (buf!4103 thiss!1577)) (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577))))))

(assert (= (and d!56527 res!136485) b!163782))

(assert (= (and b!163782 res!136484) b!163783))

(assert (= (and b!163783 (not res!136486)) b!163784))

(assert (=> b!163782 m!259763))

(assert (=> b!163782 m!259761))

(assert (=> b!163784 m!259763))

(assert (=> b!163784 m!259763))

(declare-fun m!259941 () Bool)

(assert (=> b!163784 m!259941))

(assert (=> b!163664 d!56527))

(declare-fun d!56529 () Bool)

(declare-fun e!113131 () Bool)

(assert (=> d!56529 e!113131))

(declare-fun res!136498 () Bool)

(assert (=> d!56529 (=> (not res!136498) (not e!113131))))

(declare-fun lt!257050 () (_ BitVec 64))

(declare-fun lt!257049 () (_ BitVec 64))

(declare-fun lt!257052 () (_ BitVec 64))

(assert (=> d!56529 (= res!136498 (= lt!257052 (bvsub lt!257050 lt!257049)))))

(assert (=> d!56529 (or (= (bvand lt!257050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!257049 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!257050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!257050 lt!257049) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56529 (= lt!257049 (remainingBits!0 ((_ sign_extend 32) (size!3651 (buf!4103 (_2!7859 lt!256763)))) ((_ sign_extend 32) (currentByte!7656 (_2!7859 lt!256763))) ((_ sign_extend 32) (currentBit!7651 (_2!7859 lt!256763)))))))

(declare-fun lt!257053 () (_ BitVec 64))

(declare-fun lt!257048 () (_ BitVec 64))

(assert (=> d!56529 (= lt!257050 (bvmul lt!257053 lt!257048))))

(assert (=> d!56529 (or (= lt!257053 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!257048 (bvsdiv (bvmul lt!257053 lt!257048) lt!257053)))))

(assert (=> d!56529 (= lt!257048 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!56529 (= lt!257053 ((_ sign_extend 32) (size!3651 (buf!4103 (_2!7859 lt!256763)))))))

(assert (=> d!56529 (= lt!257052 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7656 (_2!7859 lt!256763))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7651 (_2!7859 lt!256763)))))))

(assert (=> d!56529 (invariant!0 (currentBit!7651 (_2!7859 lt!256763)) (currentByte!7656 (_2!7859 lt!256763)) (size!3651 (buf!4103 (_2!7859 lt!256763))))))

(assert (=> d!56529 (= (bitIndex!0 (size!3651 (buf!4103 (_2!7859 lt!256763))) (currentByte!7656 (_2!7859 lt!256763)) (currentBit!7651 (_2!7859 lt!256763))) lt!257052)))

(declare-fun b!163799 () Bool)

(declare-fun res!136497 () Bool)

(assert (=> b!163799 (=> (not res!136497) (not e!113131))))

(assert (=> b!163799 (= res!136497 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!257052))))

(declare-fun b!163800 () Bool)

(declare-fun lt!257051 () (_ BitVec 64))

(assert (=> b!163800 (= e!113131 (bvsle lt!257052 (bvmul lt!257051 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!163800 (or (= lt!257051 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!257051 #b0000000000000000000000000000000000000000000000000000000000001000) lt!257051)))))

(assert (=> b!163800 (= lt!257051 ((_ sign_extend 32) (size!3651 (buf!4103 (_2!7859 lt!256763)))))))

(assert (= (and d!56529 res!136498) b!163799))

(assert (= (and b!163799 res!136497) b!163800))

(declare-fun m!259943 () Bool)

(assert (=> d!56529 m!259943))

(declare-fun m!259945 () Bool)

(assert (=> d!56529 m!259945))

(assert (=> b!163659 d!56529))

(declare-fun d!56531 () Bool)

(declare-fun e!113132 () Bool)

(assert (=> d!56531 e!113132))

(declare-fun res!136500 () Bool)

(assert (=> d!56531 (=> (not res!136500) (not e!113132))))

(declare-fun lt!257055 () (_ BitVec 64))

(declare-fun lt!257058 () (_ BitVec 64))

(declare-fun lt!257056 () (_ BitVec 64))

(assert (=> d!56531 (= res!136500 (= lt!257058 (bvsub lt!257056 lt!257055)))))

(assert (=> d!56531 (or (= (bvand lt!257056 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!257055 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!257056 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!257056 lt!257055) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56531 (= lt!257055 (remainingBits!0 ((_ sign_extend 32) (size!3651 (buf!4103 thiss!1577))) ((_ sign_extend 32) (currentByte!7656 thiss!1577)) ((_ sign_extend 32) (currentBit!7651 thiss!1577))))))

(declare-fun lt!257059 () (_ BitVec 64))

(declare-fun lt!257054 () (_ BitVec 64))

(assert (=> d!56531 (= lt!257056 (bvmul lt!257059 lt!257054))))

(assert (=> d!56531 (or (= lt!257059 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!257054 (bvsdiv (bvmul lt!257059 lt!257054) lt!257059)))))

(assert (=> d!56531 (= lt!257054 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!56531 (= lt!257059 ((_ sign_extend 32) (size!3651 (buf!4103 thiss!1577))))))

(assert (=> d!56531 (= lt!257058 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7656 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7651 thiss!1577))))))

(assert (=> d!56531 (invariant!0 (currentBit!7651 thiss!1577) (currentByte!7656 thiss!1577) (size!3651 (buf!4103 thiss!1577)))))

(assert (=> d!56531 (= (bitIndex!0 (size!3651 (buf!4103 thiss!1577)) (currentByte!7656 thiss!1577) (currentBit!7651 thiss!1577)) lt!257058)))

(declare-fun b!163801 () Bool)

(declare-fun res!136499 () Bool)

(assert (=> b!163801 (=> (not res!136499) (not e!113132))))

(assert (=> b!163801 (= res!136499 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!257058))))

(declare-fun b!163802 () Bool)

(declare-fun lt!257057 () (_ BitVec 64))

(assert (=> b!163802 (= e!113132 (bvsle lt!257058 (bvmul lt!257057 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!163802 (or (= lt!257057 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!257057 #b0000000000000000000000000000000000000000000000000000000000001000) lt!257057)))))

(assert (=> b!163802 (= lt!257057 ((_ sign_extend 32) (size!3651 (buf!4103 thiss!1577))))))

(assert (= (and d!56531 res!136500) b!163801))

(assert (= (and b!163801 res!136499) b!163802))

(assert (=> d!56531 m!259809))

(assert (=> d!56531 m!259841))

(assert (=> b!163659 d!56531))

(push 1)

(assert (not d!56491))

(assert (not b!163698))

(assert (not d!56519))

(assert (not b!163775))

(assert (not d!56495))

(assert (not b!163771))

(assert (not d!56529))

(assert (not b!163782))

(assert (not d!56489))

(assert (not d!56477))

(assert (not d!56521))

(assert (not b!163773))

(assert (not b!163784))

(assert (not b!163772))

(assert (not b!163745))

(assert (not d!56531))

(assert (not b!163705))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

