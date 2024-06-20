; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21584 () Bool)

(assert start!21584)

(declare-fun b!108497 () Bool)

(declare-fun res!89434 () Bool)

(declare-fun e!70995 () Bool)

(assert (=> b!108497 (=> (not res!89434) (not e!70995))))

(declare-datatypes ((array!4947 0))(
  ( (array!4948 (arr!2843 (Array (_ BitVec 32) (_ BitVec 8))) (size!2250 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3974 0))(
  ( (BitStream!3975 (buf!2641 array!4947) (currentByte!5177 (_ BitVec 32)) (currentBit!5172 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3974)

(declare-datatypes ((Unit!6641 0))(
  ( (Unit!6642) )
))
(declare-datatypes ((tuple2!8932 0))(
  ( (tuple2!8933 (_1!4723 Unit!6641) (_2!4723 BitStream!3974)) )
))
(declare-fun lt!163516 () tuple2!8932)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!108497 (= res!89434 (invariant!0 (currentBit!5172 thiss!1305) (currentByte!5177 thiss!1305) (size!2250 (buf!2641 (_2!4723 lt!163516)))))))

(declare-fun b!108498 () Bool)

(declare-fun e!70994 () Bool)

(declare-datatypes ((tuple2!8934 0))(
  ( (tuple2!8935 (_1!4724 BitStream!3974) (_2!4724 Bool)) )
))
(declare-fun lt!163538 () tuple2!8934)

(declare-fun lt!163528 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108498 (= e!70994 (= (bitIndex!0 (size!2250 (buf!2641 (_1!4724 lt!163538))) (currentByte!5177 (_1!4724 lt!163538)) (currentBit!5172 (_1!4724 lt!163538))) lt!163528))))

(declare-fun b!108499 () Bool)

(declare-fun e!71003 () Bool)

(declare-fun e!70998 () Bool)

(assert (=> b!108499 (= e!71003 e!70998)))

(declare-fun res!89441 () Bool)

(assert (=> b!108499 (=> (not res!89441) (not e!70998))))

(declare-fun lt!163530 () (_ BitVec 64))

(assert (=> b!108499 (= res!89441 (= lt!163528 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!163530)))))

(assert (=> b!108499 (= lt!163528 (bitIndex!0 (size!2250 (buf!2641 (_2!4723 lt!163516))) (currentByte!5177 (_2!4723 lt!163516)) (currentBit!5172 (_2!4723 lt!163516))))))

(assert (=> b!108499 (= lt!163530 (bitIndex!0 (size!2250 (buf!2641 thiss!1305)) (currentByte!5177 thiss!1305) (currentBit!5172 thiss!1305)))))

(declare-fun b!108500 () Bool)

(declare-fun e!70992 () Bool)

(declare-fun e!70993 () Bool)

(assert (=> b!108500 (= e!70992 e!70993)))

(declare-fun res!89446 () Bool)

(assert (=> b!108500 (=> res!89446 e!70993)))

(declare-datatypes ((tuple2!8936 0))(
  ( (tuple2!8937 (_1!4725 BitStream!3974) (_2!4725 BitStream!3974)) )
))
(declare-fun lt!163532 () tuple2!8936)

(declare-fun lt!163522 () tuple2!8932)

(declare-fun lt!163539 () BitStream!3974)

(assert (=> b!108500 (= res!89446 (or (not (= (_1!4725 lt!163532) lt!163539)) (not (= (size!2250 (buf!2641 thiss!1305)) (size!2250 (buf!2641 (_2!4723 lt!163522)))))))))

(declare-fun e!71002 () Bool)

(assert (=> b!108500 e!71002))

(declare-fun res!89433 () Bool)

(assert (=> b!108500 (=> (not res!89433) (not e!71002))))

(declare-fun lt!163520 () (_ BitVec 64))

(declare-fun lt!163531 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3974 (_ BitVec 64)) BitStream!3974)

(assert (=> b!108500 (= res!89433 (= (_1!4725 lt!163532) (withMovedBitIndex!0 (_2!4725 lt!163532) (bvsub lt!163520 lt!163531))))))

(assert (=> b!108500 (= lt!163520 (bitIndex!0 (size!2250 (buf!2641 (_2!4723 lt!163516))) (currentByte!5177 (_2!4723 lt!163516)) (currentBit!5172 (_2!4723 lt!163516))))))

(declare-fun lt!163518 () tuple2!8936)

(declare-fun lt!163524 () (_ BitVec 64))

(assert (=> b!108500 (= (_1!4725 lt!163518) (withMovedBitIndex!0 (_2!4725 lt!163518) (bvsub lt!163524 lt!163531)))))

(assert (=> b!108500 (= lt!163531 (bitIndex!0 (size!2250 (buf!2641 (_2!4723 lt!163522))) (currentByte!5177 (_2!4723 lt!163522)) (currentBit!5172 (_2!4723 lt!163522))))))

(assert (=> b!108500 (= lt!163524 (bitIndex!0 (size!2250 (buf!2641 thiss!1305)) (currentByte!5177 thiss!1305) (currentBit!5172 thiss!1305)))))

(declare-datatypes ((tuple2!8938 0))(
  ( (tuple2!8939 (_1!4726 BitStream!3974) (_2!4726 (_ BitVec 64))) )
))
(declare-fun lt!163537 () tuple2!8938)

(declare-fun lt!163540 () tuple2!8938)

(assert (=> b!108500 (and (= (_2!4726 lt!163537) (_2!4726 lt!163540)) (= (_1!4726 lt!163537) (_1!4726 lt!163540)))))

(declare-fun lt!163541 () Unit!6641)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun lt!163535 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3974 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6641)

