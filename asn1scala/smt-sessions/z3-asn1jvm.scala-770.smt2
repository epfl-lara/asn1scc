; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21954 () Bool)

(assert start!21954)

(declare-fun b!110795 () Bool)

(declare-fun e!72716 () Bool)

(declare-fun e!72715 () Bool)

(assert (=> b!110795 (= e!72716 e!72715)))

(declare-fun res!91467 () Bool)

(assert (=> b!110795 (=> (not res!91467) (not e!72715))))

(declare-fun lt!167691 () Bool)

(declare-datatypes ((array!5083 0))(
  ( (array!5084 (arr!2905 (Array (_ BitVec 32) (_ BitVec 8))) (size!2312 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4098 0))(
  ( (BitStream!4099 (buf!2709 array!5083) (currentByte!5266 (_ BitVec 32)) (currentBit!5261 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9224 0))(
  ( (tuple2!9225 (_1!4869 BitStream!4098) (_2!4869 Bool)) )
))
(declare-fun lt!167699 () tuple2!9224)

(declare-datatypes ((Unit!6792 0))(
  ( (Unit!6793) )
))
(declare-datatypes ((tuple2!9226 0))(
  ( (tuple2!9227 (_1!4870 Unit!6792) (_2!4870 BitStream!4098)) )
))
(declare-fun lt!167696 () tuple2!9226)

(assert (=> b!110795 (= res!91467 (and (= (_2!4869 lt!167699) lt!167691) (= (_1!4869 lt!167699) (_2!4870 lt!167696))))))

(declare-fun thiss!1305 () BitStream!4098)

(declare-fun readBitPure!0 (BitStream!4098) tuple2!9224)

(declare-fun readerFrom!0 (BitStream!4098 (_ BitVec 32) (_ BitVec 32)) BitStream!4098)

(assert (=> b!110795 (= lt!167699 (readBitPure!0 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305))))))

(declare-fun b!110796 () Bool)

(declare-fun e!72711 () Bool)

(declare-fun e!72714 () Bool)

(assert (=> b!110796 (= e!72711 e!72714)))

(declare-fun res!91469 () Bool)

(assert (=> b!110796 (=> (not res!91469) (not e!72714))))

(declare-fun lt!167706 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110796 (= res!91469 (validate_offset_bits!1 ((_ sign_extend 32) (size!2312 (buf!2709 thiss!1305))) ((_ sign_extend 32) (currentByte!5266 thiss!1305)) ((_ sign_extend 32) (currentBit!5261 thiss!1305)) lt!167706))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!110796 (= lt!167706 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!110797 () Bool)

(declare-fun res!91474 () Bool)

(assert (=> b!110797 (=> (not res!91474) (not e!72716))))

(declare-fun isPrefixOf!0 (BitStream!4098 BitStream!4098) Bool)

(assert (=> b!110797 (= res!91474 (isPrefixOf!0 thiss!1305 (_2!4870 lt!167696)))))

(declare-fun b!110798 () Bool)

(declare-fun e!72713 () Bool)

(declare-fun lt!167705 () tuple2!9226)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!110798 (= e!72713 (invariant!0 (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305) (size!2312 (buf!2709 (_2!4870 lt!167705)))))))

(declare-fun b!110799 () Bool)

(declare-fun e!72712 () Bool)

(declare-fun lt!167700 () tuple2!9224)

(declare-fun lt!167692 () tuple2!9224)

(assert (=> b!110799 (= e!72712 (= (_2!4869 lt!167700) (_2!4869 lt!167692)))))

(declare-fun b!110800 () Bool)

(declare-fun res!91470 () Bool)

(assert (=> b!110800 (=> (not res!91470) (not e!72714))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110800 (= res!91470 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!110801 () Bool)

(declare-fun res!91477 () Bool)

(assert (=> b!110801 (=> (not res!91477) (not e!72714))))

(assert (=> b!110801 (= res!91477 (bvslt i!615 nBits!396))))

(declare-fun b!110802 () Bool)

(declare-fun res!91471 () Bool)

(assert (=> b!110802 (=> (not res!91471) (not e!72713))))

(assert (=> b!110802 (= res!91471 (invariant!0 (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305) (size!2312 (buf!2709 (_2!4870 lt!167696)))))))

(declare-fun res!91468 () Bool)

(assert (=> start!21954 (=> (not res!91468) (not e!72711))))

(assert (=> start!21954 (= res!91468 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21954 e!72711))

(assert (=> start!21954 true))

(declare-fun e!72719 () Bool)

(declare-fun inv!12 (BitStream!4098) Bool)

(assert (=> start!21954 (and (inv!12 thiss!1305) e!72719)))

(declare-fun b!110803 () Bool)

(declare-fun array_inv!2114 (array!5083) Bool)

(assert (=> b!110803 (= e!72719 (array_inv!2114 (buf!2709 thiss!1305)))))

(declare-fun lt!167703 () tuple2!9224)

(declare-fun b!110804 () Bool)

(declare-fun lt!167704 () (_ BitVec 64))

(declare-datatypes ((tuple2!9228 0))(
  ( (tuple2!9229 (_1!4871 BitStream!4098) (_2!4871 BitStream!4098)) )
))
(declare-fun lt!167695 () tuple2!9228)

(declare-fun lt!167689 () (_ BitVec 64))

(declare-datatypes ((tuple2!9230 0))(
  ( (tuple2!9231 (_1!4872 BitStream!4098) (_2!4872 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4098 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9230)

(assert (=> b!110804 (= e!72714 (not (= (_1!4872 (readNLeastSignificantBitsLoopPure!0 (_1!4871 lt!167695) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!167689 (ite (_2!4869 lt!167703) lt!167704 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4871 lt!167695))))))

(declare-fun lt!167697 () (_ BitVec 64))

(assert (=> b!110804 (validate_offset_bits!1 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!167705)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!167696))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!167696))) lt!167697)))

(declare-fun lt!167702 () Unit!6792)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4098 array!5083 (_ BitVec 64)) Unit!6792)

(assert (=> b!110804 (= lt!167702 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4870 lt!167696) (buf!2709 (_2!4870 lt!167705)) lt!167697))))

(assert (=> b!110804 (= lt!167697 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!167690 () tuple2!9228)

(declare-fun lt!167698 () tuple2!9230)

(assert (=> b!110804 (= lt!167698 (readNLeastSignificantBitsLoopPure!0 (_1!4871 lt!167690) nBits!396 i!615 lt!167689))))

(assert (=> b!110804 (validate_offset_bits!1 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!167705)))) ((_ sign_extend 32) (currentByte!5266 thiss!1305)) ((_ sign_extend 32) (currentBit!5261 thiss!1305)) lt!167706)))

(declare-fun lt!167688 () Unit!6792)

(assert (=> b!110804 (= lt!167688 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2709 (_2!4870 lt!167705)) lt!167706))))

(assert (=> b!110804 (= lt!167689 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!110804 (= (_2!4869 lt!167703) lt!167691)))

(assert (=> b!110804 (= lt!167703 (readBitPure!0 (_1!4871 lt!167690)))))

(declare-fun reader!0 (BitStream!4098 BitStream!4098) tuple2!9228)

(assert (=> b!110804 (= lt!167695 (reader!0 (_2!4870 lt!167696) (_2!4870 lt!167705)))))

(assert (=> b!110804 (= lt!167690 (reader!0 thiss!1305 (_2!4870 lt!167705)))))

(assert (=> b!110804 e!72712))

(declare-fun res!91475 () Bool)

(assert (=> b!110804 (=> (not res!91475) (not e!72712))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110804 (= res!91475 (= (bitIndex!0 (size!2312 (buf!2709 (_1!4869 lt!167700))) (currentByte!5266 (_1!4869 lt!167700)) (currentBit!5261 (_1!4869 lt!167700))) (bitIndex!0 (size!2312 (buf!2709 (_1!4869 lt!167692))) (currentByte!5266 (_1!4869 lt!167692)) (currentBit!5261 (_1!4869 lt!167692)))))))

(declare-fun lt!167693 () Unit!6792)

(declare-fun lt!167708 () BitStream!4098)

(declare-fun readBitPrefixLemma!0 (BitStream!4098 BitStream!4098) Unit!6792)

(assert (=> b!110804 (= lt!167693 (readBitPrefixLemma!0 lt!167708 (_2!4870 lt!167705)))))

(assert (=> b!110804 (= lt!167692 (readBitPure!0 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))))))

(assert (=> b!110804 (= lt!167700 (readBitPure!0 lt!167708))))

(assert (=> b!110804 (= lt!167708 (BitStream!4099 (buf!2709 (_2!4870 lt!167696)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)))))

(assert (=> b!110804 e!72713))

(declare-fun res!91476 () Bool)

(assert (=> b!110804 (=> (not res!91476) (not e!72713))))

(assert (=> b!110804 (= res!91476 (isPrefixOf!0 thiss!1305 (_2!4870 lt!167705)))))

(declare-fun lt!167707 () Unit!6792)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4098 BitStream!4098 BitStream!4098) Unit!6792)

(assert (=> b!110804 (= lt!167707 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4870 lt!167696) (_2!4870 lt!167705)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4098 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9226)

(assert (=> b!110804 (= lt!167705 (appendNLeastSignificantBitsLoop!0 (_2!4870 lt!167696) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!72718 () Bool)

(assert (=> b!110804 e!72718))

(declare-fun res!91472 () Bool)

(assert (=> b!110804 (=> (not res!91472) (not e!72718))))

(assert (=> b!110804 (= res!91472 (= (size!2312 (buf!2709 thiss!1305)) (size!2312 (buf!2709 (_2!4870 lt!167696)))))))

(declare-fun appendBit!0 (BitStream!4098 Bool) tuple2!9226)

(assert (=> b!110804 (= lt!167696 (appendBit!0 thiss!1305 lt!167691))))

(assert (=> b!110804 (= lt!167691 (not (= (bvand v!199 lt!167704) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!110804 (= lt!167704 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!110805 () Bool)

(declare-fun lt!167694 () (_ BitVec 64))

(assert (=> b!110805 (= e!72715 (= (bitIndex!0 (size!2312 (buf!2709 (_1!4869 lt!167699))) (currentByte!5266 (_1!4869 lt!167699)) (currentBit!5261 (_1!4869 lt!167699))) lt!167694))))

(declare-fun b!110806 () Bool)

(assert (=> b!110806 (= e!72718 e!72716)))

(declare-fun res!91473 () Bool)

(assert (=> b!110806 (=> (not res!91473) (not e!72716))))

(declare-fun lt!167701 () (_ BitVec 64))

(assert (=> b!110806 (= res!91473 (= lt!167694 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!167701)))))

(assert (=> b!110806 (= lt!167694 (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))))))

(assert (=> b!110806 (= lt!167701 (bitIndex!0 (size!2312 (buf!2709 thiss!1305)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)))))

(assert (= (and start!21954 res!91468) b!110796))

(assert (= (and b!110796 res!91469) b!110800))

(assert (= (and b!110800 res!91470) b!110801))

(assert (= (and b!110801 res!91477) b!110804))

(assert (= (and b!110804 res!91472) b!110806))

(assert (= (and b!110806 res!91473) b!110797))

(assert (= (and b!110797 res!91474) b!110795))

(assert (= (and b!110795 res!91467) b!110805))

(assert (= (and b!110804 res!91476) b!110802))

(assert (= (and b!110802 res!91471) b!110798))

(assert (= (and b!110804 res!91475) b!110799))

(assert (= start!21954 b!110803))

(declare-fun m!164401 () Bool)

(assert (=> b!110802 m!164401))

(declare-fun m!164403 () Bool)

(assert (=> b!110796 m!164403))

(declare-fun m!164405 () Bool)

(assert (=> b!110806 m!164405))

(declare-fun m!164407 () Bool)

(assert (=> b!110806 m!164407))

(declare-fun m!164409 () Bool)

(assert (=> b!110804 m!164409))

(declare-fun m!164411 () Bool)

(assert (=> b!110804 m!164411))

(declare-fun m!164413 () Bool)

(assert (=> b!110804 m!164413))

(declare-fun m!164415 () Bool)

(assert (=> b!110804 m!164415))

(declare-fun m!164417 () Bool)

(assert (=> b!110804 m!164417))

(declare-fun m!164419 () Bool)

(assert (=> b!110804 m!164419))

(declare-fun m!164421 () Bool)

(assert (=> b!110804 m!164421))

(declare-fun m!164423 () Bool)

(assert (=> b!110804 m!164423))

(declare-fun m!164425 () Bool)

(assert (=> b!110804 m!164425))

(declare-fun m!164427 () Bool)

(assert (=> b!110804 m!164427))

(declare-fun m!164429 () Bool)

(assert (=> b!110804 m!164429))

(declare-fun m!164431 () Bool)

(assert (=> b!110804 m!164431))

(declare-fun m!164433 () Bool)

(assert (=> b!110804 m!164433))

(declare-fun m!164435 () Bool)

(assert (=> b!110804 m!164435))

(declare-fun m!164437 () Bool)

(assert (=> b!110804 m!164437))

(declare-fun m!164439 () Bool)

(assert (=> b!110804 m!164439))

(declare-fun m!164441 () Bool)

(assert (=> b!110804 m!164441))

(declare-fun m!164443 () Bool)

(assert (=> b!110804 m!164443))

(declare-fun m!164445 () Bool)

(assert (=> b!110804 m!164445))

(declare-fun m!164447 () Bool)

(assert (=> b!110803 m!164447))

(declare-fun m!164449 () Bool)

(assert (=> b!110800 m!164449))

(declare-fun m!164451 () Bool)

(assert (=> b!110805 m!164451))

(declare-fun m!164453 () Bool)

(assert (=> b!110795 m!164453))

(assert (=> b!110795 m!164453))

(declare-fun m!164455 () Bool)

(assert (=> b!110795 m!164455))

(declare-fun m!164457 () Bool)

(assert (=> b!110797 m!164457))

(declare-fun m!164459 () Bool)

(assert (=> start!21954 m!164459))

(declare-fun m!164461 () Bool)

(assert (=> b!110798 m!164461))

(check-sat (not b!110795) (not b!110803) (not b!110800) (not start!21954) (not b!110806) (not b!110805) (not b!110798) (not b!110804) (not b!110802) (not b!110796) (not b!110797))
(check-sat)
(get-model)

(declare-fun d!34914 () Bool)

(assert (=> d!34914 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!110800 d!34914))

(declare-fun d!34916 () Bool)

(declare-fun e!72808 () Bool)

(assert (=> d!34916 e!72808))

(declare-fun res!91609 () Bool)

(assert (=> d!34916 (=> (not res!91609) (not e!72808))))

(declare-fun lt!168060 () (_ BitVec 64))

(declare-fun lt!168061 () (_ BitVec 64))

(declare-fun lt!168059 () (_ BitVec 64))

(assert (=> d!34916 (= res!91609 (= lt!168059 (bvsub lt!168060 lt!168061)))))

(assert (=> d!34916 (or (= (bvand lt!168060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168061 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168060 lt!168061) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!34916 (= lt!168061 (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!167699)))) ((_ sign_extend 32) (currentByte!5266 (_1!4869 lt!167699))) ((_ sign_extend 32) (currentBit!5261 (_1!4869 lt!167699)))))))

(declare-fun lt!168062 () (_ BitVec 64))

(declare-fun lt!168063 () (_ BitVec 64))

(assert (=> d!34916 (= lt!168060 (bvmul lt!168062 lt!168063))))

(assert (=> d!34916 (or (= lt!168062 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!168063 (bvsdiv (bvmul lt!168062 lt!168063) lt!168062)))))

(assert (=> d!34916 (= lt!168063 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34916 (= lt!168062 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!167699)))))))

(assert (=> d!34916 (= lt!168059 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5266 (_1!4869 lt!167699))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5261 (_1!4869 lt!167699)))))))

(assert (=> d!34916 (invariant!0 (currentBit!5261 (_1!4869 lt!167699)) (currentByte!5266 (_1!4869 lt!167699)) (size!2312 (buf!2709 (_1!4869 lt!167699))))))

(assert (=> d!34916 (= (bitIndex!0 (size!2312 (buf!2709 (_1!4869 lt!167699))) (currentByte!5266 (_1!4869 lt!167699)) (currentBit!5261 (_1!4869 lt!167699))) lt!168059)))

(declare-fun b!110953 () Bool)

(declare-fun res!91608 () Bool)

(assert (=> b!110953 (=> (not res!91608) (not e!72808))))

(assert (=> b!110953 (= res!91608 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!168059))))

(declare-fun b!110954 () Bool)

(declare-fun lt!168058 () (_ BitVec 64))

(assert (=> b!110954 (= e!72808 (bvsle lt!168059 (bvmul lt!168058 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!110954 (or (= lt!168058 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!168058 #b0000000000000000000000000000000000000000000000000000000000001000) lt!168058)))))

(assert (=> b!110954 (= lt!168058 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!167699)))))))

(assert (= (and d!34916 res!91609) b!110953))

(assert (= (and b!110953 res!91608) b!110954))

(declare-fun m!164731 () Bool)

(assert (=> d!34916 m!164731))

(declare-fun m!164733 () Bool)

(assert (=> d!34916 m!164733))

(assert (=> b!110805 d!34916))

(declare-fun d!34918 () Bool)

(declare-fun e!72809 () Bool)

(assert (=> d!34918 e!72809))

(declare-fun res!91611 () Bool)

(assert (=> d!34918 (=> (not res!91611) (not e!72809))))

(declare-fun lt!168067 () (_ BitVec 64))

(declare-fun lt!168066 () (_ BitVec 64))

(declare-fun lt!168065 () (_ BitVec 64))

(assert (=> d!34918 (= res!91611 (= lt!168065 (bvsub lt!168066 lt!168067)))))

(assert (=> d!34918 (or (= (bvand lt!168066 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168067 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168066 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168066 lt!168067) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34918 (= lt!168067 (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!167696)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!167696))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!167696)))))))

(declare-fun lt!168068 () (_ BitVec 64))

(declare-fun lt!168069 () (_ BitVec 64))

(assert (=> d!34918 (= lt!168066 (bvmul lt!168068 lt!168069))))

(assert (=> d!34918 (or (= lt!168068 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!168069 (bvsdiv (bvmul lt!168068 lt!168069) lt!168068)))))

(assert (=> d!34918 (= lt!168069 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34918 (= lt!168068 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!167696)))))))

(assert (=> d!34918 (= lt!168065 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!167696))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!167696)))))))

(assert (=> d!34918 (invariant!0 (currentBit!5261 (_2!4870 lt!167696)) (currentByte!5266 (_2!4870 lt!167696)) (size!2312 (buf!2709 (_2!4870 lt!167696))))))

(assert (=> d!34918 (= (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))) lt!168065)))

(declare-fun b!110955 () Bool)

(declare-fun res!91610 () Bool)

(assert (=> b!110955 (=> (not res!91610) (not e!72809))))

(assert (=> b!110955 (= res!91610 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!168065))))

(declare-fun b!110956 () Bool)

(declare-fun lt!168064 () (_ BitVec 64))

(assert (=> b!110956 (= e!72809 (bvsle lt!168065 (bvmul lt!168064 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!110956 (or (= lt!168064 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!168064 #b0000000000000000000000000000000000000000000000000000000000001000) lt!168064)))))

(assert (=> b!110956 (= lt!168064 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!167696)))))))

(assert (= (and d!34918 res!91611) b!110955))

(assert (= (and b!110955 res!91610) b!110956))

(declare-fun m!164735 () Bool)

(assert (=> d!34918 m!164735))

(declare-fun m!164737 () Bool)

(assert (=> d!34918 m!164737))

(assert (=> b!110806 d!34918))

(declare-fun d!34920 () Bool)

(declare-fun e!72810 () Bool)

(assert (=> d!34920 e!72810))

(declare-fun res!91613 () Bool)

(assert (=> d!34920 (=> (not res!91613) (not e!72810))))

(declare-fun lt!168071 () (_ BitVec 64))

(declare-fun lt!168073 () (_ BitVec 64))

(declare-fun lt!168072 () (_ BitVec 64))

(assert (=> d!34920 (= res!91613 (= lt!168071 (bvsub lt!168072 lt!168073)))))

(assert (=> d!34920 (or (= (bvand lt!168072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168073 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168072 lt!168073) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34920 (= lt!168073 (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 thiss!1305))) ((_ sign_extend 32) (currentByte!5266 thiss!1305)) ((_ sign_extend 32) (currentBit!5261 thiss!1305))))))

(declare-fun lt!168074 () (_ BitVec 64))

(declare-fun lt!168075 () (_ BitVec 64))

(assert (=> d!34920 (= lt!168072 (bvmul lt!168074 lt!168075))))

(assert (=> d!34920 (or (= lt!168074 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!168075 (bvsdiv (bvmul lt!168074 lt!168075) lt!168074)))))

(assert (=> d!34920 (= lt!168075 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34920 (= lt!168074 ((_ sign_extend 32) (size!2312 (buf!2709 thiss!1305))))))

(assert (=> d!34920 (= lt!168071 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5266 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5261 thiss!1305))))))

(assert (=> d!34920 (invariant!0 (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305) (size!2312 (buf!2709 thiss!1305)))))

(assert (=> d!34920 (= (bitIndex!0 (size!2312 (buf!2709 thiss!1305)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)) lt!168071)))

(declare-fun b!110957 () Bool)

(declare-fun res!91612 () Bool)

(assert (=> b!110957 (=> (not res!91612) (not e!72810))))

(assert (=> b!110957 (= res!91612 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!168071))))

(declare-fun b!110958 () Bool)

(declare-fun lt!168070 () (_ BitVec 64))

(assert (=> b!110958 (= e!72810 (bvsle lt!168071 (bvmul lt!168070 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!110958 (or (= lt!168070 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!168070 #b0000000000000000000000000000000000000000000000000000000000001000) lt!168070)))))

(assert (=> b!110958 (= lt!168070 ((_ sign_extend 32) (size!2312 (buf!2709 thiss!1305))))))

(assert (= (and d!34920 res!91613) b!110957))

(assert (= (and b!110957 res!91612) b!110958))

(declare-fun m!164739 () Bool)

(assert (=> d!34920 m!164739))

(declare-fun m!164741 () Bool)

(assert (=> d!34920 m!164741))

(assert (=> b!110806 d!34920))

(declare-fun d!34922 () Bool)

(assert (=> d!34922 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305) (size!2312 (buf!2709 thiss!1305))))))

(declare-fun bs!8561 () Bool)

(assert (= bs!8561 d!34922))

(assert (=> bs!8561 m!164741))

(assert (=> start!21954 d!34922))

(declare-fun d!34924 () Bool)

(declare-datatypes ((tuple2!9248 0))(
  ( (tuple2!9249 (_1!4881 Bool) (_2!4881 BitStream!4098)) )
))
(declare-fun lt!168078 () tuple2!9248)

(declare-fun readBit!0 (BitStream!4098) tuple2!9248)

(assert (=> d!34924 (= lt!168078 (readBit!0 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305))))))

(assert (=> d!34924 (= (readBitPure!0 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305))) (tuple2!9225 (_2!4881 lt!168078) (_1!4881 lt!168078)))))

(declare-fun bs!8562 () Bool)

(assert (= bs!8562 d!34924))

(assert (=> bs!8562 m!164453))

(declare-fun m!164743 () Bool)

(assert (=> bs!8562 m!164743))

(assert (=> b!110795 d!34924))

(declare-fun d!34926 () Bool)

(declare-fun e!72813 () Bool)

(assert (=> d!34926 e!72813))

(declare-fun res!91617 () Bool)

(assert (=> d!34926 (=> (not res!91617) (not e!72813))))

(assert (=> d!34926 (= res!91617 (invariant!0 (currentBit!5261 (_2!4870 lt!167696)) (currentByte!5266 (_2!4870 lt!167696)) (size!2312 (buf!2709 (_2!4870 lt!167696)))))))

(assert (=> d!34926 (= (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305)) (BitStream!4099 (buf!2709 (_2!4870 lt!167696)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)))))

(declare-fun b!110961 () Bool)

(assert (=> b!110961 (= e!72813 (invariant!0 (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305) (size!2312 (buf!2709 (_2!4870 lt!167696)))))))

(assert (= (and d!34926 res!91617) b!110961))

(assert (=> d!34926 m!164737))

(assert (=> b!110961 m!164401))

(assert (=> b!110795 d!34926))

(declare-fun d!34928 () Bool)

(assert (=> d!34928 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2312 (buf!2709 thiss!1305))) ((_ sign_extend 32) (currentByte!5266 thiss!1305)) ((_ sign_extend 32) (currentBit!5261 thiss!1305)) lt!167706) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 thiss!1305))) ((_ sign_extend 32) (currentByte!5266 thiss!1305)) ((_ sign_extend 32) (currentBit!5261 thiss!1305))) lt!167706))))

(declare-fun bs!8563 () Bool)

(assert (= bs!8563 d!34928))

(assert (=> bs!8563 m!164739))

(assert (=> b!110796 d!34928))

(declare-fun d!34930 () Bool)

(assert (=> d!34930 (= (invariant!0 (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305) (size!2312 (buf!2709 (_2!4870 lt!167696)))) (and (bvsge (currentBit!5261 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5261 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5266 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5266 thiss!1305) (size!2312 (buf!2709 (_2!4870 lt!167696)))) (and (= (currentBit!5261 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5266 thiss!1305) (size!2312 (buf!2709 (_2!4870 lt!167696))))))))))

(assert (=> b!110802 d!34930))

(declare-fun d!34932 () Bool)

(declare-fun res!91625 () Bool)

(declare-fun e!72819 () Bool)

(assert (=> d!34932 (=> (not res!91625) (not e!72819))))

(assert (=> d!34932 (= res!91625 (= (size!2312 (buf!2709 thiss!1305)) (size!2312 (buf!2709 (_2!4870 lt!167696)))))))

(assert (=> d!34932 (= (isPrefixOf!0 thiss!1305 (_2!4870 lt!167696)) e!72819)))

(declare-fun b!110968 () Bool)

(declare-fun res!91624 () Bool)

(assert (=> b!110968 (=> (not res!91624) (not e!72819))))

(assert (=> b!110968 (= res!91624 (bvsle (bitIndex!0 (size!2312 (buf!2709 thiss!1305)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696)))))))

(declare-fun b!110969 () Bool)

(declare-fun e!72818 () Bool)

(assert (=> b!110969 (= e!72819 e!72818)))

(declare-fun res!91626 () Bool)

(assert (=> b!110969 (=> res!91626 e!72818)))

(assert (=> b!110969 (= res!91626 (= (size!2312 (buf!2709 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!110970 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5083 array!5083 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110970 (= e!72818 (arrayBitRangesEq!0 (buf!2709 thiss!1305) (buf!2709 (_2!4870 lt!167696)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2312 (buf!2709 thiss!1305)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))))))

(assert (= (and d!34932 res!91625) b!110968))

(assert (= (and b!110968 res!91624) b!110969))

(assert (= (and b!110969 (not res!91626)) b!110970))

(assert (=> b!110968 m!164407))

(assert (=> b!110968 m!164405))

(assert (=> b!110970 m!164407))

(assert (=> b!110970 m!164407))

(declare-fun m!164745 () Bool)

(assert (=> b!110970 m!164745))

(assert (=> b!110797 d!34932))

(declare-fun d!34934 () Bool)

(assert (=> d!34934 (= (invariant!0 (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305) (size!2312 (buf!2709 (_2!4870 lt!167705)))) (and (bvsge (currentBit!5261 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5261 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5266 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5266 thiss!1305) (size!2312 (buf!2709 (_2!4870 lt!167705)))) (and (= (currentBit!5261 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5266 thiss!1305) (size!2312 (buf!2709 (_2!4870 lt!167705))))))))))

(assert (=> b!110798 d!34934))

(declare-fun d!34936 () Bool)

(assert (=> d!34936 (= (array_inv!2114 (buf!2709 thiss!1305)) (bvsge (size!2312 (buf!2709 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!110803 d!34936))

(declare-fun d!34938 () Bool)

(assert (=> d!34938 (isPrefixOf!0 thiss!1305 (_2!4870 lt!167705))))

(declare-fun lt!168081 () Unit!6792)

(declare-fun choose!30 (BitStream!4098 BitStream!4098 BitStream!4098) Unit!6792)

(assert (=> d!34938 (= lt!168081 (choose!30 thiss!1305 (_2!4870 lt!167696) (_2!4870 lt!167705)))))

(assert (=> d!34938 (isPrefixOf!0 thiss!1305 (_2!4870 lt!167696))))

(assert (=> d!34938 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4870 lt!167696) (_2!4870 lt!167705)) lt!168081)))

(declare-fun bs!8564 () Bool)

(assert (= bs!8564 d!34938))

(assert (=> bs!8564 m!164427))

(declare-fun m!164747 () Bool)

(assert (=> bs!8564 m!164747))

(assert (=> bs!8564 m!164457))

(assert (=> b!110804 d!34938))

(declare-fun b!111099 () Bool)

(declare-fun res!91727 () Bool)

(declare-fun e!72887 () Bool)

(assert (=> b!111099 (=> (not res!91727) (not e!72887))))

(declare-fun lt!168502 () (_ BitVec 64))

(declare-fun lt!168505 () (_ BitVec 64))

(declare-fun lt!168496 () tuple2!9226)

(assert (=> b!111099 (= res!91727 (= (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168496))) (currentByte!5266 (_2!4870 lt!168496)) (currentBit!5261 (_2!4870 lt!168496))) (bvadd lt!168502 lt!168505)))))

(assert (=> b!111099 (or (not (= (bvand lt!168502 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168505 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!168502 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!168502 lt!168505) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111099 (= lt!168505 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!111099 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!111099 (= lt!168502 (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))))))

(declare-fun b!111100 () Bool)

(declare-fun e!72888 () (_ BitVec 64))

(assert (=> b!111100 (= e!72888 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun call!1395 () Bool)

(declare-fun lt!168495 () BitStream!4098)

(declare-fun lt!168500 () tuple2!9226)

(declare-fun bm!1392 () Bool)

(declare-fun c!6754 () Bool)

(assert (=> bm!1392 (= call!1395 (isPrefixOf!0 (ite c!6754 (_2!4870 lt!167696) lt!168495) (ite c!6754 (_2!4870 lt!168500) lt!168495)))))

(declare-fun d!34940 () Bool)

(assert (=> d!34940 e!72887))

(declare-fun res!91728 () Bool)

(assert (=> d!34940 (=> (not res!91728) (not e!72887))))

(assert (=> d!34940 (= res!91728 (= (size!2312 (buf!2709 (_2!4870 lt!167696))) (size!2312 (buf!2709 (_2!4870 lt!168496)))))))

(declare-fun e!72892 () tuple2!9226)

(assert (=> d!34940 (= lt!168496 e!72892)))

(assert (=> d!34940 (= c!6754 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!34940 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!34940 (= (appendNLeastSignificantBitsLoop!0 (_2!4870 lt!167696) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!168496)))

(declare-fun b!111101 () Bool)

(declare-fun res!91721 () Bool)

(declare-fun lt!168511 () tuple2!9226)

(assert (=> b!111101 (= res!91721 (= (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168511))) (currentByte!5266 (_2!4870 lt!168511)) (currentBit!5261 (_2!4870 lt!168511))) (bvadd (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!72893 () Bool)

(assert (=> b!111101 (=> (not res!91721) (not e!72893))))

(declare-fun b!111102 () Bool)

(declare-fun Unit!6812 () Unit!6792)

(assert (=> b!111102 (= e!72892 (tuple2!9227 Unit!6812 (_2!4870 lt!168500)))))

(declare-fun lt!168528 () Bool)

(assert (=> b!111102 (= lt!168528 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111102 (= lt!168511 (appendBit!0 (_2!4870 lt!167696) lt!168528))))

(declare-fun res!91726 () Bool)

(assert (=> b!111102 (= res!91726 (= (size!2312 (buf!2709 (_2!4870 lt!167696))) (size!2312 (buf!2709 (_2!4870 lt!168511)))))))

(assert (=> b!111102 (=> (not res!91726) (not e!72893))))

(assert (=> b!111102 e!72893))

(declare-fun lt!168524 () tuple2!9226)

(assert (=> b!111102 (= lt!168524 lt!168511)))

(assert (=> b!111102 (= lt!168500 (appendNLeastSignificantBitsLoop!0 (_2!4870 lt!168524) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!168530 () Unit!6792)

(assert (=> b!111102 (= lt!168530 (lemmaIsPrefixTransitive!0 (_2!4870 lt!167696) (_2!4870 lt!168524) (_2!4870 lt!168500)))))

(assert (=> b!111102 call!1395))

(declare-fun lt!168497 () Unit!6792)

(assert (=> b!111102 (= lt!168497 lt!168530)))

(assert (=> b!111102 (invariant!0 (currentBit!5261 (_2!4870 lt!167696)) (currentByte!5266 (_2!4870 lt!167696)) (size!2312 (buf!2709 (_2!4870 lt!168524))))))

(declare-fun lt!168499 () BitStream!4098)

(assert (=> b!111102 (= lt!168499 (BitStream!4099 (buf!2709 (_2!4870 lt!168524)) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))))))

(assert (=> b!111102 (invariant!0 (currentBit!5261 lt!168499) (currentByte!5266 lt!168499) (size!2312 (buf!2709 (_2!4870 lt!168500))))))

(declare-fun lt!168535 () BitStream!4098)

(assert (=> b!111102 (= lt!168535 (BitStream!4099 (buf!2709 (_2!4870 lt!168500)) (currentByte!5266 lt!168499) (currentBit!5261 lt!168499)))))

(declare-fun lt!168504 () tuple2!9224)

(assert (=> b!111102 (= lt!168504 (readBitPure!0 lt!168499))))

(declare-fun lt!168529 () tuple2!9224)

(assert (=> b!111102 (= lt!168529 (readBitPure!0 lt!168535))))

(declare-fun lt!168506 () Unit!6792)

(assert (=> b!111102 (= lt!168506 (readBitPrefixLemma!0 lt!168499 (_2!4870 lt!168500)))))

(declare-fun res!91723 () Bool)

(assert (=> b!111102 (= res!91723 (= (bitIndex!0 (size!2312 (buf!2709 (_1!4869 lt!168504))) (currentByte!5266 (_1!4869 lt!168504)) (currentBit!5261 (_1!4869 lt!168504))) (bitIndex!0 (size!2312 (buf!2709 (_1!4869 lt!168529))) (currentByte!5266 (_1!4869 lt!168529)) (currentBit!5261 (_1!4869 lt!168529)))))))

(declare-fun e!72889 () Bool)

(assert (=> b!111102 (=> (not res!91723) (not e!72889))))

(assert (=> b!111102 e!72889))

(declare-fun lt!168523 () Unit!6792)

(assert (=> b!111102 (= lt!168523 lt!168506)))

(declare-fun lt!168515 () tuple2!9228)

(assert (=> b!111102 (= lt!168515 (reader!0 (_2!4870 lt!167696) (_2!4870 lt!168500)))))

(declare-fun lt!168538 () tuple2!9228)

(assert (=> b!111102 (= lt!168538 (reader!0 (_2!4870 lt!168524) (_2!4870 lt!168500)))))

(declare-fun lt!168532 () tuple2!9224)

(assert (=> b!111102 (= lt!168532 (readBitPure!0 (_1!4871 lt!168515)))))

(assert (=> b!111102 (= (_2!4869 lt!168532) lt!168528)))

(declare-fun lt!168518 () Unit!6792)

(declare-fun Unit!6813 () Unit!6792)

(assert (=> b!111102 (= lt!168518 Unit!6813)))

(declare-fun lt!168521 () (_ BitVec 64))

(assert (=> b!111102 (= lt!168521 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!168501 () (_ BitVec 64))

(assert (=> b!111102 (= lt!168501 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!168534 () Unit!6792)

(assert (=> b!111102 (= lt!168534 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4870 lt!167696) (buf!2709 (_2!4870 lt!168500)) lt!168501))))

(assert (=> b!111102 (validate_offset_bits!1 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168500)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!167696))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!167696))) lt!168501)))

(declare-fun lt!168522 () Unit!6792)

(assert (=> b!111102 (= lt!168522 lt!168534)))

(declare-fun lt!168537 () tuple2!9230)

(assert (=> b!111102 (= lt!168537 (readNLeastSignificantBitsLoopPure!0 (_1!4871 lt!168515) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168521))))

(declare-fun lt!168514 () (_ BitVec 64))

(assert (=> b!111102 (= lt!168514 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!168510 () Unit!6792)

(assert (=> b!111102 (= lt!168510 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4870 lt!168524) (buf!2709 (_2!4870 lt!168500)) lt!168514))))

(assert (=> b!111102 (validate_offset_bits!1 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168500)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!168524))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!168524))) lt!168514)))

(declare-fun lt!168536 () Unit!6792)

(assert (=> b!111102 (= lt!168536 lt!168510)))

(declare-fun lt!168531 () tuple2!9230)

(assert (=> b!111102 (= lt!168531 (readNLeastSignificantBitsLoopPure!0 (_1!4871 lt!168538) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!168521 (ite (_2!4869 lt!168532) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!168526 () tuple2!9230)

(assert (=> b!111102 (= lt!168526 (readNLeastSignificantBitsLoopPure!0 (_1!4871 lt!168515) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168521))))

(declare-fun c!6753 () Bool)

(assert (=> b!111102 (= c!6753 (_2!4869 (readBitPure!0 (_1!4871 lt!168515))))))

(declare-fun lt!168494 () tuple2!9230)

(declare-fun withMovedBitIndex!0 (BitStream!4098 (_ BitVec 64)) BitStream!4098)

(assert (=> b!111102 (= lt!168494 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4871 lt!168515) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!168521 e!72888)))))

(declare-fun lt!168503 () Unit!6792)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4098 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6792)

(assert (=> b!111102 (= lt!168503 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4871 lt!168515) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168521))))

(assert (=> b!111102 (and (= (_2!4872 lt!168526) (_2!4872 lt!168494)) (= (_1!4872 lt!168526) (_1!4872 lt!168494)))))

(declare-fun lt!168498 () Unit!6792)

(assert (=> b!111102 (= lt!168498 lt!168503)))

(assert (=> b!111102 (= (_1!4871 lt!168515) (withMovedBitIndex!0 (_2!4871 lt!168515) (bvsub (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168500))) (currentByte!5266 (_2!4870 lt!168500)) (currentBit!5261 (_2!4870 lt!168500))))))))

(declare-fun lt!168520 () Unit!6792)

(declare-fun Unit!6814 () Unit!6792)

(assert (=> b!111102 (= lt!168520 Unit!6814)))

(assert (=> b!111102 (= (_1!4871 lt!168538) (withMovedBitIndex!0 (_2!4871 lt!168538) (bvsub (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168524))) (currentByte!5266 (_2!4870 lt!168524)) (currentBit!5261 (_2!4870 lt!168524))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168500))) (currentByte!5266 (_2!4870 lt!168500)) (currentBit!5261 (_2!4870 lt!168500))))))))

(declare-fun lt!168525 () Unit!6792)

(declare-fun Unit!6815 () Unit!6792)

(assert (=> b!111102 (= lt!168525 Unit!6815)))

(assert (=> b!111102 (= (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))) (bvsub (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168524))) (currentByte!5266 (_2!4870 lt!168524)) (currentBit!5261 (_2!4870 lt!168524))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!168509 () Unit!6792)

