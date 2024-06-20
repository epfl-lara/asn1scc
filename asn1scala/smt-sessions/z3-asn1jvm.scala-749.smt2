; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21582 () Bool)

(assert start!21582)

(declare-fun b!108452 () Bool)

(declare-fun e!70957 () Bool)

(declare-fun e!70967 () Bool)

(assert (=> b!108452 (= e!70957 (not e!70967))))

(declare-fun res!89391 () Bool)

(assert (=> b!108452 (=> res!89391 e!70967)))

(declare-datatypes ((array!4945 0))(
  ( (array!4946 (arr!2842 (Array (_ BitVec 32) (_ BitVec 8))) (size!2249 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3972 0))(
  ( (BitStream!3973 (buf!2640 array!4945) (currentByte!5176 (_ BitVec 32)) (currentBit!5171 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8924 0))(
  ( (tuple2!8925 (_1!4719 BitStream!3972) (_2!4719 (_ BitVec 64))) )
))
(declare-fun lt!163447 () tuple2!8924)

(declare-datatypes ((tuple2!8926 0))(
  ( (tuple2!8927 (_1!4720 BitStream!3972) (_2!4720 BitStream!3972)) )
))
(declare-fun lt!163454 () tuple2!8926)

(assert (=> b!108452 (= res!89391 (not (= (_1!4719 lt!163447) (_2!4720 lt!163454))))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun lt!163438 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3972 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8924)

(assert (=> b!108452 (= lt!163447 (readNLeastSignificantBitsLoopPure!0 (_1!4720 lt!163454) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!163438))))

(declare-datatypes ((Unit!6639 0))(
  ( (Unit!6640) )
))
(declare-datatypes ((tuple2!8928 0))(
  ( (tuple2!8929 (_1!4721 Unit!6639) (_2!4721 BitStream!3972)) )
))
(declare-fun lt!163440 () tuple2!8928)

(declare-fun lt!163449 () tuple2!8928)

(declare-fun lt!163439 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!108452 (validate_offset_bits!1 ((_ sign_extend 32) (size!2249 (buf!2640 (_2!4721 lt!163440)))) ((_ sign_extend 32) (currentByte!5176 (_2!4721 lt!163449))) ((_ sign_extend 32) (currentBit!5171 (_2!4721 lt!163449))) lt!163439)))

(declare-fun lt!163445 () Unit!6639)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3972 array!4945 (_ BitVec 64)) Unit!6639)

(assert (=> b!108452 (= lt!163445 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4721 lt!163449) (buf!2640 (_2!4721 lt!163440)) lt!163439))))

(assert (=> b!108452 (= lt!163439 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!8930 0))(
  ( (tuple2!8931 (_1!4722 BitStream!3972) (_2!4722 Bool)) )
))
(declare-fun lt!163436 () tuple2!8930)

(declare-fun lt!163430 () (_ BitVec 64))

(declare-fun lt!163432 () (_ BitVec 64))