(assert (=> b!108500 (= lt!163541 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4725 lt!163518) nBits!396 i!615 lt!163535))))

(declare-fun lt!163533 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3974 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8938)

(assert (=> b!108500 (= lt!163540 (readNLeastSignificantBitsLoopPure!0 lt!163539 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!163533))))

(assert (=> b!108500 (= lt!163539 (withMovedBitIndex!0 (_1!4725 lt!163518) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!108501 () Bool)

(declare-fun res!89440 () Bool)

(declare-fun e!71001 () Bool)

(assert (=> b!108501 (=> (not res!89440) (not e!71001))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108501 (= res!89440 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!108502 () Bool)

(assert (=> b!108502 (= e!71001 (not e!70992))))

(declare-fun res!89445 () Bool)

(assert (=> b!108502 (=> res!89445 e!70992)))

(declare-fun lt!163534 () tuple2!8938)

(assert (=> b!108502 (= res!89445 (not (= (_1!4726 lt!163534) (_2!4725 lt!163532))))))

(assert (=> b!108502 (= lt!163534 (readNLeastSignificantBitsLoopPure!0 (_1!4725 lt!163532) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!163533))))

(declare-fun lt!163529 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!108502 (validate_offset_bits!1 ((_ sign_extend 32) (size!2250 (buf!2641 (_2!4723 lt!163522)))) ((_ sign_extend 32) (currentByte!5177 (_2!4723 lt!163516))) ((_ sign_extend 32) (currentBit!5172 (_2!4723 lt!163516))) lt!163529)))

(declare-fun lt!163527 () Unit!6641)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3974 array!4947 (_ BitVec 64)) Unit!6641)

(assert (=> b!108502 (= lt!163527 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4723 lt!163516) (buf!2641 (_2!4723 lt!163522)) lt!163529))))