(declare-fun Unit!6816 () Unit!6792)

(assert (=> b!111102 (= lt!168509 Unit!6816)))

(assert (=> b!111102 (= (_2!4872 lt!168537) (_2!4872 lt!168531))))

(declare-fun lt!168516 () Unit!6792)

(declare-fun Unit!6817 () Unit!6792)

(assert (=> b!111102 (= lt!168516 Unit!6817)))

(assert (=> b!111102 (= (_1!4872 lt!168537) (_2!4871 lt!168515))))

(declare-fun b!111103 () Bool)

(declare-fun res!91722 () Bool)

(assert (=> b!111103 (= res!91722 (isPrefixOf!0 (_2!4870 lt!167696) (_2!4870 lt!168511)))))

(assert (=> b!111103 (=> (not res!91722) (not e!72893))))

(declare-fun b!111104 () Bool)

(declare-fun lt!168512 () tuple2!9224)

(assert (=> b!111104 (= lt!168512 (readBitPure!0 (readerFrom!0 (_2!4870 lt!168511) (currentBit!5261 (_2!4870 lt!167696)) (currentByte!5266 (_2!4870 lt!167696)))))))

(declare-fun res!91720 () Bool)

(assert (=> b!111104 (= res!91720 (and (= (_2!4869 lt!168512) lt!168528) (= (_1!4869 lt!168512) (_2!4870 lt!168511))))))

(declare-fun e!72891 () Bool)

(assert (=> b!111104 (=> (not res!91720) (not e!72891))))

(assert (=> b!111104 (= e!72893 e!72891)))

(declare-fun b!111105 () Bool)

(assert (=> b!111105 (= e!72889 (= (_2!4869 lt!168504) (_2!4869 lt!168529)))))

(declare-fun b!111106 () Bool)

(assert (=> b!111106 (= e!72891 (= (bitIndex!0 (size!2312 (buf!2709 (_1!4869 lt!168512))) (currentByte!5266 (_1!4869 lt!168512)) (currentBit!5261 (_1!4869 lt!168512))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168511))) (currentByte!5266 (_2!4870 lt!168511)) (currentBit!5261 (_2!4870 lt!168511)))))))

(declare-fun b!111107 () Bool)

(declare-fun lt!168533 () tuple2!9230)

(declare-fun lt!168519 () tuple2!9228)

(assert (=> b!111107 (= e!72887 (and (= (_2!4872 lt!168533) v!199) (= (_1!4872 lt!168533) (_2!4871 lt!168519))))))

(declare-fun lt!168517 () (_ BitVec 64))

(assert (=> b!111107 (= lt!168533 (readNLeastSignificantBitsLoopPure!0 (_1!4871 lt!168519) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168517))))

(declare-fun lt!168507 () Unit!6792)

(declare-fun lt!168513 () Unit!6792)

(assert (=> b!111107 (= lt!168507 lt!168513)))

(declare-fun lt!168527 () (_ BitVec 64))

(assert (=> b!111107 (validate_offset_bits!1 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168496)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!167696))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!167696))) lt!168527)))

(assert (=> b!111107 (= lt!168513 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4870 lt!167696) (buf!2709 (_2!4870 lt!168496)) lt!168527))))

(declare-fun e!72890 () Bool)

(assert (=> b!111107 e!72890))

(declare-fun res!91725 () Bool)

(assert (=> b!111107 (=> (not res!91725) (not e!72890))))

(assert (=> b!111107 (= res!91725 (and (= (size!2312 (buf!2709 (_2!4870 lt!167696))) (size!2312 (buf!2709 (_2!4870 lt!168496)))) (bvsge lt!168527 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111107 (= lt!168527 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!111107 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!111107 (= lt!168517 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!111107 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!111107 (= lt!168519 (reader!0 (_2!4870 lt!167696) (_2!4870 lt!168496)))))

(declare-fun b!111108 () Bool)

(assert (=> b!111108 (= e!72888 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!111109 () Bool)

(declare-fun lt!168508 () Unit!6792)

(assert (=> b!111109 (= e!72892 (tuple2!9227 lt!168508 (_2!4870 lt!167696)))))

(assert (=> b!111109 (= lt!168495 (_2!4870 lt!167696))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4098) Unit!6792)

(assert (=> b!111109 (= lt!168508 (lemmaIsPrefixRefl!0 lt!168495))))

(assert (=> b!111109 call!1395))

(declare-fun b!111110 () Bool)

(assert (=> b!111110 (= e!72890 (validate_offset_bits!1 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!167696)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!167696))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!167696))) lt!168527))))

(declare-fun b!111111 () Bool)

(declare-fun res!91724 () Bool)

(assert (=> b!111111 (=> (not res!91724) (not e!72887))))

(assert (=> b!111111 (= res!91724 (isPrefixOf!0 (_2!4870 lt!167696) (_2!4870 lt!168496)))))

(assert (= (and d!34940 c!6754) b!111102))

(assert (= (and d!34940 (not c!6754)) b!111109))

(assert (= (and b!111102 res!91726) b!111101))

(assert (= (and b!111101 res!91721) b!111103))

(assert (= (and b!111103 res!91722) b!111104))

(assert (= (and b!111104 res!91720) b!111106))

(assert (= (and b!111102 res!91723) b!111105))

(assert (= (and b!111102 c!6753) b!111108))

(assert (= (and b!111102 (not c!6753)) b!111100))

(assert (= (or b!111102 b!111109) bm!1392))

(assert (= (and d!34940 res!91728) b!111099))

(assert (= (and b!111099 res!91727) b!111111))

(assert (= (and b!111111 res!91724) b!111107))

(assert (= (and b!111107 res!91725) b!111110))

(declare-fun m!164967 () Bool)

(assert (=> b!111104 m!164967))

(assert (=> b!111104 m!164967))

(declare-fun m!164969 () Bool)

(assert (=> b!111104 m!164969))

(declare-fun m!164971 () Bool)

(assert (=> b!111103 m!164971))

(declare-fun m!164973 () Bool)

(assert (=> b!111101 m!164973))

(assert (=> b!111101 m!164405))

(declare-fun m!164975 () Bool)

(assert (=> b!111106 m!164975))

(assert (=> b!111106 m!164973))

(declare-fun m!164977 () Bool)

(assert (=> bm!1392 m!164977))

(declare-fun m!164979 () Bool)

(assert (=> b!111110 m!164979))

(declare-fun m!164981 () Bool)

(assert (=> b!111099 m!164981))

(assert (=> b!111099 m!164405))

(declare-fun m!164983 () Bool)

(assert (=> b!111102 m!164983))

(declare-fun m!164985 () Bool)

(assert (=> b!111102 m!164985))

(declare-fun m!164987 () Bool)

(assert (=> b!111102 m!164987))

(declare-fun m!164989 () Bool)

(assert (=> b!111102 m!164989))

(declare-fun m!164991 () Bool)

(assert (=> b!111102 m!164991))

(assert (=> b!111102 m!164405))

(declare-fun m!164993 () Bool)

(assert (=> b!111102 m!164993))

(declare-fun m!164995 () Bool)

(assert (=> b!111102 m!164995))

(declare-fun m!164997 () Bool)

(assert (=> b!111102 m!164997))

(declare-fun m!164999 () Bool)

(assert (=> b!111102 m!164999))

(declare-fun m!165001 () Bool)

(assert (=> b!111102 m!165001))

(declare-fun m!165003 () Bool)

(assert (=> b!111102 m!165003))

(declare-fun m!165005 () Bool)

(assert (=> b!111102 m!165005))

(declare-fun m!165007 () Bool)

(assert (=> b!111102 m!165007))

(declare-fun m!165009 () Bool)

(assert (=> b!111102 m!165009))

(declare-fun m!165011 () Bool)

(assert (=> b!111102 m!165011))

(declare-fun m!165013 () Bool)

(assert (=> b!111102 m!165013))

(declare-fun m!165015 () Bool)

(assert (=> b!111102 m!165015))

(declare-fun m!165017 () Bool)

(assert (=> b!111102 m!165017))

(declare-fun m!165019 () Bool)

(assert (=> b!111102 m!165019))

(declare-fun m!165021 () Bool)

(assert (=> b!111102 m!165021))

(assert (=> b!111102 m!165019))

(declare-fun m!165023 () Bool)

(assert (=> b!111102 m!165023))

(declare-fun m!165025 () Bool)

(assert (=> b!111102 m!165025))

(declare-fun m!165027 () Bool)

(assert (=> b!111102 m!165027))

(declare-fun m!165029 () Bool)

(assert (=> b!111102 m!165029))

(declare-fun m!165031 () Bool)

(assert (=> b!111102 m!165031))

(declare-fun m!165033 () Bool)

(assert (=> b!111102 m!165033))

(declare-fun m!165035 () Bool)

(assert (=> b!111102 m!165035))

(declare-fun m!165037 () Bool)

(assert (=> b!111107 m!165037))

(declare-fun m!165039 () Bool)

(assert (=> b!111107 m!165039))

(declare-fun m!165041 () Bool)

(assert (=> b!111107 m!165041))

(assert (=> b!111107 m!165029))

(declare-fun m!165043 () Bool)

(assert (=> b!111107 m!165043))

(declare-fun m!165045 () Bool)

(assert (=> b!111111 m!165045))

(declare-fun m!165047 () Bool)

(assert (=> b!111109 m!165047))

(assert (=> b!110804 d!34940))

(declare-fun d!34968 () Bool)

(declare-fun lt!168539 () tuple2!9248)

(assert (=> d!34968 (= lt!168539 (readBit!0 lt!167708))))

(assert (=> d!34968 (= (readBitPure!0 lt!167708) (tuple2!9225 (_2!4881 lt!168539) (_1!4881 lt!168539)))))

(declare-fun bs!8570 () Bool)

(assert (= bs!8570 d!34968))

(declare-fun m!165049 () Bool)

(assert (=> bs!8570 m!165049))

(assert (=> b!110804 d!34968))

(declare-fun d!34970 () Bool)

(declare-fun lt!168540 () tuple2!9248)

(assert (=> d!34970 (= lt!168540 (readBit!0 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))))))

(assert (=> d!34970 (= (readBitPure!0 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))) (tuple2!9225 (_2!4881 lt!168540) (_1!4881 lt!168540)))))

(declare-fun bs!8571 () Bool)

(assert (= bs!8571 d!34970))

(declare-fun m!165051 () Bool)

(assert (=> bs!8571 m!165051))

(assert (=> b!110804 d!34970))

(declare-fun d!34972 () Bool)

(declare-fun lt!168541 () tuple2!9248)

(assert (=> d!34972 (= lt!168541 (readBit!0 (_1!4871 lt!167690)))))

(assert (=> d!34972 (= (readBitPure!0 (_1!4871 lt!167690)) (tuple2!9225 (_2!4881 lt!168541) (_1!4881 lt!168541)))))

(declare-fun bs!8572 () Bool)

(assert (= bs!8572 d!34972))

(declare-fun m!165053 () Bool)

(assert (=> bs!8572 m!165053))

(assert (=> b!110804 d!34972))

(declare-fun b!111122 () Bool)

(declare-fun res!91737 () Bool)

(declare-fun e!72899 () Bool)

(assert (=> b!111122 (=> (not res!91737) (not e!72899))))

(declare-fun lt!168596 () tuple2!9228)

(assert (=> b!111122 (= res!91737 (isPrefixOf!0 (_2!4871 lt!168596) (_2!4870 lt!167705)))))

(declare-fun b!111123 () Bool)

(declare-fun e!72898 () Unit!6792)

(declare-fun Unit!6818 () Unit!6792)

(assert (=> b!111123 (= e!72898 Unit!6818)))

(declare-fun d!34974 () Bool)

(assert (=> d!34974 e!72899))

(declare-fun res!91735 () Bool)

(assert (=> d!34974 (=> (not res!91735) (not e!72899))))

(assert (=> d!34974 (= res!91735 (isPrefixOf!0 (_1!4871 lt!168596) (_2!4871 lt!168596)))))

(declare-fun lt!168592 () BitStream!4098)

(assert (=> d!34974 (= lt!168596 (tuple2!9229 lt!168592 (_2!4870 lt!167705)))))

(declare-fun lt!168591 () Unit!6792)

(declare-fun lt!168600 () Unit!6792)

(assert (=> d!34974 (= lt!168591 lt!168600)))

(assert (=> d!34974 (isPrefixOf!0 lt!168592 (_2!4870 lt!167705))))

(assert (=> d!34974 (= lt!168600 (lemmaIsPrefixTransitive!0 lt!168592 (_2!4870 lt!167705) (_2!4870 lt!167705)))))

(declare-fun lt!168588 () Unit!6792)

(declare-fun lt!168597 () Unit!6792)

(assert (=> d!34974 (= lt!168588 lt!168597)))

(assert (=> d!34974 (isPrefixOf!0 lt!168592 (_2!4870 lt!167705))))

(assert (=> d!34974 (= lt!168597 (lemmaIsPrefixTransitive!0 lt!168592 thiss!1305 (_2!4870 lt!167705)))))

(declare-fun lt!168598 () Unit!6792)

(assert (=> d!34974 (= lt!168598 e!72898)))

(declare-fun c!6757 () Bool)

(assert (=> d!34974 (= c!6757 (not (= (size!2312 (buf!2709 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!168584 () Unit!6792)

(declare-fun lt!168594 () Unit!6792)

(assert (=> d!34974 (= lt!168584 lt!168594)))

(assert (=> d!34974 (isPrefixOf!0 (_2!4870 lt!167705) (_2!4870 lt!167705))))

(assert (=> d!34974 (= lt!168594 (lemmaIsPrefixRefl!0 (_2!4870 lt!167705)))))

(declare-fun lt!168595 () Unit!6792)

(declare-fun lt!168583 () Unit!6792)

(assert (=> d!34974 (= lt!168595 lt!168583)))

(assert (=> d!34974 (= lt!168583 (lemmaIsPrefixRefl!0 (_2!4870 lt!167705)))))

(declare-fun lt!168585 () Unit!6792)

(declare-fun lt!168589 () Unit!6792)

(assert (=> d!34974 (= lt!168585 lt!168589)))

(assert (=> d!34974 (isPrefixOf!0 lt!168592 lt!168592)))

(assert (=> d!34974 (= lt!168589 (lemmaIsPrefixRefl!0 lt!168592))))

(declare-fun lt!168593 () Unit!6792)

(declare-fun lt!168587 () Unit!6792)

(assert (=> d!34974 (= lt!168593 lt!168587)))

(assert (=> d!34974 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!34974 (= lt!168587 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!34974 (= lt!168592 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)))))

(assert (=> d!34974 (isPrefixOf!0 thiss!1305 (_2!4870 lt!167705))))

(assert (=> d!34974 (= (reader!0 thiss!1305 (_2!4870 lt!167705)) lt!168596)))

(declare-fun b!111124 () Bool)

(declare-fun lt!168599 () (_ BitVec 64))

(declare-fun lt!168590 () (_ BitVec 64))

(assert (=> b!111124 (= e!72899 (= (_1!4871 lt!168596) (withMovedBitIndex!0 (_2!4871 lt!168596) (bvsub lt!168590 lt!168599))))))

(assert (=> b!111124 (or (= (bvand lt!168590 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168599 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168590 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168590 lt!168599) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111124 (= lt!168599 (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167705))) (currentByte!5266 (_2!4870 lt!167705)) (currentBit!5261 (_2!4870 lt!167705))))))

(assert (=> b!111124 (= lt!168590 (bitIndex!0 (size!2312 (buf!2709 thiss!1305)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)))))

(declare-fun b!111125 () Bool)

(declare-fun lt!168601 () Unit!6792)

(assert (=> b!111125 (= e!72898 lt!168601)))

(declare-fun lt!168586 () (_ BitVec 64))

(assert (=> b!111125 (= lt!168586 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!168582 () (_ BitVec 64))

(assert (=> b!111125 (= lt!168582 (bitIndex!0 (size!2312 (buf!2709 thiss!1305)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5083 array!5083 (_ BitVec 64) (_ BitVec 64)) Unit!6792)

(assert (=> b!111125 (= lt!168601 (arrayBitRangesEqSymmetric!0 (buf!2709 thiss!1305) (buf!2709 (_2!4870 lt!167705)) lt!168586 lt!168582))))

(assert (=> b!111125 (arrayBitRangesEq!0 (buf!2709 (_2!4870 lt!167705)) (buf!2709 thiss!1305) lt!168586 lt!168582)))

(declare-fun b!111126 () Bool)

(declare-fun res!91736 () Bool)

(assert (=> b!111126 (=> (not res!91736) (not e!72899))))

(assert (=> b!111126 (= res!91736 (isPrefixOf!0 (_1!4871 lt!168596) thiss!1305))))

(assert (= (and d!34974 c!6757) b!111125))

(assert (= (and d!34974 (not c!6757)) b!111123))

(assert (= (and d!34974 res!91735) b!111126))

(assert (= (and b!111126 res!91736) b!111122))

(assert (= (and b!111122 res!91737) b!111124))

(declare-fun m!165055 () Bool)

(assert (=> d!34974 m!165055))

(declare-fun m!165057 () Bool)

(assert (=> d!34974 m!165057))

(declare-fun m!165059 () Bool)

(assert (=> d!34974 m!165059))

(declare-fun m!165061 () Bool)

(assert (=> d!34974 m!165061))

(assert (=> d!34974 m!164427))

(declare-fun m!165063 () Bool)

(assert (=> d!34974 m!165063))

(declare-fun m!165065 () Bool)

(assert (=> d!34974 m!165065))

(declare-fun m!165067 () Bool)

(assert (=> d!34974 m!165067))

(declare-fun m!165069 () Bool)

(assert (=> d!34974 m!165069))

(declare-fun m!165071 () Bool)

(assert (=> d!34974 m!165071))

(declare-fun m!165073 () Bool)

(assert (=> d!34974 m!165073))

(assert (=> b!111125 m!164407))

(declare-fun m!165075 () Bool)

(assert (=> b!111125 m!165075))

(declare-fun m!165077 () Bool)

(assert (=> b!111125 m!165077))

(declare-fun m!165079 () Bool)

(assert (=> b!111126 m!165079))

(declare-fun m!165081 () Bool)

(assert (=> b!111122 m!165081))

(declare-fun m!165083 () Bool)

(assert (=> b!111124 m!165083))

(declare-fun m!165085 () Bool)

(assert (=> b!111124 m!165085))

(assert (=> b!111124 m!164407))

(assert (=> b!110804 d!34974))

(declare-fun d!34976 () Bool)

(declare-datatypes ((tuple2!9250 0))(
  ( (tuple2!9251 (_1!4882 (_ BitVec 64)) (_2!4882 BitStream!4098)) )
))
(declare-fun lt!168604 () tuple2!9250)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4098 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9250)

(assert (=> d!34976 (= lt!168604 (readNLeastSignificantBitsLoop!0 (_1!4871 lt!167695) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!167689 (ite (_2!4869 lt!167703) lt!167704 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!34976 (= (readNLeastSignificantBitsLoopPure!0 (_1!4871 lt!167695) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!167689 (ite (_2!4869 lt!167703) lt!167704 #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!9231 (_2!4882 lt!168604) (_1!4882 lt!168604)))))

(declare-fun bs!8573 () Bool)

(assert (= bs!8573 d!34976))

(declare-fun m!165087 () Bool)

(assert (=> bs!8573 m!165087))

(assert (=> b!110804 d!34976))

(declare-fun d!34978 () Bool)

(assert (=> d!34978 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!167705)))) ((_ sign_extend 32) (currentByte!5266 thiss!1305)) ((_ sign_extend 32) (currentBit!5261 thiss!1305)) lt!167706) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!167705)))) ((_ sign_extend 32) (currentByte!5266 thiss!1305)) ((_ sign_extend 32) (currentBit!5261 thiss!1305))) lt!167706))))

(declare-fun bs!8574 () Bool)

(assert (= bs!8574 d!34978))

(declare-fun m!165089 () Bool)

(assert (=> bs!8574 m!165089))

(assert (=> b!110804 d!34978))

(declare-fun d!34980 () Bool)

(declare-fun lt!168605 () tuple2!9250)

(assert (=> d!34980 (= lt!168605 (readNLeastSignificantBitsLoop!0 (_1!4871 lt!167690) nBits!396 i!615 lt!167689))))

(assert (=> d!34980 (= (readNLeastSignificantBitsLoopPure!0 (_1!4871 lt!167690) nBits!396 i!615 lt!167689) (tuple2!9231 (_2!4882 lt!168605) (_1!4882 lt!168605)))))

(declare-fun bs!8575 () Bool)

(assert (= bs!8575 d!34980))

(declare-fun m!165091 () Bool)

(assert (=> bs!8575 m!165091))

(assert (=> b!110804 d!34980))

(declare-fun d!34982 () Bool)

(declare-fun e!72900 () Bool)

(assert (=> d!34982 e!72900))

(declare-fun res!91739 () Bool)

(assert (=> d!34982 (=> (not res!91739) (not e!72900))))

(declare-fun lt!168609 () (_ BitVec 64))

(declare-fun lt!168607 () (_ BitVec 64))

(declare-fun lt!168608 () (_ BitVec 64))

(assert (=> d!34982 (= res!91739 (= lt!168607 (bvsub lt!168608 lt!168609)))))

(assert (=> d!34982 (or (= (bvand lt!168608 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168609 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168608 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168608 lt!168609) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34982 (= lt!168609 (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!167700)))) ((_ sign_extend 32) (currentByte!5266 (_1!4869 lt!167700))) ((_ sign_extend 32) (currentBit!5261 (_1!4869 lt!167700)))))))

(declare-fun lt!168610 () (_ BitVec 64))

(declare-fun lt!168611 () (_ BitVec 64))

(assert (=> d!34982 (= lt!168608 (bvmul lt!168610 lt!168611))))

(assert (=> d!34982 (or (= lt!168610 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!168611 (bvsdiv (bvmul lt!168610 lt!168611) lt!168610)))))

(assert (=> d!34982 (= lt!168611 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34982 (= lt!168610 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!167700)))))))

(assert (=> d!34982 (= lt!168607 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5266 (_1!4869 lt!167700))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5261 (_1!4869 lt!167700)))))))

(assert (=> d!34982 (invariant!0 (currentBit!5261 (_1!4869 lt!167700)) (currentByte!5266 (_1!4869 lt!167700)) (size!2312 (buf!2709 (_1!4869 lt!167700))))))

(assert (=> d!34982 (= (bitIndex!0 (size!2312 (buf!2709 (_1!4869 lt!167700))) (currentByte!5266 (_1!4869 lt!167700)) (currentBit!5261 (_1!4869 lt!167700))) lt!168607)))

(declare-fun b!111127 () Bool)

(declare-fun res!91738 () Bool)

(assert (=> b!111127 (=> (not res!91738) (not e!72900))))

(assert (=> b!111127 (= res!91738 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!168607))))

(declare-fun b!111128 () Bool)

(declare-fun lt!168606 () (_ BitVec 64))

(assert (=> b!111128 (= e!72900 (bvsle lt!168607 (bvmul lt!168606 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111128 (or (= lt!168606 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!168606 #b0000000000000000000000000000000000000000000000000000000000001000) lt!168606)))))

(assert (=> b!111128 (= lt!168606 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!167700)))))))

(assert (= (and d!34982 res!91739) b!111127))

(assert (= (and b!111127 res!91738) b!111128))

(declare-fun m!165093 () Bool)

(assert (=> d!34982 m!165093))

(declare-fun m!165095 () Bool)

(assert (=> d!34982 m!165095))

(assert (=> b!110804 d!34982))

(declare-fun b!111129 () Bool)

(declare-fun res!91742 () Bool)

(declare-fun e!72902 () Bool)

(assert (=> b!111129 (=> (not res!91742) (not e!72902))))

(declare-fun lt!168626 () tuple2!9228)

(assert (=> b!111129 (= res!91742 (isPrefixOf!0 (_2!4871 lt!168626) (_2!4870 lt!167705)))))

(declare-fun b!111130 () Bool)

(declare-fun e!72901 () Unit!6792)

(declare-fun Unit!6819 () Unit!6792)

(assert (=> b!111130 (= e!72901 Unit!6819)))

(declare-fun d!34984 () Bool)

(assert (=> d!34984 e!72902))

(declare-fun res!91740 () Bool)

(assert (=> d!34984 (=> (not res!91740) (not e!72902))))

(assert (=> d!34984 (= res!91740 (isPrefixOf!0 (_1!4871 lt!168626) (_2!4871 lt!168626)))))

(declare-fun lt!168622 () BitStream!4098)

(assert (=> d!34984 (= lt!168626 (tuple2!9229 lt!168622 (_2!4870 lt!167705)))))

(declare-fun lt!168621 () Unit!6792)

(declare-fun lt!168630 () Unit!6792)

(assert (=> d!34984 (= lt!168621 lt!168630)))

(assert (=> d!34984 (isPrefixOf!0 lt!168622 (_2!4870 lt!167705))))

(assert (=> d!34984 (= lt!168630 (lemmaIsPrefixTransitive!0 lt!168622 (_2!4870 lt!167705) (_2!4870 lt!167705)))))

(declare-fun lt!168618 () Unit!6792)

(declare-fun lt!168627 () Unit!6792)

(assert (=> d!34984 (= lt!168618 lt!168627)))

(assert (=> d!34984 (isPrefixOf!0 lt!168622 (_2!4870 lt!167705))))

(assert (=> d!34984 (= lt!168627 (lemmaIsPrefixTransitive!0 lt!168622 (_2!4870 lt!167696) (_2!4870 lt!167705)))))

(declare-fun lt!168628 () Unit!6792)

(assert (=> d!34984 (= lt!168628 e!72901)))

(declare-fun c!6758 () Bool)

(assert (=> d!34984 (= c!6758 (not (= (size!2312 (buf!2709 (_2!4870 lt!167696))) #b00000000000000000000000000000000)))))

(declare-fun lt!168614 () Unit!6792)

(declare-fun lt!168624 () Unit!6792)

(assert (=> d!34984 (= lt!168614 lt!168624)))

(assert (=> d!34984 (isPrefixOf!0 (_2!4870 lt!167705) (_2!4870 lt!167705))))

(assert (=> d!34984 (= lt!168624 (lemmaIsPrefixRefl!0 (_2!4870 lt!167705)))))

(declare-fun lt!168625 () Unit!6792)

(declare-fun lt!168613 () Unit!6792)

(assert (=> d!34984 (= lt!168625 lt!168613)))

(assert (=> d!34984 (= lt!168613 (lemmaIsPrefixRefl!0 (_2!4870 lt!167705)))))

(declare-fun lt!168615 () Unit!6792)

(declare-fun lt!168619 () Unit!6792)

(assert (=> d!34984 (= lt!168615 lt!168619)))

(assert (=> d!34984 (isPrefixOf!0 lt!168622 lt!168622)))

(assert (=> d!34984 (= lt!168619 (lemmaIsPrefixRefl!0 lt!168622))))

(declare-fun lt!168623 () Unit!6792)

(declare-fun lt!168617 () Unit!6792)

(assert (=> d!34984 (= lt!168623 lt!168617)))

(assert (=> d!34984 (isPrefixOf!0 (_2!4870 lt!167696) (_2!4870 lt!167696))))

(assert (=> d!34984 (= lt!168617 (lemmaIsPrefixRefl!0 (_2!4870 lt!167696)))))

(assert (=> d!34984 (= lt!168622 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))))))

(assert (=> d!34984 (isPrefixOf!0 (_2!4870 lt!167696) (_2!4870 lt!167705))))

(assert (=> d!34984 (= (reader!0 (_2!4870 lt!167696) (_2!4870 lt!167705)) lt!168626)))

(declare-fun b!111131 () Bool)

(declare-fun lt!168629 () (_ BitVec 64))

(declare-fun lt!168620 () (_ BitVec 64))

(assert (=> b!111131 (= e!72902 (= (_1!4871 lt!168626) (withMovedBitIndex!0 (_2!4871 lt!168626) (bvsub lt!168620 lt!168629))))))

(assert (=> b!111131 (or (= (bvand lt!168620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168629 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168620 lt!168629) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111131 (= lt!168629 (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167705))) (currentByte!5266 (_2!4870 lt!167705)) (currentBit!5261 (_2!4870 lt!167705))))))

(assert (=> b!111131 (= lt!168620 (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))))))

(declare-fun b!111132 () Bool)

(declare-fun lt!168631 () Unit!6792)

(assert (=> b!111132 (= e!72901 lt!168631)))

(declare-fun lt!168616 () (_ BitVec 64))

(assert (=> b!111132 (= lt!168616 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!168612 () (_ BitVec 64))

(assert (=> b!111132 (= lt!168612 (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))))))

(assert (=> b!111132 (= lt!168631 (arrayBitRangesEqSymmetric!0 (buf!2709 (_2!4870 lt!167696)) (buf!2709 (_2!4870 lt!167705)) lt!168616 lt!168612))))

(assert (=> b!111132 (arrayBitRangesEq!0 (buf!2709 (_2!4870 lt!167705)) (buf!2709 (_2!4870 lt!167696)) lt!168616 lt!168612)))

(declare-fun b!111133 () Bool)

(declare-fun res!91741 () Bool)

(assert (=> b!111133 (=> (not res!91741) (not e!72902))))

(assert (=> b!111133 (= res!91741 (isPrefixOf!0 (_1!4871 lt!168626) (_2!4870 lt!167696)))))

(assert (= (and d!34984 c!6758) b!111132))

(assert (= (and d!34984 (not c!6758)) b!111130))

(assert (= (and d!34984 res!91740) b!111133))

(assert (= (and b!111133 res!91741) b!111129))

(assert (= (and b!111129 res!91742) b!111131))

(declare-fun m!165097 () Bool)

(assert (=> d!34984 m!165097))

(declare-fun m!165099 () Bool)

(assert (=> d!34984 m!165099))

(declare-fun m!165101 () Bool)

(assert (=> d!34984 m!165101))

(declare-fun m!165103 () Bool)

(assert (=> d!34984 m!165103))

(declare-fun m!165105 () Bool)

(assert (=> d!34984 m!165105))

(declare-fun m!165107 () Bool)

(assert (=> d!34984 m!165107))

(assert (=> d!34984 m!165065))

(assert (=> d!34984 m!165067))

(declare-fun m!165109 () Bool)

(assert (=> d!34984 m!165109))

(declare-fun m!165111 () Bool)

(assert (=> d!34984 m!165111))

(declare-fun m!165113 () Bool)

(assert (=> d!34984 m!165113))

(assert (=> b!111132 m!164405))

(declare-fun m!165115 () Bool)

(assert (=> b!111132 m!165115))

(declare-fun m!165117 () Bool)

(assert (=> b!111132 m!165117))

(declare-fun m!165119 () Bool)

(assert (=> b!111133 m!165119))

(declare-fun m!165121 () Bool)

(assert (=> b!111129 m!165121))

(declare-fun m!165123 () Bool)

(assert (=> b!111131 m!165123))

(assert (=> b!111131 m!165085))

(assert (=> b!111131 m!164405))

(assert (=> b!110804 d!34984))

(declare-fun d!34986 () Bool)

(assert (=> d!34986 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!167705)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!167696))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!167696))) lt!167697) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!167705)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!167696))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!167696)))) lt!167697))))

(declare-fun bs!8576 () Bool)

(assert (= bs!8576 d!34986))

(declare-fun m!165125 () Bool)

(assert (=> bs!8576 m!165125))

(assert (=> b!110804 d!34986))

(declare-fun d!34988 () Bool)

(assert (=> d!34988 (validate_offset_bits!1 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!167705)))) ((_ sign_extend 32) (currentByte!5266 thiss!1305)) ((_ sign_extend 32) (currentBit!5261 thiss!1305)) lt!167706)))

(declare-fun lt!168634 () Unit!6792)

(declare-fun choose!9 (BitStream!4098 array!5083 (_ BitVec 64) BitStream!4098) Unit!6792)

(assert (=> d!34988 (= lt!168634 (choose!9 thiss!1305 (buf!2709 (_2!4870 lt!167705)) lt!167706 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))))))

(assert (=> d!34988 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2709 (_2!4870 lt!167705)) lt!167706) lt!168634)))

(declare-fun bs!8577 () Bool)

(assert (= bs!8577 d!34988))

(assert (=> bs!8577 m!164411))

(declare-fun m!165127 () Bool)

(assert (=> bs!8577 m!165127))

(assert (=> b!110804 d!34988))

(declare-fun b!111144 () Bool)

(declare-fun res!91752 () Bool)

(declare-fun e!72907 () Bool)

(assert (=> b!111144 (=> (not res!91752) (not e!72907))))

(declare-fun lt!168644 () tuple2!9226)

(assert (=> b!111144 (= res!91752 (isPrefixOf!0 thiss!1305 (_2!4870 lt!168644)))))

(declare-fun b!111143 () Bool)

(declare-fun res!91753 () Bool)

(assert (=> b!111143 (=> (not res!91753) (not e!72907))))

(declare-fun lt!168643 () (_ BitVec 64))

(declare-fun lt!168645 () (_ BitVec 64))

(assert (=> b!111143 (= res!91753 (= (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168644))) (currentByte!5266 (_2!4870 lt!168644)) (currentBit!5261 (_2!4870 lt!168644))) (bvadd lt!168643 lt!168645)))))

(assert (=> b!111143 (or (not (= (bvand lt!168643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168645 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!168643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!168643 lt!168645) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111143 (= lt!168645 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!111143 (= lt!168643 (bitIndex!0 (size!2312 (buf!2709 thiss!1305)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)))))

(declare-fun b!111146 () Bool)

(declare-fun e!72908 () Bool)

(declare-fun lt!168646 () tuple2!9224)

(assert (=> b!111146 (= e!72908 (= (bitIndex!0 (size!2312 (buf!2709 (_1!4869 lt!168646))) (currentByte!5266 (_1!4869 lt!168646)) (currentBit!5261 (_1!4869 lt!168646))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168644))) (currentByte!5266 (_2!4870 lt!168644)) (currentBit!5261 (_2!4870 lt!168644)))))))

(declare-fun d!34990 () Bool)

(assert (=> d!34990 e!72907))

(declare-fun res!91754 () Bool)

(assert (=> d!34990 (=> (not res!91754) (not e!72907))))

(assert (=> d!34990 (= res!91754 (= (size!2312 (buf!2709 thiss!1305)) (size!2312 (buf!2709 (_2!4870 lt!168644)))))))

(declare-fun choose!16 (BitStream!4098 Bool) tuple2!9226)

(assert (=> d!34990 (= lt!168644 (choose!16 thiss!1305 lt!167691))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!34990 (validate_offset_bit!0 ((_ sign_extend 32) (size!2312 (buf!2709 thiss!1305))) ((_ sign_extend 32) (currentByte!5266 thiss!1305)) ((_ sign_extend 32) (currentBit!5261 thiss!1305)))))

(assert (=> d!34990 (= (appendBit!0 thiss!1305 lt!167691) lt!168644)))

(declare-fun b!111145 () Bool)

(assert (=> b!111145 (= e!72907 e!72908)))

(declare-fun res!91751 () Bool)

(assert (=> b!111145 (=> (not res!91751) (not e!72908))))

(assert (=> b!111145 (= res!91751 (and (= (_2!4869 lt!168646) lt!167691) (= (_1!4869 lt!168646) (_2!4870 lt!168644))))))

(assert (=> b!111145 (= lt!168646 (readBitPure!0 (readerFrom!0 (_2!4870 lt!168644) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305))))))

(assert (= (and d!34990 res!91754) b!111143))

(assert (= (and b!111143 res!91753) b!111144))

(assert (= (and b!111144 res!91752) b!111145))

(assert (= (and b!111145 res!91751) b!111146))

(declare-fun m!165129 () Bool)

(assert (=> b!111143 m!165129))

(assert (=> b!111143 m!164407))

(declare-fun m!165131 () Bool)

(assert (=> d!34990 m!165131))

(declare-fun m!165133 () Bool)

(assert (=> d!34990 m!165133))

(declare-fun m!165135 () Bool)

(assert (=> b!111146 m!165135))

(assert (=> b!111146 m!165129))

(declare-fun m!165137 () Bool)

(assert (=> b!111145 m!165137))

(assert (=> b!111145 m!165137))

(declare-fun m!165139 () Bool)

(assert (=> b!111145 m!165139))

(declare-fun m!165141 () Bool)

(assert (=> b!111144 m!165141))

(assert (=> b!110804 d!34990))

(declare-fun d!34992 () Bool)

(assert (=> d!34992 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!110804 d!34992))

(declare-fun d!34994 () Bool)

(assert (=> d!34994 (validate_offset_bits!1 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!167705)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!167696))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!167696))) lt!167697)))

(declare-fun lt!168647 () Unit!6792)

(assert (=> d!34994 (= lt!168647 (choose!9 (_2!4870 lt!167696) (buf!2709 (_2!4870 lt!167705)) lt!167697 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696)))))))

(assert (=> d!34994 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4870 lt!167696) (buf!2709 (_2!4870 lt!167705)) lt!167697) lt!168647)))

(declare-fun bs!8578 () Bool)

(assert (= bs!8578 d!34994))

(assert (=> bs!8578 m!164439))

(declare-fun m!165143 () Bool)

(assert (=> bs!8578 m!165143))

(assert (=> b!110804 d!34994))

(declare-fun d!34996 () Bool)

(declare-fun res!91756 () Bool)

(declare-fun e!72910 () Bool)

(assert (=> d!34996 (=> (not res!91756) (not e!72910))))

(assert (=> d!34996 (= res!91756 (= (size!2312 (buf!2709 thiss!1305)) (size!2312 (buf!2709 (_2!4870 lt!167705)))))))

(assert (=> d!34996 (= (isPrefixOf!0 thiss!1305 (_2!4870 lt!167705)) e!72910)))

(declare-fun b!111147 () Bool)

(declare-fun res!91755 () Bool)

(assert (=> b!111147 (=> (not res!91755) (not e!72910))))

(assert (=> b!111147 (= res!91755 (bvsle (bitIndex!0 (size!2312 (buf!2709 thiss!1305)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167705))) (currentByte!5266 (_2!4870 lt!167705)) (currentBit!5261 (_2!4870 lt!167705)))))))

(declare-fun b!111148 () Bool)

(declare-fun e!72909 () Bool)

(assert (=> b!111148 (= e!72910 e!72909)))

(declare-fun res!91757 () Bool)

(assert (=> b!111148 (=> res!91757 e!72909)))