(assert (=> b!108452 (= lt!163438 (bvor lt!163432 (ite (_2!4722 lt!163436) lt!163430 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!163453 () tuple2!8924)

(declare-fun lt!163427 () tuple2!8926)

(assert (=> b!108452 (= lt!163453 (readNLeastSignificantBitsLoopPure!0 (_1!4720 lt!163427) nBits!396 i!615 lt!163432))))

(declare-fun thiss!1305 () BitStream!3972)

(declare-fun lt!163437 () (_ BitVec 64))

(assert (=> b!108452 (validate_offset_bits!1 ((_ sign_extend 32) (size!2249 (buf!2640 (_2!4721 lt!163440)))) ((_ sign_extend 32) (currentByte!5176 thiss!1305)) ((_ sign_extend 32) (currentBit!5171 thiss!1305)) lt!163437)))

(declare-fun lt!163428 () Unit!6639)

(assert (=> b!108452 (= lt!163428 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2640 (_2!4721 lt!163440)) lt!163437))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108452 (= lt!163432 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!163448 () Bool)

(assert (=> b!108452 (= (_2!4722 lt!163436) lt!163448)))

(declare-fun readBitPure!0 (BitStream!3972) tuple2!8930)

(assert (=> b!108452 (= lt!163436 (readBitPure!0 (_1!4720 lt!163427)))))

(declare-fun reader!0 (BitStream!3972 BitStream!3972) tuple2!8926)

(assert (=> b!108452 (= lt!163454 (reader!0 (_2!4721 lt!163449) (_2!4721 lt!163440)))))

(assert (=> b!108452 (= lt!163427 (reader!0 thiss!1305 (_2!4721 lt!163440)))))

(declare-fun e!70958 () Bool)

(assert (=> b!108452 e!70958))

(declare-fun res!89395 () Bool)

(assert (=> b!108452 (=> (not res!89395) (not e!70958))))

(declare-fun lt!163431 () tuple2!8930)

(declare-fun lt!163450 () tuple2!8930)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108452 (= res!89395 (= (bitIndex!0 (size!2249 (buf!2640 (_1!4722 lt!163431))) (currentByte!5176 (_1!4722 lt!163431)) (currentBit!5171 (_1!4722 lt!163431))) (bitIndex!0 (size!2249 (buf!2640 (_1!4722 lt!163450))) (currentByte!5176 (_1!4722 lt!163450)) (currentBit!5171 (_1!4722 lt!163450)))))))

(declare-fun lt!163444 () Unit!6639)

(declare-fun lt!163442 () BitStream!3972)

(declare-fun readBitPrefixLemma!0 (BitStream!3972 BitStream!3972) Unit!6639)

(assert (=> b!108452 (= lt!163444 (readBitPrefixLemma!0 lt!163442 (_2!4721 lt!163440)))))

(assert (=> b!108452 (= lt!163450 (readBitPure!0 (BitStream!3973 (buf!2640 (_2!4721 lt!163440)) (currentByte!5176 thiss!1305) (currentBit!5171 thiss!1305))))))

(assert (=> b!108452 (= lt!163431 (readBitPure!0 lt!163442))))

(assert (=> b!108452 (= lt!163442 (BitStream!3973 (buf!2640 (_2!4721 lt!163449)) (currentByte!5176 thiss!1305) (currentBit!5171 thiss!1305)))))

(declare-fun e!70962 () Bool)

(assert (=> b!108452 e!70962))

(declare-fun res!89401 () Bool)

(assert (=> b!108452 (=> (not res!89401) (not e!70962))))

(declare-fun isPrefixOf!0 (BitStream!3972 BitStream!3972) Bool)

(assert (=> b!108452 (= res!89401 (isPrefixOf!0 thiss!1305 (_2!4721 lt!163440)))))

(declare-fun lt!163435 () Unit!6639)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3972 BitStream!3972 BitStream!3972) Unit!6639)