(assert (=> b!108502 (= lt!163529 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!163521 () tuple2!8934)

(declare-fun lt!163515 () (_ BitVec 64))

(assert (=> b!108502 (= lt!163533 (bvor lt!163535 (ite (_2!4724 lt!163521) lt!163515 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108502 (= lt!163537 (readNLeastSignificantBitsLoopPure!0 (_1!4725 lt!163518) nBits!396 i!615 lt!163535))))

(declare-fun lt!163536 () (_ BitVec 64))

(assert (=> b!108502 (validate_offset_bits!1 ((_ sign_extend 32) (size!2250 (buf!2641 (_2!4723 lt!163522)))) ((_ sign_extend 32) (currentByte!5177 thiss!1305)) ((_ sign_extend 32) (currentBit!5172 thiss!1305)) lt!163536)))

(declare-fun lt!163523 () Unit!6641)

(assert (=> b!108502 (= lt!163523 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2641 (_2!4723 lt!163522)) lt!163536))))

(assert (=> b!108502 (= lt!163535 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!163514 () Bool)

(assert (=> b!108502 (= (_2!4724 lt!163521) lt!163514)))

(declare-fun readBitPure!0 (BitStream!3974) tuple2!8934)

(assert (=> b!108502 (= lt!163521 (readBitPure!0 (_1!4725 lt!163518)))))

(declare-fun reader!0 (BitStream!3974 BitStream!3974) tuple2!8936)

(assert (=> b!108502 (= lt!163532 (reader!0 (_2!4723 lt!163516) (_2!4723 lt!163522)))))

(assert (=> b!108502 (= lt!163518 (reader!0 thiss!1305 (_2!4723 lt!163522)))))

(declare-fun e!70999 () Bool)

(assert (=> b!108502 e!70999))

(declare-fun res!89435 () Bool)

(assert (=> b!108502 (=> (not res!89435) (not e!70999))))

(declare-fun lt!163517 () tuple2!8934)

(declare-fun lt!163513 () tuple2!8934)

(assert (=> b!108502 (= res!89435 (= (bitIndex!0 (size!2250 (buf!2641 (_1!4724 lt!163517))) (currentByte!5177 (_1!4724 lt!163517)) (currentBit!5172 (_1!4724 lt!163517))) (bitIndex!0 (size!2250 (buf!2641 (_1!4724 lt!163513))) (currentByte!5177 (_1!4724 lt!163513)) (currentBit!5172 (_1!4724 lt!163513)))))))

(declare-fun lt!163519 () Unit!6641)

(declare-fun lt!163525 () BitStream!3974)

(declare-fun readBitPrefixLemma!0 (BitStream!3974 BitStream!3974) Unit!6641)

(assert (=> b!108502 (= lt!163519 (readBitPrefixLemma!0 lt!163525 (_2!4723 lt!163522)))))

(assert (=> b!108502 (= lt!163513 (readBitPure!0 (BitStream!3975 (buf!2641 (_2!4723 lt!163522)) (currentByte!5177 thiss!1305) (currentBit!5172 thiss!1305))))))

(assert (=> b!108502 (= lt!163517 (readBitPure!0 lt!163525))))

(assert (=> b!108502 (= lt!163525 (BitStream!3975 (buf!2641 (_2!4723 lt!163516)) (currentByte!5177 thiss!1305) (currentBit!5172 thiss!1305)))))

(assert (=> b!108502 e!70995))

(declare-fun res!89439 () Bool)

(assert (=> b!108502 (=> (not res!89439) (not e!70995))))

(declare-fun isPrefixOf!0 (BitStream!3974 BitStream!3974) Bool)

(assert (=> b!108502 (= res!89439 (isPrefixOf!0 thiss!1305 (_2!4723 lt!163522)))))

(declare-fun lt!163526 () Unit!6641)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3974 BitStream!3974 BitStream!3974) Unit!6641)

(assert (=> b!108502 (= lt!163526 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4723 lt!163516) (_2!4723 lt!163522)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3974 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8932)

(assert (=> b!108502 (= lt!163522 (appendNLeastSignificantBitsLoop!0 (_2!4723 lt!163516) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!108502 e!71003))

(declare-fun res!89437 () Bool)

(assert (=> b!108502 (=> (not res!89437) (not e!71003))))

(assert (=> b!108502 (= res!89437 (= (size!2250 (buf!2641 thiss!1305)) (size!2250 (buf!2641 (_2!4723 lt!163516)))))))

(declare-fun appendBit!0 (BitStream!3974 Bool) tuple2!8932)

(assert (=> b!108502 (= lt!163516 (appendBit!0 thiss!1305 lt!163514))))

(assert (=> b!108502 (= lt!163514 (not (= (bvand v!199 lt!163515) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108502 (= lt!163515 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!108503 () Bool)

(assert (=> b!108503 (= e!70995 (invariant!0 (currentBit!5172 thiss!1305) (currentByte!5177 thiss!1305) (size!2250 (buf!2641 (_2!4723 lt!163522)))))))

(declare-fun b!108504 () Bool)

(assert (=> b!108504 (= e!70998 e!70994)))

(declare-fun res!89442 () Bool)

(assert (=> b!108504 (=> (not res!89442) (not e!70994))))

(assert (=> b!108504 (= res!89442 (and (= (_2!4724 lt!163538) lt!163514) (= (_1!4724 lt!163538) (_2!4723 lt!163516))))))

(declare-fun readerFrom!0 (BitStream!3974 (_ BitVec 32) (_ BitVec 32)) BitStream!3974)

(assert (=> b!108504 (= lt!163538 (readBitPure!0 (readerFrom!0 (_2!4723 lt!163516) (currentBit!5172 thiss!1305) (currentByte!5177 thiss!1305))))))

(declare-fun b!108506 () Bool)

(declare-fun res!89436 () Bool)

(assert (=> b!108506 (=> (not res!89436) (not e!71001))))

(assert (=> b!108506 (= res!89436 (bvslt i!615 nBits!396))))

(declare-fun b!108507 () Bool)

(assert (=> b!108507 (= e!71002 (and (= lt!163524 (bvsub lt!163520 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4725 lt!163532) lt!163539)) (and (= (_2!4726 lt!163537) (_2!4726 lt!163534)) (= (_1!4726 lt!163537) (_2!4725 lt!163518))))))))

(declare-fun b!108508 () Bool)

(declare-fun e!71000 () Bool)

(declare-fun array_inv!2052 (array!4947) Bool)

(assert (=> b!108508 (= e!71000 (array_inv!2052 (buf!2641 thiss!1305)))))

(declare-fun b!108509 () Bool)

(assert (=> b!108509 (= e!70999 (= (_2!4724 lt!163517) (_2!4724 lt!163513)))))

(declare-fun b!108510 () Bool)

(assert (=> b!108510 (= e!70993 (invariant!0 (currentBit!5172 thiss!1305) (currentByte!5177 thiss!1305) (size!2250 (buf!2641 thiss!1305))))))

(declare-fun b!108511 () Bool)

(declare-fun res!89444 () Bool)

(assert (=> b!108511 (=> (not res!89444) (not e!70998))))

(assert (=> b!108511 (= res!89444 (isPrefixOf!0 thiss!1305 (_2!4723 lt!163516)))))

(declare-fun b!108505 () Bool)

(declare-fun e!70997 () Bool)

(assert (=> b!108505 (= e!70997 e!71001)))

(declare-fun res!89438 () Bool)

(assert (=> b!108505 (=> (not res!89438) (not e!71001))))

(assert (=> b!108505 (= res!89438 (validate_offset_bits!1 ((_ sign_extend 32) (size!2250 (buf!2641 thiss!1305))) ((_ sign_extend 32) (currentByte!5177 thiss!1305)) ((_ sign_extend 32) (currentBit!5172 thiss!1305)) lt!163536))))

(assert (=> b!108505 (= lt!163536 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun res!89443 () Bool)

(assert (=> start!21584 (=> (not res!89443) (not e!70997))))

(assert (=> start!21584 (= res!89443 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21584 e!70997))

(assert (=> start!21584 true))

(declare-fun inv!12 (BitStream!3974) Bool)

(assert (=> start!21584 (and (inv!12 thiss!1305) e!71000)))

(assert (= (and start!21584 res!89443) b!108505))

(assert (= (and b!108505 res!89438) b!108501))

(assert (= (and b!108501 res!89440) b!108506))

(assert (= (and b!108506 res!89436) b!108502))

(assert (= (and b!108502 res!89437) b!108499))

(assert (= (and b!108499 res!89441) b!108511))

(assert (= (and b!108511 res!89444) b!108504))

(assert (= (and b!108504 res!89442) b!108498))

(assert (= (and b!108502 res!89439) b!108497))

(assert (= (and b!108497 res!89434) b!108503))

(assert (= (and b!108502 res!89435) b!108509))

(assert (= (and b!108502 (not res!89445)) b!108500))

(assert (= (and b!108500 res!89433) b!108507))

(assert (= (and b!108500 (not res!89446)) b!108510))

(assert (= start!21584 b!108508))

(declare-fun m!160801 () Bool)

(assert (=> b!108505 m!160801))

(declare-fun m!160803 () Bool)

(assert (=> b!108504 m!160803))

(assert (=> b!108504 m!160803))

(declare-fun m!160805 () Bool)

(assert (=> b!108504 m!160805))

(declare-fun m!160807 () Bool)

(assert (=> b!108498 m!160807))

(declare-fun m!160809 () Bool)

(assert (=> start!21584 m!160809))

(declare-fun m!160811 () Bool)

(assert (=> b!108500 m!160811))

(declare-fun m!160813 () Bool)

(assert (=> b!108500 m!160813))

(declare-fun m!160815 () Bool)

(assert (=> b!108500 m!160815))

(declare-fun m!160817 () Bool)

(assert (=> b!108500 m!160817))

(declare-fun m!160819 () Bool)

(assert (=> b!108500 m!160819))

(declare-fun m!160821 () Bool)

(assert (=> b!108500 m!160821))

(declare-fun m!160823 () Bool)

(assert (=> b!108500 m!160823))

(declare-fun m!160825 () Bool)

(assert (=> b!108500 m!160825))

(declare-fun m!160827 () Bool)

(assert (=> b!108502 m!160827))

(declare-fun m!160829 () Bool)

(assert (=> b!108502 m!160829))

(declare-fun m!160831 () Bool)

(assert (=> b!108502 m!160831))

(declare-fun m!160833 () Bool)

(assert (=> b!108502 m!160833))

(declare-fun m!160835 () Bool)

(assert (=> b!108502 m!160835))

(declare-fun m!160837 () Bool)

(assert (=> b!108502 m!160837))

(declare-fun m!160839 () Bool)

(assert (=> b!108502 m!160839))

(declare-fun m!160841 () Bool)

(assert (=> b!108502 m!160841))

(declare-fun m!160843 () Bool)

(assert (=> b!108502 m!160843))

(declare-fun m!160845 () Bool)

(assert (=> b!108502 m!160845))

(declare-fun m!160847 () Bool)

(assert (=> b!108502 m!160847))

(declare-fun m!160849 () Bool)

(assert (=> b!108502 m!160849))

(declare-fun m!160851 () Bool)

(assert (=> b!108502 m!160851))

(declare-fun m!160853 () Bool)

(assert (=> b!108502 m!160853))

(declare-fun m!160855 () Bool)

(assert (=> b!108502 m!160855))

(declare-fun m!160857 () Bool)

(assert (=> b!108502 m!160857))

(declare-fun m!160859 () Bool)

(assert (=> b!108502 m!160859))

(declare-fun m!160861 () Bool)

(assert (=> b!108502 m!160861))

(declare-fun m!160863 () Bool)

(assert (=> b!108502 m!160863))

(assert (=> b!108499 m!160813))

(assert (=> b!108499 m!160821))

(declare-fun m!160865 () Bool)

(assert (=> b!108510 m!160865))

(declare-fun m!160867 () Bool)

(assert (=> b!108503 m!160867))

(declare-fun m!160869 () Bool)

(assert (=> b!108501 m!160869))

(declare-fun m!160871 () Bool)

(assert (=> b!108511 m!160871))

(declare-fun m!160873 () Bool)

(assert (=> b!108508 m!160873))

(declare-fun m!160875 () Bool)

(assert (=> b!108497 m!160875))

(push 1)

(assert (not b!108510))

(assert (not b!108511))

(assert (not b!108497))

(assert (not start!21584))

(assert (not b!108508))

(assert (not b!108503))

(assert (not b!108504))

(assert (not b!108498))

(assert (not b!108500))

(assert (not b!108502))

(assert (not b!108499))

(assert (not b!108505))

(assert (not b!108501))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