(assert (=> b!111148 (= res!91757 (= (size!2312 (buf!2709 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!111149 () Bool)

(assert (=> b!111149 (= e!72909 (arrayBitRangesEq!0 (buf!2709 thiss!1305) (buf!2709 (_2!4870 lt!167705)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2312 (buf!2709 thiss!1305)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))))))

(assert (= (and d!34996 res!91756) b!111147))

(assert (= (and b!111147 res!91755) b!111148))

(assert (= (and b!111148 (not res!91757)) b!111149))

(assert (=> b!111147 m!164407))

(assert (=> b!111147 m!165085))

(assert (=> b!111149 m!164407))

(assert (=> b!111149 m!164407))

(declare-fun m!165145 () Bool)

(assert (=> b!111149 m!165145))

(assert (=> b!110804 d!34996))

(declare-fun d!34998 () Bool)

(declare-fun e!72913 () Bool)

(assert (=> d!34998 e!72913))

(declare-fun res!91760 () Bool)

(assert (=> d!34998 (=> (not res!91760) (not e!72913))))

(declare-fun lt!168657 () tuple2!9224)

(declare-fun lt!168656 () tuple2!9224)

(assert (=> d!34998 (= res!91760 (= (bitIndex!0 (size!2312 (buf!2709 (_1!4869 lt!168657))) (currentByte!5266 (_1!4869 lt!168657)) (currentBit!5261 (_1!4869 lt!168657))) (bitIndex!0 (size!2312 (buf!2709 (_1!4869 lt!168656))) (currentByte!5266 (_1!4869 lt!168656)) (currentBit!5261 (_1!4869 lt!168656)))))))

(declare-fun lt!168658 () Unit!6792)

(declare-fun lt!168659 () BitStream!4098)

(declare-fun choose!50 (BitStream!4098 BitStream!4098 BitStream!4098 tuple2!9224 tuple2!9224 BitStream!4098 Bool tuple2!9224 tuple2!9224 BitStream!4098 Bool) Unit!6792)

(assert (=> d!34998 (= lt!168658 (choose!50 lt!167708 (_2!4870 lt!167705) lt!168659 lt!168657 (tuple2!9225 (_1!4869 lt!168657) (_2!4869 lt!168657)) (_1!4869 lt!168657) (_2!4869 lt!168657) lt!168656 (tuple2!9225 (_1!4869 lt!168656) (_2!4869 lt!168656)) (_1!4869 lt!168656) (_2!4869 lt!168656)))))

(assert (=> d!34998 (= lt!168656 (readBitPure!0 lt!168659))))

(assert (=> d!34998 (= lt!168657 (readBitPure!0 lt!167708))))

(assert (=> d!34998 (= lt!168659 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 lt!167708) (currentBit!5261 lt!167708)))))

(assert (=> d!34998 (invariant!0 (currentBit!5261 lt!167708) (currentByte!5266 lt!167708) (size!2312 (buf!2709 (_2!4870 lt!167705))))))

(assert (=> d!34998 (= (readBitPrefixLemma!0 lt!167708 (_2!4870 lt!167705)) lt!168658)))

(declare-fun b!111152 () Bool)

(assert (=> b!111152 (= e!72913 (= (_2!4869 lt!168657) (_2!4869 lt!168656)))))

(assert (= (and d!34998 res!91760) b!111152))

(declare-fun m!165147 () Bool)

(assert (=> d!34998 m!165147))

(declare-fun m!165149 () Bool)

(assert (=> d!34998 m!165149))

(declare-fun m!165151 () Bool)

(assert (=> d!34998 m!165151))

(assert (=> d!34998 m!164413))

(declare-fun m!165153 () Bool)

(assert (=> d!34998 m!165153))

(declare-fun m!165155 () Bool)

(assert (=> d!34998 m!165155))

(assert (=> b!110804 d!34998))

(declare-fun d!35000 () Bool)

(declare-fun e!72914 () Bool)

(assert (=> d!35000 e!72914))

(declare-fun res!91762 () Bool)

(assert (=> d!35000 (=> (not res!91762) (not e!72914))))

(declare-fun lt!168663 () (_ BitVec 64))

(declare-fun lt!168662 () (_ BitVec 64))

(declare-fun lt!168661 () (_ BitVec 64))

(assert (=> d!35000 (= res!91762 (= lt!168661 (bvsub lt!168662 lt!168663)))))

(assert (=> d!35000 (or (= (bvand lt!168662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168663 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168662 lt!168663) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35000 (= lt!168663 (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!167692)))) ((_ sign_extend 32) (currentByte!5266 (_1!4869 lt!167692))) ((_ sign_extend 32) (currentBit!5261 (_1!4869 lt!167692)))))))

(declare-fun lt!168664 () (_ BitVec 64))

(declare-fun lt!168665 () (_ BitVec 64))

(assert (=> d!35000 (= lt!168662 (bvmul lt!168664 lt!168665))))

(assert (=> d!35000 (or (= lt!168664 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!168665 (bvsdiv (bvmul lt!168664 lt!168665) lt!168664)))))

(assert (=> d!35000 (= lt!168665 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35000 (= lt!168664 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!167692)))))))

(assert (=> d!35000 (= lt!168661 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5266 (_1!4869 lt!167692))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5261 (_1!4869 lt!167692)))))))

(assert (=> d!35000 (invariant!0 (currentBit!5261 (_1!4869 lt!167692)) (currentByte!5266 (_1!4869 lt!167692)) (size!2312 (buf!2709 (_1!4869 lt!167692))))))

(assert (=> d!35000 (= (bitIndex!0 (size!2312 (buf!2709 (_1!4869 lt!167692))) (currentByte!5266 (_1!4869 lt!167692)) (currentBit!5261 (_1!4869 lt!167692))) lt!168661)))

(declare-fun b!111153 () Bool)

(declare-fun res!91761 () Bool)

(assert (=> b!111153 (=> (not res!91761) (not e!72914))))

(assert (=> b!111153 (= res!91761 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!168661))))

(declare-fun b!111154 () Bool)

(declare-fun lt!168660 () (_ BitVec 64))

(assert (=> b!111154 (= e!72914 (bvsle lt!168661 (bvmul lt!168660 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111154 (or (= lt!168660 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!168660 #b0000000000000000000000000000000000000000000000000000000000001000) lt!168660)))))

(assert (=> b!111154 (= lt!168660 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!167692)))))))

(assert (= (and d!35000 res!91762) b!111153))

(assert (= (and b!111153 res!91761) b!111154))

(declare-fun m!165157 () Bool)

(assert (=> d!35000 m!165157))

(declare-fun m!165159 () Bool)

(assert (=> d!35000 m!165159))

(assert (=> b!110804 d!35000))

(check-sat (not b!111144) (not b!110968) (not b!111106) (not d!35000) (not d!34920) (not d!34990) (not b!110961) (not b!111147) (not b!111143) (not b!111110) (not b!111125) (not b!111146) (not b!111124) (not d!34994) (not b!111133) (not d!34922) (not b!111103) (not b!111129) (not d!34984) (not b!111132) (not b!111111) (not d!34918) (not d!34928) (not d!34978) (not d!34982) (not d!34916) (not b!111099) (not b!111126) (not b!111145) (not b!111131) (not d!34970) (not d!34974) (not d!34976) (not b!111102) (not d!34938) (not d!34986) (not d!34926) (not b!111101) (not d!34972) (not b!111109) (not d!34988) (not d!34998) (not b!110970) (not d!34980) (not d!34968) (not b!111104) (not b!111107) (not bm!1392) (not d!34924) (not b!111122) (not b!111149))
(check-sat)
(get-model)

(assert (=> d!34988 d!34978))

(declare-fun d!35002 () Bool)

(assert (=> d!35002 (validate_offset_bits!1 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!167705)))) ((_ sign_extend 32) (currentByte!5266 thiss!1305)) ((_ sign_extend 32) (currentBit!5261 thiss!1305)) lt!167706)))

(assert (=> d!35002 true))

(declare-fun _$6!236 () Unit!6792)

(assert (=> d!35002 (= (choose!9 thiss!1305 (buf!2709 (_2!4870 lt!167705)) lt!167706 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))) _$6!236)))

(declare-fun bs!8579 () Bool)

(assert (= bs!8579 d!35002))

(assert (=> bs!8579 m!164411))

(assert (=> d!34988 d!35002))

(declare-fun d!35004 () Bool)

(declare-fun e!72915 () Bool)

(assert (=> d!35004 e!72915))

(declare-fun res!91764 () Bool)

(assert (=> d!35004 (=> (not res!91764) (not e!72915))))

(declare-fun lt!168667 () (_ BitVec 64))

(declare-fun lt!168668 () (_ BitVec 64))

(declare-fun lt!168669 () (_ BitVec 64))

(assert (=> d!35004 (= res!91764 (= lt!168667 (bvsub lt!168668 lt!168669)))))

(assert (=> d!35004 (or (= (bvand lt!168668 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168669 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168668 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168668 lt!168669) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35004 (= lt!168669 (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168644)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!168644))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!168644)))))))

(declare-fun lt!168670 () (_ BitVec 64))

(declare-fun lt!168671 () (_ BitVec 64))

(assert (=> d!35004 (= lt!168668 (bvmul lt!168670 lt!168671))))

(assert (=> d!35004 (or (= lt!168670 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!168671 (bvsdiv (bvmul lt!168670 lt!168671) lt!168670)))))

(assert (=> d!35004 (= lt!168671 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35004 (= lt!168670 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168644)))))))

(assert (=> d!35004 (= lt!168667 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!168644))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!168644)))))))

(assert (=> d!35004 (invariant!0 (currentBit!5261 (_2!4870 lt!168644)) (currentByte!5266 (_2!4870 lt!168644)) (size!2312 (buf!2709 (_2!4870 lt!168644))))))

(assert (=> d!35004 (= (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168644))) (currentByte!5266 (_2!4870 lt!168644)) (currentBit!5261 (_2!4870 lt!168644))) lt!168667)))

(declare-fun b!111155 () Bool)

(declare-fun res!91763 () Bool)

(assert (=> b!111155 (=> (not res!91763) (not e!72915))))

(assert (=> b!111155 (= res!91763 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!168667))))

(declare-fun b!111156 () Bool)

(declare-fun lt!168666 () (_ BitVec 64))

(assert (=> b!111156 (= e!72915 (bvsle lt!168667 (bvmul lt!168666 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111156 (or (= lt!168666 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!168666 #b0000000000000000000000000000000000000000000000000000000000001000) lt!168666)))))

(assert (=> b!111156 (= lt!168666 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168644)))))))

(assert (= (and d!35004 res!91764) b!111155))

(assert (= (and b!111155 res!91763) b!111156))

(declare-fun m!165161 () Bool)

(assert (=> d!35004 m!165161))

(declare-fun m!165163 () Bool)

(assert (=> d!35004 m!165163))

(assert (=> b!111143 d!35004))

(assert (=> b!111143 d!34920))

(declare-fun d!35006 () Bool)

(assert (=> d!35006 (= (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!167696)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!167696))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!167696)))) (bvsub (bvmul ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!167696)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!167696))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!167696))))))))

(assert (=> d!34918 d!35006))

(declare-fun d!35008 () Bool)

(assert (=> d!35008 (= (invariant!0 (currentBit!5261 (_2!4870 lt!167696)) (currentByte!5266 (_2!4870 lt!167696)) (size!2312 (buf!2709 (_2!4870 lt!167696)))) (and (bvsge (currentBit!5261 (_2!4870 lt!167696)) #b00000000000000000000000000000000) (bvslt (currentBit!5261 (_2!4870 lt!167696)) #b00000000000000000000000000001000) (bvsge (currentByte!5266 (_2!4870 lt!167696)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5266 (_2!4870 lt!167696)) (size!2312 (buf!2709 (_2!4870 lt!167696)))) (and (= (currentBit!5261 (_2!4870 lt!167696)) #b00000000000000000000000000000000) (= (currentByte!5266 (_2!4870 lt!167696)) (size!2312 (buf!2709 (_2!4870 lt!167696))))))))))

(assert (=> d!34918 d!35008))

(assert (=> d!34974 d!34996))

(declare-fun d!35010 () Bool)

(assert (=> d!35010 (isPrefixOf!0 lt!168592 lt!168592)))

(declare-fun lt!168674 () Unit!6792)

(declare-fun choose!11 (BitStream!4098) Unit!6792)

(assert (=> d!35010 (= lt!168674 (choose!11 lt!168592))))

(assert (=> d!35010 (= (lemmaIsPrefixRefl!0 lt!168592) lt!168674)))

(declare-fun bs!8581 () Bool)

(assert (= bs!8581 d!35010))

(assert (=> bs!8581 m!165061))

(declare-fun m!165165 () Bool)

(assert (=> bs!8581 m!165165))

(assert (=> d!34974 d!35010))

(declare-fun d!35012 () Bool)

(assert (=> d!35012 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-fun lt!168675 () Unit!6792)

(assert (=> d!35012 (= lt!168675 (choose!11 thiss!1305))))

(assert (=> d!35012 (= (lemmaIsPrefixRefl!0 thiss!1305) lt!168675)))

(declare-fun bs!8582 () Bool)

(assert (= bs!8582 d!35012))

(assert (=> bs!8582 m!165057))

(declare-fun m!165167 () Bool)

(assert (=> bs!8582 m!165167))

(assert (=> d!34974 d!35012))

(declare-fun d!35014 () Bool)

(assert (=> d!35014 (isPrefixOf!0 lt!168592 (_2!4870 lt!167705))))

(declare-fun lt!168676 () Unit!6792)

(assert (=> d!35014 (= lt!168676 (choose!30 lt!168592 (_2!4870 lt!167705) (_2!4870 lt!167705)))))

(assert (=> d!35014 (isPrefixOf!0 lt!168592 (_2!4870 lt!167705))))

(assert (=> d!35014 (= (lemmaIsPrefixTransitive!0 lt!168592 (_2!4870 lt!167705) (_2!4870 lt!167705)) lt!168676)))

(declare-fun bs!8583 () Bool)

(assert (= bs!8583 d!35014))

(assert (=> bs!8583 m!165071))

(declare-fun m!165169 () Bool)

(assert (=> bs!8583 m!165169))

(assert (=> bs!8583 m!165071))

(assert (=> d!34974 d!35014))

(declare-fun d!35016 () Bool)

(declare-fun res!91766 () Bool)

(declare-fun e!72917 () Bool)

(assert (=> d!35016 (=> (not res!91766) (not e!72917))))

(assert (=> d!35016 (= res!91766 (= (size!2312 (buf!2709 (_1!4871 lt!168596))) (size!2312 (buf!2709 (_2!4871 lt!168596)))))))

(assert (=> d!35016 (= (isPrefixOf!0 (_1!4871 lt!168596) (_2!4871 lt!168596)) e!72917)))

(declare-fun b!111157 () Bool)

(declare-fun res!91765 () Bool)

(assert (=> b!111157 (=> (not res!91765) (not e!72917))))

(assert (=> b!111157 (= res!91765 (bvsle (bitIndex!0 (size!2312 (buf!2709 (_1!4871 lt!168596))) (currentByte!5266 (_1!4871 lt!168596)) (currentBit!5261 (_1!4871 lt!168596))) (bitIndex!0 (size!2312 (buf!2709 (_2!4871 lt!168596))) (currentByte!5266 (_2!4871 lt!168596)) (currentBit!5261 (_2!4871 lt!168596)))))))

(declare-fun b!111158 () Bool)

(declare-fun e!72916 () Bool)

(assert (=> b!111158 (= e!72917 e!72916)))

(declare-fun res!91767 () Bool)

(assert (=> b!111158 (=> res!91767 e!72916)))

(assert (=> b!111158 (= res!91767 (= (size!2312 (buf!2709 (_1!4871 lt!168596))) #b00000000000000000000000000000000))))

(declare-fun b!111159 () Bool)

(assert (=> b!111159 (= e!72916 (arrayBitRangesEq!0 (buf!2709 (_1!4871 lt!168596)) (buf!2709 (_2!4871 lt!168596)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2312 (buf!2709 (_1!4871 lt!168596))) (currentByte!5266 (_1!4871 lt!168596)) (currentBit!5261 (_1!4871 lt!168596)))))))

(assert (= (and d!35016 res!91766) b!111157))

(assert (= (and b!111157 res!91765) b!111158))

(assert (= (and b!111158 (not res!91767)) b!111159))

(declare-fun m!165171 () Bool)

(assert (=> b!111157 m!165171))

(declare-fun m!165173 () Bool)

(assert (=> b!111157 m!165173))

(assert (=> b!111159 m!165171))

(assert (=> b!111159 m!165171))

(declare-fun m!165175 () Bool)

(assert (=> b!111159 m!165175))

(assert (=> d!34974 d!35016))

(declare-fun d!35018 () Bool)

(assert (=> d!35018 (isPrefixOf!0 lt!168592 (_2!4870 lt!167705))))

(declare-fun lt!168677 () Unit!6792)

(assert (=> d!35018 (= lt!168677 (choose!30 lt!168592 thiss!1305 (_2!4870 lt!167705)))))

(assert (=> d!35018 (isPrefixOf!0 lt!168592 thiss!1305)))

(assert (=> d!35018 (= (lemmaIsPrefixTransitive!0 lt!168592 thiss!1305 (_2!4870 lt!167705)) lt!168677)))

(declare-fun bs!8584 () Bool)

(assert (= bs!8584 d!35018))

(assert (=> bs!8584 m!165071))

(declare-fun m!165177 () Bool)

(assert (=> bs!8584 m!165177))

(declare-fun m!165179 () Bool)

(assert (=> bs!8584 m!165179))

(assert (=> d!34974 d!35018))

(declare-fun d!35020 () Bool)

(declare-fun res!91769 () Bool)

(declare-fun e!72919 () Bool)

(assert (=> d!35020 (=> (not res!91769) (not e!72919))))

(assert (=> d!35020 (= res!91769 (= (size!2312 (buf!2709 lt!168592)) (size!2312 (buf!2709 (_2!4870 lt!167705)))))))

(assert (=> d!35020 (= (isPrefixOf!0 lt!168592 (_2!4870 lt!167705)) e!72919)))

(declare-fun b!111160 () Bool)

(declare-fun res!91768 () Bool)

(assert (=> b!111160 (=> (not res!91768) (not e!72919))))

(assert (=> b!111160 (= res!91768 (bvsle (bitIndex!0 (size!2312 (buf!2709 lt!168592)) (currentByte!5266 lt!168592) (currentBit!5261 lt!168592)) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167705))) (currentByte!5266 (_2!4870 lt!167705)) (currentBit!5261 (_2!4870 lt!167705)))))))

(declare-fun b!111161 () Bool)

(declare-fun e!72918 () Bool)

(assert (=> b!111161 (= e!72919 e!72918)))

(declare-fun res!91770 () Bool)

(assert (=> b!111161 (=> res!91770 e!72918)))

(assert (=> b!111161 (= res!91770 (= (size!2312 (buf!2709 lt!168592)) #b00000000000000000000000000000000))))

(declare-fun b!111162 () Bool)

(assert (=> b!111162 (= e!72918 (arrayBitRangesEq!0 (buf!2709 lt!168592) (buf!2709 (_2!4870 lt!167705)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2312 (buf!2709 lt!168592)) (currentByte!5266 lt!168592) (currentBit!5261 lt!168592))))))

(assert (= (and d!35020 res!91769) b!111160))

(assert (= (and b!111160 res!91768) b!111161))

(assert (= (and b!111161 (not res!91770)) b!111162))

(declare-fun m!165181 () Bool)

(assert (=> b!111160 m!165181))

(assert (=> b!111160 m!165085))

(assert (=> b!111162 m!165181))

(assert (=> b!111162 m!165181))

(declare-fun m!165183 () Bool)

(assert (=> b!111162 m!165183))

(assert (=> d!34974 d!35020))

(declare-fun d!35022 () Bool)

(declare-fun res!91772 () Bool)

(declare-fun e!72921 () Bool)

(assert (=> d!35022 (=> (not res!91772) (not e!72921))))

(assert (=> d!35022 (= res!91772 (= (size!2312 (buf!2709 (_2!4870 lt!167705))) (size!2312 (buf!2709 (_2!4870 lt!167705)))))))

(assert (=> d!35022 (= (isPrefixOf!0 (_2!4870 lt!167705) (_2!4870 lt!167705)) e!72921)))

(declare-fun b!111163 () Bool)

(declare-fun res!91771 () Bool)

(assert (=> b!111163 (=> (not res!91771) (not e!72921))))

(assert (=> b!111163 (= res!91771 (bvsle (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167705))) (currentByte!5266 (_2!4870 lt!167705)) (currentBit!5261 (_2!4870 lt!167705))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167705))) (currentByte!5266 (_2!4870 lt!167705)) (currentBit!5261 (_2!4870 lt!167705)))))))

(declare-fun b!111164 () Bool)

(declare-fun e!72920 () Bool)

(assert (=> b!111164 (= e!72921 e!72920)))

(declare-fun res!91773 () Bool)

(assert (=> b!111164 (=> res!91773 e!72920)))

(assert (=> b!111164 (= res!91773 (= (size!2312 (buf!2709 (_2!4870 lt!167705))) #b00000000000000000000000000000000))))

(declare-fun b!111165 () Bool)

(assert (=> b!111165 (= e!72920 (arrayBitRangesEq!0 (buf!2709 (_2!4870 lt!167705)) (buf!2709 (_2!4870 lt!167705)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167705))) (currentByte!5266 (_2!4870 lt!167705)) (currentBit!5261 (_2!4870 lt!167705)))))))

(assert (= (and d!35022 res!91772) b!111163))

(assert (= (and b!111163 res!91771) b!111164))

(assert (= (and b!111164 (not res!91773)) b!111165))

(assert (=> b!111163 m!165085))

(assert (=> b!111163 m!165085))

(assert (=> b!111165 m!165085))

(assert (=> b!111165 m!165085))

(declare-fun m!165185 () Bool)

(assert (=> b!111165 m!165185))

(assert (=> d!34974 d!35022))

(declare-fun d!35024 () Bool)

(declare-fun res!91775 () Bool)

(declare-fun e!72923 () Bool)

(assert (=> d!35024 (=> (not res!91775) (not e!72923))))

(assert (=> d!35024 (= res!91775 (= (size!2312 (buf!2709 thiss!1305)) (size!2312 (buf!2709 thiss!1305))))))

(assert (=> d!35024 (= (isPrefixOf!0 thiss!1305 thiss!1305) e!72923)))

(declare-fun b!111166 () Bool)

(declare-fun res!91774 () Bool)

(assert (=> b!111166 (=> (not res!91774) (not e!72923))))

(assert (=> b!111166 (= res!91774 (bvsle (bitIndex!0 (size!2312 (buf!2709 thiss!1305)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)) (bitIndex!0 (size!2312 (buf!2709 thiss!1305)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))))))

(declare-fun b!111167 () Bool)

(declare-fun e!72922 () Bool)

(assert (=> b!111167 (= e!72923 e!72922)))

(declare-fun res!91776 () Bool)

(assert (=> b!111167 (=> res!91776 e!72922)))

(assert (=> b!111167 (= res!91776 (= (size!2312 (buf!2709 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!111168 () Bool)

(assert (=> b!111168 (= e!72922 (arrayBitRangesEq!0 (buf!2709 thiss!1305) (buf!2709 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2312 (buf!2709 thiss!1305)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))))))

(assert (= (and d!35024 res!91775) b!111166))

(assert (= (and b!111166 res!91774) b!111167))

(assert (= (and b!111167 (not res!91776)) b!111168))

(assert (=> b!111166 m!164407))

(assert (=> b!111166 m!164407))

(assert (=> b!111168 m!164407))

(assert (=> b!111168 m!164407))

(declare-fun m!165187 () Bool)

(assert (=> b!111168 m!165187))

(assert (=> d!34974 d!35024))

(declare-fun d!35026 () Bool)

(assert (=> d!35026 (isPrefixOf!0 (_2!4870 lt!167705) (_2!4870 lt!167705))))

(declare-fun lt!168678 () Unit!6792)

(assert (=> d!35026 (= lt!168678 (choose!11 (_2!4870 lt!167705)))))

(assert (=> d!35026 (= (lemmaIsPrefixRefl!0 (_2!4870 lt!167705)) lt!168678)))

(declare-fun bs!8585 () Bool)

(assert (= bs!8585 d!35026))

(assert (=> bs!8585 m!165065))

(declare-fun m!165189 () Bool)

(assert (=> bs!8585 m!165189))

(assert (=> d!34974 d!35026))

(declare-fun d!35028 () Bool)

(declare-fun res!91778 () Bool)

(declare-fun e!72925 () Bool)

(assert (=> d!35028 (=> (not res!91778) (not e!72925))))

(assert (=> d!35028 (= res!91778 (= (size!2312 (buf!2709 lt!168592)) (size!2312 (buf!2709 lt!168592))))))

(assert (=> d!35028 (= (isPrefixOf!0 lt!168592 lt!168592) e!72925)))

(declare-fun b!111169 () Bool)

(declare-fun res!91777 () Bool)

(assert (=> b!111169 (=> (not res!91777) (not e!72925))))

(assert (=> b!111169 (= res!91777 (bvsle (bitIndex!0 (size!2312 (buf!2709 lt!168592)) (currentByte!5266 lt!168592) (currentBit!5261 lt!168592)) (bitIndex!0 (size!2312 (buf!2709 lt!168592)) (currentByte!5266 lt!168592) (currentBit!5261 lt!168592))))))

(declare-fun b!111170 () Bool)

(declare-fun e!72924 () Bool)

(assert (=> b!111170 (= e!72925 e!72924)))

(declare-fun res!91779 () Bool)

(assert (=> b!111170 (=> res!91779 e!72924)))

(assert (=> b!111170 (= res!91779 (= (size!2312 (buf!2709 lt!168592)) #b00000000000000000000000000000000))))

(declare-fun b!111171 () Bool)

(assert (=> b!111171 (= e!72924 (arrayBitRangesEq!0 (buf!2709 lt!168592) (buf!2709 lt!168592) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2312 (buf!2709 lt!168592)) (currentByte!5266 lt!168592) (currentBit!5261 lt!168592))))))

(assert (= (and d!35028 res!91778) b!111169))

(assert (= (and b!111169 res!91777) b!111170))

(assert (= (and b!111170 (not res!91779)) b!111171))

(assert (=> b!111169 m!165181))

(assert (=> b!111169 m!165181))

(assert (=> b!111171 m!165181))

(assert (=> b!111171 m!165181))

(declare-fun m!165191 () Bool)

(assert (=> b!111171 m!165191))

(assert (=> d!34974 d!35028))

(declare-fun d!35030 () Bool)

(assert (=> d!35030 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!167696)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!167696))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!167696))) lt!168527) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!167696)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!167696))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!167696)))) lt!168527))))

(declare-fun bs!8586 () Bool)

(assert (= bs!8586 d!35030))

(assert (=> bs!8586 m!164735))

(assert (=> b!111110 d!35030))

(declare-fun d!35032 () Bool)

(declare-fun lt!168679 () tuple2!9248)

(assert (=> d!35032 (= lt!168679 (readBit!0 (readerFrom!0 (_2!4870 lt!168644) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305))))))

(assert (=> d!35032 (= (readBitPure!0 (readerFrom!0 (_2!4870 lt!168644) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305))) (tuple2!9225 (_2!4881 lt!168679) (_1!4881 lt!168679)))))

(declare-fun bs!8587 () Bool)

(assert (= bs!8587 d!35032))

(assert (=> bs!8587 m!165137))

(declare-fun m!165193 () Bool)

(assert (=> bs!8587 m!165193))

(assert (=> b!111145 d!35032))

(declare-fun d!35034 () Bool)

(declare-fun e!72926 () Bool)

(assert (=> d!35034 e!72926))

(declare-fun res!91780 () Bool)

(assert (=> d!35034 (=> (not res!91780) (not e!72926))))

(assert (=> d!35034 (= res!91780 (invariant!0 (currentBit!5261 (_2!4870 lt!168644)) (currentByte!5266 (_2!4870 lt!168644)) (size!2312 (buf!2709 (_2!4870 lt!168644)))))))

(assert (=> d!35034 (= (readerFrom!0 (_2!4870 lt!168644) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305)) (BitStream!4099 (buf!2709 (_2!4870 lt!168644)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)))))

(declare-fun b!111172 () Bool)

(assert (=> b!111172 (= e!72926 (invariant!0 (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305) (size!2312 (buf!2709 (_2!4870 lt!168644)))))))

(assert (= (and d!35034 res!91780) b!111172))

(assert (=> d!35034 m!165163))

(declare-fun m!165195 () Bool)

(assert (=> b!111172 m!165195))

(assert (=> b!111145 d!35034))

(declare-fun d!35036 () Bool)

(declare-fun e!72933 () Bool)

(assert (=> d!35036 e!72933))

(declare-fun res!91783 () Bool)

(assert (=> d!35036 (=> (not res!91783) (not e!72933))))

(declare-fun increaseBitIndex!0 (BitStream!4098) tuple2!9226)

(assert (=> d!35036 (= res!91783 (= (buf!2709 (_2!4870 (increaseBitIndex!0 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305))))) (buf!2709 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305)))))))

(declare-fun lt!168695 () Bool)

(assert (=> d!35036 (= lt!168695 (not (= (bvand ((_ sign_extend 24) (select (arr!2905 (buf!2709 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305)))) (currentByte!5266 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5261 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!168694 () tuple2!9248)

(assert (=> d!35036 (= lt!168694 (tuple2!9249 (not (= (bvand ((_ sign_extend 24) (select (arr!2905 (buf!2709 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305)))) (currentByte!5266 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5261 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305)))))) #b00000000000000000000000000000000)) (_2!4870 (increaseBitIndex!0 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305))))))))

(assert (=> d!35036 (validate_offset_bit!0 ((_ sign_extend 32) (size!2312 (buf!2709 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305))))) ((_ sign_extend 32) (currentByte!5266 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305)))) ((_ sign_extend 32) (currentBit!5261 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305)))))))

(assert (=> d!35036 (= (readBit!0 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305))) lt!168694)))

(declare-fun lt!168699 () (_ BitVec 64))

(declare-fun lt!168696 () (_ BitVec 64))

(declare-fun b!111175 () Bool)

(assert (=> b!111175 (= e!72933 (= (bitIndex!0 (size!2312 (buf!2709 (_2!4870 (increaseBitIndex!0 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305)))))) (currentByte!5266 (_2!4870 (increaseBitIndex!0 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305))))) (currentBit!5261 (_2!4870 (increaseBitIndex!0 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305)))))) (bvadd lt!168696 lt!168699)))))

(assert (=> b!111175 (or (not (= (bvand lt!168696 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168699 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!168696 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!168696 lt!168699) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111175 (= lt!168699 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!111175 (= lt!168696 (bitIndex!0 (size!2312 (buf!2709 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305)))) (currentByte!5266 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305))) (currentBit!5261 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305)))))))

(declare-fun lt!168700 () Bool)

(assert (=> b!111175 (= lt!168700 (not (= (bvand ((_ sign_extend 24) (select (arr!2905 (buf!2709 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305)))) (currentByte!5266 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5261 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!168697 () Bool)

(assert (=> b!111175 (= lt!168697 (not (= (bvand ((_ sign_extend 24) (select (arr!2905 (buf!2709 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305)))) (currentByte!5266 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5261 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!168698 () Bool)

(assert (=> b!111175 (= lt!168698 (not (= (bvand ((_ sign_extend 24) (select (arr!2905 (buf!2709 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305)))) (currentByte!5266 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5261 (readerFrom!0 (_2!4870 lt!167696) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!35036 res!91783) b!111175))

(assert (=> d!35036 m!164453))

(declare-fun m!165197 () Bool)

(assert (=> d!35036 m!165197))

(declare-fun m!165199 () Bool)

(assert (=> d!35036 m!165199))

(declare-fun m!165201 () Bool)

(assert (=> d!35036 m!165201))

(declare-fun m!165203 () Bool)

(assert (=> d!35036 m!165203))

(declare-fun m!165205 () Bool)

(assert (=> b!111175 m!165205))

(assert (=> b!111175 m!165199))

(declare-fun m!165207 () Bool)

(assert (=> b!111175 m!165207))

(assert (=> b!111175 m!165201))

(assert (=> b!111175 m!164453))

(assert (=> b!111175 m!165197))

(assert (=> d!34924 d!35036))

(assert (=> d!34994 d!34986))

(declare-fun d!35038 () Bool)

(assert (=> d!35038 (validate_offset_bits!1 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!167705)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!167696))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!167696))) lt!167697)))

(assert (=> d!35038 true))

(declare-fun _$6!237 () Unit!6792)

(assert (=> d!35038 (= (choose!9 (_2!4870 lt!167696) (buf!2709 (_2!4870 lt!167705)) lt!167697 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696)))) _$6!237)))

(declare-fun bs!8588 () Bool)

(assert (= bs!8588 d!35038))

(assert (=> bs!8588 m!164439))

(assert (=> d!34994 d!35038))

(declare-fun d!35040 () Bool)

(assert (=> d!35040 (= (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!167699)))) ((_ sign_extend 32) (currentByte!5266 (_1!4869 lt!167699))) ((_ sign_extend 32) (currentBit!5261 (_1!4869 lt!167699)))) (bvsub (bvmul ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!167699)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5266 (_1!4869 lt!167699))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5261 (_1!4869 lt!167699))))))))

(assert (=> d!34916 d!35040))

(declare-fun d!35042 () Bool)

(assert (=> d!35042 (= (invariant!0 (currentBit!5261 (_1!4869 lt!167699)) (currentByte!5266 (_1!4869 lt!167699)) (size!2312 (buf!2709 (_1!4869 lt!167699)))) (and (bvsge (currentBit!5261 (_1!4869 lt!167699)) #b00000000000000000000000000000000) (bvslt (currentBit!5261 (_1!4869 lt!167699)) #b00000000000000000000000000001000) (bvsge (currentByte!5266 (_1!4869 lt!167699)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5266 (_1!4869 lt!167699)) (size!2312 (buf!2709 (_1!4869 lt!167699)))) (and (= (currentBit!5261 (_1!4869 lt!167699)) #b00000000000000000000000000000000) (= (currentByte!5266 (_1!4869 lt!167699)) (size!2312 (buf!2709 (_1!4869 lt!167699))))))))))

(assert (=> d!34916 d!35042))

(declare-fun d!35044 () Bool)

(declare-fun e!72934 () Bool)

(assert (=> d!35044 e!72934))

(declare-fun res!91785 () Bool)

(assert (=> d!35044 (=> (not res!91785) (not e!72934))))

(declare-fun lt!168703 () (_ BitVec 64))

(declare-fun lt!168704 () (_ BitVec 64))

(declare-fun lt!168702 () (_ BitVec 64))

(assert (=> d!35044 (= res!91785 (= lt!168702 (bvsub lt!168703 lt!168704)))))

(assert (=> d!35044 (or (= (bvand lt!168703 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168704 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168703 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168703 lt!168704) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35044 (= lt!168704 (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!168512)))) ((_ sign_extend 32) (currentByte!5266 (_1!4869 lt!168512))) ((_ sign_extend 32) (currentBit!5261 (_1!4869 lt!168512)))))))

(declare-fun lt!168705 () (_ BitVec 64))

(declare-fun lt!168706 () (_ BitVec 64))

(assert (=> d!35044 (= lt!168703 (bvmul lt!168705 lt!168706))))

(assert (=> d!35044 (or (= lt!168705 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!168706 (bvsdiv (bvmul lt!168705 lt!168706) lt!168705)))))

(assert (=> d!35044 (= lt!168706 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35044 (= lt!168705 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!168512)))))))

(assert (=> d!35044 (= lt!168702 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5266 (_1!4869 lt!168512))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5261 (_1!4869 lt!168512)))))))

(assert (=> d!35044 (invariant!0 (currentBit!5261 (_1!4869 lt!168512)) (currentByte!5266 (_1!4869 lt!168512)) (size!2312 (buf!2709 (_1!4869 lt!168512))))))

(assert (=> d!35044 (= (bitIndex!0 (size!2312 (buf!2709 (_1!4869 lt!168512))) (currentByte!5266 (_1!4869 lt!168512)) (currentBit!5261 (_1!4869 lt!168512))) lt!168702)))

(declare-fun b!111176 () Bool)

(declare-fun res!91784 () Bool)

(assert (=> b!111176 (=> (not res!91784) (not e!72934))))

(assert (=> b!111176 (= res!91784 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!168702))))

(declare-fun b!111177 () Bool)

(declare-fun lt!168701 () (_ BitVec 64))

(assert (=> b!111177 (= e!72934 (bvsle lt!168702 (bvmul lt!168701 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111177 (or (= lt!168701 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!168701 #b0000000000000000000000000000000000000000000000000000000000001000) lt!168701)))))

(assert (=> b!111177 (= lt!168701 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!168512)))))))

(assert (= (and d!35044 res!91785) b!111176))

(assert (= (and b!111176 res!91784) b!111177))

(declare-fun m!165209 () Bool)

(assert (=> d!35044 m!165209))

(declare-fun m!165211 () Bool)

(assert (=> d!35044 m!165211))

(assert (=> b!111106 d!35044))

(declare-fun d!35046 () Bool)

(declare-fun e!72935 () Bool)

(assert (=> d!35046 e!72935))

(declare-fun res!91787 () Bool)

(assert (=> d!35046 (=> (not res!91787) (not e!72935))))

(declare-fun lt!168710 () (_ BitVec 64))

(declare-fun lt!168708 () (_ BitVec 64))

(declare-fun lt!168709 () (_ BitVec 64))

(assert (=> d!35046 (= res!91787 (= lt!168708 (bvsub lt!168709 lt!168710)))))

(assert (=> d!35046 (or (= (bvand lt!168709 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168710 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168709 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168709 lt!168710) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35046 (= lt!168710 (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168511)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!168511))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!168511)))))))

(declare-fun lt!168711 () (_ BitVec 64))

(declare-fun lt!168712 () (_ BitVec 64))

(assert (=> d!35046 (= lt!168709 (bvmul lt!168711 lt!168712))))

(assert (=> d!35046 (or (= lt!168711 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!168712 (bvsdiv (bvmul lt!168711 lt!168712) lt!168711)))))

(assert (=> d!35046 (= lt!168712 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35046 (= lt!168711 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168511)))))))

(assert (=> d!35046 (= lt!168708 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!168511))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!168511)))))))

(assert (=> d!35046 (invariant!0 (currentBit!5261 (_2!4870 lt!168511)) (currentByte!5266 (_2!4870 lt!168511)) (size!2312 (buf!2709 (_2!4870 lt!168511))))))

(assert (=> d!35046 (= (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168511))) (currentByte!5266 (_2!4870 lt!168511)) (currentBit!5261 (_2!4870 lt!168511))) lt!168708)))

(declare-fun b!111178 () Bool)

(declare-fun res!91786 () Bool)

(assert (=> b!111178 (=> (not res!91786) (not e!72935))))

(assert (=> b!111178 (= res!91786 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!168708))))

(declare-fun b!111179 () Bool)

(declare-fun lt!168707 () (_ BitVec 64))

(assert (=> b!111179 (= e!72935 (bvsle lt!168708 (bvmul lt!168707 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111179 (or (= lt!168707 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!168707 #b0000000000000000000000000000000000000000000000000000000000001000) lt!168707)))))

(assert (=> b!111179 (= lt!168707 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168511)))))))

(assert (= (and d!35046 res!91787) b!111178))

(assert (= (and b!111178 res!91786) b!111179))

(declare-fun m!165213 () Bool)

(assert (=> d!35046 m!165213))

(declare-fun m!165215 () Bool)

(assert (=> d!35046 m!165215))

(assert (=> b!111106 d!35046))

(assert (=> b!111147 d!34920))

(declare-fun d!35048 () Bool)

(declare-fun e!72936 () Bool)

(assert (=> d!35048 e!72936))

(declare-fun res!91789 () Bool)

(assert (=> d!35048 (=> (not res!91789) (not e!72936))))

(declare-fun lt!168714 () (_ BitVec 64))

(declare-fun lt!168716 () (_ BitVec 64))

(declare-fun lt!168715 () (_ BitVec 64))

(assert (=> d!35048 (= res!91789 (= lt!168714 (bvsub lt!168715 lt!168716)))))

(assert (=> d!35048 (or (= (bvand lt!168715 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168716 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168715 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168715 lt!168716) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35048 (= lt!168716 (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!167705)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!167705))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!167705)))))))