(assert (=> b!108452 (= lt!163435 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4721 lt!163449) (_2!4721 lt!163440)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3972 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8928)

(assert (=> b!108452 (= lt!163440 (appendNLeastSignificantBitsLoop!0 (_2!4721 lt!163449) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!70956 () Bool)

(assert (=> b!108452 e!70956))

(declare-fun res!89400 () Bool)

(assert (=> b!108452 (=> (not res!89400) (not e!70956))))

(assert (=> b!108452 (= res!89400 (= (size!2249 (buf!2640 thiss!1305)) (size!2249 (buf!2640 (_2!4721 lt!163449)))))))

(declare-fun appendBit!0 (BitStream!3972 Bool) tuple2!8928)

(assert (=> b!108452 (= lt!163449 (appendBit!0 thiss!1305 lt!163448))))

(assert (=> b!108452 (= lt!163448 (not (= (bvand v!199 lt!163430) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108452 (= lt!163430 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!108453 () Bool)

(declare-fun res!89403 () Bool)

(assert (=> b!108453 (=> (not res!89403) (not e!70957))))

(assert (=> b!108453 (= res!89403 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!108454 () Bool)

(declare-fun res!89393 () Bool)

(assert (=> b!108454 (=> (not res!89393) (not e!70962))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!108454 (= res!89393 (invariant!0 (currentBit!5171 thiss!1305) (currentByte!5176 thiss!1305) (size!2249 (buf!2640 (_2!4721 lt!163449)))))))

(declare-fun b!108455 () Bool)

(declare-fun e!70959 () Bool)

(assert (=> b!108455 (= e!70959 e!70957)))

(declare-fun res!89396 () Bool)

(assert (=> b!108455 (=> (not res!89396) (not e!70957))))

(assert (=> b!108455 (= res!89396 (validate_offset_bits!1 ((_ sign_extend 32) (size!2249 (buf!2640 thiss!1305))) ((_ sign_extend 32) (currentByte!5176 thiss!1305)) ((_ sign_extend 32) (currentBit!5171 thiss!1305)) lt!163437))))

(assert (=> b!108455 (= lt!163437 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!108456 () Bool)

(assert (=> b!108456 (= e!70958 (= (_2!4722 lt!163431) (_2!4722 lt!163450)))))

(declare-fun b!108457 () Bool)

(assert (=> b!108457 (= e!70962 (invariant!0 (currentBit!5171 thiss!1305) (currentByte!5176 thiss!1305) (size!2249 (buf!2640 (_2!4721 lt!163440)))))))

(declare-fun b!108458 () Bool)

(declare-fun e!70964 () Bool)

(assert (=> b!108458 (= e!70956 e!70964)))

(declare-fun res!89404 () Bool)

(assert (=> b!108458 (=> (not res!89404) (not e!70964))))

(declare-fun lt!163433 () (_ BitVec 64))

(declare-fun lt!163452 () (_ BitVec 64))

(assert (=> b!108458 (= res!89404 (= lt!163433 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!163452)))))

(assert (=> b!108458 (= lt!163433 (bitIndex!0 (size!2249 (buf!2640 (_2!4721 lt!163449))) (currentByte!5176 (_2!4721 lt!163449)) (currentBit!5171 (_2!4721 lt!163449))))))

(assert (=> b!108458 (= lt!163452 (bitIndex!0 (size!2249 (buf!2640 thiss!1305)) (currentByte!5176 thiss!1305) (currentBit!5171 thiss!1305)))))

(declare-fun b!108459 () Bool)

(declare-fun e!70965 () Bool)

(declare-fun lt!163434 () tuple2!8930)

(assert (=> b!108459 (= e!70965 (= (bitIndex!0 (size!2249 (buf!2640 (_1!4722 lt!163434))) (currentByte!5176 (_1!4722 lt!163434)) (currentBit!5171 (_1!4722 lt!163434))) lt!163433))))

(declare-fun res!89399 () Bool)

(assert (=> start!21582 (=> (not res!89399) (not e!70959))))

(assert (=> start!21582 (= res!89399 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21582 e!70959))

(assert (=> start!21582 true))

(declare-fun e!70966 () Bool)

(declare-fun inv!12 (BitStream!3972) Bool)

(assert (=> start!21582 (and (inv!12 thiss!1305) e!70966)))

(declare-fun b!108460 () Bool)

(declare-fun e!70961 () Bool)

(assert (=> b!108460 (= e!70961 (invariant!0 (currentBit!5171 thiss!1305) (currentByte!5176 thiss!1305) (size!2249 (buf!2640 thiss!1305))))))

(declare-fun b!108461 () Bool)

(declare-fun res!89402 () Bool)

(assert (=> b!108461 (=> (not res!89402) (not e!70957))))

(assert (=> b!108461 (= res!89402 (bvslt i!615 nBits!396))))

(declare-fun b!108462 () Bool)

(declare-fun array_inv!2051 (array!4945) Bool)

(assert (=> b!108462 (= e!70966 (array_inv!2051 (buf!2640 thiss!1305)))))

(declare-fun b!108463 () Bool)

(assert (=> b!108463 (= e!70964 e!70965)))

(declare-fun res!89394 () Bool)

(assert (=> b!108463 (=> (not res!89394) (not e!70965))))

(assert (=> b!108463 (= res!89394 (and (= (_2!4722 lt!163434) lt!163448) (= (_1!4722 lt!163434) (_2!4721 lt!163449))))))

(declare-fun readerFrom!0 (BitStream!3972 (_ BitVec 32) (_ BitVec 32)) BitStream!3972)

(assert (=> b!108463 (= lt!163434 (readBitPure!0 (readerFrom!0 (_2!4721 lt!163449) (currentBit!5171 thiss!1305) (currentByte!5176 thiss!1305))))))

(declare-fun b!108464 () Bool)

(declare-fun res!89398 () Bool)

(assert (=> b!108464 (=> (not res!89398) (not e!70964))))

(assert (=> b!108464 (= res!89398 (isPrefixOf!0 thiss!1305 (_2!4721 lt!163449)))))

(declare-fun e!70960 () Bool)

(declare-fun b!108465 () Bool)

(declare-fun lt!163426 () BitStream!3972)

(declare-fun lt!163441 () (_ BitVec 64))

(declare-fun lt!163443 () (_ BitVec 64))

(assert (=> b!108465 (= e!70960 (and (= lt!163441 (bvsub lt!163443 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4720 lt!163454) lt!163426)) (and (= (_2!4719 lt!163453) (_2!4719 lt!163447)) (= (_1!4719 lt!163453) (_2!4720 lt!163427))))))))

(declare-fun b!108466 () Bool)

(assert (=> b!108466 (= e!70967 e!70961)))

(declare-fun res!89392 () Bool)

(assert (=> b!108466 (=> res!89392 e!70961)))

(assert (=> b!108466 (= res!89392 (or (not (= (_1!4720 lt!163454) lt!163426)) (not (= (size!2249 (buf!2640 thiss!1305)) (size!2249 (buf!2640 (_2!4721 lt!163440)))))))))

(assert (=> b!108466 e!70960))

(declare-fun res!89397 () Bool)

(assert (=> b!108466 (=> (not res!89397) (not e!70960))))

(declare-fun lt!163451 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3972 (_ BitVec 64)) BitStream!3972)

(assert (=> b!108466 (= res!89397 (= (_1!4720 lt!163454) (withMovedBitIndex!0 (_2!4720 lt!163454) (bvsub lt!163443 lt!163451))))))

(assert (=> b!108466 (= lt!163443 (bitIndex!0 (size!2249 (buf!2640 (_2!4721 lt!163449))) (currentByte!5176 (_2!4721 lt!163449)) (currentBit!5171 (_2!4721 lt!163449))))))

(assert (=> b!108466 (= (_1!4720 lt!163427) (withMovedBitIndex!0 (_2!4720 lt!163427) (bvsub lt!163441 lt!163451)))))

(assert (=> b!108466 (= lt!163451 (bitIndex!0 (size!2249 (buf!2640 (_2!4721 lt!163440))) (currentByte!5176 (_2!4721 lt!163440)) (currentBit!5171 (_2!4721 lt!163440))))))

(assert (=> b!108466 (= lt!163441 (bitIndex!0 (size!2249 (buf!2640 thiss!1305)) (currentByte!5176 thiss!1305) (currentBit!5171 thiss!1305)))))

(declare-fun lt!163429 () tuple2!8924)

(assert (=> b!108466 (and (= (_2!4719 lt!163453) (_2!4719 lt!163429)) (= (_1!4719 lt!163453) (_1!4719 lt!163429)))))

(declare-fun lt!163446 () Unit!6639)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3972 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6639)

(assert (=> b!108466 (= lt!163446 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4720 lt!163427) nBits!396 i!615 lt!163432))))

(assert (=> b!108466 (= lt!163429 (readNLeastSignificantBitsLoopPure!0 lt!163426 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!163438))))

(assert (=> b!108466 (= lt!163426 (withMovedBitIndex!0 (_1!4720 lt!163427) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and start!21582 res!89399) b!108455))

(assert (= (and b!108455 res!89396) b!108453))

(assert (= (and b!108453 res!89403) b!108461))

(assert (= (and b!108461 res!89402) b!108452))

(assert (= (and b!108452 res!89400) b!108458))

(assert (= (and b!108458 res!89404) b!108464))

(assert (= (and b!108464 res!89398) b!108463))

(assert (= (and b!108463 res!89394) b!108459))

(assert (= (and b!108452 res!89401) b!108454))

(assert (= (and b!108454 res!89393) b!108457))

(assert (= (and b!108452 res!89395) b!108456))

(assert (= (and b!108452 (not res!89391)) b!108466))

(assert (= (and b!108466 res!89397) b!108465))

(assert (= (and b!108466 (not res!89392)) b!108460))

(assert (= start!21582 b!108462))

(declare-fun m!160725 () Bool)

(assert (=> b!108460 m!160725))

(declare-fun m!160727 () Bool)

(assert (=> b!108457 m!160727))

(declare-fun m!160729 () Bool)

(assert (=> b!108455 m!160729))

(declare-fun m!160731 () Bool)

(assert (=> b!108459 m!160731))

(declare-fun m!160733 () Bool)

(assert (=> b!108464 m!160733))

(declare-fun m!160735 () Bool)

(assert (=> b!108454 m!160735))

(declare-fun m!160737 () Bool)

(assert (=> start!21582 m!160737))

(declare-fun m!160739 () Bool)

(assert (=> b!108463 m!160739))

(assert (=> b!108463 m!160739))

(declare-fun m!160741 () Bool)

(assert (=> b!108463 m!160741))

(declare-fun m!160743 () Bool)

(assert (=> b!108452 m!160743))

(declare-fun m!160745 () Bool)

(assert (=> b!108452 m!160745))

(declare-fun m!160747 () Bool)

(assert (=> b!108452 m!160747))

(declare-fun m!160749 () Bool)

(assert (=> b!108452 m!160749))

(declare-fun m!160751 () Bool)

(assert (=> b!108452 m!160751))

(declare-fun m!160753 () Bool)

(assert (=> b!108452 m!160753))

(declare-fun m!160755 () Bool)

(assert (=> b!108452 m!160755))

(declare-fun m!160757 () Bool)

(assert (=> b!108452 m!160757))

(declare-fun m!160759 () Bool)

(assert (=> b!108452 m!160759))

(declare-fun m!160761 () Bool)

(assert (=> b!108452 m!160761))

(declare-fun m!160763 () Bool)

(assert (=> b!108452 m!160763))

(declare-fun m!160765 () Bool)

(assert (=> b!108452 m!160765))

(declare-fun m!160767 () Bool)

(assert (=> b!108452 m!160767))

(declare-fun m!160769 () Bool)

(assert (=> b!108452 m!160769))

(declare-fun m!160771 () Bool)

(assert (=> b!108452 m!160771))

(declare-fun m!160773 () Bool)

(assert (=> b!108452 m!160773))

(declare-fun m!160775 () Bool)

(assert (=> b!108452 m!160775))

(declare-fun m!160777 () Bool)

(assert (=> b!108452 m!160777))

(declare-fun m!160779 () Bool)

(assert (=> b!108452 m!160779))

(declare-fun m!160781 () Bool)

(assert (=> b!108462 m!160781))

(declare-fun m!160783 () Bool)

(assert (=> b!108466 m!160783))

(declare-fun m!160785 () Bool)

(assert (=> b!108466 m!160785))

(declare-fun m!160787 () Bool)

(assert (=> b!108466 m!160787))

(declare-fun m!160789 () Bool)

(assert (=> b!108466 m!160789))

(declare-fun m!160791 () Bool)

(assert (=> b!108466 m!160791))

(declare-fun m!160793 () Bool)

(assert (=> b!108466 m!160793))

(declare-fun m!160795 () Bool)

(assert (=> b!108466 m!160795))

(declare-fun m!160797 () Bool)

(assert (=> b!108466 m!160797))

(declare-fun m!160799 () Bool)

(assert (=> b!108453 m!160799))

(assert (=> b!108458 m!160795))

(assert (=> b!108458 m!160789))

(check-sat (not b!108463) (not b!108452) (not start!21582) (not b!108460) (not b!108453) (not b!108466) (not b!108455) (not b!108462) (not b!108459) (not b!108458) (not b!108454) (not b!108464) (not b!108457))