(declare-fun lt!168717 () (_ BitVec 64))

(declare-fun lt!168718 () (_ BitVec 64))

(assert (=> d!35048 (= lt!168715 (bvmul lt!168717 lt!168718))))

(assert (=> d!35048 (or (= lt!168717 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!168718 (bvsdiv (bvmul lt!168717 lt!168718) lt!168717)))))

(assert (=> d!35048 (= lt!168718 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35048 (= lt!168717 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!167705)))))))

(assert (=> d!35048 (= lt!168714 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!167705))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!167705)))))))

(assert (=> d!35048 (invariant!0 (currentBit!5261 (_2!4870 lt!167705)) (currentByte!5266 (_2!4870 lt!167705)) (size!2312 (buf!2709 (_2!4870 lt!167705))))))

(assert (=> d!35048 (= (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167705))) (currentByte!5266 (_2!4870 lt!167705)) (currentBit!5261 (_2!4870 lt!167705))) lt!168714)))

(declare-fun b!111180 () Bool)

(declare-fun res!91788 () Bool)

(assert (=> b!111180 (=> (not res!91788) (not e!72936))))

(assert (=> b!111180 (= res!91788 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!168714))))

(declare-fun b!111181 () Bool)

(declare-fun lt!168713 () (_ BitVec 64))

(assert (=> b!111181 (= e!72936 (bvsle lt!168714 (bvmul lt!168713 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111181 (or (= lt!168713 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!168713 #b0000000000000000000000000000000000000000000000000000000000001000) lt!168713)))))

(assert (=> b!111181 (= lt!168713 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!167705)))))))

(assert (= (and d!35048 res!91789) b!111180))

(assert (= (and b!111180 res!91788) b!111181))

(declare-fun m!165217 () Bool)

(assert (=> d!35048 m!165217))

(declare-fun m!165219 () Bool)

(assert (=> d!35048 m!165219))

(assert (=> b!111147 d!35048))

(declare-fun d!35050 () Bool)

(assert (=> d!35050 (= (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 thiss!1305))) ((_ sign_extend 32) (currentByte!5266 thiss!1305)) ((_ sign_extend 32) (currentBit!5261 thiss!1305))) (bvsub (bvmul ((_ sign_extend 32) (size!2312 (buf!2709 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5266 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5261 thiss!1305)))))))

(assert (=> d!34920 d!35050))

(declare-fun d!35052 () Bool)

(assert (=> d!35052 (= (invariant!0 (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305) (size!2312 (buf!2709 thiss!1305))) (and (bvsge (currentBit!5261 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5261 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5266 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5266 thiss!1305) (size!2312 (buf!2709 thiss!1305))) (and (= (currentBit!5261 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5266 thiss!1305) (size!2312 (buf!2709 thiss!1305)))))))))

(assert (=> d!34920 d!35052))

(declare-fun d!35054 () Bool)

(declare-fun e!72937 () Bool)

(assert (=> d!35054 e!72937))

(declare-fun res!91790 () Bool)

(assert (=> d!35054 (=> (not res!91790) (not e!72937))))

(assert (=> d!35054 (= res!91790 (= (buf!2709 (_2!4870 (increaseBitIndex!0 (_1!4871 lt!167690)))) (buf!2709 (_1!4871 lt!167690))))))

(declare-fun lt!168720 () Bool)

(assert (=> d!35054 (= lt!168720 (not (= (bvand ((_ sign_extend 24) (select (arr!2905 (buf!2709 (_1!4871 lt!167690))) (currentByte!5266 (_1!4871 lt!167690)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5261 (_1!4871 lt!167690))))) #b00000000000000000000000000000000)))))

(declare-fun lt!168719 () tuple2!9248)

(assert (=> d!35054 (= lt!168719 (tuple2!9249 (not (= (bvand ((_ sign_extend 24) (select (arr!2905 (buf!2709 (_1!4871 lt!167690))) (currentByte!5266 (_1!4871 lt!167690)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5261 (_1!4871 lt!167690))))) #b00000000000000000000000000000000)) (_2!4870 (increaseBitIndex!0 (_1!4871 lt!167690)))))))

(assert (=> d!35054 (validate_offset_bit!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4871 lt!167690)))) ((_ sign_extend 32) (currentByte!5266 (_1!4871 lt!167690))) ((_ sign_extend 32) (currentBit!5261 (_1!4871 lt!167690))))))

(assert (=> d!35054 (= (readBit!0 (_1!4871 lt!167690)) lt!168719)))

(declare-fun lt!168724 () (_ BitVec 64))

(declare-fun b!111182 () Bool)

(declare-fun lt!168721 () (_ BitVec 64))

(assert (=> b!111182 (= e!72937 (= (bitIndex!0 (size!2312 (buf!2709 (_2!4870 (increaseBitIndex!0 (_1!4871 lt!167690))))) (currentByte!5266 (_2!4870 (increaseBitIndex!0 (_1!4871 lt!167690)))) (currentBit!5261 (_2!4870 (increaseBitIndex!0 (_1!4871 lt!167690))))) (bvadd lt!168721 lt!168724)))))

(assert (=> b!111182 (or (not (= (bvand lt!168721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168724 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!168721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!168721 lt!168724) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111182 (= lt!168724 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!111182 (= lt!168721 (bitIndex!0 (size!2312 (buf!2709 (_1!4871 lt!167690))) (currentByte!5266 (_1!4871 lt!167690)) (currentBit!5261 (_1!4871 lt!167690))))))

(declare-fun lt!168725 () Bool)

(assert (=> b!111182 (= lt!168725 (not (= (bvand ((_ sign_extend 24) (select (arr!2905 (buf!2709 (_1!4871 lt!167690))) (currentByte!5266 (_1!4871 lt!167690)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5261 (_1!4871 lt!167690))))) #b00000000000000000000000000000000)))))

(declare-fun lt!168722 () Bool)

(assert (=> b!111182 (= lt!168722 (not (= (bvand ((_ sign_extend 24) (select (arr!2905 (buf!2709 (_1!4871 lt!167690))) (currentByte!5266 (_1!4871 lt!167690)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5261 (_1!4871 lt!167690))))) #b00000000000000000000000000000000)))))

(declare-fun lt!168723 () Bool)

(assert (=> b!111182 (= lt!168723 (not (= (bvand ((_ sign_extend 24) (select (arr!2905 (buf!2709 (_1!4871 lt!167690))) (currentByte!5266 (_1!4871 lt!167690)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5261 (_1!4871 lt!167690))))) #b00000000000000000000000000000000)))))

(assert (= (and d!35054 res!91790) b!111182))

(declare-fun m!165221 () Bool)

(assert (=> d!35054 m!165221))

(declare-fun m!165223 () Bool)

(assert (=> d!35054 m!165223))

(declare-fun m!165225 () Bool)

(assert (=> d!35054 m!165225))

(declare-fun m!165227 () Bool)

(assert (=> d!35054 m!165227))

(declare-fun m!165229 () Bool)

(assert (=> b!111182 m!165229))

(assert (=> b!111182 m!165223))

(declare-fun m!165231 () Bool)

(assert (=> b!111182 m!165231))

(assert (=> b!111182 m!165225))

(assert (=> b!111182 m!165221))

(assert (=> d!34972 d!35054))

(assert (=> d!34922 d!35052))

(declare-fun b!111194 () Bool)

(declare-fun e!72946 () Bool)

(declare-fun e!72949 () Bool)

(assert (=> b!111194 (= e!72946 e!72949)))

(declare-fun res!91801 () Bool)

(assert (=> b!111194 (=> (not res!91801) (not e!72949))))

(declare-fun lt!168728 () tuple2!9224)

(declare-fun _$19!96 () tuple2!9226)

(assert (=> b!111194 (= res!91801 (and (= (_2!4869 lt!168728) lt!167691) (= (_1!4869 lt!168728) (_2!4870 _$19!96))))))

(assert (=> b!111194 (= lt!168728 (readBitPure!0 (readerFrom!0 (_2!4870 _$19!96) (currentBit!5261 thiss!1305) (currentByte!5266 thiss!1305))))))

(declare-fun b!111195 () Bool)

(declare-fun res!91800 () Bool)

(assert (=> b!111195 (=> (not res!91800) (not e!72946))))

(assert (=> b!111195 (= res!91800 (isPrefixOf!0 thiss!1305 (_2!4870 _$19!96)))))

(declare-fun d!35056 () Bool)

(assert (=> d!35056 e!72946))

(declare-fun res!91799 () Bool)

(assert (=> d!35056 (=> (not res!91799) (not e!72946))))

(assert (=> d!35056 (= res!91799 (= (size!2312 (buf!2709 thiss!1305)) (size!2312 (buf!2709 (_2!4870 _$19!96)))))))

(declare-fun e!72948 () Bool)

(assert (=> d!35056 (and (inv!12 (_2!4870 _$19!96)) e!72948)))

(assert (=> d!35056 (= (choose!16 thiss!1305 lt!167691) _$19!96)))

(declare-fun b!111196 () Bool)

(assert (=> b!111196 (= e!72948 (array_inv!2114 (buf!2709 (_2!4870 _$19!96))))))

(declare-fun b!111197 () Bool)

(assert (=> b!111197 (= e!72949 (= (bitIndex!0 (size!2312 (buf!2709 (_1!4869 lt!168728))) (currentByte!5266 (_1!4869 lt!168728)) (currentBit!5261 (_1!4869 lt!168728))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 _$19!96))) (currentByte!5266 (_2!4870 _$19!96)) (currentBit!5261 (_2!4870 _$19!96)))))))

(declare-fun b!111198 () Bool)

(declare-fun res!91802 () Bool)

(assert (=> b!111198 (=> (not res!91802) (not e!72946))))

(assert (=> b!111198 (= res!91802 (= (bitIndex!0 (size!2312 (buf!2709 (_2!4870 _$19!96))) (currentByte!5266 (_2!4870 _$19!96)) (currentBit!5261 (_2!4870 _$19!96))) (bvadd (bitIndex!0 (size!2312 (buf!2709 thiss!1305)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= d!35056 b!111196))

(assert (= (and d!35056 res!91799) b!111198))

(assert (= (and b!111198 res!91802) b!111195))

(assert (= (and b!111195 res!91800) b!111194))

(assert (= (and b!111194 res!91801) b!111197))

(declare-fun m!165233 () Bool)

(assert (=> b!111195 m!165233))

(declare-fun m!165235 () Bool)

(assert (=> b!111196 m!165235))

(declare-fun m!165237 () Bool)

(assert (=> b!111197 m!165237))

(declare-fun m!165239 () Bool)

(assert (=> b!111197 m!165239))

(assert (=> b!111198 m!165239))

(assert (=> b!111198 m!164407))

(declare-fun m!165241 () Bool)

(assert (=> d!35056 m!165241))

(declare-fun m!165243 () Bool)

(assert (=> b!111194 m!165243))

(assert (=> b!111194 m!165243))

(declare-fun m!165245 () Bool)

(assert (=> b!111194 m!165245))

(assert (=> d!34990 d!35056))

(declare-fun d!35058 () Bool)

(assert (=> d!35058 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2312 (buf!2709 thiss!1305))) ((_ sign_extend 32) (currentByte!5266 thiss!1305)) ((_ sign_extend 32) (currentBit!5261 thiss!1305))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 thiss!1305))) ((_ sign_extend 32) (currentByte!5266 thiss!1305)) ((_ sign_extend 32) (currentBit!5261 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!8589 () Bool)

(assert (= bs!8589 d!35058))

(assert (=> bs!8589 m!164739))

(assert (=> d!34990 d!35058))

(declare-fun d!35060 () Bool)

(assert (=> d!35060 (= (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!167705)))) ((_ sign_extend 32) (currentByte!5266 thiss!1305)) ((_ sign_extend 32) (currentBit!5261 thiss!1305))) (bvsub (bvmul ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!167705)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5266 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5261 thiss!1305)))))))

(assert (=> d!34978 d!35060))

(declare-fun b!111213 () Bool)

(declare-fun e!72963 () Bool)

(declare-fun e!72965 () Bool)

(assert (=> b!111213 (= e!72963 e!72965)))

(declare-fun res!91817 () Bool)

(assert (=> b!111213 (=> (not res!91817) (not e!72965))))

(declare-fun e!72967 () Bool)

(assert (=> b!111213 (= res!91817 e!72967)))

(declare-fun res!91816 () Bool)

(assert (=> b!111213 (=> res!91816 e!72967)))

(declare-datatypes ((tuple4!72 0))(
  ( (tuple4!73 (_1!4883 (_ BitVec 32)) (_2!4883 (_ BitVec 32)) (_3!257 (_ BitVec 32)) (_4!36 (_ BitVec 32))) )
))
(declare-fun lt!168737 () tuple4!72)

(assert (=> b!111213 (= res!91816 (bvsge (_1!4883 lt!168737) (_2!4883 lt!168737)))))

(declare-fun lt!168735 () (_ BitVec 32))

(assert (=> b!111213 (= lt!168735 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2312 (buf!2709 thiss!1305)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!168736 () (_ BitVec 32))

(assert (=> b!111213 (= lt!168736 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!72)

(assert (=> b!111213 (= lt!168737 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2312 (buf!2709 thiss!1305)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))))))

(declare-fun b!111214 () Bool)

(declare-fun res!91813 () Bool)

(assert (=> b!111214 (= res!91813 (= lt!168735 #b00000000000000000000000000000000))))

(declare-fun e!72964 () Bool)

(assert (=> b!111214 (=> res!91813 e!72964)))

(declare-fun e!72962 () Bool)

(assert (=> b!111214 (= e!72962 e!72964)))

(declare-fun b!111215 () Bool)

(declare-fun e!72966 () Bool)

(assert (=> b!111215 (= e!72965 e!72966)))

(declare-fun c!6761 () Bool)

(assert (=> b!111215 (= c!6761 (= (_3!257 lt!168737) (_4!36 lt!168737)))))

(declare-fun b!111216 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!111216 (= e!72964 (byteRangesEq!0 (select (arr!2905 (buf!2709 thiss!1305)) (_4!36 lt!168737)) (select (arr!2905 (buf!2709 (_2!4870 lt!167705))) (_4!36 lt!168737)) #b00000000000000000000000000000000 lt!168735))))

(declare-fun d!35062 () Bool)

(declare-fun res!91814 () Bool)

(assert (=> d!35062 (=> res!91814 e!72963)))

(assert (=> d!35062 (= res!91814 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2312 (buf!2709 thiss!1305)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))))))

(assert (=> d!35062 (= (arrayBitRangesEq!0 (buf!2709 thiss!1305) (buf!2709 (_2!4870 lt!167705)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2312 (buf!2709 thiss!1305)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))) e!72963)))

(declare-fun b!111217 () Bool)

(assert (=> b!111217 (= e!72966 e!72962)))

(declare-fun res!91815 () Bool)

(declare-fun call!1398 () Bool)

(assert (=> b!111217 (= res!91815 call!1398)))

(assert (=> b!111217 (=> (not res!91815) (not e!72962))))

(declare-fun b!111218 () Bool)

(declare-fun arrayRangesEq!37 (array!5083 array!5083 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!111218 (= e!72967 (arrayRangesEq!37 (buf!2709 thiss!1305) (buf!2709 (_2!4870 lt!167705)) (_1!4883 lt!168737) (_2!4883 lt!168737)))))

(declare-fun b!111219 () Bool)

(assert (=> b!111219 (= e!72966 call!1398)))

(declare-fun bm!1395 () Bool)

(assert (=> bm!1395 (= call!1398 (byteRangesEq!0 (select (arr!2905 (buf!2709 thiss!1305)) (_3!257 lt!168737)) (select (arr!2905 (buf!2709 (_2!4870 lt!167705))) (_3!257 lt!168737)) lt!168736 (ite c!6761 lt!168735 #b00000000000000000000000000001000)))))

(assert (= (and d!35062 (not res!91814)) b!111213))

(assert (= (and b!111213 (not res!91816)) b!111218))

(assert (= (and b!111213 res!91817) b!111215))

(assert (= (and b!111215 c!6761) b!111219))

(assert (= (and b!111215 (not c!6761)) b!111217))

(assert (= (and b!111217 res!91815) b!111214))

(assert (= (and b!111214 (not res!91813)) b!111216))

(assert (= (or b!111219 b!111217) bm!1395))

(assert (=> b!111213 m!164407))

(declare-fun m!165247 () Bool)

(assert (=> b!111213 m!165247))

(declare-fun m!165249 () Bool)

(assert (=> b!111216 m!165249))

(declare-fun m!165251 () Bool)

(assert (=> b!111216 m!165251))

(assert (=> b!111216 m!165249))

(assert (=> b!111216 m!165251))

(declare-fun m!165253 () Bool)

(assert (=> b!111216 m!165253))

(declare-fun m!165255 () Bool)

(assert (=> b!111218 m!165255))

(declare-fun m!165257 () Bool)

(assert (=> bm!1395 m!165257))

(declare-fun m!165259 () Bool)

(assert (=> bm!1395 m!165259))

(assert (=> bm!1395 m!165257))

(assert (=> bm!1395 m!165259))

(declare-fun m!165261 () Bool)

(assert (=> bm!1395 m!165261))

(assert (=> b!111149 d!35062))

(assert (=> b!111149 d!34920))

(declare-fun d!35064 () Bool)

(declare-fun e!72970 () Bool)

(assert (=> d!35064 e!72970))

(declare-fun res!91820 () Bool)

(assert (=> d!35064 (=> (not res!91820) (not e!72970))))

(declare-fun lt!168742 () BitStream!4098)

(declare-fun lt!168743 () (_ BitVec 64))

(assert (=> d!35064 (= res!91820 (= (bvadd lt!168743 (bvsub lt!168620 lt!168629)) (bitIndex!0 (size!2312 (buf!2709 lt!168742)) (currentByte!5266 lt!168742) (currentBit!5261 lt!168742))))))

(assert (=> d!35064 (or (not (= (bvand lt!168743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168620 lt!168629) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!168743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!168743 (bvsub lt!168620 lt!168629)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35064 (= lt!168743 (bitIndex!0 (size!2312 (buf!2709 (_2!4871 lt!168626))) (currentByte!5266 (_2!4871 lt!168626)) (currentBit!5261 (_2!4871 lt!168626))))))

(declare-fun moveBitIndex!0 (BitStream!4098 (_ BitVec 64)) tuple2!9226)

(assert (=> d!35064 (= lt!168742 (_2!4870 (moveBitIndex!0 (_2!4871 lt!168626) (bvsub lt!168620 lt!168629))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4098 (_ BitVec 64)) Bool)

(assert (=> d!35064 (moveBitIndexPrecond!0 (_2!4871 lt!168626) (bvsub lt!168620 lt!168629))))

(assert (=> d!35064 (= (withMovedBitIndex!0 (_2!4871 lt!168626) (bvsub lt!168620 lt!168629)) lt!168742)))

(declare-fun b!111222 () Bool)

(assert (=> b!111222 (= e!72970 (= (size!2312 (buf!2709 (_2!4871 lt!168626))) (size!2312 (buf!2709 lt!168742))))))

(assert (= (and d!35064 res!91820) b!111222))

(declare-fun m!165263 () Bool)

(assert (=> d!35064 m!165263))

(declare-fun m!165265 () Bool)

(assert (=> d!35064 m!165265))

(declare-fun m!165267 () Bool)

(assert (=> d!35064 m!165267))

(declare-fun m!165269 () Bool)

(assert (=> d!35064 m!165269))

(assert (=> b!111131 d!35064))

(assert (=> b!111131 d!35048))

(assert (=> b!111131 d!34918))

(declare-fun d!35066 () Bool)

(declare-fun e!72971 () Bool)

(assert (=> d!35066 e!72971))

(declare-fun res!91821 () Bool)

(assert (=> d!35066 (=> (not res!91821) (not e!72971))))

(declare-fun lt!168745 () (_ BitVec 64))

(declare-fun lt!168744 () BitStream!4098)

(assert (=> d!35066 (= res!91821 (= (bvadd lt!168745 (bvsub lt!168590 lt!168599)) (bitIndex!0 (size!2312 (buf!2709 lt!168744)) (currentByte!5266 lt!168744) (currentBit!5261 lt!168744))))))

(assert (=> d!35066 (or (not (= (bvand lt!168745 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168590 lt!168599) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!168745 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!168745 (bvsub lt!168590 lt!168599)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35066 (= lt!168745 (bitIndex!0 (size!2312 (buf!2709 (_2!4871 lt!168596))) (currentByte!5266 (_2!4871 lt!168596)) (currentBit!5261 (_2!4871 lt!168596))))))

(assert (=> d!35066 (= lt!168744 (_2!4870 (moveBitIndex!0 (_2!4871 lt!168596) (bvsub lt!168590 lt!168599))))))

(assert (=> d!35066 (moveBitIndexPrecond!0 (_2!4871 lt!168596) (bvsub lt!168590 lt!168599))))

(assert (=> d!35066 (= (withMovedBitIndex!0 (_2!4871 lt!168596) (bvsub lt!168590 lt!168599)) lt!168744)))

(declare-fun b!111223 () Bool)

(assert (=> b!111223 (= e!72971 (= (size!2312 (buf!2709 (_2!4871 lt!168596))) (size!2312 (buf!2709 lt!168744))))))

(assert (= (and d!35066 res!91821) b!111223))

(declare-fun m!165271 () Bool)

(assert (=> d!35066 m!165271))

(assert (=> d!35066 m!165173))

(declare-fun m!165273 () Bool)

(assert (=> d!35066 m!165273))

(declare-fun m!165275 () Bool)

(assert (=> d!35066 m!165275))

(assert (=> b!111124 d!35066))

(assert (=> b!111124 d!35048))

(assert (=> b!111124 d!34920))

(declare-fun d!35068 () Bool)

(declare-fun res!91823 () Bool)

(declare-fun e!72973 () Bool)

(assert (=> d!35068 (=> (not res!91823) (not e!72973))))

(assert (=> d!35068 (= res!91823 (= (size!2312 (buf!2709 (ite c!6754 (_2!4870 lt!167696) lt!168495))) (size!2312 (buf!2709 (ite c!6754 (_2!4870 lt!168500) lt!168495)))))))

(assert (=> d!35068 (= (isPrefixOf!0 (ite c!6754 (_2!4870 lt!167696) lt!168495) (ite c!6754 (_2!4870 lt!168500) lt!168495)) e!72973)))

(declare-fun b!111224 () Bool)

(declare-fun res!91822 () Bool)

(assert (=> b!111224 (=> (not res!91822) (not e!72973))))

(assert (=> b!111224 (= res!91822 (bvsle (bitIndex!0 (size!2312 (buf!2709 (ite c!6754 (_2!4870 lt!167696) lt!168495))) (currentByte!5266 (ite c!6754 (_2!4870 lt!167696) lt!168495)) (currentBit!5261 (ite c!6754 (_2!4870 lt!167696) lt!168495))) (bitIndex!0 (size!2312 (buf!2709 (ite c!6754 (_2!4870 lt!168500) lt!168495))) (currentByte!5266 (ite c!6754 (_2!4870 lt!168500) lt!168495)) (currentBit!5261 (ite c!6754 (_2!4870 lt!168500) lt!168495)))))))

(declare-fun b!111225 () Bool)

(declare-fun e!72972 () Bool)

(assert (=> b!111225 (= e!72973 e!72972)))

(declare-fun res!91824 () Bool)

(assert (=> b!111225 (=> res!91824 e!72972)))

(assert (=> b!111225 (= res!91824 (= (size!2312 (buf!2709 (ite c!6754 (_2!4870 lt!167696) lt!168495))) #b00000000000000000000000000000000))))

(declare-fun b!111226 () Bool)

(assert (=> b!111226 (= e!72972 (arrayBitRangesEq!0 (buf!2709 (ite c!6754 (_2!4870 lt!167696) lt!168495)) (buf!2709 (ite c!6754 (_2!4870 lt!168500) lt!168495)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2312 (buf!2709 (ite c!6754 (_2!4870 lt!167696) lt!168495))) (currentByte!5266 (ite c!6754 (_2!4870 lt!167696) lt!168495)) (currentBit!5261 (ite c!6754 (_2!4870 lt!167696) lt!168495)))))))

(assert (= (and d!35068 res!91823) b!111224))

(assert (= (and b!111224 res!91822) b!111225))

(assert (= (and b!111225 (not res!91824)) b!111226))

(declare-fun m!165277 () Bool)

(assert (=> b!111224 m!165277))

(declare-fun m!165279 () Bool)

(assert (=> b!111224 m!165279))

(assert (=> b!111226 m!165277))

(assert (=> b!111226 m!165277))

(declare-fun m!165281 () Bool)

(assert (=> b!111226 m!165281))

(assert (=> bm!1392 d!35068))

(declare-fun d!35070 () Bool)

(declare-fun res!91826 () Bool)

(declare-fun e!72975 () Bool)

(assert (=> d!35070 (=> (not res!91826) (not e!72975))))

(assert (=> d!35070 (= res!91826 (= (size!2312 (buf!2709 (_2!4871 lt!168626))) (size!2312 (buf!2709 (_2!4870 lt!167705)))))))

(assert (=> d!35070 (= (isPrefixOf!0 (_2!4871 lt!168626) (_2!4870 lt!167705)) e!72975)))

(declare-fun b!111227 () Bool)

(declare-fun res!91825 () Bool)

(assert (=> b!111227 (=> (not res!91825) (not e!72975))))

(assert (=> b!111227 (= res!91825 (bvsle (bitIndex!0 (size!2312 (buf!2709 (_2!4871 lt!168626))) (currentByte!5266 (_2!4871 lt!168626)) (currentBit!5261 (_2!4871 lt!168626))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167705))) (currentByte!5266 (_2!4870 lt!167705)) (currentBit!5261 (_2!4870 lt!167705)))))))

(declare-fun b!111228 () Bool)

(declare-fun e!72974 () Bool)

(assert (=> b!111228 (= e!72975 e!72974)))

(declare-fun res!91827 () Bool)

(assert (=> b!111228 (=> res!91827 e!72974)))

(assert (=> b!111228 (= res!91827 (= (size!2312 (buf!2709 (_2!4871 lt!168626))) #b00000000000000000000000000000000))))

(declare-fun b!111229 () Bool)

(assert (=> b!111229 (= e!72974 (arrayBitRangesEq!0 (buf!2709 (_2!4871 lt!168626)) (buf!2709 (_2!4870 lt!167705)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2312 (buf!2709 (_2!4871 lt!168626))) (currentByte!5266 (_2!4871 lt!168626)) (currentBit!5261 (_2!4871 lt!168626)))))))

(assert (= (and d!35070 res!91826) b!111227))

(assert (= (and b!111227 res!91825) b!111228))

(assert (= (and b!111228 (not res!91827)) b!111229))

(assert (=> b!111227 m!165265))

(assert (=> b!111227 m!165085))

(assert (=> b!111229 m!165265))

(assert (=> b!111229 m!165265))

(declare-fun m!165283 () Bool)

(assert (=> b!111229 m!165283))

(assert (=> b!111129 d!35070))

(declare-fun d!35072 () Bool)

(declare-fun lt!168746 () tuple2!9248)

(assert (=> d!35072 (= lt!168746 (readBit!0 (readerFrom!0 (_2!4870 lt!168511) (currentBit!5261 (_2!4870 lt!167696)) (currentByte!5266 (_2!4870 lt!167696)))))))

(assert (=> d!35072 (= (readBitPure!0 (readerFrom!0 (_2!4870 lt!168511) (currentBit!5261 (_2!4870 lt!167696)) (currentByte!5266 (_2!4870 lt!167696)))) (tuple2!9225 (_2!4881 lt!168746) (_1!4881 lt!168746)))))

(declare-fun bs!8590 () Bool)

(assert (= bs!8590 d!35072))

(assert (=> bs!8590 m!164967))

(declare-fun m!165285 () Bool)

(assert (=> bs!8590 m!165285))

(assert (=> b!111104 d!35072))

(declare-fun d!35074 () Bool)

(declare-fun e!72976 () Bool)

(assert (=> d!35074 e!72976))

(declare-fun res!91828 () Bool)

(assert (=> d!35074 (=> (not res!91828) (not e!72976))))

(assert (=> d!35074 (= res!91828 (invariant!0 (currentBit!5261 (_2!4870 lt!168511)) (currentByte!5266 (_2!4870 lt!168511)) (size!2312 (buf!2709 (_2!4870 lt!168511)))))))

(assert (=> d!35074 (= (readerFrom!0 (_2!4870 lt!168511) (currentBit!5261 (_2!4870 lt!167696)) (currentByte!5266 (_2!4870 lt!167696))) (BitStream!4099 (buf!2709 (_2!4870 lt!168511)) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))))))

(declare-fun b!111230 () Bool)

(assert (=> b!111230 (= e!72976 (invariant!0 (currentBit!5261 (_2!4870 lt!167696)) (currentByte!5266 (_2!4870 lt!167696)) (size!2312 (buf!2709 (_2!4870 lt!168511)))))))

(assert (= (and d!35074 res!91828) b!111230))

(assert (=> d!35074 m!165215))

(declare-fun m!165287 () Bool)

(assert (=> b!111230 m!165287))

(assert (=> b!111104 d!35074))

(declare-fun d!35076 () Bool)

(declare-fun res!91830 () Bool)

(declare-fun e!72978 () Bool)

(assert (=> d!35076 (=> (not res!91830) (not e!72978))))

(assert (=> d!35076 (= res!91830 (= (size!2312 (buf!2709 (_1!4871 lt!168626))) (size!2312 (buf!2709 (_2!4870 lt!167696)))))))

(assert (=> d!35076 (= (isPrefixOf!0 (_1!4871 lt!168626) (_2!4870 lt!167696)) e!72978)))

(declare-fun b!111231 () Bool)

(declare-fun res!91829 () Bool)

(assert (=> b!111231 (=> (not res!91829) (not e!72978))))

(assert (=> b!111231 (= res!91829 (bvsle (bitIndex!0 (size!2312 (buf!2709 (_1!4871 lt!168626))) (currentByte!5266 (_1!4871 lt!168626)) (currentBit!5261 (_1!4871 lt!168626))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696)))))))

(declare-fun b!111232 () Bool)

(declare-fun e!72977 () Bool)

(assert (=> b!111232 (= e!72978 e!72977)))

(declare-fun res!91831 () Bool)

(assert (=> b!111232 (=> res!91831 e!72977)))

(assert (=> b!111232 (= res!91831 (= (size!2312 (buf!2709 (_1!4871 lt!168626))) #b00000000000000000000000000000000))))

(declare-fun b!111233 () Bool)

(assert (=> b!111233 (= e!72977 (arrayBitRangesEq!0 (buf!2709 (_1!4871 lt!168626)) (buf!2709 (_2!4870 lt!167696)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2312 (buf!2709 (_1!4871 lt!168626))) (currentByte!5266 (_1!4871 lt!168626)) (currentBit!5261 (_1!4871 lt!168626)))))))

(assert (= (and d!35076 res!91830) b!111231))

(assert (= (and b!111231 res!91829) b!111232))

(assert (= (and b!111232 (not res!91831)) b!111233))

(declare-fun m!165289 () Bool)

(assert (=> b!111231 m!165289))

(assert (=> b!111231 m!164405))

(assert (=> b!111233 m!165289))

(assert (=> b!111233 m!165289))

(declare-fun m!165291 () Bool)

(assert (=> b!111233 m!165291))

(assert (=> b!111133 d!35076))

(assert (=> d!34926 d!35008))

(declare-fun d!35078 () Bool)

(declare-fun res!91833 () Bool)

(declare-fun e!72980 () Bool)

(assert (=> d!35078 (=> (not res!91833) (not e!72980))))

(assert (=> d!35078 (= res!91833 (= (size!2312 (buf!2709 (_1!4871 lt!168596))) (size!2312 (buf!2709 thiss!1305))))))

(assert (=> d!35078 (= (isPrefixOf!0 (_1!4871 lt!168596) thiss!1305) e!72980)))

(declare-fun b!111234 () Bool)

(declare-fun res!91832 () Bool)

(assert (=> b!111234 (=> (not res!91832) (not e!72980))))

(assert (=> b!111234 (= res!91832 (bvsle (bitIndex!0 (size!2312 (buf!2709 (_1!4871 lt!168596))) (currentByte!5266 (_1!4871 lt!168596)) (currentBit!5261 (_1!4871 lt!168596))) (bitIndex!0 (size!2312 (buf!2709 thiss!1305)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))))))

(declare-fun b!111235 () Bool)

(declare-fun e!72979 () Bool)

(assert (=> b!111235 (= e!72980 e!72979)))

(declare-fun res!91834 () Bool)

(assert (=> b!111235 (=> res!91834 e!72979)))

(assert (=> b!111235 (= res!91834 (= (size!2312 (buf!2709 (_1!4871 lt!168596))) #b00000000000000000000000000000000))))

(declare-fun b!111236 () Bool)

(assert (=> b!111236 (= e!72979 (arrayBitRangesEq!0 (buf!2709 (_1!4871 lt!168596)) (buf!2709 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2312 (buf!2709 (_1!4871 lt!168596))) (currentByte!5266 (_1!4871 lt!168596)) (currentBit!5261 (_1!4871 lt!168596)))))))

(assert (= (and d!35078 res!91833) b!111234))

(assert (= (and b!111234 res!91832) b!111235))

(assert (= (and b!111235 (not res!91834)) b!111236))

(assert (=> b!111234 m!165171))

(assert (=> b!111234 m!164407))

(assert (=> b!111236 m!165171))

(assert (=> b!111236 m!165171))

(declare-fun m!165293 () Bool)

(assert (=> b!111236 m!165293))

(assert (=> b!111126 d!35078))

(declare-fun b!111237 () Bool)

(declare-fun res!91837 () Bool)

(declare-fun e!72982 () Bool)

(assert (=> b!111237 (=> (not res!91837) (not e!72982))))

(declare-fun lt!168761 () tuple2!9228)

(assert (=> b!111237 (= res!91837 (isPrefixOf!0 (_2!4871 lt!168761) (_2!4870 lt!168500)))))

(declare-fun b!111238 () Bool)

(declare-fun e!72981 () Unit!6792)

(declare-fun Unit!6820 () Unit!6792)

(assert (=> b!111238 (= e!72981 Unit!6820)))

(declare-fun d!35080 () Bool)

(assert (=> d!35080 e!72982))

(declare-fun res!91835 () Bool)

(assert (=> d!35080 (=> (not res!91835) (not e!72982))))

(assert (=> d!35080 (= res!91835 (isPrefixOf!0 (_1!4871 lt!168761) (_2!4871 lt!168761)))))

(declare-fun lt!168757 () BitStream!4098)

(assert (=> d!35080 (= lt!168761 (tuple2!9229 lt!168757 (_2!4870 lt!168500)))))

(declare-fun lt!168756 () Unit!6792)

(declare-fun lt!168765 () Unit!6792)

(assert (=> d!35080 (= lt!168756 lt!168765)))

(assert (=> d!35080 (isPrefixOf!0 lt!168757 (_2!4870 lt!168500))))

(assert (=> d!35080 (= lt!168765 (lemmaIsPrefixTransitive!0 lt!168757 (_2!4870 lt!168500) (_2!4870 lt!168500)))))

(declare-fun lt!168753 () Unit!6792)

(declare-fun lt!168762 () Unit!6792)

(assert (=> d!35080 (= lt!168753 lt!168762)))

(assert (=> d!35080 (isPrefixOf!0 lt!168757 (_2!4870 lt!168500))))

(assert (=> d!35080 (= lt!168762 (lemmaIsPrefixTransitive!0 lt!168757 (_2!4870 lt!168524) (_2!4870 lt!168500)))))

(declare-fun lt!168763 () Unit!6792)

(assert (=> d!35080 (= lt!168763 e!72981)))

(declare-fun c!6762 () Bool)

(assert (=> d!35080 (= c!6762 (not (= (size!2312 (buf!2709 (_2!4870 lt!168524))) #b00000000000000000000000000000000)))))

(declare-fun lt!168749 () Unit!6792)

(declare-fun lt!168759 () Unit!6792)

(assert (=> d!35080 (= lt!168749 lt!168759)))

(assert (=> d!35080 (isPrefixOf!0 (_2!4870 lt!168500) (_2!4870 lt!168500))))

(assert (=> d!35080 (= lt!168759 (lemmaIsPrefixRefl!0 (_2!4870 lt!168500)))))

(declare-fun lt!168760 () Unit!6792)

(declare-fun lt!168748 () Unit!6792)

(assert (=> d!35080 (= lt!168760 lt!168748)))

(assert (=> d!35080 (= lt!168748 (lemmaIsPrefixRefl!0 (_2!4870 lt!168500)))))

(declare-fun lt!168750 () Unit!6792)

(declare-fun lt!168754 () Unit!6792)

(assert (=> d!35080 (= lt!168750 lt!168754)))

(assert (=> d!35080 (isPrefixOf!0 lt!168757 lt!168757)))

(assert (=> d!35080 (= lt!168754 (lemmaIsPrefixRefl!0 lt!168757))))

(declare-fun lt!168758 () Unit!6792)

(declare-fun lt!168752 () Unit!6792)

(assert (=> d!35080 (= lt!168758 lt!168752)))

(assert (=> d!35080 (isPrefixOf!0 (_2!4870 lt!168524) (_2!4870 lt!168524))))

(assert (=> d!35080 (= lt!168752 (lemmaIsPrefixRefl!0 (_2!4870 lt!168524)))))

(assert (=> d!35080 (= lt!168757 (BitStream!4099 (buf!2709 (_2!4870 lt!168500)) (currentByte!5266 (_2!4870 lt!168524)) (currentBit!5261 (_2!4870 lt!168524))))))

(assert (=> d!35080 (isPrefixOf!0 (_2!4870 lt!168524) (_2!4870 lt!168500))))

(assert (=> d!35080 (= (reader!0 (_2!4870 lt!168524) (_2!4870 lt!168500)) lt!168761)))

(declare-fun b!111239 () Bool)

(declare-fun lt!168764 () (_ BitVec 64))

(declare-fun lt!168755 () (_ BitVec 64))

(assert (=> b!111239 (= e!72982 (= (_1!4871 lt!168761) (withMovedBitIndex!0 (_2!4871 lt!168761) (bvsub lt!168755 lt!168764))))))

(assert (=> b!111239 (or (= (bvand lt!168755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168764 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168755 lt!168764) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111239 (= lt!168764 (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168500))) (currentByte!5266 (_2!4870 lt!168500)) (currentBit!5261 (_2!4870 lt!168500))))))

(assert (=> b!111239 (= lt!168755 (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168524))) (currentByte!5266 (_2!4870 lt!168524)) (currentBit!5261 (_2!4870 lt!168524))))))

(declare-fun b!111240 () Bool)

(declare-fun lt!168766 () Unit!6792)

(assert (=> b!111240 (= e!72981 lt!168766)))

(declare-fun lt!168751 () (_ BitVec 64))

(assert (=> b!111240 (= lt!168751 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!168747 () (_ BitVec 64))

(assert (=> b!111240 (= lt!168747 (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168524))) (currentByte!5266 (_2!4870 lt!168524)) (currentBit!5261 (_2!4870 lt!168524))))))

(assert (=> b!111240 (= lt!168766 (arrayBitRangesEqSymmetric!0 (buf!2709 (_2!4870 lt!168524)) (buf!2709 (_2!4870 lt!168500)) lt!168751 lt!168747))))

(assert (=> b!111240 (arrayBitRangesEq!0 (buf!2709 (_2!4870 lt!168500)) (buf!2709 (_2!4870 lt!168524)) lt!168751 lt!168747)))

(declare-fun b!111241 () Bool)

(declare-fun res!91836 () Bool)

(assert (=> b!111241 (=> (not res!91836) (not e!72982))))

(assert (=> b!111241 (= res!91836 (isPrefixOf!0 (_1!4871 lt!168761) (_2!4870 lt!168524)))))

(assert (= (and d!35080 c!6762) b!111240))

(assert (= (and d!35080 (not c!6762)) b!111238))

(assert (= (and d!35080 res!91835) b!111241))

(assert (= (and b!111241 res!91836) b!111237))

(assert (= (and b!111237 res!91837) b!111239))

(declare-fun m!165295 () Bool)

(assert (=> d!35080 m!165295))

(declare-fun m!165297 () Bool)

(assert (=> d!35080 m!165297))

(declare-fun m!165299 () Bool)

(assert (=> d!35080 m!165299))

(declare-fun m!165301 () Bool)

(assert (=> d!35080 m!165301))

(declare-fun m!165303 () Bool)

(assert (=> d!35080 m!165303))

(declare-fun m!165305 () Bool)

(assert (=> d!35080 m!165305))

(declare-fun m!165307 () Bool)

(assert (=> d!35080 m!165307))

(declare-fun m!165309 () Bool)

(assert (=> d!35080 m!165309))

(declare-fun m!165311 () Bool)

(assert (=> d!35080 m!165311))

(declare-fun m!165313 () Bool)

(assert (=> d!35080 m!165313))

(declare-fun m!165315 () Bool)

(assert (=> d!35080 m!165315))

(assert (=> b!111240 m!165007))

(declare-fun m!165317 () Bool)

(assert (=> b!111240 m!165317))

(declare-fun m!165319 () Bool)

(assert (=> b!111240 m!165319))

(declare-fun m!165321 () Bool)

(assert (=> b!111241 m!165321))

(declare-fun m!165323 () Bool)

(assert (=> b!111237 m!165323))

(declare-fun m!165325 () Bool)

(assert (=> b!111239 m!165325))

(assert (=> b!111239 m!165025))

(assert (=> b!111239 m!165007))

(assert (=> b!111102 d!35080))

(declare-fun d!35082 () Bool)

(declare-fun lt!168782 () tuple2!9230)

(declare-fun lt!168781 () tuple2!9230)

(assert (=> d!35082 (and (= (_2!4872 lt!168782) (_2!4872 lt!168781)) (= (_1!4872 lt!168782) (_1!4872 lt!168781)))))

(declare-fun lt!168780 () BitStream!4098)

(declare-fun lt!168783 () Bool)

(declare-fun lt!168784 () Unit!6792)

(declare-fun lt!168779 () (_ BitVec 64))

(declare-fun choose!45 (BitStream!4098 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!9230 tuple2!9230 BitStream!4098 (_ BitVec 64) Bool BitStream!4098 (_ BitVec 64) tuple2!9230 tuple2!9230 BitStream!4098 (_ BitVec 64)) Unit!6792)

(assert (=> d!35082 (= lt!168784 (choose!45 (_1!4871 lt!168515) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168521 lt!168782 (tuple2!9231 (_1!4872 lt!168782) (_2!4872 lt!168782)) (_1!4872 lt!168782) (_2!4872 lt!168782) lt!168783 lt!168780 lt!168779 lt!168781 (tuple2!9231 (_1!4872 lt!168781) (_2!4872 lt!168781)) (_1!4872 lt!168781) (_2!4872 lt!168781)))))

(assert (=> d!35082 (= lt!168781 (readNLeastSignificantBitsLoopPure!0 lt!168780 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!168779))))

(assert (=> d!35082 (= lt!168779 (bvor lt!168521 (ite lt!168783 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35082 (= lt!168780 (withMovedBitIndex!0 (_1!4871 lt!168515) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!35082 (= lt!168783 (_2!4869 (readBitPure!0 (_1!4871 lt!168515))))))

(assert (=> d!35082 (= lt!168782 (readNLeastSignificantBitsLoopPure!0 (_1!4871 lt!168515) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168521))))

(assert (=> d!35082 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4871 lt!168515) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168521) lt!168784)))

(declare-fun bs!8592 () Bool)

(assert (= bs!8592 d!35082))

(assert (=> bs!8592 m!165033))

(declare-fun m!165327 () Bool)

(assert (=> bs!8592 m!165327))

(declare-fun m!165329 () Bool)

(assert (=> bs!8592 m!165329))

(assert (=> bs!8592 m!165019))

(assert (=> bs!8592 m!164983))

(assert (=> b!111102 d!35082))

(declare-fun d!35084 () Bool)

(declare-fun lt!168785 () tuple2!9250)

(assert (=> d!35084 (= lt!168785 (readNLeastSignificantBitsLoop!0 (_1!4871 lt!168538) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!168521 (ite (_2!4869 lt!168532) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!35084 (= (readNLeastSignificantBitsLoopPure!0 (_1!4871 lt!168538) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!168521 (ite (_2!4869 lt!168532) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!9231 (_2!4882 lt!168785) (_1!4882 lt!168785)))))

(declare-fun bs!8593 () Bool)

(assert (= bs!8593 d!35084))

(declare-fun m!165331 () Bool)

(assert (=> bs!8593 m!165331))

(assert (=> b!111102 d!35084))

(declare-fun d!35086 () Bool)

(assert (=> d!35086 (= (invariant!0 (currentBit!5261 (_2!4870 lt!167696)) (currentByte!5266 (_2!4870 lt!167696)) (size!2312 (buf!2709 (_2!4870 lt!168524)))) (and (bvsge (currentBit!5261 (_2!4870 lt!167696)) #b00000000000000000000000000000000) (bvslt (currentBit!5261 (_2!4870 lt!167696)) #b00000000000000000000000000001000) (bvsge (currentByte!5266 (_2!4870 lt!167696)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5266 (_2!4870 lt!167696)) (size!2312 (buf!2709 (_2!4870 lt!168524)))) (and (= (currentBit!5261 (_2!4870 lt!167696)) #b00000000000000000000000000000000) (= (currentByte!5266 (_2!4870 lt!167696)) (size!2312 (buf!2709 (_2!4870 lt!168524))))))))))

(assert (=> b!111102 d!35086))

(declare-fun d!35088 () Bool)

(declare-fun lt!168786 () tuple2!9250)

(assert (=> d!35088 (= lt!168786 (readNLeastSignificantBitsLoop!0 (_1!4871 lt!168515) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168521))))

(assert (=> d!35088 (= (readNLeastSignificantBitsLoopPure!0 (_1!4871 lt!168515) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168521) (tuple2!9231 (_2!4882 lt!168786) (_1!4882 lt!168786)))))

(declare-fun bs!8594 () Bool)

(assert (= bs!8594 d!35088))

(declare-fun m!165333 () Bool)

(assert (=> bs!8594 m!165333))

(assert (=> b!111102 d!35088))

(declare-fun d!35090 () Bool)

(assert (=> d!35090 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168500)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!167696))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!167696))) lt!168501) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168500)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!167696))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!167696)))) lt!168501))))

(declare-fun bs!8595 () Bool)

(assert (= bs!8595 d!35090))

(declare-fun m!165335 () Bool)

(assert (=> bs!8595 m!165335))

(assert (=> b!111102 d!35090))

(declare-fun b!111242 () Bool)

(declare-fun res!91840 () Bool)

(declare-fun e!72984 () Bool)

(assert (=> b!111242 (=> (not res!91840) (not e!72984))))

(declare-fun lt!168801 () tuple2!9228)

(assert (=> b!111242 (= res!91840 (isPrefixOf!0 (_2!4871 lt!168801) (_2!4870 lt!168500)))))

(declare-fun b!111243 () Bool)

(declare-fun e!72983 () Unit!6792)

(declare-fun Unit!6821 () Unit!6792)

(assert (=> b!111243 (= e!72983 Unit!6821)))

(declare-fun d!35092 () Bool)

(assert (=> d!35092 e!72984))

(declare-fun res!91838 () Bool)

(assert (=> d!35092 (=> (not res!91838) (not e!72984))))

(assert (=> d!35092 (= res!91838 (isPrefixOf!0 (_1!4871 lt!168801) (_2!4871 lt!168801)))))

(declare-fun lt!168797 () BitStream!4098)

(assert (=> d!35092 (= lt!168801 (tuple2!9229 lt!168797 (_2!4870 lt!168500)))))

(declare-fun lt!168796 () Unit!6792)

(declare-fun lt!168805 () Unit!6792)

(assert (=> d!35092 (= lt!168796 lt!168805)))

(assert (=> d!35092 (isPrefixOf!0 lt!168797 (_2!4870 lt!168500))))

(assert (=> d!35092 (= lt!168805 (lemmaIsPrefixTransitive!0 lt!168797 (_2!4870 lt!168500) (_2!4870 lt!168500)))))

(declare-fun lt!168793 () Unit!6792)

(declare-fun lt!168802 () Unit!6792)

(assert (=> d!35092 (= lt!168793 lt!168802)))

(assert (=> d!35092 (isPrefixOf!0 lt!168797 (_2!4870 lt!168500))))

(assert (=> d!35092 (= lt!168802 (lemmaIsPrefixTransitive!0 lt!168797 (_2!4870 lt!167696) (_2!4870 lt!168500)))))

(declare-fun lt!168803 () Unit!6792)

(assert (=> d!35092 (= lt!168803 e!72983)))

(declare-fun c!6763 () Bool)

(assert (=> d!35092 (= c!6763 (not (= (size!2312 (buf!2709 (_2!4870 lt!167696))) #b00000000000000000000000000000000)))))

(declare-fun lt!168789 () Unit!6792)

(declare-fun lt!168799 () Unit!6792)

(assert (=> d!35092 (= lt!168789 lt!168799)))

(assert (=> d!35092 (isPrefixOf!0 (_2!4870 lt!168500) (_2!4870 lt!168500))))

(assert (=> d!35092 (= lt!168799 (lemmaIsPrefixRefl!0 (_2!4870 lt!168500)))))

(declare-fun lt!168800 () Unit!6792)

(declare-fun lt!168788 () Unit!6792)

(assert (=> d!35092 (= lt!168800 lt!168788)))

(assert (=> d!35092 (= lt!168788 (lemmaIsPrefixRefl!0 (_2!4870 lt!168500)))))

(declare-fun lt!168790 () Unit!6792)

(declare-fun lt!168794 () Unit!6792)

(assert (=> d!35092 (= lt!168790 lt!168794)))

(assert (=> d!35092 (isPrefixOf!0 lt!168797 lt!168797)))

(assert (=> d!35092 (= lt!168794 (lemmaIsPrefixRefl!0 lt!168797))))

(declare-fun lt!168798 () Unit!6792)

(declare-fun lt!168792 () Unit!6792)

(assert (=> d!35092 (= lt!168798 lt!168792)))

(assert (=> d!35092 (isPrefixOf!0 (_2!4870 lt!167696) (_2!4870 lt!167696))))

(assert (=> d!35092 (= lt!168792 (lemmaIsPrefixRefl!0 (_2!4870 lt!167696)))))

(assert (=> d!35092 (= lt!168797 (BitStream!4099 (buf!2709 (_2!4870 lt!168500)) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))))))

(assert (=> d!35092 (isPrefixOf!0 (_2!4870 lt!167696) (_2!4870 lt!168500))))

(assert (=> d!35092 (= (reader!0 (_2!4870 lt!167696) (_2!4870 lt!168500)) lt!168801)))

(declare-fun lt!168795 () (_ BitVec 64))

(declare-fun b!111244 () Bool)

(declare-fun lt!168804 () (_ BitVec 64))

(assert (=> b!111244 (= e!72984 (= (_1!4871 lt!168801) (withMovedBitIndex!0 (_2!4871 lt!168801) (bvsub lt!168795 lt!168804))))))

(assert (=> b!111244 (or (= (bvand lt!168795 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168804 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168795 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168795 lt!168804) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111244 (= lt!168804 (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168500))) (currentByte!5266 (_2!4870 lt!168500)) (currentBit!5261 (_2!4870 lt!168500))))))

(assert (=> b!111244 (= lt!168795 (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))))))

(declare-fun b!111245 () Bool)

(declare-fun lt!168806 () Unit!6792)

(assert (=> b!111245 (= e!72983 lt!168806)))

(declare-fun lt!168791 () (_ BitVec 64))

(assert (=> b!111245 (= lt!168791 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!168787 () (_ BitVec 64))

(assert (=> b!111245 (= lt!168787 (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))))))

(assert (=> b!111245 (= lt!168806 (arrayBitRangesEqSymmetric!0 (buf!2709 (_2!4870 lt!167696)) (buf!2709 (_2!4870 lt!168500)) lt!168791 lt!168787))))

(assert (=> b!111245 (arrayBitRangesEq!0 (buf!2709 (_2!4870 lt!168500)) (buf!2709 (_2!4870 lt!167696)) lt!168791 lt!168787)))

(declare-fun b!111246 () Bool)

(declare-fun res!91839 () Bool)

(assert (=> b!111246 (=> (not res!91839) (not e!72984))))

(assert (=> b!111246 (= res!91839 (isPrefixOf!0 (_1!4871 lt!168801) (_2!4870 lt!167696)))))

(assert (= (and d!35092 c!6763) b!111245))

(assert (= (and d!35092 (not c!6763)) b!111243))

(assert (= (and d!35092 res!91838) b!111246))

(assert (= (and b!111246 res!91839) b!111242))

(assert (= (and b!111242 res!91840) b!111244))

(declare-fun m!165337 () Bool)

(assert (=> d!35092 m!165337))

(assert (=> d!35092 m!165099))

(declare-fun m!165339 () Bool)

(assert (=> d!35092 m!165339))

(declare-fun m!165341 () Bool)

(assert (=> d!35092 m!165341))

(declare-fun m!165343 () Bool)

(assert (=> d!35092 m!165343))

(assert (=> d!35092 m!165107))

(assert (=> d!35092 m!165307))

(assert (=> d!35092 m!165309))

(declare-fun m!165345 () Bool)

(assert (=> d!35092 m!165345))

(declare-fun m!165347 () Bool)

(assert (=> d!35092 m!165347))

(declare-fun m!165349 () Bool)

(assert (=> d!35092 m!165349))

(assert (=> b!111245 m!164405))

(declare-fun m!165351 () Bool)

(assert (=> b!111245 m!165351))

(declare-fun m!165353 () Bool)

(assert (=> b!111245 m!165353))

(declare-fun m!165355 () Bool)

(assert (=> b!111246 m!165355))

(declare-fun m!165357 () Bool)

(assert (=> b!111242 m!165357))

(declare-fun m!165359 () Bool)

(assert (=> b!111244 m!165359))

(assert (=> b!111244 m!165025))

(assert (=> b!111244 m!164405))

(assert (=> b!111102 d!35092))

(declare-fun d!35094 () Bool)

(declare-fun e!72985 () Bool)

(assert (=> d!35094 e!72985))

(declare-fun res!91841 () Bool)

(assert (=> d!35094 (=> (not res!91841) (not e!72985))))

(declare-fun lt!168807 () BitStream!4098)

(declare-fun lt!168808 () (_ BitVec 64))

(assert (=> d!35094 (= res!91841 (= (bvadd lt!168808 (bvsub (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168524))) (currentByte!5266 (_2!4870 lt!168524)) (currentBit!5261 (_2!4870 lt!168524))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168500))) (currentByte!5266 (_2!4870 lt!168500)) (currentBit!5261 (_2!4870 lt!168500))))) (bitIndex!0 (size!2312 (buf!2709 lt!168807)) (currentByte!5266 lt!168807) (currentBit!5261 lt!168807))))))

(assert (=> d!35094 (or (not (= (bvand lt!168808 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168524))) (currentByte!5266 (_2!4870 lt!168524)) (currentBit!5261 (_2!4870 lt!168524))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168500))) (currentByte!5266 (_2!4870 lt!168500)) (currentBit!5261 (_2!4870 lt!168500)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!168808 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!168808 (bvsub (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168524))) (currentByte!5266 (_2!4870 lt!168524)) (currentBit!5261 (_2!4870 lt!168524))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168500))) (currentByte!5266 (_2!4870 lt!168500)) (currentBit!5261 (_2!4870 lt!168500))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35094 (= lt!168808 (bitIndex!0 (size!2312 (buf!2709 (_2!4871 lt!168538))) (currentByte!5266 (_2!4871 lt!168538)) (currentBit!5261 (_2!4871 lt!168538))))))

(assert (=> d!35094 (= lt!168807 (_2!4870 (moveBitIndex!0 (_2!4871 lt!168538) (bvsub (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168524))) (currentByte!5266 (_2!4870 lt!168524)) (currentBit!5261 (_2!4870 lt!168524))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168500))) (currentByte!5266 (_2!4870 lt!168500)) (currentBit!5261 (_2!4870 lt!168500)))))))))

(assert (=> d!35094 (moveBitIndexPrecond!0 (_2!4871 lt!168538) (bvsub (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168524))) (currentByte!5266 (_2!4870 lt!168524)) (currentBit!5261 (_2!4870 lt!168524))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168500))) (currentByte!5266 (_2!4870 lt!168500)) (currentBit!5261 (_2!4870 lt!168500)))))))

(assert (=> d!35094 (= (withMovedBitIndex!0 (_2!4871 lt!168538) (bvsub (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168524))) (currentByte!5266 (_2!4870 lt!168524)) (currentBit!5261 (_2!4870 lt!168524))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168500))) (currentByte!5266 (_2!4870 lt!168500)) (currentBit!5261 (_2!4870 lt!168500))))) lt!168807)))

(declare-fun b!111247 () Bool)

(assert (=> b!111247 (= e!72985 (= (size!2312 (buf!2709 (_2!4871 lt!168538))) (size!2312 (buf!2709 lt!168807))))))

(assert (= (and d!35094 res!91841) b!111247))

(declare-fun m!165361 () Bool)

(assert (=> d!35094 m!165361))

(declare-fun m!165363 () Bool)

(assert (=> d!35094 m!165363))

(declare-fun m!165365 () Bool)

(assert (=> d!35094 m!165365))

(declare-fun m!165367 () Bool)

(assert (=> d!35094 m!165367))

(assert (=> b!111102 d!35094))

(declare-fun d!35096 () Bool)

(assert (=> d!35096 (validate_offset_bits!1 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168500)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!168524))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!168524))) lt!168514)))

(declare-fun lt!168809 () Unit!6792)

(assert (=> d!35096 (= lt!168809 (choose!9 (_2!4870 lt!168524) (buf!2709 (_2!4870 lt!168500)) lt!168514 (BitStream!4099 (buf!2709 (_2!4870 lt!168500)) (currentByte!5266 (_2!4870 lt!168524)) (currentBit!5261 (_2!4870 lt!168524)))))))

(assert (=> d!35096 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4870 lt!168524) (buf!2709 (_2!4870 lt!168500)) lt!168514) lt!168809)))

(declare-fun bs!8596 () Bool)

(assert (= bs!8596 d!35096))

(assert (=> bs!8596 m!164995))

(declare-fun m!165369 () Bool)

(assert (=> bs!8596 m!165369))

(assert (=> b!111102 d!35096))

(declare-fun d!35098 () Bool)

(declare-fun e!72986 () Bool)

(assert (=> d!35098 e!72986))

(declare-fun res!91842 () Bool)

(assert (=> d!35098 (=> (not res!91842) (not e!72986))))

(declare-fun lt!168810 () BitStream!4098)

(declare-fun lt!168811 () (_ BitVec 64))

(assert (=> d!35098 (= res!91842 (= (bvadd lt!168811 (bvsub (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168500))) (currentByte!5266 (_2!4870 lt!168500)) (currentBit!5261 (_2!4870 lt!168500))))) (bitIndex!0 (size!2312 (buf!2709 lt!168810)) (currentByte!5266 lt!168810) (currentBit!5261 lt!168810))))))

(assert (=> d!35098 (or (not (= (bvand lt!168811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168500))) (currentByte!5266 (_2!4870 lt!168500)) (currentBit!5261 (_2!4870 lt!168500)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!168811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!168811 (bvsub (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168500))) (currentByte!5266 (_2!4870 lt!168500)) (currentBit!5261 (_2!4870 lt!168500))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35098 (= lt!168811 (bitIndex!0 (size!2312 (buf!2709 (_2!4871 lt!168515))) (currentByte!5266 (_2!4871 lt!168515)) (currentBit!5261 (_2!4871 lt!168515))))))

(assert (=> d!35098 (= lt!168810 (_2!4870 (moveBitIndex!0 (_2!4871 lt!168515) (bvsub (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168500))) (currentByte!5266 (_2!4870 lt!168500)) (currentBit!5261 (_2!4870 lt!168500)))))))))

(assert (=> d!35098 (moveBitIndexPrecond!0 (_2!4871 lt!168515) (bvsub (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168500))) (currentByte!5266 (_2!4870 lt!168500)) (currentBit!5261 (_2!4870 lt!168500)))))))

(assert (=> d!35098 (= (withMovedBitIndex!0 (_2!4871 lt!168515) (bvsub (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168500))) (currentByte!5266 (_2!4870 lt!168500)) (currentBit!5261 (_2!4870 lt!168500))))) lt!168810)))

(declare-fun b!111248 () Bool)

(assert (=> b!111248 (= e!72986 (= (size!2312 (buf!2709 (_2!4871 lt!168515))) (size!2312 (buf!2709 lt!168810))))))

(assert (= (and d!35098 res!91842) b!111248))

(declare-fun m!165371 () Bool)

(assert (=> d!35098 m!165371))

(declare-fun m!165373 () Bool)

(assert (=> d!35098 m!165373))

(declare-fun m!165375 () Bool)

(assert (=> d!35098 m!165375))

(declare-fun m!165377 () Bool)

(assert (=> d!35098 m!165377))

(assert (=> b!111102 d!35098))

(declare-fun d!35100 () Bool)

(assert (=> d!35100 (= (invariant!0 (currentBit!5261 lt!168499) (currentByte!5266 lt!168499) (size!2312 (buf!2709 (_2!4870 lt!168500)))) (and (bvsge (currentBit!5261 lt!168499) #b00000000000000000000000000000000) (bvslt (currentBit!5261 lt!168499) #b00000000000000000000000000001000) (bvsge (currentByte!5266 lt!168499) #b00000000000000000000000000000000) (or (bvslt (currentByte!5266 lt!168499) (size!2312 (buf!2709 (_2!4870 lt!168500)))) (and (= (currentBit!5261 lt!168499) #b00000000000000000000000000000000) (= (currentByte!5266 lt!168499) (size!2312 (buf!2709 (_2!4870 lt!168500))))))))))

(assert (=> b!111102 d!35100))

(declare-fun d!35102 () Bool)

(declare-fun e!72987 () Bool)

(assert (=> d!35102 e!72987))

(declare-fun res!91843 () Bool)

(assert (=> d!35102 (=> (not res!91843) (not e!72987))))

(declare-fun lt!168813 () tuple2!9224)

(declare-fun lt!168812 () tuple2!9224)

(assert (=> d!35102 (= res!91843 (= (bitIndex!0 (size!2312 (buf!2709 (_1!4869 lt!168813))) (currentByte!5266 (_1!4869 lt!168813)) (currentBit!5261 (_1!4869 lt!168813))) (bitIndex!0 (size!2312 (buf!2709 (_1!4869 lt!168812))) (currentByte!5266 (_1!4869 lt!168812)) (currentBit!5261 (_1!4869 lt!168812)))))))

(declare-fun lt!168815 () BitStream!4098)

(declare-fun lt!168814 () Unit!6792)

(assert (=> d!35102 (= lt!168814 (choose!50 lt!168499 (_2!4870 lt!168500) lt!168815 lt!168813 (tuple2!9225 (_1!4869 lt!168813) (_2!4869 lt!168813)) (_1!4869 lt!168813) (_2!4869 lt!168813) lt!168812 (tuple2!9225 (_1!4869 lt!168812) (_2!4869 lt!168812)) (_1!4869 lt!168812) (_2!4869 lt!168812)))))

(assert (=> d!35102 (= lt!168812 (readBitPure!0 lt!168815))))

(assert (=> d!35102 (= lt!168813 (readBitPure!0 lt!168499))))

(assert (=> d!35102 (= lt!168815 (BitStream!4099 (buf!2709 (_2!4870 lt!168500)) (currentByte!5266 lt!168499) (currentBit!5261 lt!168499)))))

(assert (=> d!35102 (invariant!0 (currentBit!5261 lt!168499) (currentByte!5266 lt!168499) (size!2312 (buf!2709 (_2!4870 lt!168500))))))

(assert (=> d!35102 (= (readBitPrefixLemma!0 lt!168499 (_2!4870 lt!168500)) lt!168814)))

(declare-fun b!111249 () Bool)

(assert (=> b!111249 (= e!72987 (= (_2!4869 lt!168813) (_2!4869 lt!168812)))))

(assert (= (and d!35102 res!91843) b!111249))

(declare-fun m!165379 () Bool)

(assert (=> d!35102 m!165379))

(declare-fun m!165381 () Bool)

(assert (=> d!35102 m!165381))

(assert (=> d!35102 m!165017))

(assert (=> d!35102 m!165027))

(declare-fun m!165383 () Bool)

(assert (=> d!35102 m!165383))

(declare-fun m!165385 () Bool)

(assert (=> d!35102 m!165385))

(assert (=> b!111102 d!35102))

(declare-fun d!35104 () Bool)

(declare-fun lt!168816 () tuple2!9248)

(assert (=> d!35104 (= lt!168816 (readBit!0 lt!168535))))

(assert (=> d!35104 (= (readBitPure!0 lt!168535) (tuple2!9225 (_2!4881 lt!168816) (_1!4881 lt!168816)))))

(declare-fun bs!8597 () Bool)

(assert (= bs!8597 d!35104))

(declare-fun m!165387 () Bool)

(assert (=> bs!8597 m!165387))

(assert (=> b!111102 d!35104))

(declare-fun lt!168817 () tuple2!9250)

(declare-fun d!35106 () Bool)

(assert (=> d!35106 (= lt!168817 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4871 lt!168515) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!168521 e!72888)))))

(assert (=> d!35106 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4871 lt!168515) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!168521 e!72888)) (tuple2!9231 (_2!4882 lt!168817) (_1!4882 lt!168817)))))

(declare-fun bs!8598 () Bool)

(assert (= bs!8598 d!35106))

(assert (=> bs!8598 m!165019))

(declare-fun m!165389 () Bool)

(assert (=> bs!8598 m!165389))

(assert (=> b!111102 d!35106))

(declare-fun d!35108 () Bool)

(declare-fun e!72988 () Bool)

(assert (=> d!35108 e!72988))

(declare-fun res!91845 () Bool)

(assert (=> d!35108 (=> (not res!91845) (not e!72988))))

(declare-fun lt!168819 () (_ BitVec 64))

(declare-fun lt!168821 () (_ BitVec 64))

(declare-fun lt!168820 () (_ BitVec 64))

(assert (=> d!35108 (= res!91845 (= lt!168819 (bvsub lt!168820 lt!168821)))))

(assert (=> d!35108 (or (= (bvand lt!168820 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168821 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168820 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168820 lt!168821) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35108 (= lt!168821 (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168524)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!168524))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!168524)))))))

(declare-fun lt!168822 () (_ BitVec 64))

(declare-fun lt!168823 () (_ BitVec 64))

(assert (=> d!35108 (= lt!168820 (bvmul lt!168822 lt!168823))))

(assert (=> d!35108 (or (= lt!168822 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!168823 (bvsdiv (bvmul lt!168822 lt!168823) lt!168822)))))

(assert (=> d!35108 (= lt!168823 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35108 (= lt!168822 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168524)))))))

(assert (=> d!35108 (= lt!168819 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!168524))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!168524)))))))

(assert (=> d!35108 (invariant!0 (currentBit!5261 (_2!4870 lt!168524)) (currentByte!5266 (_2!4870 lt!168524)) (size!2312 (buf!2709 (_2!4870 lt!168524))))))

(assert (=> d!35108 (= (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168524))) (currentByte!5266 (_2!4870 lt!168524)) (currentBit!5261 (_2!4870 lt!168524))) lt!168819)))

(declare-fun b!111250 () Bool)

(declare-fun res!91844 () Bool)

(assert (=> b!111250 (=> (not res!91844) (not e!72988))))

(assert (=> b!111250 (= res!91844 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!168819))))

(declare-fun b!111251 () Bool)

(declare-fun lt!168818 () (_ BitVec 64))

(assert (=> b!111251 (= e!72988 (bvsle lt!168819 (bvmul lt!168818 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111251 (or (= lt!168818 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!168818 #b0000000000000000000000000000000000000000000000000000000000001000) lt!168818)))))

(assert (=> b!111251 (= lt!168818 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168524)))))))

(assert (= (and d!35108 res!91845) b!111250))

(assert (= (and b!111250 res!91844) b!111251))

(declare-fun m!165391 () Bool)

(assert (=> d!35108 m!165391))

(declare-fun m!165393 () Bool)

(assert (=> d!35108 m!165393))

(assert (=> b!111102 d!35108))

(declare-fun d!35110 () Bool)

(assert (=> d!35110 (validate_offset_bits!1 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168500)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!167696))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!167696))) lt!168501)))

(declare-fun lt!168824 () Unit!6792)

(assert (=> d!35110 (= lt!168824 (choose!9 (_2!4870 lt!167696) (buf!2709 (_2!4870 lt!168500)) lt!168501 (BitStream!4099 (buf!2709 (_2!4870 lt!168500)) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696)))))))

(assert (=> d!35110 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4870 lt!167696) (buf!2709 (_2!4870 lt!168500)) lt!168501) lt!168824)))

(declare-fun bs!8599 () Bool)

(assert (= bs!8599 d!35110))

(assert (=> bs!8599 m!165005))

(declare-fun m!165395 () Bool)

(assert (=> bs!8599 m!165395))

(assert (=> b!111102 d!35110))

(declare-fun d!35112 () Bool)

(declare-fun e!72989 () Bool)

(assert (=> d!35112 e!72989))

(declare-fun res!91847 () Bool)

(assert (=> d!35112 (=> (not res!91847) (not e!72989))))

(declare-fun lt!168828 () (_ BitVec 64))

(declare-fun lt!168827 () (_ BitVec 64))

(declare-fun lt!168826 () (_ BitVec 64))

(assert (=> d!35112 (= res!91847 (= lt!168826 (bvsub lt!168827 lt!168828)))))

(assert (=> d!35112 (or (= (bvand lt!168827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168828 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168827 lt!168828) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35112 (= lt!168828 (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168500)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!168500))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!168500)))))))

(declare-fun lt!168829 () (_ BitVec 64))

(declare-fun lt!168830 () (_ BitVec 64))

(assert (=> d!35112 (= lt!168827 (bvmul lt!168829 lt!168830))))

(assert (=> d!35112 (or (= lt!168829 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!168830 (bvsdiv (bvmul lt!168829 lt!168830) lt!168829)))))

(assert (=> d!35112 (= lt!168830 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35112 (= lt!168829 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168500)))))))

(assert (=> d!35112 (= lt!168826 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!168500))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!168500)))))))

(assert (=> d!35112 (invariant!0 (currentBit!5261 (_2!4870 lt!168500)) (currentByte!5266 (_2!4870 lt!168500)) (size!2312 (buf!2709 (_2!4870 lt!168500))))))

(assert (=> d!35112 (= (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168500))) (currentByte!5266 (_2!4870 lt!168500)) (currentBit!5261 (_2!4870 lt!168500))) lt!168826)))

(declare-fun b!111252 () Bool)

(declare-fun res!91846 () Bool)

(assert (=> b!111252 (=> (not res!91846) (not e!72989))))

(assert (=> b!111252 (= res!91846 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!168826))))

(declare-fun b!111253 () Bool)

(declare-fun lt!168825 () (_ BitVec 64))

(assert (=> b!111253 (= e!72989 (bvsle lt!168826 (bvmul lt!168825 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111253 (or (= lt!168825 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!168825 #b0000000000000000000000000000000000000000000000000000000000001000) lt!168825)))))

(assert (=> b!111253 (= lt!168825 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168500)))))))

(assert (= (and d!35112 res!91847) b!111252))

(assert (= (and b!111252 res!91846) b!111253))

(declare-fun m!165397 () Bool)

(assert (=> d!35112 m!165397))

(declare-fun m!165399 () Bool)

(assert (=> d!35112 m!165399))

(assert (=> b!111102 d!35112))

(assert (=> b!111102 d!34918))

(declare-fun d!35114 () Bool)

(declare-fun e!72990 () Bool)

(assert (=> d!35114 e!72990))

(declare-fun res!91849 () Bool)

(assert (=> d!35114 (=> (not res!91849) (not e!72990))))

(declare-fun lt!168834 () (_ BitVec 64))

(declare-fun lt!168833 () (_ BitVec 64))

(declare-fun lt!168832 () (_ BitVec 64))

(assert (=> d!35114 (= res!91849 (= lt!168832 (bvsub lt!168833 lt!168834)))))

(assert (=> d!35114 (or (= (bvand lt!168833 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168834 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168833 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168833 lt!168834) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35114 (= lt!168834 (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!168529)))) ((_ sign_extend 32) (currentByte!5266 (_1!4869 lt!168529))) ((_ sign_extend 32) (currentBit!5261 (_1!4869 lt!168529)))))))

(declare-fun lt!168835 () (_ BitVec 64))

(declare-fun lt!168836 () (_ BitVec 64))

(assert (=> d!35114 (= lt!168833 (bvmul lt!168835 lt!168836))))

(assert (=> d!35114 (or (= lt!168835 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!168836 (bvsdiv (bvmul lt!168835 lt!168836) lt!168835)))))

(assert (=> d!35114 (= lt!168836 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35114 (= lt!168835 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!168529)))))))

(assert (=> d!35114 (= lt!168832 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5266 (_1!4869 lt!168529))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5261 (_1!4869 lt!168529)))))))

(assert (=> d!35114 (invariant!0 (currentBit!5261 (_1!4869 lt!168529)) (currentByte!5266 (_1!4869 lt!168529)) (size!2312 (buf!2709 (_1!4869 lt!168529))))))

(assert (=> d!35114 (= (bitIndex!0 (size!2312 (buf!2709 (_1!4869 lt!168529))) (currentByte!5266 (_1!4869 lt!168529)) (currentBit!5261 (_1!4869 lt!168529))) lt!168832)))

(declare-fun b!111254 () Bool)

(declare-fun res!91848 () Bool)

(assert (=> b!111254 (=> (not res!91848) (not e!72990))))

(assert (=> b!111254 (= res!91848 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!168832))))

(declare-fun b!111255 () Bool)

(declare-fun lt!168831 () (_ BitVec 64))

(assert (=> b!111255 (= e!72990 (bvsle lt!168832 (bvmul lt!168831 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111255 (or (= lt!168831 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!168831 #b0000000000000000000000000000000000000000000000000000000000001000) lt!168831)))))

(assert (=> b!111255 (= lt!168831 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!168529)))))))

(assert (= (and d!35114 res!91849) b!111254))

(assert (= (and b!111254 res!91848) b!111255))

(declare-fun m!165401 () Bool)

(assert (=> d!35114 m!165401))

(declare-fun m!165403 () Bool)

(assert (=> d!35114 m!165403))

(assert (=> b!111102 d!35114))

(declare-fun b!111257 () Bool)

(declare-fun res!91851 () Bool)

(declare-fun e!72991 () Bool)

(assert (=> b!111257 (=> (not res!91851) (not e!72991))))

(declare-fun lt!168838 () tuple2!9226)

(assert (=> b!111257 (= res!91851 (isPrefixOf!0 (_2!4870 lt!167696) (_2!4870 lt!168838)))))

(declare-fun b!111256 () Bool)

(declare-fun res!91852 () Bool)

(assert (=> b!111256 (=> (not res!91852) (not e!72991))))

(declare-fun lt!168839 () (_ BitVec 64))

(declare-fun lt!168837 () (_ BitVec 64))

(assert (=> b!111256 (= res!91852 (= (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168838))) (currentByte!5266 (_2!4870 lt!168838)) (currentBit!5261 (_2!4870 lt!168838))) (bvadd lt!168837 lt!168839)))))

(assert (=> b!111256 (or (not (= (bvand lt!168837 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168839 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!168837 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!168837 lt!168839) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111256 (= lt!168839 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!111256 (= lt!168837 (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))))))

(declare-fun b!111259 () Bool)

(declare-fun e!72992 () Bool)

(declare-fun lt!168840 () tuple2!9224)

(assert (=> b!111259 (= e!72992 (= (bitIndex!0 (size!2312 (buf!2709 (_1!4869 lt!168840))) (currentByte!5266 (_1!4869 lt!168840)) (currentBit!5261 (_1!4869 lt!168840))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168838))) (currentByte!5266 (_2!4870 lt!168838)) (currentBit!5261 (_2!4870 lt!168838)))))))

(declare-fun d!35116 () Bool)

(assert (=> d!35116 e!72991))

(declare-fun res!91853 () Bool)

(assert (=> d!35116 (=> (not res!91853) (not e!72991))))

(assert (=> d!35116 (= res!91853 (= (size!2312 (buf!2709 (_2!4870 lt!167696))) (size!2312 (buf!2709 (_2!4870 lt!168838)))))))

(assert (=> d!35116 (= lt!168838 (choose!16 (_2!4870 lt!167696) lt!168528))))

(assert (=> d!35116 (validate_offset_bit!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!167696)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!167696))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!167696))))))

(assert (=> d!35116 (= (appendBit!0 (_2!4870 lt!167696) lt!168528) lt!168838)))

(declare-fun b!111258 () Bool)

(assert (=> b!111258 (= e!72991 e!72992)))

(declare-fun res!91850 () Bool)

(assert (=> b!111258 (=> (not res!91850) (not e!72992))))

(assert (=> b!111258 (= res!91850 (and (= (_2!4869 lt!168840) lt!168528) (= (_1!4869 lt!168840) (_2!4870 lt!168838))))))

(assert (=> b!111258 (= lt!168840 (readBitPure!0 (readerFrom!0 (_2!4870 lt!168838) (currentBit!5261 (_2!4870 lt!167696)) (currentByte!5266 (_2!4870 lt!167696)))))))

(assert (= (and d!35116 res!91853) b!111256))

(assert (= (and b!111256 res!91852) b!111257))

(assert (= (and b!111257 res!91851) b!111258))

(assert (= (and b!111258 res!91850) b!111259))

(declare-fun m!165405 () Bool)

(assert (=> b!111256 m!165405))

(assert (=> b!111256 m!164405))

(declare-fun m!165407 () Bool)

(assert (=> d!35116 m!165407))

(declare-fun m!165409 () Bool)

(assert (=> d!35116 m!165409))

(declare-fun m!165411 () Bool)

(assert (=> b!111259 m!165411))

(assert (=> b!111259 m!165405))

(declare-fun m!165413 () Bool)

(assert (=> b!111258 m!165413))

(assert (=> b!111258 m!165413))

(declare-fun m!165415 () Bool)

(assert (=> b!111258 m!165415))

(declare-fun m!165417 () Bool)

(assert (=> b!111257 m!165417))

(assert (=> b!111102 d!35116))

(declare-fun d!35118 () Bool)

(declare-fun e!72993 () Bool)

(assert (=> d!35118 e!72993))

(declare-fun res!91855 () Bool)

(assert (=> d!35118 (=> (not res!91855) (not e!72993))))

(declare-fun lt!168843 () (_ BitVec 64))

(declare-fun lt!168844 () (_ BitVec 64))

(declare-fun lt!168842 () (_ BitVec 64))

(assert (=> d!35118 (= res!91855 (= lt!168842 (bvsub lt!168843 lt!168844)))))

(assert (=> d!35118 (or (= (bvand lt!168843 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168844 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168843 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168843 lt!168844) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35118 (= lt!168844 (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!168504)))) ((_ sign_extend 32) (currentByte!5266 (_1!4869 lt!168504))) ((_ sign_extend 32) (currentBit!5261 (_1!4869 lt!168504)))))))

(declare-fun lt!168845 () (_ BitVec 64))

(declare-fun lt!168846 () (_ BitVec 64))

(assert (=> d!35118 (= lt!168843 (bvmul lt!168845 lt!168846))))

(assert (=> d!35118 (or (= lt!168845 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!168846 (bvsdiv (bvmul lt!168845 lt!168846) lt!168845)))))

(assert (=> d!35118 (= lt!168846 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35118 (= lt!168845 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!168504)))))))

(assert (=> d!35118 (= lt!168842 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5266 (_1!4869 lt!168504))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5261 (_1!4869 lt!168504)))))))

(assert (=> d!35118 (invariant!0 (currentBit!5261 (_1!4869 lt!168504)) (currentByte!5266 (_1!4869 lt!168504)) (size!2312 (buf!2709 (_1!4869 lt!168504))))))

(assert (=> d!35118 (= (bitIndex!0 (size!2312 (buf!2709 (_1!4869 lt!168504))) (currentByte!5266 (_1!4869 lt!168504)) (currentBit!5261 (_1!4869 lt!168504))) lt!168842)))

(declare-fun b!111260 () Bool)

(declare-fun res!91854 () Bool)

(assert (=> b!111260 (=> (not res!91854) (not e!72993))))

(assert (=> b!111260 (= res!91854 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!168842))))

(declare-fun b!111261 () Bool)

(declare-fun lt!168841 () (_ BitVec 64))

(assert (=> b!111261 (= e!72993 (bvsle lt!168842 (bvmul lt!168841 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111261 (or (= lt!168841 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!168841 #b0000000000000000000000000000000000000000000000000000000000001000) lt!168841)))))

(assert (=> b!111261 (= lt!168841 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!168504)))))))

(assert (= (and d!35118 res!91855) b!111260))

(assert (= (and b!111260 res!91854) b!111261))

(declare-fun m!165419 () Bool)

(assert (=> d!35118 m!165419))

(declare-fun m!165421 () Bool)

(assert (=> d!35118 m!165421))

(assert (=> b!111102 d!35118))

(declare-fun d!35120 () Bool)

(declare-fun lt!168847 () tuple2!9248)

(assert (=> d!35120 (= lt!168847 (readBit!0 lt!168499))))

(assert (=> d!35120 (= (readBitPure!0 lt!168499) (tuple2!9225 (_2!4881 lt!168847) (_1!4881 lt!168847)))))

(declare-fun bs!8600 () Bool)

(assert (= bs!8600 d!35120))

(declare-fun m!165423 () Bool)

(assert (=> bs!8600 m!165423))

(assert (=> b!111102 d!35120))

(declare-fun d!35122 () Bool)

(declare-fun lt!168848 () tuple2!9248)

(assert (=> d!35122 (= lt!168848 (readBit!0 (_1!4871 lt!168515)))))

(assert (=> d!35122 (= (readBitPure!0 (_1!4871 lt!168515)) (tuple2!9225 (_2!4881 lt!168848) (_1!4881 lt!168848)))))

(declare-fun bs!8601 () Bool)

(assert (= bs!8601 d!35122))

(declare-fun m!165425 () Bool)

(assert (=> bs!8601 m!165425))

(assert (=> b!111102 d!35122))

(declare-fun d!35124 () Bool)

(assert (=> d!35124 (= (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!111102 d!35124))

(declare-fun d!35126 () Bool)

(assert (=> d!35126 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168500)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!168524))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!168524))) lt!168514) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168500)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!168524))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!168524)))) lt!168514))))

(declare-fun bs!8602 () Bool)

(assert (= bs!8602 d!35126))

(declare-fun m!165427 () Bool)

(assert (=> bs!8602 m!165427))

(assert (=> b!111102 d!35126))

(declare-fun d!35128 () Bool)

(assert (=> d!35128 (isPrefixOf!0 (_2!4870 lt!167696) (_2!4870 lt!168500))))

(declare-fun lt!168849 () Unit!6792)

(assert (=> d!35128 (= lt!168849 (choose!30 (_2!4870 lt!167696) (_2!4870 lt!168524) (_2!4870 lt!168500)))))

(assert (=> d!35128 (isPrefixOf!0 (_2!4870 lt!167696) (_2!4870 lt!168524))))

(assert (=> d!35128 (= (lemmaIsPrefixTransitive!0 (_2!4870 lt!167696) (_2!4870 lt!168524) (_2!4870 lt!168500)) lt!168849)))

(declare-fun bs!8603 () Bool)

(assert (= bs!8603 d!35128))

(assert (=> bs!8603 m!165343))

(declare-fun m!165429 () Bool)

(assert (=> bs!8603 m!165429))

(declare-fun m!165431 () Bool)

(assert (=> bs!8603 m!165431))

(assert (=> b!111102 d!35128))

(declare-fun d!35130 () Bool)

(declare-fun e!72994 () Bool)

(assert (=> d!35130 e!72994))

(declare-fun res!91856 () Bool)

(assert (=> d!35130 (=> (not res!91856) (not e!72994))))

(declare-fun lt!168851 () (_ BitVec 64))

(declare-fun lt!168850 () BitStream!4098)

(assert (=> d!35130 (= res!91856 (= (bvadd lt!168851 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2312 (buf!2709 lt!168850)) (currentByte!5266 lt!168850) (currentBit!5261 lt!168850))))))

(assert (=> d!35130 (or (not (= (bvand lt!168851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!168851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!168851 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35130 (= lt!168851 (bitIndex!0 (size!2312 (buf!2709 (_1!4871 lt!168515))) (currentByte!5266 (_1!4871 lt!168515)) (currentBit!5261 (_1!4871 lt!168515))))))

(assert (=> d!35130 (= lt!168850 (_2!4870 (moveBitIndex!0 (_1!4871 lt!168515) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!35130 (moveBitIndexPrecond!0 (_1!4871 lt!168515) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!35130 (= (withMovedBitIndex!0 (_1!4871 lt!168515) #b0000000000000000000000000000000000000000000000000000000000000001) lt!168850)))

(declare-fun b!111262 () Bool)

(assert (=> b!111262 (= e!72994 (= (size!2312 (buf!2709 (_1!4871 lt!168515))) (size!2312 (buf!2709 lt!168850))))))

(assert (= (and d!35130 res!91856) b!111262))

(declare-fun m!165433 () Bool)

(assert (=> d!35130 m!165433))

(declare-fun m!165435 () Bool)

(assert (=> d!35130 m!165435))

(declare-fun m!165437 () Bool)

(assert (=> d!35130 m!165437))

(declare-fun m!165439 () Bool)

(assert (=> d!35130 m!165439))

(assert (=> b!111102 d!35130))

(declare-fun b!111263 () Bool)

(declare-fun res!91864 () Bool)

(declare-fun e!72995 () Bool)

(assert (=> b!111263 (=> (not res!91864) (not e!72995))))

(declare-fun lt!168860 () (_ BitVec 64))

(declare-fun lt!168863 () (_ BitVec 64))

(declare-fun lt!168854 () tuple2!9226)

(assert (=> b!111263 (= res!91864 (= (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168854))) (currentByte!5266 (_2!4870 lt!168854)) (currentBit!5261 (_2!4870 lt!168854))) (bvadd lt!168860 lt!168863)))))

(assert (=> b!111263 (or (not (= (bvand lt!168860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168863 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!168860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!168860 lt!168863) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111263 (= lt!168863 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(assert (=> b!111263 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!111263 (= lt!168860 (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168524))) (currentByte!5266 (_2!4870 lt!168524)) (currentBit!5261 (_2!4870 lt!168524))))))

(declare-fun b!111264 () Bool)

(declare-fun e!72996 () (_ BitVec 64))

(assert (=> b!111264 (= e!72996 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun c!6765 () Bool)

(declare-fun lt!168853 () BitStream!4098)

(declare-fun lt!168858 () tuple2!9226)

(declare-fun call!1399 () Bool)

(declare-fun bm!1396 () Bool)

(assert (=> bm!1396 (= call!1399 (isPrefixOf!0 (ite c!6765 (_2!4870 lt!168524) lt!168853) (ite c!6765 (_2!4870 lt!168858) lt!168853)))))

(declare-fun d!35132 () Bool)

(assert (=> d!35132 e!72995))

(declare-fun res!91865 () Bool)

(assert (=> d!35132 (=> (not res!91865) (not e!72995))))

(assert (=> d!35132 (= res!91865 (= (size!2312 (buf!2709 (_2!4870 lt!168524))) (size!2312 (buf!2709 (_2!4870 lt!168854)))))))

(declare-fun e!73000 () tuple2!9226)

(assert (=> d!35132 (= lt!168854 e!73000)))

(assert (=> d!35132 (= c!6765 (bvslt (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) nBits!396))))

(assert (=> d!35132 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!35132 (= (appendNLeastSignificantBitsLoop!0 (_2!4870 lt!168524) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) lt!168854)))

(declare-fun b!111265 () Bool)

(declare-fun res!91858 () Bool)

(declare-fun lt!168869 () tuple2!9226)

(assert (=> b!111265 (= res!91858 (= (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168869))) (currentByte!5266 (_2!4870 lt!168869)) (currentBit!5261 (_2!4870 lt!168869))) (bvadd (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168524))) (currentByte!5266 (_2!4870 lt!168524)) (currentBit!5261 (_2!4870 lt!168524))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!73001 () Bool)

(assert (=> b!111265 (=> (not res!91858) (not e!73001))))

(declare-fun b!111266 () Bool)

(declare-fun Unit!6822 () Unit!6792)

(assert (=> b!111266 (= e!73000 (tuple2!9227 Unit!6822 (_2!4870 lt!168858)))))

(declare-fun lt!168886 () Bool)

(assert (=> b!111266 (= lt!168886 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111266 (= lt!168869 (appendBit!0 (_2!4870 lt!168524) lt!168886))))

(declare-fun res!91863 () Bool)

(assert (=> b!111266 (= res!91863 (= (size!2312 (buf!2709 (_2!4870 lt!168524))) (size!2312 (buf!2709 (_2!4870 lt!168869)))))))

(assert (=> b!111266 (=> (not res!91863) (not e!73001))))

(assert (=> b!111266 e!73001))

(declare-fun lt!168882 () tuple2!9226)

(assert (=> b!111266 (= lt!168882 lt!168869)))

(assert (=> b!111266 (= lt!168858 (appendNLeastSignificantBitsLoop!0 (_2!4870 lt!168882) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!168888 () Unit!6792)

(assert (=> b!111266 (= lt!168888 (lemmaIsPrefixTransitive!0 (_2!4870 lt!168524) (_2!4870 lt!168882) (_2!4870 lt!168858)))))

(assert (=> b!111266 call!1399))

(declare-fun lt!168855 () Unit!6792)

(assert (=> b!111266 (= lt!168855 lt!168888)))

(assert (=> b!111266 (invariant!0 (currentBit!5261 (_2!4870 lt!168524)) (currentByte!5266 (_2!4870 lt!168524)) (size!2312 (buf!2709 (_2!4870 lt!168882))))))

(declare-fun lt!168857 () BitStream!4098)

(assert (=> b!111266 (= lt!168857 (BitStream!4099 (buf!2709 (_2!4870 lt!168882)) (currentByte!5266 (_2!4870 lt!168524)) (currentBit!5261 (_2!4870 lt!168524))))))

(assert (=> b!111266 (invariant!0 (currentBit!5261 lt!168857) (currentByte!5266 lt!168857) (size!2312 (buf!2709 (_2!4870 lt!168858))))))

(declare-fun lt!168893 () BitStream!4098)

(assert (=> b!111266 (= lt!168893 (BitStream!4099 (buf!2709 (_2!4870 lt!168858)) (currentByte!5266 lt!168857) (currentBit!5261 lt!168857)))))

(declare-fun lt!168862 () tuple2!9224)

(assert (=> b!111266 (= lt!168862 (readBitPure!0 lt!168857))))

(declare-fun lt!168887 () tuple2!9224)

(assert (=> b!111266 (= lt!168887 (readBitPure!0 lt!168893))))

(declare-fun lt!168864 () Unit!6792)

(assert (=> b!111266 (= lt!168864 (readBitPrefixLemma!0 lt!168857 (_2!4870 lt!168858)))))

(declare-fun res!91860 () Bool)

(assert (=> b!111266 (= res!91860 (= (bitIndex!0 (size!2312 (buf!2709 (_1!4869 lt!168862))) (currentByte!5266 (_1!4869 lt!168862)) (currentBit!5261 (_1!4869 lt!168862))) (bitIndex!0 (size!2312 (buf!2709 (_1!4869 lt!168887))) (currentByte!5266 (_1!4869 lt!168887)) (currentBit!5261 (_1!4869 lt!168887)))))))

(declare-fun e!72997 () Bool)

(assert (=> b!111266 (=> (not res!91860) (not e!72997))))

(assert (=> b!111266 e!72997))

(declare-fun lt!168881 () Unit!6792)

(assert (=> b!111266 (= lt!168881 lt!168864)))

(declare-fun lt!168873 () tuple2!9228)

(assert (=> b!111266 (= lt!168873 (reader!0 (_2!4870 lt!168524) (_2!4870 lt!168858)))))

(declare-fun lt!168896 () tuple2!9228)

(assert (=> b!111266 (= lt!168896 (reader!0 (_2!4870 lt!168882) (_2!4870 lt!168858)))))

(declare-fun lt!168890 () tuple2!9224)

(assert (=> b!111266 (= lt!168890 (readBitPure!0 (_1!4871 lt!168873)))))

(assert (=> b!111266 (= (_2!4869 lt!168890) lt!168886)))

(declare-fun lt!168876 () Unit!6792)

(declare-fun Unit!6823 () Unit!6792)

(assert (=> b!111266 (= lt!168876 Unit!6823)))

(declare-fun lt!168879 () (_ BitVec 64))

(assert (=> b!111266 (= lt!168879 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))))

(declare-fun lt!168859 () (_ BitVec 64))

(assert (=> b!111266 (= lt!168859 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(declare-fun lt!168892 () Unit!6792)

(assert (=> b!111266 (= lt!168892 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4870 lt!168524) (buf!2709 (_2!4870 lt!168858)) lt!168859))))

(assert (=> b!111266 (validate_offset_bits!1 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168858)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!168524))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!168524))) lt!168859)))

(declare-fun lt!168880 () Unit!6792)

(assert (=> b!111266 (= lt!168880 lt!168892)))

(declare-fun lt!168895 () tuple2!9230)

(assert (=> b!111266 (= lt!168895 (readNLeastSignificantBitsLoopPure!0 (_1!4871 lt!168873) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!168879))))

(declare-fun lt!168872 () (_ BitVec 64))

(assert (=> b!111266 (= lt!168872 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!168868 () Unit!6792)

(assert (=> b!111266 (= lt!168868 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4870 lt!168882) (buf!2709 (_2!4870 lt!168858)) lt!168872))))

(assert (=> b!111266 (validate_offset_bits!1 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168858)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!168882))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!168882))) lt!168872)))

(declare-fun lt!168894 () Unit!6792)

(assert (=> b!111266 (= lt!168894 lt!168868)))

(declare-fun lt!168889 () tuple2!9230)

(assert (=> b!111266 (= lt!168889 (readNLeastSignificantBitsLoopPure!0 (_1!4871 lt!168896) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!168879 (ite (_2!4869 lt!168890) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!168884 () tuple2!9230)

(assert (=> b!111266 (= lt!168884 (readNLeastSignificantBitsLoopPure!0 (_1!4871 lt!168873) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!168879))))

(declare-fun c!6764 () Bool)

(assert (=> b!111266 (= c!6764 (_2!4869 (readBitPure!0 (_1!4871 lt!168873))))))

(declare-fun lt!168852 () tuple2!9230)

(assert (=> b!111266 (= lt!168852 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4871 lt!168873) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!168879 e!72996)))))

(declare-fun lt!168861 () Unit!6792)

(assert (=> b!111266 (= lt!168861 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4871 lt!168873) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!168879))))

(assert (=> b!111266 (and (= (_2!4872 lt!168884) (_2!4872 lt!168852)) (= (_1!4872 lt!168884) (_1!4872 lt!168852)))))

(declare-fun lt!168856 () Unit!6792)

(assert (=> b!111266 (= lt!168856 lt!168861)))

(assert (=> b!111266 (= (_1!4871 lt!168873) (withMovedBitIndex!0 (_2!4871 lt!168873) (bvsub (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168524))) (currentByte!5266 (_2!4870 lt!168524)) (currentBit!5261 (_2!4870 lt!168524))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168858))) (currentByte!5266 (_2!4870 lt!168858)) (currentBit!5261 (_2!4870 lt!168858))))))))

(declare-fun lt!168878 () Unit!6792)

(declare-fun Unit!6824 () Unit!6792)

(assert (=> b!111266 (= lt!168878 Unit!6824)))

(assert (=> b!111266 (= (_1!4871 lt!168896) (withMovedBitIndex!0 (_2!4871 lt!168896) (bvsub (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168882))) (currentByte!5266 (_2!4870 lt!168882)) (currentBit!5261 (_2!4870 lt!168882))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168858))) (currentByte!5266 (_2!4870 lt!168858)) (currentBit!5261 (_2!4870 lt!168858))))))))

(declare-fun lt!168883 () Unit!6792)

(declare-fun Unit!6825 () Unit!6792)

(assert (=> b!111266 (= lt!168883 Unit!6825)))

(assert (=> b!111266 (= (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168524))) (currentByte!5266 (_2!4870 lt!168524)) (currentBit!5261 (_2!4870 lt!168524))) (bvsub (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168882))) (currentByte!5266 (_2!4870 lt!168882)) (currentBit!5261 (_2!4870 lt!168882))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!168867 () Unit!6792)

(declare-fun Unit!6826 () Unit!6792)

(assert (=> b!111266 (= lt!168867 Unit!6826)))

(assert (=> b!111266 (= (_2!4872 lt!168895) (_2!4872 lt!168889))))

(declare-fun lt!168874 () Unit!6792)

(declare-fun Unit!6827 () Unit!6792)

(assert (=> b!111266 (= lt!168874 Unit!6827)))

(assert (=> b!111266 (= (_1!4872 lt!168895) (_2!4871 lt!168873))))

(declare-fun b!111267 () Bool)

(declare-fun res!91859 () Bool)

(assert (=> b!111267 (= res!91859 (isPrefixOf!0 (_2!4870 lt!168524) (_2!4870 lt!168869)))))

(assert (=> b!111267 (=> (not res!91859) (not e!73001))))

(declare-fun b!111268 () Bool)

(declare-fun lt!168870 () tuple2!9224)

(assert (=> b!111268 (= lt!168870 (readBitPure!0 (readerFrom!0 (_2!4870 lt!168869) (currentBit!5261 (_2!4870 lt!168524)) (currentByte!5266 (_2!4870 lt!168524)))))))

(declare-fun res!91857 () Bool)

(assert (=> b!111268 (= res!91857 (and (= (_2!4869 lt!168870) lt!168886) (= (_1!4869 lt!168870) (_2!4870 lt!168869))))))

(declare-fun e!72999 () Bool)

(assert (=> b!111268 (=> (not res!91857) (not e!72999))))

(assert (=> b!111268 (= e!73001 e!72999)))

(declare-fun b!111269 () Bool)

(assert (=> b!111269 (= e!72997 (= (_2!4869 lt!168862) (_2!4869 lt!168887)))))

(declare-fun b!111270 () Bool)

(assert (=> b!111270 (= e!72999 (= (bitIndex!0 (size!2312 (buf!2709 (_1!4869 lt!168870))) (currentByte!5266 (_1!4869 lt!168870)) (currentBit!5261 (_1!4869 lt!168870))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168869))) (currentByte!5266 (_2!4870 lt!168869)) (currentBit!5261 (_2!4870 lt!168869)))))))

(declare-fun lt!168877 () tuple2!9228)

(declare-fun b!111271 () Bool)

(declare-fun lt!168891 () tuple2!9230)

(assert (=> b!111271 (= e!72995 (and (= (_2!4872 lt!168891) v!199) (= (_1!4872 lt!168891) (_2!4871 lt!168877))))))

(declare-fun lt!168875 () (_ BitVec 64))

(assert (=> b!111271 (= lt!168891 (readNLeastSignificantBitsLoopPure!0 (_1!4871 lt!168877) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!168875))))

(declare-fun lt!168865 () Unit!6792)

(declare-fun lt!168871 () Unit!6792)

(assert (=> b!111271 (= lt!168865 lt!168871)))

(declare-fun lt!168885 () (_ BitVec 64))

(assert (=> b!111271 (validate_offset_bits!1 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168854)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!168524))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!168524))) lt!168885)))

(assert (=> b!111271 (= lt!168871 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4870 lt!168524) (buf!2709 (_2!4870 lt!168854)) lt!168885))))

(declare-fun e!72998 () Bool)

(assert (=> b!111271 e!72998))

(declare-fun res!91862 () Bool)

(assert (=> b!111271 (=> (not res!91862) (not e!72998))))

(assert (=> b!111271 (= res!91862 (and (= (size!2312 (buf!2709 (_2!4870 lt!168524))) (size!2312 (buf!2709 (_2!4870 lt!168854)))) (bvsge lt!168885 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111271 (= lt!168885 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(assert (=> b!111271 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!111271 (= lt!168875 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))))

(assert (=> b!111271 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!111271 (= lt!168877 (reader!0 (_2!4870 lt!168524) (_2!4870 lt!168854)))))

(declare-fun b!111272 () Bool)

(assert (=> b!111272 (= e!72996 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))))

(declare-fun b!111273 () Bool)

(declare-fun lt!168866 () Unit!6792)

(assert (=> b!111273 (= e!73000 (tuple2!9227 lt!168866 (_2!4870 lt!168524)))))

(assert (=> b!111273 (= lt!168853 (_2!4870 lt!168524))))

(assert (=> b!111273 (= lt!168866 (lemmaIsPrefixRefl!0 lt!168853))))

(assert (=> b!111273 call!1399))

(declare-fun b!111274 () Bool)

(assert (=> b!111274 (= e!72998 (validate_offset_bits!1 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168524)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!168524))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!168524))) lt!168885))))

(declare-fun b!111275 () Bool)

(declare-fun res!91861 () Bool)

(assert (=> b!111275 (=> (not res!91861) (not e!72995))))

(assert (=> b!111275 (= res!91861 (isPrefixOf!0 (_2!4870 lt!168524) (_2!4870 lt!168854)))))

(assert (= (and d!35132 c!6765) b!111266))

(assert (= (and d!35132 (not c!6765)) b!111273))

(assert (= (and b!111266 res!91863) b!111265))

(assert (= (and b!111265 res!91858) b!111267))

(assert (= (and b!111267 res!91859) b!111268))

(assert (= (and b!111268 res!91857) b!111270))

(assert (= (and b!111266 res!91860) b!111269))

(assert (= (and b!111266 c!6764) b!111272))

(assert (= (and b!111266 (not c!6764)) b!111264))

(assert (= (or b!111266 b!111273) bm!1396))

(assert (= (and d!35132 res!91865) b!111263))

(assert (= (and b!111263 res!91864) b!111275))

(assert (= (and b!111275 res!91861) b!111271))

(assert (= (and b!111271 res!91862) b!111274))

(declare-fun m!165441 () Bool)

(assert (=> b!111268 m!165441))

(assert (=> b!111268 m!165441))

(declare-fun m!165443 () Bool)

(assert (=> b!111268 m!165443))

(declare-fun m!165445 () Bool)

(assert (=> b!111267 m!165445))

(declare-fun m!165447 () Bool)

(assert (=> b!111265 m!165447))

(assert (=> b!111265 m!165007))

(declare-fun m!165449 () Bool)

(assert (=> b!111270 m!165449))

(assert (=> b!111270 m!165447))

(declare-fun m!165451 () Bool)

(assert (=> bm!1396 m!165451))

(declare-fun m!165453 () Bool)

(assert (=> b!111274 m!165453))

(declare-fun m!165455 () Bool)

(assert (=> b!111263 m!165455))

(assert (=> b!111263 m!165007))

(declare-fun m!165457 () Bool)

(assert (=> b!111266 m!165457))

(declare-fun m!165459 () Bool)

(assert (=> b!111266 m!165459))

(declare-fun m!165461 () Bool)

(assert (=> b!111266 m!165461))

(declare-fun m!165463 () Bool)

(assert (=> b!111266 m!165463))

(declare-fun m!165465 () Bool)

(assert (=> b!111266 m!165465))

(assert (=> b!111266 m!165007))

(declare-fun m!165467 () Bool)

(assert (=> b!111266 m!165467))

(declare-fun m!165469 () Bool)

(assert (=> b!111266 m!165469))

(declare-fun m!165471 () Bool)

(assert (=> b!111266 m!165471))

(declare-fun m!165473 () Bool)

(assert (=> b!111266 m!165473))

(declare-fun m!165475 () Bool)

(assert (=> b!111266 m!165475))

(declare-fun m!165477 () Bool)

(assert (=> b!111266 m!165477))

(declare-fun m!165479 () Bool)

(assert (=> b!111266 m!165479))

(declare-fun m!165481 () Bool)

(assert (=> b!111266 m!165481))

(declare-fun m!165483 () Bool)

(assert (=> b!111266 m!165483))

(declare-fun m!165485 () Bool)

(assert (=> b!111266 m!165485))

(declare-fun m!165487 () Bool)

(assert (=> b!111266 m!165487))

(declare-fun m!165489 () Bool)

(assert (=> b!111266 m!165489))

(declare-fun m!165491 () Bool)

(assert (=> b!111266 m!165491))

(declare-fun m!165493 () Bool)

(assert (=> b!111266 m!165493))

(declare-fun m!165495 () Bool)

(assert (=> b!111266 m!165495))

(assert (=> b!111266 m!165493))

(declare-fun m!165497 () Bool)

(assert (=> b!111266 m!165497))

(declare-fun m!165499 () Bool)

(assert (=> b!111266 m!165499))

(declare-fun m!165501 () Bool)

(assert (=> b!111266 m!165501))

(declare-fun m!165503 () Bool)

(assert (=> b!111266 m!165503))

(declare-fun m!165505 () Bool)

(assert (=> b!111266 m!165505))

(declare-fun m!165507 () Bool)

(assert (=> b!111266 m!165507))

(declare-fun m!165509 () Bool)

(assert (=> b!111266 m!165509))

(declare-fun m!165511 () Bool)

(assert (=> b!111271 m!165511))

(declare-fun m!165513 () Bool)

(assert (=> b!111271 m!165513))

(declare-fun m!165515 () Bool)

(assert (=> b!111271 m!165515))

(assert (=> b!111271 m!165503))

(declare-fun m!165517 () Bool)

(assert (=> b!111271 m!165517))

(declare-fun m!165519 () Bool)

(assert (=> b!111275 m!165519))

(declare-fun m!165521 () Bool)

(assert (=> b!111273 m!165521))

(assert (=> b!111102 d!35132))

(declare-fun b!111276 () Bool)

(declare-fun e!73003 () Bool)

(declare-fun e!73005 () Bool)

(assert (=> b!111276 (= e!73003 e!73005)))

(declare-fun res!91870 () Bool)

(assert (=> b!111276 (=> (not res!91870) (not e!73005))))

(declare-fun e!73007 () Bool)

(assert (=> b!111276 (= res!91870 e!73007)))

(declare-fun res!91869 () Bool)

(assert (=> b!111276 (=> res!91869 e!73007)))

(declare-fun lt!168899 () tuple4!72)

(assert (=> b!111276 (= res!91869 (bvsge (_1!4883 lt!168899) (_2!4883 lt!168899)))))

(declare-fun lt!168897 () (_ BitVec 32))

(assert (=> b!111276 (= lt!168897 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2312 (buf!2709 thiss!1305)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!168898 () (_ BitVec 32))

(assert (=> b!111276 (= lt!168898 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111276 (= lt!168899 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2312 (buf!2709 thiss!1305)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))))))

(declare-fun b!111277 () Bool)

(declare-fun res!91866 () Bool)

(assert (=> b!111277 (= res!91866 (= lt!168897 #b00000000000000000000000000000000))))

(declare-fun e!73004 () Bool)

(assert (=> b!111277 (=> res!91866 e!73004)))

(declare-fun e!73002 () Bool)

(assert (=> b!111277 (= e!73002 e!73004)))

(declare-fun b!111278 () Bool)

(declare-fun e!73006 () Bool)

(assert (=> b!111278 (= e!73005 e!73006)))

(declare-fun c!6766 () Bool)

(assert (=> b!111278 (= c!6766 (= (_3!257 lt!168899) (_4!36 lt!168899)))))

(declare-fun b!111279 () Bool)

(assert (=> b!111279 (= e!73004 (byteRangesEq!0 (select (arr!2905 (buf!2709 thiss!1305)) (_4!36 lt!168899)) (select (arr!2905 (buf!2709 (_2!4870 lt!167696))) (_4!36 lt!168899)) #b00000000000000000000000000000000 lt!168897))))

(declare-fun d!35134 () Bool)

(declare-fun res!91867 () Bool)

(assert (=> d!35134 (=> res!91867 e!73003)))

(assert (=> d!35134 (= res!91867 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2312 (buf!2709 thiss!1305)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))))))

(assert (=> d!35134 (= (arrayBitRangesEq!0 (buf!2709 thiss!1305) (buf!2709 (_2!4870 lt!167696)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2312 (buf!2709 thiss!1305)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))) e!73003)))

(declare-fun b!111280 () Bool)

(assert (=> b!111280 (= e!73006 e!73002)))

(declare-fun res!91868 () Bool)

(declare-fun call!1400 () Bool)

(assert (=> b!111280 (= res!91868 call!1400)))

(assert (=> b!111280 (=> (not res!91868) (not e!73002))))

(declare-fun b!111281 () Bool)

(assert (=> b!111281 (= e!73007 (arrayRangesEq!37 (buf!2709 thiss!1305) (buf!2709 (_2!4870 lt!167696)) (_1!4883 lt!168899) (_2!4883 lt!168899)))))

(declare-fun b!111282 () Bool)

(assert (=> b!111282 (= e!73006 call!1400)))

(declare-fun bm!1397 () Bool)

(assert (=> bm!1397 (= call!1400 (byteRangesEq!0 (select (arr!2905 (buf!2709 thiss!1305)) (_3!257 lt!168899)) (select (arr!2905 (buf!2709 (_2!4870 lt!167696))) (_3!257 lt!168899)) lt!168898 (ite c!6766 lt!168897 #b00000000000000000000000000001000)))))

(assert (= (and d!35134 (not res!91867)) b!111276))

(assert (= (and b!111276 (not res!91869)) b!111281))

(assert (= (and b!111276 res!91870) b!111278))

(assert (= (and b!111278 c!6766) b!111282))

(assert (= (and b!111278 (not c!6766)) b!111280))

(assert (= (and b!111280 res!91868) b!111277))

(assert (= (and b!111277 (not res!91866)) b!111279))

(assert (= (or b!111282 b!111280) bm!1397))

(assert (=> b!111276 m!164407))

(assert (=> b!111276 m!165247))

(declare-fun m!165523 () Bool)

(assert (=> b!111279 m!165523))

(declare-fun m!165525 () Bool)

(assert (=> b!111279 m!165525))

(assert (=> b!111279 m!165523))

(assert (=> b!111279 m!165525))

(declare-fun m!165527 () Bool)

(assert (=> b!111279 m!165527))

(declare-fun m!165529 () Bool)

(assert (=> b!111281 m!165529))

(declare-fun m!165531 () Bool)

(assert (=> bm!1397 m!165531))

(declare-fun m!165533 () Bool)

(assert (=> bm!1397 m!165533))

(assert (=> bm!1397 m!165531))

(assert (=> bm!1397 m!165533))

(declare-fun m!165535 () Bool)

(assert (=> bm!1397 m!165535))

(assert (=> b!110970 d!35134))

(assert (=> b!110970 d!34920))

(declare-fun d!35136 () Bool)

(declare-fun e!73015 () Bool)

(assert (=> d!35136 e!73015))

(declare-fun res!91882 () Bool)

(assert (=> d!35136 (=> (not res!91882) (not e!73015))))

(declare-fun lt!168920 () tuple2!9250)

(assert (=> d!35136 (= res!91882 (= (buf!2709 (_2!4882 lt!168920)) (buf!2709 (_1!4871 lt!167695))))))

(declare-fun e!73016 () tuple2!9250)

(assert (=> d!35136 (= lt!168920 e!73016)))

(declare-fun c!6769 () Bool)

(assert (=> d!35136 (= c!6769 (= nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> d!35136 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!35136 (= (readNLeastSignificantBitsLoop!0 (_1!4871 lt!167695) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!167689 (ite (_2!4869 lt!167703) lt!167704 #b0000000000000000000000000000000000000000000000000000000000000000))) lt!168920)))

(declare-fun b!111297 () Bool)

(declare-fun res!91884 () Bool)

(assert (=> b!111297 (=> (not res!91884) (not e!73015))))

(declare-fun lt!168919 () (_ BitVec 64))

(declare-fun lt!168922 () (_ BitVec 64))

(assert (=> b!111297 (= res!91884 (= (bitIndex!0 (size!2312 (buf!2709 (_2!4882 lt!168920))) (currentByte!5266 (_2!4882 lt!168920)) (currentBit!5261 (_2!4882 lt!168920))) (bvadd lt!168919 lt!168922)))))

(assert (=> b!111297 (or (not (= (bvand lt!168919 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168922 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!168919 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!168919 lt!168922) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111297 (= lt!168922 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!111297 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!111297 (= lt!168919 (bitIndex!0 (size!2312 (buf!2709 (_1!4871 lt!167695))) (currentByte!5266 (_1!4871 lt!167695)) (currentBit!5261 (_1!4871 lt!167695))))))

(declare-fun b!111298 () Bool)

(declare-fun e!73014 () Bool)

(assert (=> b!111298 (= e!73015 e!73014)))

(declare-fun res!91881 () Bool)

(assert (=> b!111298 (=> res!91881 e!73014)))

(assert (=> b!111298 (= res!91881 (bvsge (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(declare-fun b!111299 () Bool)

(declare-fun lt!168921 () (_ BitVec 64))

(assert (=> b!111299 (= e!73014 (= (= (bvand (bvlshr (_1!4882 lt!168920) lt!168921) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!4869 (readBitPure!0 (_1!4871 lt!167695)))))))

(assert (=> b!111299 (and (bvsge lt!168921 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!168921 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!168918 () (_ BitVec 32))

(assert (=> b!111299 (= lt!168921 ((_ sign_extend 32) (bvsub lt!168918 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!111299 (or (= (bvand lt!168918 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand lt!168918 #b10000000000000000000000000000000) (bvand (bvsub lt!168918 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!111299 (= lt!168918 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!111299 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!111300 () Bool)

(declare-fun res!91885 () Bool)

(assert (=> b!111300 (=> (not res!91885) (not e!73015))))

(assert (=> b!111300 (= res!91885 (= (bvand (_1!4882 lt!168920) (onesLSBLong!0 nBits!396)) (_1!4882 lt!168920)))))

(declare-fun b!111301 () Bool)

(declare-fun res!91883 () Bool)

(assert (=> b!111301 (=> (not res!91883) (not e!73015))))

(declare-fun lt!168926 () (_ BitVec 64))

(declare-fun lt!168924 () (_ BitVec 64))

(assert (=> b!111301 (= res!91883 (= (bvlshr (_1!4882 lt!168920) lt!168926) (bvlshr (bvor lt!167689 (ite (_2!4869 lt!167703) lt!167704 #b0000000000000000000000000000000000000000000000000000000000000000)) lt!168924)))))

(assert (=> b!111301 (and (bvsge lt!168924 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!168924 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!111301 (= lt!168924 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!111301 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!111301 (and (bvsge lt!168926 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!168926 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!111301 (= lt!168926 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!111301 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(declare-fun b!111302 () Bool)

(declare-fun lt!168925 () tuple2!9250)

(assert (=> b!111302 (= e!73016 (tuple2!9251 (_1!4882 lt!168925) (_2!4882 lt!168925)))))

(declare-fun lt!168923 () tuple2!9248)

(assert (=> b!111302 (= lt!168923 (readBit!0 (_1!4871 lt!167695)))))

(assert (=> b!111302 (= lt!168925 (readNLeastSignificantBitsLoop!0 (_2!4881 lt!168923) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor (bvor lt!167689 (ite (_2!4869 lt!167703) lt!167704 #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!4881 lt!168923) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!111303 () Bool)

(assert (=> b!111303 (= e!73016 (tuple2!9251 (bvor lt!167689 (ite (_2!4869 lt!167703) lt!167704 #b0000000000000000000000000000000000000000000000000000000000000000)) (_1!4871 lt!167695)))))

(assert (= (and d!35136 c!6769) b!111303))

(assert (= (and d!35136 (not c!6769)) b!111302))

(assert (= (and d!35136 res!91882) b!111297))

(assert (= (and b!111297 res!91884) b!111301))

(assert (= (and b!111301 res!91883) b!111300))

(assert (= (and b!111300 res!91885) b!111298))

(assert (= (and b!111298 (not res!91881)) b!111299))

(declare-fun m!165537 () Bool)

(assert (=> b!111297 m!165537))

(declare-fun m!165539 () Bool)

(assert (=> b!111297 m!165539))

(declare-fun m!165541 () Bool)

(assert (=> b!111299 m!165541))

(assert (=> b!111300 m!164449))

(declare-fun m!165543 () Bool)

(assert (=> b!111302 m!165543))

(declare-fun m!165545 () Bool)

(assert (=> b!111302 m!165545))

(assert (=> d!34976 d!35136))

(declare-fun d!35138 () Bool)

(declare-fun res!91887 () Bool)

(declare-fun e!73018 () Bool)

(assert (=> d!35138 (=> (not res!91887) (not e!73018))))

(assert (=> d!35138 (= res!91887 (= (size!2312 (buf!2709 (_2!4871 lt!168596))) (size!2312 (buf!2709 (_2!4870 lt!167705)))))))

(assert (=> d!35138 (= (isPrefixOf!0 (_2!4871 lt!168596) (_2!4870 lt!167705)) e!73018)))

(declare-fun b!111304 () Bool)

(declare-fun res!91886 () Bool)

(assert (=> b!111304 (=> (not res!91886) (not e!73018))))

(assert (=> b!111304 (= res!91886 (bvsle (bitIndex!0 (size!2312 (buf!2709 (_2!4871 lt!168596))) (currentByte!5266 (_2!4871 lt!168596)) (currentBit!5261 (_2!4871 lt!168596))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167705))) (currentByte!5266 (_2!4870 lt!167705)) (currentBit!5261 (_2!4870 lt!167705)))))))

(declare-fun b!111305 () Bool)

(declare-fun e!73017 () Bool)

(assert (=> b!111305 (= e!73018 e!73017)))

(declare-fun res!91888 () Bool)

(assert (=> b!111305 (=> res!91888 e!73017)))

(assert (=> b!111305 (= res!91888 (= (size!2312 (buf!2709 (_2!4871 lt!168596))) #b00000000000000000000000000000000))))

(declare-fun b!111306 () Bool)

(assert (=> b!111306 (= e!73017 (arrayBitRangesEq!0 (buf!2709 (_2!4871 lt!168596)) (buf!2709 (_2!4870 lt!167705)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2312 (buf!2709 (_2!4871 lt!168596))) (currentByte!5266 (_2!4871 lt!168596)) (currentBit!5261 (_2!4871 lt!168596)))))))

(assert (= (and d!35138 res!91887) b!111304))

(assert (= (and b!111304 res!91886) b!111305))

(assert (= (and b!111305 (not res!91888)) b!111306))

(assert (=> b!111304 m!165173))

(assert (=> b!111304 m!165085))

(assert (=> b!111306 m!165173))

(assert (=> b!111306 m!165173))

(declare-fun m!165547 () Bool)

(assert (=> b!111306 m!165547))

(assert (=> b!111122 d!35138))

(assert (=> b!110961 d!34930))

(declare-fun d!35140 () Bool)

(declare-fun e!73019 () Bool)

(assert (=> d!35140 e!73019))

(declare-fun res!91889 () Bool)

(assert (=> d!35140 (=> (not res!91889) (not e!73019))))

(assert (=> d!35140 (= res!91889 (= (buf!2709 (_2!4870 (increaseBitIndex!0 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))))) (buf!2709 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)))))))

(declare-fun lt!168928 () Bool)

(assert (=> d!35140 (= lt!168928 (not (= (bvand ((_ sign_extend 24) (select (arr!2905 (buf!2709 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)))) (currentByte!5266 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5261 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!168927 () tuple2!9248)

(assert (=> d!35140 (= lt!168927 (tuple2!9249 (not (= (bvand ((_ sign_extend 24) (select (arr!2905 (buf!2709 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)))) (currentByte!5266 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5261 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)))))) #b00000000000000000000000000000000)) (_2!4870 (increaseBitIndex!0 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))))))))

(assert (=> d!35140 (validate_offset_bit!0 ((_ sign_extend 32) (size!2312 (buf!2709 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))))) ((_ sign_extend 32) (currentByte!5266 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)))) ((_ sign_extend 32) (currentBit!5261 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)))))))

(assert (=> d!35140 (= (readBit!0 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))) lt!168927)))

(declare-fun lt!168932 () (_ BitVec 64))

(declare-fun b!111307 () Bool)

(declare-fun lt!168929 () (_ BitVec 64))

(assert (=> b!111307 (= e!73019 (= (bitIndex!0 (size!2312 (buf!2709 (_2!4870 (increaseBitIndex!0 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)))))) (currentByte!5266 (_2!4870 (increaseBitIndex!0 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))))) (currentBit!5261 (_2!4870 (increaseBitIndex!0 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)))))) (bvadd lt!168929 lt!168932)))))

(assert (=> b!111307 (or (not (= (bvand lt!168929 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168932 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!168929 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!168929 lt!168932) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111307 (= lt!168932 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!111307 (= lt!168929 (bitIndex!0 (size!2312 (buf!2709 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)))) (currentByte!5266 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))) (currentBit!5261 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)))))))

(declare-fun lt!168933 () Bool)

(assert (=> b!111307 (= lt!168933 (not (= (bvand ((_ sign_extend 24) (select (arr!2905 (buf!2709 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)))) (currentByte!5266 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5261 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!168930 () Bool)

(assert (=> b!111307 (= lt!168930 (not (= (bvand ((_ sign_extend 24) (select (arr!2905 (buf!2709 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)))) (currentByte!5266 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5261 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!168931 () Bool)

(assert (=> b!111307 (= lt!168931 (not (= (bvand ((_ sign_extend 24) (select (arr!2905 (buf!2709 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)))) (currentByte!5266 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5261 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!35140 res!91889) b!111307))

(declare-fun m!165549 () Bool)

(assert (=> d!35140 m!165549))

(declare-fun m!165551 () Bool)

(assert (=> d!35140 m!165551))

(declare-fun m!165553 () Bool)

(assert (=> d!35140 m!165553))

(declare-fun m!165555 () Bool)

(assert (=> d!35140 m!165555))

(declare-fun m!165557 () Bool)

(assert (=> b!111307 m!165557))

(assert (=> b!111307 m!165551))

(declare-fun m!165559 () Bool)

(assert (=> b!111307 m!165559))

(assert (=> b!111307 m!165553))

(assert (=> b!111307 m!165549))

(assert (=> d!34970 d!35140))

(declare-fun d!35142 () Bool)

(declare-fun e!73020 () Bool)

(assert (=> d!35142 e!73020))

(declare-fun res!91891 () Bool)

(assert (=> d!35142 (=> (not res!91891) (not e!73020))))

(declare-fun lt!168937 () (_ BitVec 64))

(declare-fun lt!168936 () (_ BitVec 64))

(declare-fun lt!168935 () (_ BitVec 64))

(assert (=> d!35142 (= res!91891 (= lt!168935 (bvsub lt!168936 lt!168937)))))

(assert (=> d!35142 (or (= (bvand lt!168936 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168937 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168936 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168936 lt!168937) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35142 (= lt!168937 (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168496)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!168496))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!168496)))))))

(declare-fun lt!168938 () (_ BitVec 64))

(declare-fun lt!168939 () (_ BitVec 64))

(assert (=> d!35142 (= lt!168936 (bvmul lt!168938 lt!168939))))

(assert (=> d!35142 (or (= lt!168938 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!168939 (bvsdiv (bvmul lt!168938 lt!168939) lt!168938)))))

(assert (=> d!35142 (= lt!168939 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35142 (= lt!168938 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168496)))))))

(assert (=> d!35142 (= lt!168935 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!168496))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!168496)))))))

(assert (=> d!35142 (invariant!0 (currentBit!5261 (_2!4870 lt!168496)) (currentByte!5266 (_2!4870 lt!168496)) (size!2312 (buf!2709 (_2!4870 lt!168496))))))

(assert (=> d!35142 (= (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168496))) (currentByte!5266 (_2!4870 lt!168496)) (currentBit!5261 (_2!4870 lt!168496))) lt!168935)))

(declare-fun b!111308 () Bool)

(declare-fun res!91890 () Bool)

(assert (=> b!111308 (=> (not res!91890) (not e!73020))))

(assert (=> b!111308 (= res!91890 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!168935))))

(declare-fun b!111309 () Bool)

(declare-fun lt!168934 () (_ BitVec 64))

(assert (=> b!111309 (= e!73020 (bvsle lt!168935 (bvmul lt!168934 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111309 (or (= lt!168934 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!168934 #b0000000000000000000000000000000000000000000000000000000000001000) lt!168934)))))

(assert (=> b!111309 (= lt!168934 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168496)))))))

(assert (= (and d!35142 res!91891) b!111308))

(assert (= (and b!111308 res!91890) b!111309))

(declare-fun m!165561 () Bool)

(assert (=> d!35142 m!165561))

(declare-fun m!165563 () Bool)

(assert (=> d!35142 m!165563))

(assert (=> b!111099 d!35142))

(assert (=> b!111099 d!34918))

(declare-fun d!35144 () Bool)

(assert (=> d!35144 (= (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!167700)))) ((_ sign_extend 32) (currentByte!5266 (_1!4869 lt!167700))) ((_ sign_extend 32) (currentBit!5261 (_1!4869 lt!167700)))) (bvsub (bvmul ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!167700)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5266 (_1!4869 lt!167700))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5261 (_1!4869 lt!167700))))))))

(assert (=> d!34982 d!35144))

(declare-fun d!35146 () Bool)

(assert (=> d!35146 (= (invariant!0 (currentBit!5261 (_1!4869 lt!167700)) (currentByte!5266 (_1!4869 lt!167700)) (size!2312 (buf!2709 (_1!4869 lt!167700)))) (and (bvsge (currentBit!5261 (_1!4869 lt!167700)) #b00000000000000000000000000000000) (bvslt (currentBit!5261 (_1!4869 lt!167700)) #b00000000000000000000000000001000) (bvsge (currentByte!5266 (_1!4869 lt!167700)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5266 (_1!4869 lt!167700)) (size!2312 (buf!2709 (_1!4869 lt!167700)))) (and (= (currentBit!5261 (_1!4869 lt!167700)) #b00000000000000000000000000000000) (= (currentByte!5266 (_1!4869 lt!167700)) (size!2312 (buf!2709 (_1!4869 lt!167700))))))))))

(assert (=> d!34982 d!35146))

(assert (=> b!110968 d!34920))

(assert (=> b!110968 d!34918))

(assert (=> d!34928 d!35050))

(declare-fun d!35148 () Bool)

(assert (=> d!35148 (= (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!167705)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!167696))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!167696)))) (bvsub (bvmul ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!167705)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!167696))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!167696))))))))

(assert (=> d!34986 d!35148))

(declare-fun d!35150 () Bool)

(declare-fun e!73023 () Bool)

(assert (=> d!35150 e!73023))

(declare-fun res!91894 () Bool)

(assert (=> d!35150 (=> (not res!91894) (not e!73023))))

(declare-fun lt!168946 () tuple2!9224)

(declare-fun lt!168948 () tuple2!9224)

(assert (=> d!35150 (= res!91894 (= (bitIndex!0 (size!2312 (buf!2709 (_1!4869 lt!168946))) (currentByte!5266 (_1!4869 lt!168946)) (currentBit!5261 (_1!4869 lt!168946))) (bitIndex!0 (size!2312 (buf!2709 (_1!4869 lt!168948))) (currentByte!5266 (_1!4869 lt!168948)) (currentBit!5261 (_1!4869 lt!168948)))))))

(declare-fun lt!168947 () BitStream!4098)

(assert (=> d!35150 (= lt!168948 (readBitPure!0 lt!168947))))

(assert (=> d!35150 (= lt!168946 (readBitPure!0 lt!167708))))

(assert (=> d!35150 (= lt!168947 (BitStream!4099 (buf!2709 (_2!4870 lt!167705)) (currentByte!5266 lt!167708) (currentBit!5261 lt!167708)))))

(assert (=> d!35150 (invariant!0 (currentBit!5261 lt!167708) (currentByte!5266 lt!167708) (size!2312 (buf!2709 (_2!4870 lt!167705))))))

(assert (=> d!35150 true))

(declare-fun _$9!45 () Unit!6792)

(assert (=> d!35150 (= (choose!50 lt!167708 (_2!4870 lt!167705) lt!168659 lt!168657 (tuple2!9225 (_1!4869 lt!168657) (_2!4869 lt!168657)) (_1!4869 lt!168657) (_2!4869 lt!168657) lt!168656 (tuple2!9225 (_1!4869 lt!168656) (_2!4869 lt!168656)) (_1!4869 lt!168656) (_2!4869 lt!168656)) _$9!45)))

(declare-fun b!111312 () Bool)

(assert (=> b!111312 (= e!73023 (= (_2!4869 lt!168946) (_2!4869 lt!168948)))))

(assert (= (and d!35150 res!91894) b!111312))

(declare-fun m!165565 () Bool)

(assert (=> d!35150 m!165565))

(declare-fun m!165567 () Bool)

(assert (=> d!35150 m!165567))

(assert (=> d!35150 m!165151))

(declare-fun m!165569 () Bool)

(assert (=> d!35150 m!165569))

(assert (=> d!35150 m!164413))

(assert (=> d!34998 d!35150))

(assert (=> d!34998 d!34968))

(declare-fun d!35152 () Bool)

(declare-fun e!73024 () Bool)

(assert (=> d!35152 e!73024))

(declare-fun res!91896 () Bool)

(assert (=> d!35152 (=> (not res!91896) (not e!73024))))

(declare-fun lt!168950 () (_ BitVec 64))

(declare-fun lt!168952 () (_ BitVec 64))

(declare-fun lt!168951 () (_ BitVec 64))

(assert (=> d!35152 (= res!91896 (= lt!168950 (bvsub lt!168951 lt!168952)))))

(assert (=> d!35152 (or (= (bvand lt!168951 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168952 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168951 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168951 lt!168952) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35152 (= lt!168952 (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!168656)))) ((_ sign_extend 32) (currentByte!5266 (_1!4869 lt!168656))) ((_ sign_extend 32) (currentBit!5261 (_1!4869 lt!168656)))))))

(declare-fun lt!168953 () (_ BitVec 64))

(declare-fun lt!168954 () (_ BitVec 64))

(assert (=> d!35152 (= lt!168951 (bvmul lt!168953 lt!168954))))

(assert (=> d!35152 (or (= lt!168953 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!168954 (bvsdiv (bvmul lt!168953 lt!168954) lt!168953)))))

(assert (=> d!35152 (= lt!168954 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35152 (= lt!168953 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!168656)))))))

(assert (=> d!35152 (= lt!168950 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5266 (_1!4869 lt!168656))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5261 (_1!4869 lt!168656)))))))

(assert (=> d!35152 (invariant!0 (currentBit!5261 (_1!4869 lt!168656)) (currentByte!5266 (_1!4869 lt!168656)) (size!2312 (buf!2709 (_1!4869 lt!168656))))))

(assert (=> d!35152 (= (bitIndex!0 (size!2312 (buf!2709 (_1!4869 lt!168656))) (currentByte!5266 (_1!4869 lt!168656)) (currentBit!5261 (_1!4869 lt!168656))) lt!168950)))

(declare-fun b!111313 () Bool)

(declare-fun res!91895 () Bool)

(assert (=> b!111313 (=> (not res!91895) (not e!73024))))

(assert (=> b!111313 (= res!91895 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!168950))))

(declare-fun b!111314 () Bool)

(declare-fun lt!168949 () (_ BitVec 64))

(assert (=> b!111314 (= e!73024 (bvsle lt!168950 (bvmul lt!168949 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111314 (or (= lt!168949 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!168949 #b0000000000000000000000000000000000000000000000000000000000001000) lt!168949)))))

(assert (=> b!111314 (= lt!168949 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!168656)))))))

(assert (= (and d!35152 res!91896) b!111313))

(assert (= (and b!111313 res!91895) b!111314))

(declare-fun m!165571 () Bool)

(assert (=> d!35152 m!165571))

(declare-fun m!165573 () Bool)

(assert (=> d!35152 m!165573))

(assert (=> d!34998 d!35152))

(declare-fun d!35154 () Bool)

(declare-fun e!73025 () Bool)

(assert (=> d!35154 e!73025))

(declare-fun res!91898 () Bool)

(assert (=> d!35154 (=> (not res!91898) (not e!73025))))

(declare-fun lt!168956 () (_ BitVec 64))

(declare-fun lt!168957 () (_ BitVec 64))

(declare-fun lt!168958 () (_ BitVec 64))

(assert (=> d!35154 (= res!91898 (= lt!168956 (bvsub lt!168957 lt!168958)))))

(assert (=> d!35154 (or (= (bvand lt!168957 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168958 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168957 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168957 lt!168958) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35154 (= lt!168958 (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!168657)))) ((_ sign_extend 32) (currentByte!5266 (_1!4869 lt!168657))) ((_ sign_extend 32) (currentBit!5261 (_1!4869 lt!168657)))))))

(declare-fun lt!168959 () (_ BitVec 64))

(declare-fun lt!168960 () (_ BitVec 64))

(assert (=> d!35154 (= lt!168957 (bvmul lt!168959 lt!168960))))

(assert (=> d!35154 (or (= lt!168959 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!168960 (bvsdiv (bvmul lt!168959 lt!168960) lt!168959)))))

(assert (=> d!35154 (= lt!168960 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35154 (= lt!168959 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!168657)))))))

(assert (=> d!35154 (= lt!168956 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5266 (_1!4869 lt!168657))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5261 (_1!4869 lt!168657)))))))

(assert (=> d!35154 (invariant!0 (currentBit!5261 (_1!4869 lt!168657)) (currentByte!5266 (_1!4869 lt!168657)) (size!2312 (buf!2709 (_1!4869 lt!168657))))))

(assert (=> d!35154 (= (bitIndex!0 (size!2312 (buf!2709 (_1!4869 lt!168657))) (currentByte!5266 (_1!4869 lt!168657)) (currentBit!5261 (_1!4869 lt!168657))) lt!168956)))

(declare-fun b!111315 () Bool)

(declare-fun res!91897 () Bool)

(assert (=> b!111315 (=> (not res!91897) (not e!73025))))

(assert (=> b!111315 (= res!91897 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!168956))))

(declare-fun b!111316 () Bool)

(declare-fun lt!168955 () (_ BitVec 64))

(assert (=> b!111316 (= e!73025 (bvsle lt!168956 (bvmul lt!168955 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111316 (or (= lt!168955 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!168955 #b0000000000000000000000000000000000000000000000000000000000001000) lt!168955)))))

(assert (=> b!111316 (= lt!168955 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!168657)))))))

(assert (= (and d!35154 res!91898) b!111315))

(assert (= (and b!111315 res!91897) b!111316))

(declare-fun m!165575 () Bool)

(assert (=> d!35154 m!165575))

(declare-fun m!165577 () Bool)

(assert (=> d!35154 m!165577))

(assert (=> d!34998 d!35154))

(declare-fun d!35156 () Bool)

(declare-fun lt!168961 () tuple2!9248)

(assert (=> d!35156 (= lt!168961 (readBit!0 lt!168659))))

(assert (=> d!35156 (= (readBitPure!0 lt!168659) (tuple2!9225 (_2!4881 lt!168961) (_1!4881 lt!168961)))))

(declare-fun bs!8604 () Bool)

(assert (= bs!8604 d!35156))

(declare-fun m!165579 () Bool)

(assert (=> bs!8604 m!165579))

(assert (=> d!34998 d!35156))

(declare-fun d!35158 () Bool)

(assert (=> d!35158 (= (invariant!0 (currentBit!5261 lt!167708) (currentByte!5266 lt!167708) (size!2312 (buf!2709 (_2!4870 lt!167705)))) (and (bvsge (currentBit!5261 lt!167708) #b00000000000000000000000000000000) (bvslt (currentBit!5261 lt!167708) #b00000000000000000000000000001000) (bvsge (currentByte!5266 lt!167708) #b00000000000000000000000000000000) (or (bvslt (currentByte!5266 lt!167708) (size!2312 (buf!2709 (_2!4870 lt!167705)))) (and (= (currentBit!5261 lt!167708) #b00000000000000000000000000000000) (= (currentByte!5266 lt!167708) (size!2312 (buf!2709 (_2!4870 lt!167705))))))))))

(assert (=> d!34998 d!35158))

(declare-fun d!35160 () Bool)

(declare-fun res!91900 () Bool)

(declare-fun e!73027 () Bool)

(assert (=> d!35160 (=> (not res!91900) (not e!73027))))

(assert (=> d!35160 (= res!91900 (= (size!2312 (buf!2709 (_2!4870 lt!167696))) (size!2312 (buf!2709 (_2!4870 lt!168496)))))))

(assert (=> d!35160 (= (isPrefixOf!0 (_2!4870 lt!167696) (_2!4870 lt!168496)) e!73027)))

(declare-fun b!111317 () Bool)

(declare-fun res!91899 () Bool)

(assert (=> b!111317 (=> (not res!91899) (not e!73027))))

(assert (=> b!111317 (= res!91899 (bvsle (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168496))) (currentByte!5266 (_2!4870 lt!168496)) (currentBit!5261 (_2!4870 lt!168496)))))))

(declare-fun b!111318 () Bool)

(declare-fun e!73026 () Bool)

(assert (=> b!111318 (= e!73027 e!73026)))

(declare-fun res!91901 () Bool)

(assert (=> b!111318 (=> res!91901 e!73026)))

(assert (=> b!111318 (= res!91901 (= (size!2312 (buf!2709 (_2!4870 lt!167696))) #b00000000000000000000000000000000))))

(declare-fun b!111319 () Bool)

(assert (=> b!111319 (= e!73026 (arrayBitRangesEq!0 (buf!2709 (_2!4870 lt!167696)) (buf!2709 (_2!4870 lt!168496)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696)))))))

(assert (= (and d!35160 res!91900) b!111317))

(assert (= (and b!111317 res!91899) b!111318))

(assert (= (and b!111318 (not res!91901)) b!111319))

(assert (=> b!111317 m!164405))

(assert (=> b!111317 m!164981))

(assert (=> b!111319 m!164405))

(assert (=> b!111319 m!164405))

(declare-fun m!165581 () Bool)

(assert (=> b!111319 m!165581))

(assert (=> b!111111 d!35160))

(declare-fun d!35162 () Bool)

(assert (=> d!35162 (isPrefixOf!0 lt!168622 (_2!4870 lt!167705))))

(declare-fun lt!168962 () Unit!6792)

(assert (=> d!35162 (= lt!168962 (choose!30 lt!168622 (_2!4870 lt!167696) (_2!4870 lt!167705)))))

(assert (=> d!35162 (isPrefixOf!0 lt!168622 (_2!4870 lt!167696))))

(assert (=> d!35162 (= (lemmaIsPrefixTransitive!0 lt!168622 (_2!4870 lt!167696) (_2!4870 lt!167705)) lt!168962)))

(declare-fun bs!8605 () Bool)

(assert (= bs!8605 d!35162))

(assert (=> bs!8605 m!165111))

(declare-fun m!165583 () Bool)

(assert (=> bs!8605 m!165583))

(declare-fun m!165585 () Bool)

(assert (=> bs!8605 m!165585))

(assert (=> d!34984 d!35162))

(declare-fun d!35164 () Bool)

(declare-fun res!91903 () Bool)

(declare-fun e!73029 () Bool)

(assert (=> d!35164 (=> (not res!91903) (not e!73029))))

(assert (=> d!35164 (= res!91903 (= (size!2312 (buf!2709 lt!168622)) (size!2312 (buf!2709 lt!168622))))))

(assert (=> d!35164 (= (isPrefixOf!0 lt!168622 lt!168622) e!73029)))

(declare-fun b!111320 () Bool)

(declare-fun res!91902 () Bool)

(assert (=> b!111320 (=> (not res!91902) (not e!73029))))

(assert (=> b!111320 (= res!91902 (bvsle (bitIndex!0 (size!2312 (buf!2709 lt!168622)) (currentByte!5266 lt!168622) (currentBit!5261 lt!168622)) (bitIndex!0 (size!2312 (buf!2709 lt!168622)) (currentByte!5266 lt!168622) (currentBit!5261 lt!168622))))))

(declare-fun b!111321 () Bool)

(declare-fun e!73028 () Bool)

(assert (=> b!111321 (= e!73029 e!73028)))

(declare-fun res!91904 () Bool)

(assert (=> b!111321 (=> res!91904 e!73028)))

(assert (=> b!111321 (= res!91904 (= (size!2312 (buf!2709 lt!168622)) #b00000000000000000000000000000000))))

(declare-fun b!111322 () Bool)

(assert (=> b!111322 (= e!73028 (arrayBitRangesEq!0 (buf!2709 lt!168622) (buf!2709 lt!168622) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2312 (buf!2709 lt!168622)) (currentByte!5266 lt!168622) (currentBit!5261 lt!168622))))))

(assert (= (and d!35164 res!91903) b!111320))

(assert (= (and b!111320 res!91902) b!111321))

(assert (= (and b!111321 (not res!91904)) b!111322))

(declare-fun m!165587 () Bool)

(assert (=> b!111320 m!165587))

(assert (=> b!111320 m!165587))

(assert (=> b!111322 m!165587))

(assert (=> b!111322 m!165587))

(declare-fun m!165589 () Bool)

(assert (=> b!111322 m!165589))

(assert (=> d!34984 d!35164))

(declare-fun d!35166 () Bool)

(declare-fun res!91906 () Bool)

(declare-fun e!73031 () Bool)

(assert (=> d!35166 (=> (not res!91906) (not e!73031))))

(assert (=> d!35166 (= res!91906 (= (size!2312 (buf!2709 (_2!4870 lt!167696))) (size!2312 (buf!2709 (_2!4870 lt!167696)))))))

(assert (=> d!35166 (= (isPrefixOf!0 (_2!4870 lt!167696) (_2!4870 lt!167696)) e!73031)))

(declare-fun b!111323 () Bool)

(declare-fun res!91905 () Bool)

(assert (=> b!111323 (=> (not res!91905) (not e!73031))))

(assert (=> b!111323 (= res!91905 (bvsle (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696)))))))

(declare-fun b!111324 () Bool)

(declare-fun e!73030 () Bool)

(assert (=> b!111324 (= e!73031 e!73030)))

(declare-fun res!91907 () Bool)

(assert (=> b!111324 (=> res!91907 e!73030)))

(assert (=> b!111324 (= res!91907 (= (size!2312 (buf!2709 (_2!4870 lt!167696))) #b00000000000000000000000000000000))))

(declare-fun b!111325 () Bool)

(assert (=> b!111325 (= e!73030 (arrayBitRangesEq!0 (buf!2709 (_2!4870 lt!167696)) (buf!2709 (_2!4870 lt!167696)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696)))))))

(assert (= (and d!35166 res!91906) b!111323))

(assert (= (and b!111323 res!91905) b!111324))

(assert (= (and b!111324 (not res!91907)) b!111325))

(assert (=> b!111323 m!164405))

(assert (=> b!111323 m!164405))

(assert (=> b!111325 m!164405))

(assert (=> b!111325 m!164405))

(declare-fun m!165591 () Bool)

(assert (=> b!111325 m!165591))

(assert (=> d!34984 d!35166))

(declare-fun d!35168 () Bool)

(assert (=> d!35168 (isPrefixOf!0 lt!168622 (_2!4870 lt!167705))))

(declare-fun lt!168963 () Unit!6792)

(assert (=> d!35168 (= lt!168963 (choose!30 lt!168622 (_2!4870 lt!167705) (_2!4870 lt!167705)))))

(assert (=> d!35168 (isPrefixOf!0 lt!168622 (_2!4870 lt!167705))))

(assert (=> d!35168 (= (lemmaIsPrefixTransitive!0 lt!168622 (_2!4870 lt!167705) (_2!4870 lt!167705)) lt!168963)))

(declare-fun bs!8606 () Bool)

(assert (= bs!8606 d!35168))

(assert (=> bs!8606 m!165111))

(declare-fun m!165593 () Bool)

(assert (=> bs!8606 m!165593))

(assert (=> bs!8606 m!165111))

(assert (=> d!34984 d!35168))

(declare-fun d!35170 () Bool)

(assert (=> d!35170 (isPrefixOf!0 (_2!4870 lt!167696) (_2!4870 lt!167696))))

(declare-fun lt!168964 () Unit!6792)

(assert (=> d!35170 (= lt!168964 (choose!11 (_2!4870 lt!167696)))))

(assert (=> d!35170 (= (lemmaIsPrefixRefl!0 (_2!4870 lt!167696)) lt!168964)))

(declare-fun bs!8607 () Bool)

(assert (= bs!8607 d!35170))

(assert (=> bs!8607 m!165099))

(declare-fun m!165595 () Bool)

(assert (=> bs!8607 m!165595))

(assert (=> d!34984 d!35170))

(assert (=> d!34984 d!35022))

(declare-fun d!35172 () Bool)

(declare-fun res!91909 () Bool)

(declare-fun e!73033 () Bool)

(assert (=> d!35172 (=> (not res!91909) (not e!73033))))

(assert (=> d!35172 (= res!91909 (= (size!2312 (buf!2709 (_2!4870 lt!167696))) (size!2312 (buf!2709 (_2!4870 lt!167705)))))))

(assert (=> d!35172 (= (isPrefixOf!0 (_2!4870 lt!167696) (_2!4870 lt!167705)) e!73033)))

(declare-fun b!111326 () Bool)

(declare-fun res!91908 () Bool)

(assert (=> b!111326 (=> (not res!91908) (not e!73033))))

(assert (=> b!111326 (= res!91908 (bvsle (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167705))) (currentByte!5266 (_2!4870 lt!167705)) (currentBit!5261 (_2!4870 lt!167705)))))))

(declare-fun b!111327 () Bool)

(declare-fun e!73032 () Bool)

(assert (=> b!111327 (= e!73033 e!73032)))

(declare-fun res!91910 () Bool)

(assert (=> b!111327 (=> res!91910 e!73032)))

(assert (=> b!111327 (= res!91910 (= (size!2312 (buf!2709 (_2!4870 lt!167696))) #b00000000000000000000000000000000))))

(declare-fun b!111328 () Bool)

(assert (=> b!111328 (= e!73032 (arrayBitRangesEq!0 (buf!2709 (_2!4870 lt!167696)) (buf!2709 (_2!4870 lt!167705)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696)))))))

(assert (= (and d!35172 res!91909) b!111326))

(assert (= (and b!111326 res!91908) b!111327))

(assert (= (and b!111327 (not res!91910)) b!111328))

(assert (=> b!111326 m!164405))

(assert (=> b!111326 m!165085))

(assert (=> b!111328 m!164405))

(assert (=> b!111328 m!164405))

(declare-fun m!165597 () Bool)

(assert (=> b!111328 m!165597))

(assert (=> d!34984 d!35172))

(assert (=> d!34984 d!35026))

(declare-fun d!35174 () Bool)

(declare-fun res!91912 () Bool)

(declare-fun e!73035 () Bool)

(assert (=> d!35174 (=> (not res!91912) (not e!73035))))

(assert (=> d!35174 (= res!91912 (= (size!2312 (buf!2709 lt!168622)) (size!2312 (buf!2709 (_2!4870 lt!167705)))))))

(assert (=> d!35174 (= (isPrefixOf!0 lt!168622 (_2!4870 lt!167705)) e!73035)))

(declare-fun b!111329 () Bool)

(declare-fun res!91911 () Bool)

(assert (=> b!111329 (=> (not res!91911) (not e!73035))))

(assert (=> b!111329 (= res!91911 (bvsle (bitIndex!0 (size!2312 (buf!2709 lt!168622)) (currentByte!5266 lt!168622) (currentBit!5261 lt!168622)) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167705))) (currentByte!5266 (_2!4870 lt!167705)) (currentBit!5261 (_2!4870 lt!167705)))))))

(declare-fun b!111330 () Bool)

(declare-fun e!73034 () Bool)

(assert (=> b!111330 (= e!73035 e!73034)))

(declare-fun res!91913 () Bool)

(assert (=> b!111330 (=> res!91913 e!73034)))

(assert (=> b!111330 (= res!91913 (= (size!2312 (buf!2709 lt!168622)) #b00000000000000000000000000000000))))

(declare-fun b!111331 () Bool)

(assert (=> b!111331 (= e!73034 (arrayBitRangesEq!0 (buf!2709 lt!168622) (buf!2709 (_2!4870 lt!167705)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2312 (buf!2709 lt!168622)) (currentByte!5266 lt!168622) (currentBit!5261 lt!168622))))))

(assert (= (and d!35174 res!91912) b!111329))

(assert (= (and b!111329 res!91911) b!111330))

(assert (= (and b!111330 (not res!91913)) b!111331))

(assert (=> b!111329 m!165587))

(assert (=> b!111329 m!165085))

(assert (=> b!111331 m!165587))

(assert (=> b!111331 m!165587))

(declare-fun m!165599 () Bool)

(assert (=> b!111331 m!165599))

(assert (=> d!34984 d!35174))

(declare-fun d!35176 () Bool)

(assert (=> d!35176 (isPrefixOf!0 lt!168622 lt!168622)))

(declare-fun lt!168965 () Unit!6792)

(assert (=> d!35176 (= lt!168965 (choose!11 lt!168622))))

(assert (=> d!35176 (= (lemmaIsPrefixRefl!0 lt!168622) lt!168965)))

(declare-fun bs!8608 () Bool)

(assert (= bs!8608 d!35176))

(assert (=> bs!8608 m!165103))

(declare-fun m!165601 () Bool)

(assert (=> bs!8608 m!165601))

(assert (=> d!34984 d!35176))

(declare-fun d!35178 () Bool)

(declare-fun res!91915 () Bool)

(declare-fun e!73037 () Bool)

(assert (=> d!35178 (=> (not res!91915) (not e!73037))))

(assert (=> d!35178 (= res!91915 (= (size!2312 (buf!2709 (_1!4871 lt!168626))) (size!2312 (buf!2709 (_2!4871 lt!168626)))))))

(assert (=> d!35178 (= (isPrefixOf!0 (_1!4871 lt!168626) (_2!4871 lt!168626)) e!73037)))

(declare-fun b!111332 () Bool)

(declare-fun res!91914 () Bool)

(assert (=> b!111332 (=> (not res!91914) (not e!73037))))

(assert (=> b!111332 (= res!91914 (bvsle (bitIndex!0 (size!2312 (buf!2709 (_1!4871 lt!168626))) (currentByte!5266 (_1!4871 lt!168626)) (currentBit!5261 (_1!4871 lt!168626))) (bitIndex!0 (size!2312 (buf!2709 (_2!4871 lt!168626))) (currentByte!5266 (_2!4871 lt!168626)) (currentBit!5261 (_2!4871 lt!168626)))))))

(declare-fun b!111333 () Bool)

(declare-fun e!73036 () Bool)

(assert (=> b!111333 (= e!73037 e!73036)))

(declare-fun res!91916 () Bool)

(assert (=> b!111333 (=> res!91916 e!73036)))

(assert (=> b!111333 (= res!91916 (= (size!2312 (buf!2709 (_1!4871 lt!168626))) #b00000000000000000000000000000000))))

(declare-fun b!111334 () Bool)

(assert (=> b!111334 (= e!73036 (arrayBitRangesEq!0 (buf!2709 (_1!4871 lt!168626)) (buf!2709 (_2!4871 lt!168626)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2312 (buf!2709 (_1!4871 lt!168626))) (currentByte!5266 (_1!4871 lt!168626)) (currentBit!5261 (_1!4871 lt!168626)))))))

(assert (= (and d!35178 res!91915) b!111332))

(assert (= (and b!111332 res!91914) b!111333))

(assert (= (and b!111333 (not res!91916)) b!111334))

(assert (=> b!111332 m!165289))

(assert (=> b!111332 m!165265))

(assert (=> b!111334 m!165289))

(assert (=> b!111334 m!165289))

(declare-fun m!165603 () Bool)

(assert (=> b!111334 m!165603))

(assert (=> d!34984 d!35178))

(declare-fun d!35180 () Bool)

(declare-fun e!73038 () Bool)

(assert (=> d!35180 e!73038))

(declare-fun res!91918 () Bool)

(assert (=> d!35180 (=> (not res!91918) (not e!73038))))

(declare-fun lt!168968 () (_ BitVec 64))

(declare-fun lt!168967 () (_ BitVec 64))

(declare-fun lt!168969 () (_ BitVec 64))

(assert (=> d!35180 (= res!91918 (= lt!168967 (bvsub lt!168968 lt!168969)))))

(assert (=> d!35180 (or (= (bvand lt!168968 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168969 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168968 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168968 lt!168969) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35180 (= lt!168969 (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!168646)))) ((_ sign_extend 32) (currentByte!5266 (_1!4869 lt!168646))) ((_ sign_extend 32) (currentBit!5261 (_1!4869 lt!168646)))))))

(declare-fun lt!168970 () (_ BitVec 64))

(declare-fun lt!168971 () (_ BitVec 64))

(assert (=> d!35180 (= lt!168968 (bvmul lt!168970 lt!168971))))

(assert (=> d!35180 (or (= lt!168970 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!168971 (bvsdiv (bvmul lt!168970 lt!168971) lt!168970)))))

(assert (=> d!35180 (= lt!168971 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35180 (= lt!168970 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!168646)))))))

(assert (=> d!35180 (= lt!168967 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5266 (_1!4869 lt!168646))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5261 (_1!4869 lt!168646)))))))

(assert (=> d!35180 (invariant!0 (currentBit!5261 (_1!4869 lt!168646)) (currentByte!5266 (_1!4869 lt!168646)) (size!2312 (buf!2709 (_1!4869 lt!168646))))))

(assert (=> d!35180 (= (bitIndex!0 (size!2312 (buf!2709 (_1!4869 lt!168646))) (currentByte!5266 (_1!4869 lt!168646)) (currentBit!5261 (_1!4869 lt!168646))) lt!168967)))

(declare-fun b!111335 () Bool)

(declare-fun res!91917 () Bool)

(assert (=> b!111335 (=> (not res!91917) (not e!73038))))

(assert (=> b!111335 (= res!91917 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!168967))))

(declare-fun b!111336 () Bool)

(declare-fun lt!168966 () (_ BitVec 64))

(assert (=> b!111336 (= e!73038 (bvsle lt!168967 (bvmul lt!168966 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111336 (or (= lt!168966 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!168966 #b0000000000000000000000000000000000000000000000000000000000001000) lt!168966)))))

(assert (=> b!111336 (= lt!168966 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!168646)))))))

(assert (= (and d!35180 res!91918) b!111335))

(assert (= (and b!111335 res!91917) b!111336))

(declare-fun m!165605 () Bool)

(assert (=> d!35180 m!165605))

(declare-fun m!165607 () Bool)

(assert (=> d!35180 m!165607))

(assert (=> b!111146 d!35180))

(assert (=> b!111146 d!35004))

(declare-fun d!35182 () Bool)

(declare-fun e!73039 () Bool)

(assert (=> d!35182 e!73039))

(declare-fun res!91919 () Bool)

(assert (=> d!35182 (=> (not res!91919) (not e!73039))))

(assert (=> d!35182 (= res!91919 (= (buf!2709 (_2!4870 (increaseBitIndex!0 lt!167708))) (buf!2709 lt!167708)))))

(declare-fun lt!168973 () Bool)

(assert (=> d!35182 (= lt!168973 (not (= (bvand ((_ sign_extend 24) (select (arr!2905 (buf!2709 lt!167708)) (currentByte!5266 lt!167708))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5261 lt!167708)))) #b00000000000000000000000000000000)))))

(declare-fun lt!168972 () tuple2!9248)

(assert (=> d!35182 (= lt!168972 (tuple2!9249 (not (= (bvand ((_ sign_extend 24) (select (arr!2905 (buf!2709 lt!167708)) (currentByte!5266 lt!167708))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5261 lt!167708)))) #b00000000000000000000000000000000)) (_2!4870 (increaseBitIndex!0 lt!167708))))))

(assert (=> d!35182 (validate_offset_bit!0 ((_ sign_extend 32) (size!2312 (buf!2709 lt!167708))) ((_ sign_extend 32) (currentByte!5266 lt!167708)) ((_ sign_extend 32) (currentBit!5261 lt!167708)))))

(assert (=> d!35182 (= (readBit!0 lt!167708) lt!168972)))

(declare-fun lt!168974 () (_ BitVec 64))

(declare-fun lt!168977 () (_ BitVec 64))

(declare-fun b!111337 () Bool)

(assert (=> b!111337 (= e!73039 (= (bitIndex!0 (size!2312 (buf!2709 (_2!4870 (increaseBitIndex!0 lt!167708)))) (currentByte!5266 (_2!4870 (increaseBitIndex!0 lt!167708))) (currentBit!5261 (_2!4870 (increaseBitIndex!0 lt!167708)))) (bvadd lt!168974 lt!168977)))))

(assert (=> b!111337 (or (not (= (bvand lt!168974 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168977 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!168974 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!168974 lt!168977) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111337 (= lt!168977 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!111337 (= lt!168974 (bitIndex!0 (size!2312 (buf!2709 lt!167708)) (currentByte!5266 lt!167708) (currentBit!5261 lt!167708)))))

(declare-fun lt!168978 () Bool)

(assert (=> b!111337 (= lt!168978 (not (= (bvand ((_ sign_extend 24) (select (arr!2905 (buf!2709 lt!167708)) (currentByte!5266 lt!167708))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5261 lt!167708)))) #b00000000000000000000000000000000)))))

(declare-fun lt!168975 () Bool)

(assert (=> b!111337 (= lt!168975 (not (= (bvand ((_ sign_extend 24) (select (arr!2905 (buf!2709 lt!167708)) (currentByte!5266 lt!167708))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5261 lt!167708)))) #b00000000000000000000000000000000)))))

(declare-fun lt!168976 () Bool)

(assert (=> b!111337 (= lt!168976 (not (= (bvand ((_ sign_extend 24) (select (arr!2905 (buf!2709 lt!167708)) (currentByte!5266 lt!167708))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5261 lt!167708)))) #b00000000000000000000000000000000)))))

(assert (= (and d!35182 res!91919) b!111337))

(declare-fun m!165609 () Bool)

(assert (=> d!35182 m!165609))

(declare-fun m!165611 () Bool)

(assert (=> d!35182 m!165611))

(declare-fun m!165613 () Bool)

(assert (=> d!35182 m!165613))

(declare-fun m!165615 () Bool)

(assert (=> d!35182 m!165615))

(declare-fun m!165617 () Bool)

(assert (=> b!111337 m!165617))

(assert (=> b!111337 m!165611))

(declare-fun m!165619 () Bool)

(assert (=> b!111337 m!165619))

(assert (=> b!111337 m!165613))

(assert (=> b!111337 m!165609))

(assert (=> d!34968 d!35182))

(declare-fun d!35184 () Bool)

(declare-fun e!73041 () Bool)

(assert (=> d!35184 e!73041))

(declare-fun res!91921 () Bool)

(assert (=> d!35184 (=> (not res!91921) (not e!73041))))

(declare-fun lt!168981 () tuple2!9250)

(assert (=> d!35184 (= res!91921 (= (buf!2709 (_2!4882 lt!168981)) (buf!2709 (_1!4871 lt!167690))))))

(declare-fun e!73042 () tuple2!9250)

(assert (=> d!35184 (= lt!168981 e!73042)))

(declare-fun c!6770 () Bool)

(assert (=> d!35184 (= c!6770 (= nBits!396 i!615))))

(assert (=> d!35184 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!35184 (= (readNLeastSignificantBitsLoop!0 (_1!4871 lt!167690) nBits!396 i!615 lt!167689) lt!168981)))

(declare-fun b!111338 () Bool)

(declare-fun res!91923 () Bool)

(assert (=> b!111338 (=> (not res!91923) (not e!73041))))

(declare-fun lt!168980 () (_ BitVec 64))

(declare-fun lt!168983 () (_ BitVec 64))

(assert (=> b!111338 (= res!91923 (= (bitIndex!0 (size!2312 (buf!2709 (_2!4882 lt!168981))) (currentByte!5266 (_2!4882 lt!168981)) (currentBit!5261 (_2!4882 lt!168981))) (bvadd lt!168980 lt!168983)))))

(assert (=> b!111338 (or (not (= (bvand lt!168980 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168983 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!168980 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!168980 lt!168983) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111338 (= lt!168983 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!111338 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!111338 (= lt!168980 (bitIndex!0 (size!2312 (buf!2709 (_1!4871 lt!167690))) (currentByte!5266 (_1!4871 lt!167690)) (currentBit!5261 (_1!4871 lt!167690))))))

(declare-fun b!111339 () Bool)

(declare-fun e!73040 () Bool)

(assert (=> b!111339 (= e!73041 e!73040)))

(declare-fun res!91920 () Bool)

(assert (=> b!111339 (=> res!91920 e!73040)))

(assert (=> b!111339 (= res!91920 (bvsge i!615 nBits!396))))

(declare-fun b!111340 () Bool)

(declare-fun lt!168982 () (_ BitVec 64))

(assert (=> b!111340 (= e!73040 (= (= (bvand (bvlshr (_1!4882 lt!168981) lt!168982) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!4869 (readBitPure!0 (_1!4871 lt!167690)))))))

(assert (=> b!111340 (and (bvsge lt!168982 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!168982 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!168979 () (_ BitVec 32))

(assert (=> b!111340 (= lt!168982 ((_ sign_extend 32) (bvsub lt!168979 i!615)))))

(assert (=> b!111340 (or (= (bvand lt!168979 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand lt!168979 #b10000000000000000000000000000000) (bvand (bvsub lt!168979 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!111340 (= lt!168979 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!111340 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!111341 () Bool)

(declare-fun res!91924 () Bool)

(assert (=> b!111341 (=> (not res!91924) (not e!73041))))

(assert (=> b!111341 (= res!91924 (= (bvand (_1!4882 lt!168981) (onesLSBLong!0 nBits!396)) (_1!4882 lt!168981)))))

(declare-fun b!111342 () Bool)

(declare-fun res!91922 () Bool)

(assert (=> b!111342 (=> (not res!91922) (not e!73041))))

(declare-fun lt!168987 () (_ BitVec 64))

(declare-fun lt!168985 () (_ BitVec 64))

(assert (=> b!111342 (= res!91922 (= (bvlshr (_1!4882 lt!168981) lt!168987) (bvlshr lt!167689 lt!168985)))))

(assert (=> b!111342 (and (bvsge lt!168985 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!168985 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!111342 (= lt!168985 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!111342 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!111342 (and (bvsge lt!168987 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!168987 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!111342 (= lt!168987 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!111342 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(declare-fun b!111343 () Bool)

(declare-fun lt!168986 () tuple2!9250)

(assert (=> b!111343 (= e!73042 (tuple2!9251 (_1!4882 lt!168986) (_2!4882 lt!168986)))))

(declare-fun lt!168984 () tuple2!9248)

(assert (=> b!111343 (= lt!168984 (readBit!0 (_1!4871 lt!167690)))))

(assert (=> b!111343 (= lt!168986 (readNLeastSignificantBitsLoop!0 (_2!4881 lt!168984) nBits!396 (bvadd i!615 #b00000000000000000000000000000001) (bvor lt!167689 (ite (_1!4881 lt!168984) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!111344 () Bool)

(assert (=> b!111344 (= e!73042 (tuple2!9251 lt!167689 (_1!4871 lt!167690)))))

(assert (= (and d!35184 c!6770) b!111344))

(assert (= (and d!35184 (not c!6770)) b!111343))

(assert (= (and d!35184 res!91921) b!111338))

(assert (= (and b!111338 res!91923) b!111342))

(assert (= (and b!111342 res!91922) b!111341))

(assert (= (and b!111341 res!91924) b!111339))

(assert (= (and b!111339 (not res!91920)) b!111340))

(declare-fun m!165621 () Bool)

(assert (=> b!111338 m!165621))

(assert (=> b!111338 m!165231))

(assert (=> b!111340 m!164419))

(assert (=> b!111341 m!164449))

(assert (=> b!111343 m!165053))

(declare-fun m!165623 () Bool)

(assert (=> b!111343 m!165623))

(assert (=> d!34980 d!35184))

(declare-fun d!35186 () Bool)

(declare-fun res!91926 () Bool)

(declare-fun e!73044 () Bool)

(assert (=> d!35186 (=> (not res!91926) (not e!73044))))

(assert (=> d!35186 (= res!91926 (= (size!2312 (buf!2709 thiss!1305)) (size!2312 (buf!2709 (_2!4870 lt!168644)))))))

(assert (=> d!35186 (= (isPrefixOf!0 thiss!1305 (_2!4870 lt!168644)) e!73044)))

(declare-fun b!111345 () Bool)

(declare-fun res!91925 () Bool)

(assert (=> b!111345 (=> (not res!91925) (not e!73044))))

(assert (=> b!111345 (= res!91925 (bvsle (bitIndex!0 (size!2312 (buf!2709 thiss!1305)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305)) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168644))) (currentByte!5266 (_2!4870 lt!168644)) (currentBit!5261 (_2!4870 lt!168644)))))))

(declare-fun b!111346 () Bool)

(declare-fun e!73043 () Bool)

(assert (=> b!111346 (= e!73044 e!73043)))

(declare-fun res!91927 () Bool)

(assert (=> b!111346 (=> res!91927 e!73043)))

(assert (=> b!111346 (= res!91927 (= (size!2312 (buf!2709 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!111347 () Bool)

(assert (=> b!111347 (= e!73043 (arrayBitRangesEq!0 (buf!2709 thiss!1305) (buf!2709 (_2!4870 lt!168644)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2312 (buf!2709 thiss!1305)) (currentByte!5266 thiss!1305) (currentBit!5261 thiss!1305))))))

(assert (= (and d!35186 res!91926) b!111345))

(assert (= (and b!111345 res!91925) b!111346))

(assert (= (and b!111346 (not res!91927)) b!111347))

(assert (=> b!111345 m!164407))

(assert (=> b!111345 m!165129))

(assert (=> b!111347 m!164407))

(assert (=> b!111347 m!164407))

(declare-fun m!165625 () Bool)

(assert (=> b!111347 m!165625))

(assert (=> b!111144 d!35186))

(assert (=> d!34938 d!34996))

(declare-fun d!35188 () Bool)

(assert (=> d!35188 (isPrefixOf!0 thiss!1305 (_2!4870 lt!167705))))

(assert (=> d!35188 true))

(declare-fun _$15!171 () Unit!6792)

(assert (=> d!35188 (= (choose!30 thiss!1305 (_2!4870 lt!167696) (_2!4870 lt!167705)) _$15!171)))

(declare-fun bs!8609 () Bool)

(assert (= bs!8609 d!35188))

(assert (=> bs!8609 m!164427))

(assert (=> d!34938 d!35188))

(assert (=> d!34938 d!34932))

(declare-fun d!35190 () Bool)

(assert (=> d!35190 (isPrefixOf!0 lt!168495 lt!168495)))

(declare-fun lt!168988 () Unit!6792)

(assert (=> d!35190 (= lt!168988 (choose!11 lt!168495))))

(assert (=> d!35190 (= (lemmaIsPrefixRefl!0 lt!168495) lt!168988)))

(declare-fun bs!8610 () Bool)

(assert (= bs!8610 d!35190))

(declare-fun m!165627 () Bool)

(assert (=> bs!8610 m!165627))

(declare-fun m!165629 () Bool)

(assert (=> bs!8610 m!165629))

(assert (=> b!111109 d!35190))

(declare-fun d!35192 () Bool)

(assert (=> d!35192 (validate_offset_bits!1 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168496)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!167696))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!167696))) lt!168527)))

(declare-fun lt!168989 () Unit!6792)

(assert (=> d!35192 (= lt!168989 (choose!9 (_2!4870 lt!167696) (buf!2709 (_2!4870 lt!168496)) lt!168527 (BitStream!4099 (buf!2709 (_2!4870 lt!168496)) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696)))))))

(assert (=> d!35192 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4870 lt!167696) (buf!2709 (_2!4870 lt!168496)) lt!168527) lt!168989)))

(declare-fun bs!8611 () Bool)

(assert (= bs!8611 d!35192))

(assert (=> bs!8611 m!165041))

(declare-fun m!165631 () Bool)

(assert (=> bs!8611 m!165631))

(assert (=> b!111107 d!35192))

(declare-fun lt!168990 () tuple2!9250)

(declare-fun d!35194 () Bool)

(assert (=> d!35194 (= lt!168990 (readNLeastSignificantBitsLoop!0 (_1!4871 lt!168519) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168517))))

(assert (=> d!35194 (= (readNLeastSignificantBitsLoopPure!0 (_1!4871 lt!168519) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168517) (tuple2!9231 (_2!4882 lt!168990) (_1!4882 lt!168990)))))

(declare-fun bs!8612 () Bool)

(assert (= bs!8612 d!35194))

(declare-fun m!165633 () Bool)

(assert (=> bs!8612 m!165633))

(assert (=> b!111107 d!35194))

(declare-fun b!111348 () Bool)

(declare-fun res!91930 () Bool)

(declare-fun e!73046 () Bool)

(assert (=> b!111348 (=> (not res!91930) (not e!73046))))

(declare-fun lt!169005 () tuple2!9228)

(assert (=> b!111348 (= res!91930 (isPrefixOf!0 (_2!4871 lt!169005) (_2!4870 lt!168496)))))

(declare-fun b!111349 () Bool)

(declare-fun e!73045 () Unit!6792)

(declare-fun Unit!6828 () Unit!6792)

(assert (=> b!111349 (= e!73045 Unit!6828)))

(declare-fun d!35196 () Bool)

(assert (=> d!35196 e!73046))

(declare-fun res!91928 () Bool)

(assert (=> d!35196 (=> (not res!91928) (not e!73046))))

(assert (=> d!35196 (= res!91928 (isPrefixOf!0 (_1!4871 lt!169005) (_2!4871 lt!169005)))))

(declare-fun lt!169001 () BitStream!4098)

(assert (=> d!35196 (= lt!169005 (tuple2!9229 lt!169001 (_2!4870 lt!168496)))))

(declare-fun lt!169000 () Unit!6792)

(declare-fun lt!169009 () Unit!6792)

(assert (=> d!35196 (= lt!169000 lt!169009)))

(assert (=> d!35196 (isPrefixOf!0 lt!169001 (_2!4870 lt!168496))))

(assert (=> d!35196 (= lt!169009 (lemmaIsPrefixTransitive!0 lt!169001 (_2!4870 lt!168496) (_2!4870 lt!168496)))))

(declare-fun lt!168997 () Unit!6792)

(declare-fun lt!169006 () Unit!6792)

(assert (=> d!35196 (= lt!168997 lt!169006)))

(assert (=> d!35196 (isPrefixOf!0 lt!169001 (_2!4870 lt!168496))))

(assert (=> d!35196 (= lt!169006 (lemmaIsPrefixTransitive!0 lt!169001 (_2!4870 lt!167696) (_2!4870 lt!168496)))))

(declare-fun lt!169007 () Unit!6792)

(assert (=> d!35196 (= lt!169007 e!73045)))

(declare-fun c!6771 () Bool)

(assert (=> d!35196 (= c!6771 (not (= (size!2312 (buf!2709 (_2!4870 lt!167696))) #b00000000000000000000000000000000)))))

(declare-fun lt!168993 () Unit!6792)

(declare-fun lt!169003 () Unit!6792)

(assert (=> d!35196 (= lt!168993 lt!169003)))

(assert (=> d!35196 (isPrefixOf!0 (_2!4870 lt!168496) (_2!4870 lt!168496))))

(assert (=> d!35196 (= lt!169003 (lemmaIsPrefixRefl!0 (_2!4870 lt!168496)))))

(declare-fun lt!169004 () Unit!6792)

(declare-fun lt!168992 () Unit!6792)

(assert (=> d!35196 (= lt!169004 lt!168992)))

(assert (=> d!35196 (= lt!168992 (lemmaIsPrefixRefl!0 (_2!4870 lt!168496)))))

(declare-fun lt!168994 () Unit!6792)

(declare-fun lt!168998 () Unit!6792)

(assert (=> d!35196 (= lt!168994 lt!168998)))

(assert (=> d!35196 (isPrefixOf!0 lt!169001 lt!169001)))

(assert (=> d!35196 (= lt!168998 (lemmaIsPrefixRefl!0 lt!169001))))

(declare-fun lt!169002 () Unit!6792)

(declare-fun lt!168996 () Unit!6792)

(assert (=> d!35196 (= lt!169002 lt!168996)))

(assert (=> d!35196 (isPrefixOf!0 (_2!4870 lt!167696) (_2!4870 lt!167696))))

(assert (=> d!35196 (= lt!168996 (lemmaIsPrefixRefl!0 (_2!4870 lt!167696)))))

(assert (=> d!35196 (= lt!169001 (BitStream!4099 (buf!2709 (_2!4870 lt!168496)) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))))))

(assert (=> d!35196 (isPrefixOf!0 (_2!4870 lt!167696) (_2!4870 lt!168496))))

(assert (=> d!35196 (= (reader!0 (_2!4870 lt!167696) (_2!4870 lt!168496)) lt!169005)))

(declare-fun lt!169008 () (_ BitVec 64))

(declare-fun lt!168999 () (_ BitVec 64))

(declare-fun b!111350 () Bool)

(assert (=> b!111350 (= e!73046 (= (_1!4871 lt!169005) (withMovedBitIndex!0 (_2!4871 lt!169005) (bvsub lt!168999 lt!169008))))))

(assert (=> b!111350 (or (= (bvand lt!168999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169008 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168999 lt!169008) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111350 (= lt!169008 (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168496))) (currentByte!5266 (_2!4870 lt!168496)) (currentBit!5261 (_2!4870 lt!168496))))))

(assert (=> b!111350 (= lt!168999 (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))))))

(declare-fun b!111351 () Bool)

(declare-fun lt!169010 () Unit!6792)

(assert (=> b!111351 (= e!73045 lt!169010)))

(declare-fun lt!168995 () (_ BitVec 64))

(assert (=> b!111351 (= lt!168995 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!168991 () (_ BitVec 64))

(assert (=> b!111351 (= lt!168991 (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))))))

(assert (=> b!111351 (= lt!169010 (arrayBitRangesEqSymmetric!0 (buf!2709 (_2!4870 lt!167696)) (buf!2709 (_2!4870 lt!168496)) lt!168995 lt!168991))))

(assert (=> b!111351 (arrayBitRangesEq!0 (buf!2709 (_2!4870 lt!168496)) (buf!2709 (_2!4870 lt!167696)) lt!168995 lt!168991)))

(declare-fun b!111352 () Bool)

(declare-fun res!91929 () Bool)

(assert (=> b!111352 (=> (not res!91929) (not e!73046))))

(assert (=> b!111352 (= res!91929 (isPrefixOf!0 (_1!4871 lt!169005) (_2!4870 lt!167696)))))

(assert (= (and d!35196 c!6771) b!111351))

(assert (= (and d!35196 (not c!6771)) b!111349))

(assert (= (and d!35196 res!91928) b!111352))

(assert (= (and b!111352 res!91929) b!111348))

(assert (= (and b!111348 res!91930) b!111350))

(declare-fun m!165635 () Bool)

(assert (=> d!35196 m!165635))

(assert (=> d!35196 m!165099))

(declare-fun m!165637 () Bool)

(assert (=> d!35196 m!165637))

(declare-fun m!165639 () Bool)

(assert (=> d!35196 m!165639))

(assert (=> d!35196 m!165045))

(assert (=> d!35196 m!165107))

(declare-fun m!165641 () Bool)

(assert (=> d!35196 m!165641))

(declare-fun m!165643 () Bool)

(assert (=> d!35196 m!165643))

(declare-fun m!165645 () Bool)

(assert (=> d!35196 m!165645))

(declare-fun m!165647 () Bool)

(assert (=> d!35196 m!165647))

(declare-fun m!165649 () Bool)

(assert (=> d!35196 m!165649))

(assert (=> b!111351 m!164405))

(declare-fun m!165651 () Bool)

(assert (=> b!111351 m!165651))

(declare-fun m!165653 () Bool)

(assert (=> b!111351 m!165653))

(declare-fun m!165655 () Bool)

(assert (=> b!111352 m!165655))

(declare-fun m!165657 () Bool)

(assert (=> b!111348 m!165657))

(declare-fun m!165659 () Bool)

(assert (=> b!111350 m!165659))

(assert (=> b!111350 m!164981))

(assert (=> b!111350 m!164405))

(assert (=> b!111107 d!35196))

(assert (=> b!111107 d!35124))

(declare-fun d!35198 () Bool)

(assert (=> d!35198 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168496)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!167696))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!167696))) lt!168527) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_2!4870 lt!168496)))) ((_ sign_extend 32) (currentByte!5266 (_2!4870 lt!167696))) ((_ sign_extend 32) (currentBit!5261 (_2!4870 lt!167696)))) lt!168527))))

(declare-fun bs!8613 () Bool)

(assert (= bs!8613 d!35198))

(declare-fun m!165661 () Bool)

(assert (=> bs!8613 m!165661))

(assert (=> b!111107 d!35198))

(declare-fun d!35200 () Bool)

(assert (=> d!35200 (= (remainingBits!0 ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!167692)))) ((_ sign_extend 32) (currentByte!5266 (_1!4869 lt!167692))) ((_ sign_extend 32) (currentBit!5261 (_1!4869 lt!167692)))) (bvsub (bvmul ((_ sign_extend 32) (size!2312 (buf!2709 (_1!4869 lt!167692)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5266 (_1!4869 lt!167692))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5261 (_1!4869 lt!167692))))))))

(assert (=> d!35000 d!35200))

(declare-fun d!35202 () Bool)

(assert (=> d!35202 (= (invariant!0 (currentBit!5261 (_1!4869 lt!167692)) (currentByte!5266 (_1!4869 lt!167692)) (size!2312 (buf!2709 (_1!4869 lt!167692)))) (and (bvsge (currentBit!5261 (_1!4869 lt!167692)) #b00000000000000000000000000000000) (bvslt (currentBit!5261 (_1!4869 lt!167692)) #b00000000000000000000000000001000) (bvsge (currentByte!5266 (_1!4869 lt!167692)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5266 (_1!4869 lt!167692)) (size!2312 (buf!2709 (_1!4869 lt!167692)))) (and (= (currentBit!5261 (_1!4869 lt!167692)) #b00000000000000000000000000000000) (= (currentByte!5266 (_1!4869 lt!167692)) (size!2312 (buf!2709 (_1!4869 lt!167692))))))))))

(assert (=> d!35000 d!35202))

(assert (=> b!111101 d!35046))

(assert (=> b!111101 d!34918))

(declare-fun d!35204 () Bool)

(declare-fun res!91932 () Bool)

(declare-fun e!73048 () Bool)

(assert (=> d!35204 (=> (not res!91932) (not e!73048))))

(assert (=> d!35204 (= res!91932 (= (size!2312 (buf!2709 (_2!4870 lt!167696))) (size!2312 (buf!2709 (_2!4870 lt!168511)))))))

(assert (=> d!35204 (= (isPrefixOf!0 (_2!4870 lt!167696) (_2!4870 lt!168511)) e!73048)))

(declare-fun b!111353 () Bool)

(declare-fun res!91931 () Bool)

(assert (=> b!111353 (=> (not res!91931) (not e!73048))))

(assert (=> b!111353 (= res!91931 (bvsle (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696))) (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!168511))) (currentByte!5266 (_2!4870 lt!168511)) (currentBit!5261 (_2!4870 lt!168511)))))))

(declare-fun b!111354 () Bool)

(declare-fun e!73047 () Bool)

(assert (=> b!111354 (= e!73048 e!73047)))

(declare-fun res!91933 () Bool)

(assert (=> b!111354 (=> res!91933 e!73047)))

(assert (=> b!111354 (= res!91933 (= (size!2312 (buf!2709 (_2!4870 lt!167696))) #b00000000000000000000000000000000))))

(declare-fun b!111355 () Bool)

(assert (=> b!111355 (= e!73047 (arrayBitRangesEq!0 (buf!2709 (_2!4870 lt!167696)) (buf!2709 (_2!4870 lt!168511)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2312 (buf!2709 (_2!4870 lt!167696))) (currentByte!5266 (_2!4870 lt!167696)) (currentBit!5261 (_2!4870 lt!167696)))))))

(assert (= (and d!35204 res!91932) b!111353))

(assert (= (and b!111353 res!91931) b!111354))

(assert (= (and b!111354 (not res!91933)) b!111355))

(assert (=> b!111353 m!164405))

(assert (=> b!111353 m!164973))

(assert (=> b!111355 m!164405))

(assert (=> b!111355 m!164405))

(declare-fun m!165663 () Bool)

(assert (=> b!111355 m!165663))

(assert (=> b!111103 d!35204))

(assert (=> b!111132 d!34918))

(declare-fun d!35206 () Bool)

(assert (=> d!35206 (arrayBitRangesEq!0 (buf!2709 (_2!4870 lt!167705)) (buf!2709 (_2!4870 lt!167696)) lt!168616 lt!168612)))

(declare-fun lt!169013 () Unit!6792)

(declare-fun choose!8 (array!5083 array!5083 (_ BitVec 64) (_ BitVec 64)) Unit!6792)

(assert (=> d!35206 (= lt!169013 (choose!8 (buf!2709 (_2!4870 lt!167696)) (buf!2709 (_2!4870 lt!167705)) lt!168616 lt!168612))))

(assert (=> d!35206 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!168616) (bvsle lt!168616 lt!168612))))

(assert (=> d!35206 (= (arrayBitRangesEqSymmetric!0 (buf!2709 (_2!4870 lt!167696)) (buf!2709 (_2!4870 lt!167705)) lt!168616 lt!168612) lt!169013)))

(declare-fun bs!8614 () Bool)

(assert (= bs!8614 d!35206))

(assert (=> bs!8614 m!165117))

(declare-fun m!165665 () Bool)

(assert (=> bs!8614 m!165665))

(assert (=> b!111132 d!35206))

(declare-fun b!111356 () Bool)

(declare-fun e!73050 () Bool)

(declare-fun e!73052 () Bool)

(assert (=> b!111356 (= e!73050 e!73052)))

(declare-fun res!91938 () Bool)

(assert (=> b!111356 (=> (not res!91938) (not e!73052))))

(declare-fun e!73054 () Bool)

(assert (=> b!111356 (= res!91938 e!73054)))

(declare-fun res!91937 () Bool)

(assert (=> b!111356 (=> res!91937 e!73054)))

(declare-fun lt!169016 () tuple4!72)

(assert (=> b!111356 (= res!91937 (bvsge (_1!4883 lt!169016) (_2!4883 lt!169016)))))

(declare-fun lt!169014 () (_ BitVec 32))

(assert (=> b!111356 (= lt!169014 ((_ extract 31 0) (bvsrem lt!168612 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!169015 () (_ BitVec 32))

(assert (=> b!111356 (= lt!169015 ((_ extract 31 0) (bvsrem lt!168616 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111356 (= lt!169016 (arrayBitIndices!0 lt!168616 lt!168612))))

(declare-fun b!111357 () Bool)

(declare-fun res!91934 () Bool)

(assert (=> b!111357 (= res!91934 (= lt!169014 #b00000000000000000000000000000000))))

(declare-fun e!73051 () Bool)

(assert (=> b!111357 (=> res!91934 e!73051)))

(declare-fun e!73049 () Bool)

(assert (=> b!111357 (= e!73049 e!73051)))

(declare-fun b!111358 () Bool)

(declare-fun e!73053 () Bool)

(assert (=> b!111358 (= e!73052 e!73053)))

(declare-fun c!6772 () Bool)

(assert (=> b!111358 (= c!6772 (= (_3!257 lt!169016) (_4!36 lt!169016)))))

(declare-fun b!111359 () Bool)

(assert (=> b!111359 (= e!73051 (byteRangesEq!0 (select (arr!2905 (buf!2709 (_2!4870 lt!167705))) (_4!36 lt!169016)) (select (arr!2905 (buf!2709 (_2!4870 lt!167696))) (_4!36 lt!169016)) #b00000000000000000000000000000000 lt!169014))))

(declare-fun d!35208 () Bool)

(declare-fun res!91935 () Bool)

(assert (=> d!35208 (=> res!91935 e!73050)))

(assert (=> d!35208 (= res!91935 (bvsge lt!168616 lt!168612))))

(assert (=> d!35208 (= (arrayBitRangesEq!0 (buf!2709 (_2!4870 lt!167705)) (buf!2709 (_2!4870 lt!167696)) lt!168616 lt!168612) e!73050)))

(declare-fun b!111360 () Bool)

(assert (=> b!111360 (= e!73053 e!73049)))

(declare-fun res!91936 () Bool)

(declare-fun call!1401 () Bool)

(assert (=> b!111360 (= res!91936 call!1401)))

(assert (=> b!111360 (=> (not res!91936) (not e!73049))))

(declare-fun b!111361 () Bool)

(assert (=> b!111361 (= e!73054 (arrayRangesEq!37 (buf!2709 (_2!4870 lt!167705)) (buf!2709 (_2!4870 lt!167696)) (_1!4883 lt!169016) (_2!4883 lt!169016)))))

(declare-fun b!111362 () Bool)

(assert (=> b!111362 (= e!73053 call!1401)))

(declare-fun bm!1398 () Bool)

(assert (=> bm!1398 (= call!1401 (byteRangesEq!0 (select (arr!2905 (buf!2709 (_2!4870 lt!167705))) (_3!257 lt!169016)) (select (arr!2905 (buf!2709 (_2!4870 lt!167696))) (_3!257 lt!169016)) lt!169015 (ite c!6772 lt!169014 #b00000000000000000000000000001000)))))

(assert (= (and d!35208 (not res!91935)) b!111356))

(assert (= (and b!111356 (not res!91937)) b!111361))

(assert (= (and b!111356 res!91938) b!111358))

(assert (= (and b!111358 c!6772) b!111362))

(assert (= (and b!111358 (not c!6772)) b!111360))

(assert (= (and b!111360 res!91936) b!111357))

(assert (= (and b!111357 (not res!91934)) b!111359))

(assert (= (or b!111362 b!111360) bm!1398))

(declare-fun m!165667 () Bool)

(assert (=> b!111356 m!165667))

(declare-fun m!165669 () Bool)

(assert (=> b!111359 m!165669))

(declare-fun m!165671 () Bool)

(assert (=> b!111359 m!165671))

(assert (=> b!111359 m!165669))

(assert (=> b!111359 m!165671))

(declare-fun m!165673 () Bool)

(assert (=> b!111359 m!165673))

(declare-fun m!165675 () Bool)

(assert (=> b!111361 m!165675))

(declare-fun m!165677 () Bool)

(assert (=> bm!1398 m!165677))

(declare-fun m!165679 () Bool)

(assert (=> bm!1398 m!165679))

(assert (=> bm!1398 m!165677))

(assert (=> bm!1398 m!165679))

(declare-fun m!165681 () Bool)

(assert (=> bm!1398 m!165681))

(assert (=> b!111132 d!35208))

(assert (=> b!111125 d!34920))

(declare-fun d!35210 () Bool)

(assert (=> d!35210 (arrayBitRangesEq!0 (buf!2709 (_2!4870 lt!167705)) (buf!2709 thiss!1305) lt!168586 lt!168582)))

(declare-fun lt!169017 () Unit!6792)

(assert (=> d!35210 (= lt!169017 (choose!8 (buf!2709 thiss!1305) (buf!2709 (_2!4870 lt!167705)) lt!168586 lt!168582))))

(assert (=> d!35210 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!168586) (bvsle lt!168586 lt!168582))))

(assert (=> d!35210 (= (arrayBitRangesEqSymmetric!0 (buf!2709 thiss!1305) (buf!2709 (_2!4870 lt!167705)) lt!168586 lt!168582) lt!169017)))

(declare-fun bs!8615 () Bool)

(assert (= bs!8615 d!35210))

(assert (=> bs!8615 m!165077))

(declare-fun m!165683 () Bool)

(assert (=> bs!8615 m!165683))

(assert (=> b!111125 d!35210))

(declare-fun b!111363 () Bool)

(declare-fun e!73056 () Bool)

(declare-fun e!73058 () Bool)

(assert (=> b!111363 (= e!73056 e!73058)))

(declare-fun res!91943 () Bool)

(assert (=> b!111363 (=> (not res!91943) (not e!73058))))

(declare-fun e!73060 () Bool)

(assert (=> b!111363 (= res!91943 e!73060)))

(declare-fun res!91942 () Bool)

(assert (=> b!111363 (=> res!91942 e!73060)))

(declare-fun lt!169020 () tuple4!72)

(assert (=> b!111363 (= res!91942 (bvsge (_1!4883 lt!169020) (_2!4883 lt!169020)))))

(declare-fun lt!169018 () (_ BitVec 32))

(assert (=> b!111363 (= lt!169018 ((_ extract 31 0) (bvsrem lt!168582 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!169019 () (_ BitVec 32))

(assert (=> b!111363 (= lt!169019 ((_ extract 31 0) (bvsrem lt!168586 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111363 (= lt!169020 (arrayBitIndices!0 lt!168586 lt!168582))))

(declare-fun b!111364 () Bool)

(declare-fun res!91939 () Bool)

(assert (=> b!111364 (= res!91939 (= lt!169018 #b00000000000000000000000000000000))))

(declare-fun e!73057 () Bool)

(assert (=> b!111364 (=> res!91939 e!73057)))

(declare-fun e!73055 () Bool)

(assert (=> b!111364 (= e!73055 e!73057)))

(declare-fun b!111365 () Bool)

(declare-fun e!73059 () Bool)

(assert (=> b!111365 (= e!73058 e!73059)))

(declare-fun c!6773 () Bool)

(assert (=> b!111365 (= c!6773 (= (_3!257 lt!169020) (_4!36 lt!169020)))))

(declare-fun b!111366 () Bool)

(assert (=> b!111366 (= e!73057 (byteRangesEq!0 (select (arr!2905 (buf!2709 (_2!4870 lt!167705))) (_4!36 lt!169020)) (select (arr!2905 (buf!2709 thiss!1305)) (_4!36 lt!169020)) #b00000000000000000000000000000000 lt!169018))))

(declare-fun d!35212 () Bool)

(declare-fun res!91940 () Bool)

(assert (=> d!35212 (=> res!91940 e!73056)))

(assert (=> d!35212 (= res!91940 (bvsge lt!168586 lt!168582))))

(assert (=> d!35212 (= (arrayBitRangesEq!0 (buf!2709 (_2!4870 lt!167705)) (buf!2709 thiss!1305) lt!168586 lt!168582) e!73056)))

(declare-fun b!111367 () Bool)

(assert (=> b!111367 (= e!73059 e!73055)))

(declare-fun res!91941 () Bool)

(declare-fun call!1402 () Bool)

(assert (=> b!111367 (= res!91941 call!1402)))

(assert (=> b!111367 (=> (not res!91941) (not e!73055))))

(declare-fun b!111368 () Bool)

(assert (=> b!111368 (= e!73060 (arrayRangesEq!37 (buf!2709 (_2!4870 lt!167705)) (buf!2709 thiss!1305) (_1!4883 lt!169020) (_2!4883 lt!169020)))))

(declare-fun b!111369 () Bool)

(assert (=> b!111369 (= e!73059 call!1402)))

(declare-fun bm!1399 () Bool)

(assert (=> bm!1399 (= call!1402 (byteRangesEq!0 (select (arr!2905 (buf!2709 (_2!4870 lt!167705))) (_3!257 lt!169020)) (select (arr!2905 (buf!2709 thiss!1305)) (_3!257 lt!169020)) lt!169019 (ite c!6773 lt!169018 #b00000000000000000000000000001000)))))

(assert (= (and d!35212 (not res!91940)) b!111363))

(assert (= (and b!111363 (not res!91942)) b!111368))

(assert (= (and b!111363 res!91943) b!111365))

(assert (= (and b!111365 c!6773) b!111369))

(assert (= (and b!111365 (not c!6773)) b!111367))

(assert (= (and b!111367 res!91941) b!111364))

(assert (= (and b!111364 (not res!91939)) b!111366))

(assert (= (or b!111369 b!111367) bm!1399))

(declare-fun m!165685 () Bool)

(assert (=> b!111363 m!165685))

(declare-fun m!165687 () Bool)

(assert (=> b!111366 m!165687))

(declare-fun m!165689 () Bool)

(assert (=> b!111366 m!165689))

(assert (=> b!111366 m!165687))

(assert (=> b!111366 m!165689))

(declare-fun m!165691 () Bool)

(assert (=> b!111366 m!165691))

(declare-fun m!165693 () Bool)

(assert (=> b!111368 m!165693))

(declare-fun m!165695 () Bool)

(assert (=> bm!1399 m!165695))

(declare-fun m!165697 () Bool)

(assert (=> bm!1399 m!165697))

(assert (=> bm!1399 m!165695))

(assert (=> bm!1399 m!165697))

(declare-fun m!165699 () Bool)

(assert (=> bm!1399 m!165699))

(assert (=> b!111125 d!35212))

(check-sat (not b!111341) (not b!111332) (not d!35182) (not b!111322) (not d!35116) (not d!35192) (not d!35030) (not bm!1398) (not b!111340) (not d!35206) (not b!111257) (not d!35002) (not d!35044) (not b!111263) (not d!35102) (not b!111236) (not b!111182) (not bm!1395) (not d!35162) (not b!111307) (not b!111267) (not d!35082) (not d!35012) (not d!35126) (not b!111281) (not b!111166) (not d!35054) (not b!111224) (not b!111350) (not d!35004) (not d!35198) (not b!111304) (not b!111241) (not b!111242) (not b!111195) (not d!35084) (not d!35072) (not b!111329) (not b!111343) (not d!35168) (not b!111302) (not d!35150) (not b!111234) (not b!111326) (not b!111171) (not b!111160) (not b!111328) (not d!35154) (not d!35188) (not b!111320) (not b!111299) (not b!111196) (not b!111323) (not b!111366) (not d!35066) (not b!111317) (not b!111226) (not b!111352) (not d!35036) (not b!111237) (not b!111194) (not b!111361) (not b!111198) (not b!111279) (not d!35140) (not d!35190) (not b!111218) (not b!111216) (not b!111347) (not d!35128) (not b!111270) (not b!111165) (not b!111345) (not d!35088) (not b!111197) (not d!35112) (not d!35156) (not b!111162) (not d!35196) (not b!111246) (not b!111348) (not b!111163) (not b!111300) (not d!35058) (not bm!1396) (not d!35194) (not b!111276) (not d!35034) (not d!35106) (not b!111256) (not b!111229) (not b!111244) (not d!35094) (not b!111351) (not d!35046) (not d!35010) (not b!111258) (not b!111334) (not b!111239) (not d!35014) (not d!35118) (not b!111230) (not d!35080) (not b!111306) (not b!111169) (not d!35170) (not b!111213) (not b!111266) (not b!111355) (not b!111274) (not b!111240) (not d!35056) (not d!35098) (not b!111231) (not d!35130) (not b!111273) (not d!35104) (not b!111175) (not b!111268) (not bm!1397) (not d!35090) (not d!35018) (not d!35048) (not d!35122) (not d!35180) (not b!111233) (not d!35110) (not b!111159) (not b!111353) (not b!111227) (not b!111331) (not b!111368) (not d!35120) (not b!111168) (not b!111337) (not d!35074) (not b!111275) (not d!35108) (not b!111245) (not b!111297) (not b!111338) (not b!111356) (not d!35142) (not d!35176) (not bm!1399) (not d!35092) (not b!111319) (not b!111265) (not d!35064) (not d!35096) (not d!35152) (not b!111325) (not d!35032) (not d!35210) (not b!111172) (not b!111359) (not d!35026) (not d!35114) (not b!111259) (not b!111363) (not b!111157) (not b!111271) (not d!35038))
(check-sat)
