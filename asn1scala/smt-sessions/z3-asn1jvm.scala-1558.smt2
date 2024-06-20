; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43646 () Bool)

(assert start!43646)

(declare-fun b!207466 () Bool)

(declare-fun res!174073 () Bool)

(declare-fun e!141819 () Bool)

(assert (=> b!207466 (=> res!174073 e!141819)))

(declare-datatypes ((array!10429 0))(
  ( (array!10430 (arr!5516 (Array (_ BitVec 32) (_ BitVec 8))) (size!4586 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8280 0))(
  ( (BitStream!8281 (buf!5091 array!10429) (currentByte!9609 (_ BitVec 32)) (currentBit!9604 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8280)

(declare-datatypes ((Unit!14766 0))(
  ( (Unit!14767) )
))
(declare-datatypes ((tuple2!17794 0))(
  ( (tuple2!17795 (_1!9552 Unit!14766) (_2!9552 BitStream!8280)) )
))
(declare-fun lt!323760 () tuple2!17794)

(declare-fun isPrefixOf!0 (BitStream!8280 BitStream!8280) Bool)

(assert (=> b!207466 (= res!174073 (not (isPrefixOf!0 thiss!1204 (_2!9552 lt!323760))))))

(declare-fun b!207467 () Bool)

(declare-fun res!174076 () Bool)

(assert (=> b!207467 (=> res!174076 e!141819)))

(declare-fun lt!323755 () tuple2!17794)

(assert (=> b!207467 (= res!174076 (not (isPrefixOf!0 (_2!9552 lt!323760) (_2!9552 lt!323755))))))

(declare-fun b!207468 () Bool)

(declare-fun e!141820 () Bool)

(assert (=> b!207468 (= e!141820 e!141819)))

(declare-fun res!174065 () Bool)

(assert (=> b!207468 (=> res!174065 e!141819)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!323770 () (_ BitVec 64))

(declare-fun lt!323772 () (_ BitVec 64))

(assert (=> b!207468 (= res!174065 (not (= lt!323770 (bvsub (bvsub (bvadd lt!323772 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!207468 (= lt!323770 (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!323755))) (currentByte!9609 (_2!9552 lt!323755)) (currentBit!9604 (_2!9552 lt!323755))))))

(assert (=> b!207468 (isPrefixOf!0 thiss!1204 (_2!9552 lt!323755))))

(declare-fun lt!323768 () Unit!14766)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8280 BitStream!8280 BitStream!8280) Unit!14766)

(assert (=> b!207468 (= lt!323768 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9552 lt!323760) (_2!9552 lt!323755)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8280 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17794)

(assert (=> b!207468 (= lt!323755 (appendBitsLSBFirstLoopTR!0 (_2!9552 lt!323760) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!207469 () Bool)

(declare-fun e!141822 () Bool)

(declare-fun e!141817 () Bool)

(assert (=> b!207469 (= e!141822 e!141817)))

(declare-fun res!174075 () Bool)

(assert (=> b!207469 (=> (not res!174075) (not e!141817))))

(declare-fun lt!323756 () Bool)

(declare-datatypes ((tuple2!17796 0))(
  ( (tuple2!17797 (_1!9553 BitStream!8280) (_2!9553 Bool)) )
))
(declare-fun lt!323761 () tuple2!17796)

(assert (=> b!207469 (= res!174075 (and (= (_2!9553 lt!323761) lt!323756) (= (_1!9553 lt!323761) (_2!9552 lt!323760))))))

(declare-fun readBitPure!0 (BitStream!8280) tuple2!17796)

(declare-fun readerFrom!0 (BitStream!8280 (_ BitVec 32) (_ BitVec 32)) BitStream!8280)

(assert (=> b!207469 (= lt!323761 (readBitPure!0 (readerFrom!0 (_2!9552 lt!323760) (currentBit!9604 thiss!1204) (currentByte!9609 thiss!1204))))))

(declare-fun b!207470 () Bool)

(declare-fun res!174071 () Bool)

(declare-fun e!141818 () Bool)

(assert (=> b!207470 (=> (not res!174071) (not e!141818))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!207470 (= res!174071 (invariant!0 (currentBit!9604 thiss!1204) (currentByte!9609 thiss!1204) (size!4586 (buf!5091 thiss!1204))))))

(declare-fun b!207471 () Bool)

(declare-fun e!141811 () Bool)

(declare-fun array_inv!4327 (array!10429) Bool)

(assert (=> b!207471 (= e!141811 (array_inv!4327 (buf!5091 thiss!1204)))))

(declare-fun b!207472 () Bool)

(declare-fun e!141821 () Bool)

(declare-fun lt!323763 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!207472 (= e!141821 (validate_offset_bits!1 ((_ sign_extend 32) (size!4586 (buf!5091 (_2!9552 lt!323760)))) ((_ sign_extend 32) (currentByte!9609 (_2!9552 lt!323760))) ((_ sign_extend 32) (currentBit!9604 (_2!9552 lt!323760))) lt!323763))))

(declare-fun b!207473 () Bool)

(declare-fun res!174077 () Bool)

(assert (=> b!207473 (=> res!174077 e!141819)))

(declare-fun lt!323759 () (_ BitVec 64))

(assert (=> b!207473 (= res!174077 (or (not (= (size!4586 (buf!5091 (_2!9552 lt!323755))) (size!4586 (buf!5091 thiss!1204)))) (not (= lt!323770 (bvsub (bvadd lt!323759 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!207474 () Bool)

(declare-fun e!141816 () Bool)

(assert (=> b!207474 (= e!141816 e!141822)))

(declare-fun res!174069 () Bool)

(assert (=> b!207474 (=> (not res!174069) (not e!141822))))

(declare-fun lt!323765 () (_ BitVec 64))

(declare-fun lt!323767 () (_ BitVec 64))

(assert (=> b!207474 (= res!174069 (= lt!323765 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323767)))))

(assert (=> b!207474 (= lt!323765 (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!323760))) (currentByte!9609 (_2!9552 lt!323760)) (currentBit!9604 (_2!9552 lt!323760))))))

(assert (=> b!207474 (= lt!323767 (bitIndex!0 (size!4586 (buf!5091 thiss!1204)) (currentByte!9609 thiss!1204) (currentBit!9604 thiss!1204)))))

(declare-fun b!207476 () Bool)

(assert (=> b!207476 (= e!141819 e!141821)))

(declare-fun res!174070 () Bool)

(assert (=> b!207476 (=> res!174070 e!141821)))

(assert (=> b!207476 (= res!174070 (or (not (= (size!4586 (buf!5091 (_2!9552 lt!323760))) (size!4586 (buf!5091 (_2!9552 lt!323755))))) (bvslt lt!323763 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!207476 (= lt!323763 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!17798 0))(
  ( (tuple2!17799 (_1!9554 BitStream!8280) (_2!9554 (_ BitVec 64))) )
))
(declare-fun lt!323769 () tuple2!17798)

(declare-datatypes ((tuple2!17800 0))(
  ( (tuple2!17801 (_1!9555 BitStream!8280) (_2!9555 BitStream!8280)) )
))
(declare-fun lt!323764 () tuple2!17800)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8280 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17798)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!207476 (= lt!323769 (readNBitsLSBFirstsLoopPure!0 (_1!9555 lt!323764) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-fun lt!323766 () (_ BitVec 64))

(assert (=> b!207476 (validate_offset_bits!1 ((_ sign_extend 32) (size!4586 (buf!5091 (_2!9552 lt!323755)))) ((_ sign_extend 32) (currentByte!9609 thiss!1204)) ((_ sign_extend 32) (currentBit!9604 thiss!1204)) lt!323766)))

(declare-fun lt!323762 () Unit!14766)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8280 array!10429 (_ BitVec 64)) Unit!14766)

(assert (=> b!207476 (= lt!323762 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5091 (_2!9552 lt!323755)) lt!323766))))

(assert (=> b!207476 (= (_2!9553 (readBitPure!0 (_1!9555 lt!323764))) lt!323756)))

(declare-fun lt!323757 () tuple2!17800)

(declare-fun reader!0 (BitStream!8280 BitStream!8280) tuple2!17800)

(assert (=> b!207476 (= lt!323757 (reader!0 (_2!9552 lt!323760) (_2!9552 lt!323755)))))

(assert (=> b!207476 (= lt!323764 (reader!0 thiss!1204 (_2!9552 lt!323755)))))

(declare-fun e!141814 () Bool)

(assert (=> b!207476 e!141814))

(declare-fun res!174074 () Bool)

(assert (=> b!207476 (=> (not res!174074) (not e!141814))))

(declare-fun lt!323758 () tuple2!17796)

(declare-fun lt!323773 () tuple2!17796)

(assert (=> b!207476 (= res!174074 (= (bitIndex!0 (size!4586 (buf!5091 (_1!9553 lt!323758))) (currentByte!9609 (_1!9553 lt!323758)) (currentBit!9604 (_1!9553 lt!323758))) (bitIndex!0 (size!4586 (buf!5091 (_1!9553 lt!323773))) (currentByte!9609 (_1!9553 lt!323773)) (currentBit!9604 (_1!9553 lt!323773)))))))

(declare-fun lt!323774 () Unit!14766)

(declare-fun lt!323771 () BitStream!8280)

(declare-fun readBitPrefixLemma!0 (BitStream!8280 BitStream!8280) Unit!14766)

(assert (=> b!207476 (= lt!323774 (readBitPrefixLemma!0 lt!323771 (_2!9552 lt!323755)))))

(assert (=> b!207476 (= lt!323773 (readBitPure!0 (BitStream!8281 (buf!5091 (_2!9552 lt!323755)) (currentByte!9609 thiss!1204) (currentBit!9604 thiss!1204))))))

(assert (=> b!207476 (= lt!323758 (readBitPure!0 lt!323771))))

(declare-fun e!141813 () Bool)

(assert (=> b!207476 e!141813))

(declare-fun res!174079 () Bool)

(assert (=> b!207476 (=> (not res!174079) (not e!141813))))

(assert (=> b!207476 (= res!174079 (invariant!0 (currentBit!9604 thiss!1204) (currentByte!9609 thiss!1204) (size!4586 (buf!5091 (_2!9552 lt!323760)))))))

(assert (=> b!207476 (= lt!323771 (BitStream!8281 (buf!5091 (_2!9552 lt!323760)) (currentByte!9609 thiss!1204) (currentBit!9604 thiss!1204)))))

(declare-fun b!207477 () Bool)

(declare-fun e!141812 () Bool)

(assert (=> b!207477 (= e!141812 e!141818)))

(declare-fun res!174078 () Bool)

(assert (=> b!207477 (=> (not res!174078) (not e!141818))))

(assert (=> b!207477 (= res!174078 (validate_offset_bits!1 ((_ sign_extend 32) (size!4586 (buf!5091 thiss!1204))) ((_ sign_extend 32) (currentByte!9609 thiss!1204)) ((_ sign_extend 32) (currentBit!9604 thiss!1204)) lt!323766))))

(assert (=> b!207477 (= lt!323766 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!207478 () Bool)

(assert (=> b!207478 (= e!141817 (= (bitIndex!0 (size!4586 (buf!5091 (_1!9553 lt!323761))) (currentByte!9609 (_1!9553 lt!323761)) (currentBit!9604 (_1!9553 lt!323761))) lt!323765))))

(declare-fun b!207479 () Bool)

(declare-fun res!174066 () Bool)

(assert (=> b!207479 (=> res!174066 e!141819)))

(assert (=> b!207479 (= res!174066 (not (invariant!0 (currentBit!9604 (_2!9552 lt!323755)) (currentByte!9609 (_2!9552 lt!323755)) (size!4586 (buf!5091 (_2!9552 lt!323755))))))))

(declare-fun b!207480 () Bool)

(assert (=> b!207480 (= e!141814 (= (_2!9553 lt!323758) (_2!9553 lt!323773)))))

(declare-fun b!207481 () Bool)

(assert (=> b!207481 (= e!141813 (invariant!0 (currentBit!9604 thiss!1204) (currentByte!9609 thiss!1204) (size!4586 (buf!5091 (_2!9552 lt!323755)))))))

(declare-fun b!207482 () Bool)

(declare-fun res!174067 () Bool)

(assert (=> b!207482 (=> (not res!174067) (not e!141822))))

(assert (=> b!207482 (= res!174067 (isPrefixOf!0 thiss!1204 (_2!9552 lt!323760)))))

(declare-fun b!207483 () Bool)

(declare-fun res!174064 () Bool)

(assert (=> b!207483 (=> (not res!174064) (not e!141818))))

(assert (=> b!207483 (= res!174064 (not (= i!590 nBits!348)))))

(declare-fun b!207475 () Bool)

(assert (=> b!207475 (= e!141818 (not e!141820))))

(declare-fun res!174080 () Bool)

(assert (=> b!207475 (=> res!174080 e!141820)))

(assert (=> b!207475 (= res!174080 (not (= lt!323772 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323759))))))

(assert (=> b!207475 (= lt!323772 (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!323760))) (currentByte!9609 (_2!9552 lt!323760)) (currentBit!9604 (_2!9552 lt!323760))))))

(assert (=> b!207475 (= lt!323759 (bitIndex!0 (size!4586 (buf!5091 thiss!1204)) (currentByte!9609 thiss!1204) (currentBit!9604 thiss!1204)))))

(assert (=> b!207475 e!141816))

(declare-fun res!174072 () Bool)

(assert (=> b!207475 (=> (not res!174072) (not e!141816))))

(assert (=> b!207475 (= res!174072 (= (size!4586 (buf!5091 thiss!1204)) (size!4586 (buf!5091 (_2!9552 lt!323760)))))))

(declare-fun appendBit!0 (BitStream!8280 Bool) tuple2!17794)

(assert (=> b!207475 (= lt!323760 (appendBit!0 thiss!1204 lt!323756))))

(assert (=> b!207475 (= lt!323756 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!174068 () Bool)

(assert (=> start!43646 (=> (not res!174068) (not e!141812))))

(assert (=> start!43646 (= res!174068 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43646 e!141812))

(assert (=> start!43646 true))

(declare-fun inv!12 (BitStream!8280) Bool)

(assert (=> start!43646 (and (inv!12 thiss!1204) e!141811)))

(assert (= (and start!43646 res!174068) b!207477))

(assert (= (and b!207477 res!174078) b!207470))

(assert (= (and b!207470 res!174071) b!207483))

(assert (= (and b!207483 res!174064) b!207475))

(assert (= (and b!207475 res!174072) b!207474))

(assert (= (and b!207474 res!174069) b!207482))

(assert (= (and b!207482 res!174067) b!207469))

(assert (= (and b!207469 res!174075) b!207478))

(assert (= (and b!207475 (not res!174080)) b!207468))

(assert (= (and b!207468 (not res!174065)) b!207479))

(assert (= (and b!207479 (not res!174066)) b!207473))

(assert (= (and b!207473 (not res!174077)) b!207467))

(assert (= (and b!207467 (not res!174076)) b!207466))

(assert (= (and b!207466 (not res!174073)) b!207476))

(assert (= (and b!207476 res!174079) b!207481))

(assert (= (and b!207476 res!174074) b!207480))

(assert (= (and b!207476 (not res!174070)) b!207472))

(assert (= start!43646 b!207471))

(declare-fun m!319213 () Bool)

(assert (=> b!207466 m!319213))

(declare-fun m!319215 () Bool)

(assert (=> b!207475 m!319215))

(declare-fun m!319217 () Bool)

(assert (=> b!207475 m!319217))

(declare-fun m!319219 () Bool)

(assert (=> b!207475 m!319219))

(assert (=> b!207474 m!319215))

(assert (=> b!207474 m!319217))

(declare-fun m!319221 () Bool)

(assert (=> b!207477 m!319221))

(declare-fun m!319223 () Bool)

(assert (=> b!207472 m!319223))

(declare-fun m!319225 () Bool)

(assert (=> b!207479 m!319225))

(declare-fun m!319227 () Bool)

(assert (=> b!207476 m!319227))

(declare-fun m!319229 () Bool)

(assert (=> b!207476 m!319229))

(declare-fun m!319231 () Bool)

(assert (=> b!207476 m!319231))

(declare-fun m!319233 () Bool)

(assert (=> b!207476 m!319233))

(declare-fun m!319235 () Bool)

(assert (=> b!207476 m!319235))

(declare-fun m!319237 () Bool)

(assert (=> b!207476 m!319237))

(declare-fun m!319239 () Bool)

(assert (=> b!207476 m!319239))

(declare-fun m!319241 () Bool)

(assert (=> b!207476 m!319241))

(declare-fun m!319243 () Bool)

(assert (=> b!207476 m!319243))

(declare-fun m!319245 () Bool)

(assert (=> b!207476 m!319245))

(declare-fun m!319247 () Bool)

(assert (=> b!207476 m!319247))

(declare-fun m!319249 () Bool)

(assert (=> b!207476 m!319249))

(declare-fun m!319251 () Bool)

(assert (=> b!207476 m!319251))

(declare-fun m!319253 () Bool)

(assert (=> b!207481 m!319253))

(declare-fun m!319255 () Bool)

(assert (=> b!207469 m!319255))

(assert (=> b!207469 m!319255))

(declare-fun m!319257 () Bool)

(assert (=> b!207469 m!319257))

(declare-fun m!319259 () Bool)

(assert (=> b!207478 m!319259))

(assert (=> b!207482 m!319213))

(declare-fun m!319261 () Bool)

(assert (=> b!207470 m!319261))

(declare-fun m!319263 () Bool)

(assert (=> start!43646 m!319263))

(declare-fun m!319265 () Bool)

(assert (=> b!207467 m!319265))

(declare-fun m!319267 () Bool)

(assert (=> b!207468 m!319267))

(declare-fun m!319269 () Bool)

(assert (=> b!207468 m!319269))

(declare-fun m!319271 () Bool)

(assert (=> b!207468 m!319271))

(declare-fun m!319273 () Bool)

(assert (=> b!207468 m!319273))

(declare-fun m!319275 () Bool)

(assert (=> b!207471 m!319275))

(check-sat (not b!207479) (not b!207477) (not start!43646) (not b!207471) (not b!207468) (not b!207474) (not b!207466) (not b!207481) (not b!207469) (not b!207478) (not b!207472) (not b!207470) (not b!207467) (not b!207476) (not b!207475) (not b!207482))
(check-sat)
(get-model)

(declare-fun d!70173 () Bool)

(assert (=> d!70173 (= (invariant!0 (currentBit!9604 (_2!9552 lt!323755)) (currentByte!9609 (_2!9552 lt!323755)) (size!4586 (buf!5091 (_2!9552 lt!323755)))) (and (bvsge (currentBit!9604 (_2!9552 lt!323755)) #b00000000000000000000000000000000) (bvslt (currentBit!9604 (_2!9552 lt!323755)) #b00000000000000000000000000001000) (bvsge (currentByte!9609 (_2!9552 lt!323755)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9609 (_2!9552 lt!323755)) (size!4586 (buf!5091 (_2!9552 lt!323755)))) (and (= (currentBit!9604 (_2!9552 lt!323755)) #b00000000000000000000000000000000) (= (currentByte!9609 (_2!9552 lt!323755)) (size!4586 (buf!5091 (_2!9552 lt!323755))))))))))

(assert (=> b!207479 d!70173))

(declare-fun d!70175 () Bool)

(declare-fun e!141861 () Bool)

(assert (=> d!70175 e!141861))

(declare-fun res!174136 () Bool)

(assert (=> d!70175 (=> (not res!174136) (not e!141861))))

(declare-fun lt!323849 () (_ BitVec 64))

(declare-fun lt!323847 () (_ BitVec 64))

(declare-fun lt!323851 () (_ BitVec 64))

(assert (=> d!70175 (= res!174136 (= lt!323849 (bvsub lt!323847 lt!323851)))))

(assert (=> d!70175 (or (= (bvand lt!323847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!323851 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!323847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!323847 lt!323851) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!70175 (= lt!323851 (remainingBits!0 ((_ sign_extend 32) (size!4586 (buf!5091 (_2!9552 lt!323755)))) ((_ sign_extend 32) (currentByte!9609 (_2!9552 lt!323755))) ((_ sign_extend 32) (currentBit!9604 (_2!9552 lt!323755)))))))

(declare-fun lt!323848 () (_ BitVec 64))

(declare-fun lt!323852 () (_ BitVec 64))

(assert (=> d!70175 (= lt!323847 (bvmul lt!323848 lt!323852))))

(assert (=> d!70175 (or (= lt!323848 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!323852 (bvsdiv (bvmul lt!323848 lt!323852) lt!323848)))))

(assert (=> d!70175 (= lt!323852 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70175 (= lt!323848 ((_ sign_extend 32) (size!4586 (buf!5091 (_2!9552 lt!323755)))))))

(assert (=> d!70175 (= lt!323849 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9609 (_2!9552 lt!323755))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9604 (_2!9552 lt!323755)))))))

(assert (=> d!70175 (invariant!0 (currentBit!9604 (_2!9552 lt!323755)) (currentByte!9609 (_2!9552 lt!323755)) (size!4586 (buf!5091 (_2!9552 lt!323755))))))

(assert (=> d!70175 (= (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!323755))) (currentByte!9609 (_2!9552 lt!323755)) (currentBit!9604 (_2!9552 lt!323755))) lt!323849)))

(declare-fun b!207542 () Bool)

(declare-fun res!174137 () Bool)

(assert (=> b!207542 (=> (not res!174137) (not e!141861))))

(assert (=> b!207542 (= res!174137 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!323849))))

(declare-fun b!207543 () Bool)

(declare-fun lt!323850 () (_ BitVec 64))

(assert (=> b!207543 (= e!141861 (bvsle lt!323849 (bvmul lt!323850 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!207543 (or (= lt!323850 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!323850 #b0000000000000000000000000000000000000000000000000000000000001000) lt!323850)))))

(assert (=> b!207543 (= lt!323850 ((_ sign_extend 32) (size!4586 (buf!5091 (_2!9552 lt!323755)))))))

(assert (= (and d!70175 res!174136) b!207542))

(assert (= (and b!207542 res!174137) b!207543))

(declare-fun m!319341 () Bool)

(assert (=> d!70175 m!319341))

(assert (=> d!70175 m!319225))

(assert (=> b!207468 d!70175))

(declare-fun d!70177 () Bool)

(declare-fun res!174146 () Bool)

(declare-fun e!141867 () Bool)

(assert (=> d!70177 (=> (not res!174146) (not e!141867))))

(assert (=> d!70177 (= res!174146 (= (size!4586 (buf!5091 thiss!1204)) (size!4586 (buf!5091 (_2!9552 lt!323755)))))))

(assert (=> d!70177 (= (isPrefixOf!0 thiss!1204 (_2!9552 lt!323755)) e!141867)))

(declare-fun b!207550 () Bool)

(declare-fun res!174144 () Bool)

(assert (=> b!207550 (=> (not res!174144) (not e!141867))))

(assert (=> b!207550 (= res!174144 (bvsle (bitIndex!0 (size!4586 (buf!5091 thiss!1204)) (currentByte!9609 thiss!1204) (currentBit!9604 thiss!1204)) (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!323755))) (currentByte!9609 (_2!9552 lt!323755)) (currentBit!9604 (_2!9552 lt!323755)))))))

(declare-fun b!207551 () Bool)

(declare-fun e!141866 () Bool)

(assert (=> b!207551 (= e!141867 e!141866)))

(declare-fun res!174145 () Bool)

(assert (=> b!207551 (=> res!174145 e!141866)))

(assert (=> b!207551 (= res!174145 (= (size!4586 (buf!5091 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!207552 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10429 array!10429 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!207552 (= e!141866 (arrayBitRangesEq!0 (buf!5091 thiss!1204) (buf!5091 (_2!9552 lt!323755)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4586 (buf!5091 thiss!1204)) (currentByte!9609 thiss!1204) (currentBit!9604 thiss!1204))))))

(assert (= (and d!70177 res!174146) b!207550))

(assert (= (and b!207550 res!174144) b!207551))

(assert (= (and b!207551 (not res!174145)) b!207552))

(assert (=> b!207550 m!319217))

(assert (=> b!207550 m!319267))

(assert (=> b!207552 m!319217))

(assert (=> b!207552 m!319217))

(declare-fun m!319343 () Bool)

(assert (=> b!207552 m!319343))

(assert (=> b!207468 d!70177))

(declare-fun d!70179 () Bool)

(assert (=> d!70179 (isPrefixOf!0 thiss!1204 (_2!9552 lt!323755))))

(declare-fun lt!323855 () Unit!14766)

(declare-fun choose!30 (BitStream!8280 BitStream!8280 BitStream!8280) Unit!14766)

(assert (=> d!70179 (= lt!323855 (choose!30 thiss!1204 (_2!9552 lt!323760) (_2!9552 lt!323755)))))

(assert (=> d!70179 (isPrefixOf!0 thiss!1204 (_2!9552 lt!323760))))

(assert (=> d!70179 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9552 lt!323760) (_2!9552 lt!323755)) lt!323855)))

(declare-fun bs!17262 () Bool)

(assert (= bs!17262 d!70179))

(assert (=> bs!17262 m!319269))

(declare-fun m!319345 () Bool)

(assert (=> bs!17262 m!319345))

(assert (=> bs!17262 m!319213))

(assert (=> b!207468 d!70179))

(declare-fun b!207670 () Bool)

(declare-fun lt!324174 () tuple2!17796)

(declare-fun lt!324195 () tuple2!17794)

(assert (=> b!207670 (= lt!324174 (readBitPure!0 (readerFrom!0 (_2!9552 lt!324195) (currentBit!9604 (_2!9552 lt!323760)) (currentByte!9609 (_2!9552 lt!323760)))))))

(declare-fun res!174250 () Bool)

(declare-fun lt!324180 () Bool)

(assert (=> b!207670 (= res!174250 (and (= (_2!9553 lt!324174) lt!324180) (= (_1!9553 lt!324174) (_2!9552 lt!324195))))))

(declare-fun e!141937 () Bool)

(assert (=> b!207670 (=> (not res!174250) (not e!141937))))

(declare-fun e!141933 () Bool)

(assert (=> b!207670 (= e!141933 e!141937)))

(declare-fun b!207671 () Bool)

(declare-fun e!141934 () Bool)

(declare-fun lt!324206 () tuple2!17798)

(declare-fun lt!324194 () tuple2!17800)

(assert (=> b!207671 (= e!141934 (= (_1!9554 lt!324206) (_2!9555 lt!324194)))))

(declare-fun d!70181 () Bool)

(declare-fun e!141941 () Bool)

(assert (=> d!70181 e!141941))

(declare-fun res!174248 () Bool)

(assert (=> d!70181 (=> (not res!174248) (not e!141941))))

(declare-fun lt!324203 () tuple2!17794)

(assert (=> d!70181 (= res!174248 (invariant!0 (currentBit!9604 (_2!9552 lt!324203)) (currentByte!9609 (_2!9552 lt!324203)) (size!4586 (buf!5091 (_2!9552 lt!324203)))))))

(declare-fun e!141938 () tuple2!17794)

(assert (=> d!70181 (= lt!324203 e!141938)))

(declare-fun c!10218 () Bool)

(assert (=> d!70181 (= c!10218 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!70181 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!70181 (= (appendBitsLSBFirstLoopTR!0 (_2!9552 lt!323760) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!324203)))

(declare-fun b!207672 () Bool)

(declare-fun res!174251 () Bool)

(assert (=> b!207672 (=> (not res!174251) (not e!141941))))

(assert (=> b!207672 (= res!174251 (isPrefixOf!0 (_2!9552 lt!323760) (_2!9552 lt!324203)))))

(declare-fun b!207673 () Bool)

(declare-fun res!174249 () Bool)

(assert (=> b!207673 (= res!174249 (= (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!324195))) (currentByte!9609 (_2!9552 lt!324195)) (currentBit!9604 (_2!9552 lt!324195))) (bvadd (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!323760))) (currentByte!9609 (_2!9552 lt!323760)) (currentBit!9604 (_2!9552 lt!323760))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!207673 (=> (not res!174249) (not e!141933))))

(declare-fun b!207674 () Bool)

(declare-fun e!141939 () (_ BitVec 64))

(assert (=> b!207674 (= e!141939 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!207675 () Bool)

(declare-fun e!141940 () Bool)

(declare-fun lt!324191 () (_ BitVec 64))

(assert (=> b!207675 (= e!141940 (validate_offset_bits!1 ((_ sign_extend 32) (size!4586 (buf!5091 (_2!9552 lt!323760)))) ((_ sign_extend 32) (currentByte!9609 (_2!9552 lt!323760))) ((_ sign_extend 32) (currentBit!9604 (_2!9552 lt!323760))) lt!324191))))

(declare-fun b!207676 () Bool)

(declare-fun e!141935 () Bool)

(declare-fun lt!324190 () tuple2!17798)

(declare-fun lt!324196 () tuple2!17800)

(assert (=> b!207676 (= e!141935 (= (_1!9554 lt!324190) (_2!9555 lt!324196)))))

(declare-fun b!207677 () Bool)

(declare-fun res!174256 () Bool)

(declare-fun call!3273 () Bool)

(assert (=> b!207677 (= res!174256 call!3273)))

(assert (=> b!207677 (=> (not res!174256) (not e!141933))))

(declare-fun b!207678 () Bool)

(assert (=> b!207678 (= e!141941 e!141935)))

(declare-fun res!174254 () Bool)

(assert (=> b!207678 (=> (not res!174254) (not e!141935))))

(assert (=> b!207678 (= res!174254 (= (_2!9554 lt!324190) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!207678 (= lt!324190 (readNBitsLSBFirstsLoopPure!0 (_1!9555 lt!324196) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!324197 () Unit!14766)

(declare-fun lt!324211 () Unit!14766)

(assert (=> b!207678 (= lt!324197 lt!324211)))

(assert (=> b!207678 (validate_offset_bits!1 ((_ sign_extend 32) (size!4586 (buf!5091 (_2!9552 lt!324203)))) ((_ sign_extend 32) (currentByte!9609 (_2!9552 lt!323760))) ((_ sign_extend 32) (currentBit!9604 (_2!9552 lt!323760))) lt!324191)))

(assert (=> b!207678 (= lt!324211 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9552 lt!323760) (buf!5091 (_2!9552 lt!324203)) lt!324191))))

(assert (=> b!207678 e!141940))

(declare-fun res!174252 () Bool)

(assert (=> b!207678 (=> (not res!174252) (not e!141940))))

(assert (=> b!207678 (= res!174252 (and (= (size!4586 (buf!5091 (_2!9552 lt!323760))) (size!4586 (buf!5091 (_2!9552 lt!324203)))) (bvsge lt!324191 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!207678 (= lt!324191 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!207678 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!207678 (= lt!324196 (reader!0 (_2!9552 lt!323760) (_2!9552 lt!324203)))))

(declare-fun b!207679 () Bool)

(declare-fun res!174258 () Bool)

(assert (=> b!207679 (=> (not res!174258) (not e!141941))))

(declare-fun lt!324184 () (_ BitVec 64))

(declare-fun lt!324205 () (_ BitVec 64))

(assert (=> b!207679 (= res!174258 (= (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!324203))) (currentByte!9609 (_2!9552 lt!324203)) (currentBit!9604 (_2!9552 lt!324203))) (bvsub lt!324184 lt!324205)))))

(assert (=> b!207679 (or (= (bvand lt!324184 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!324205 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!324184 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!324184 lt!324205) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!207679 (= lt!324205 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!324207 () (_ BitVec 64))

(declare-fun lt!324198 () (_ BitVec 64))

(assert (=> b!207679 (= lt!324184 (bvadd lt!324207 lt!324198))))

(assert (=> b!207679 (or (not (= (bvand lt!324207 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!324198 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!324207 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!324207 lt!324198) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!207679 (= lt!324198 ((_ sign_extend 32) nBits!348))))

(assert (=> b!207679 (= lt!324207 (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!323760))) (currentByte!9609 (_2!9552 lt!323760)) (currentBit!9604 (_2!9552 lt!323760))))))

(declare-fun b!207680 () Bool)

(assert (=> b!207680 (= e!141937 (= (bitIndex!0 (size!4586 (buf!5091 (_1!9553 lt!324174))) (currentByte!9609 (_1!9553 lt!324174)) (currentBit!9604 (_1!9553 lt!324174))) (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!324195))) (currentByte!9609 (_2!9552 lt!324195)) (currentBit!9604 (_2!9552 lt!324195)))))))

(declare-fun bm!3270 () Bool)

(assert (=> bm!3270 (= call!3273 (isPrefixOf!0 (_2!9552 lt!323760) (ite c!10218 (_2!9552 lt!323760) (_2!9552 lt!324195))))))

(declare-fun b!207681 () Bool)

(declare-fun lt!324179 () tuple2!17794)

(assert (=> b!207681 (= e!141938 (tuple2!17795 (_1!9552 lt!324179) (_2!9552 lt!324179)))))

(assert (=> b!207681 (= lt!324180 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!207681 (= lt!324195 (appendBit!0 (_2!9552 lt!323760) lt!324180))))

(declare-fun res!174253 () Bool)

(assert (=> b!207681 (= res!174253 (= (size!4586 (buf!5091 (_2!9552 lt!323760))) (size!4586 (buf!5091 (_2!9552 lt!324195)))))))

(assert (=> b!207681 (=> (not res!174253) (not e!141933))))

(assert (=> b!207681 e!141933))

(declare-fun lt!324186 () tuple2!17794)

(assert (=> b!207681 (= lt!324186 lt!324195)))

(assert (=> b!207681 (= lt!324179 (appendBitsLSBFirstLoopTR!0 (_2!9552 lt!324186) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!324156 () Unit!14766)

(assert (=> b!207681 (= lt!324156 (lemmaIsPrefixTransitive!0 (_2!9552 lt!323760) (_2!9552 lt!324186) (_2!9552 lt!324179)))))

(assert (=> b!207681 (isPrefixOf!0 (_2!9552 lt!323760) (_2!9552 lt!324179))))

(declare-fun lt!324210 () Unit!14766)

(assert (=> b!207681 (= lt!324210 lt!324156)))

(assert (=> b!207681 (invariant!0 (currentBit!9604 (_2!9552 lt!323760)) (currentByte!9609 (_2!9552 lt!323760)) (size!4586 (buf!5091 (_2!9552 lt!324186))))))

(declare-fun lt!324193 () BitStream!8280)

(assert (=> b!207681 (= lt!324193 (BitStream!8281 (buf!5091 (_2!9552 lt!324186)) (currentByte!9609 (_2!9552 lt!323760)) (currentBit!9604 (_2!9552 lt!323760))))))

(assert (=> b!207681 (invariant!0 (currentBit!9604 lt!324193) (currentByte!9609 lt!324193) (size!4586 (buf!5091 (_2!9552 lt!324179))))))

(declare-fun lt!324166 () BitStream!8280)

(assert (=> b!207681 (= lt!324166 (BitStream!8281 (buf!5091 (_2!9552 lt!324179)) (currentByte!9609 lt!324193) (currentBit!9604 lt!324193)))))

(declare-fun lt!324201 () tuple2!17796)

(assert (=> b!207681 (= lt!324201 (readBitPure!0 lt!324193))))

(declare-fun lt!324173 () tuple2!17796)

(assert (=> b!207681 (= lt!324173 (readBitPure!0 lt!324166))))

(declare-fun lt!324161 () Unit!14766)

(assert (=> b!207681 (= lt!324161 (readBitPrefixLemma!0 lt!324193 (_2!9552 lt!324179)))))

(declare-fun res!174257 () Bool)

(assert (=> b!207681 (= res!174257 (= (bitIndex!0 (size!4586 (buf!5091 (_1!9553 lt!324201))) (currentByte!9609 (_1!9553 lt!324201)) (currentBit!9604 (_1!9553 lt!324201))) (bitIndex!0 (size!4586 (buf!5091 (_1!9553 lt!324173))) (currentByte!9609 (_1!9553 lt!324173)) (currentBit!9604 (_1!9553 lt!324173)))))))

(declare-fun e!141936 () Bool)

(assert (=> b!207681 (=> (not res!174257) (not e!141936))))

(assert (=> b!207681 e!141936))

(declare-fun lt!324182 () Unit!14766)

(assert (=> b!207681 (= lt!324182 lt!324161)))

(declare-fun lt!324188 () tuple2!17800)

(assert (=> b!207681 (= lt!324188 (reader!0 (_2!9552 lt!323760) (_2!9552 lt!324179)))))

(declare-fun lt!324160 () tuple2!17800)

(assert (=> b!207681 (= lt!324160 (reader!0 (_2!9552 lt!324186) (_2!9552 lt!324179)))))

(declare-fun lt!324159 () tuple2!17796)

(assert (=> b!207681 (= lt!324159 (readBitPure!0 (_1!9555 lt!324188)))))

(assert (=> b!207681 (= (_2!9553 lt!324159) lt!324180)))

(declare-fun lt!324209 () Unit!14766)

(declare-fun Unit!14770 () Unit!14766)

(assert (=> b!207681 (= lt!324209 Unit!14770)))

(declare-fun lt!324204 () (_ BitVec 64))

(assert (=> b!207681 (= lt!324204 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!324192 () (_ BitVec 64))

(assert (=> b!207681 (= lt!324192 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!324187 () Unit!14766)

(assert (=> b!207681 (= lt!324187 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9552 lt!323760) (buf!5091 (_2!9552 lt!324179)) lt!324192))))

(assert (=> b!207681 (validate_offset_bits!1 ((_ sign_extend 32) (size!4586 (buf!5091 (_2!9552 lt!324179)))) ((_ sign_extend 32) (currentByte!9609 (_2!9552 lt!323760))) ((_ sign_extend 32) (currentBit!9604 (_2!9552 lt!323760))) lt!324192)))

(declare-fun lt!324164 () Unit!14766)

(assert (=> b!207681 (= lt!324164 lt!324187)))

(declare-fun lt!324178 () tuple2!17798)

(assert (=> b!207681 (= lt!324178 (readNBitsLSBFirstsLoopPure!0 (_1!9555 lt!324188) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!324204))))

(declare-fun lt!324176 () (_ BitVec 64))

(assert (=> b!207681 (= lt!324176 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!324169 () Unit!14766)

(assert (=> b!207681 (= lt!324169 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9552 lt!324186) (buf!5091 (_2!9552 lt!324179)) lt!324176))))

(assert (=> b!207681 (validate_offset_bits!1 ((_ sign_extend 32) (size!4586 (buf!5091 (_2!9552 lt!324179)))) ((_ sign_extend 32) (currentByte!9609 (_2!9552 lt!324186))) ((_ sign_extend 32) (currentBit!9604 (_2!9552 lt!324186))) lt!324176)))

(declare-fun lt!324162 () Unit!14766)

(assert (=> b!207681 (= lt!324162 lt!324169)))

(declare-fun lt!324168 () tuple2!17798)

(assert (=> b!207681 (= lt!324168 (readNBitsLSBFirstsLoopPure!0 (_1!9555 lt!324160) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!324204 (ite (_2!9553 lt!324159) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!324165 () tuple2!17798)

(assert (=> b!207681 (= lt!324165 (readNBitsLSBFirstsLoopPure!0 (_1!9555 lt!324188) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!324204))))

(declare-fun c!10217 () Bool)

(assert (=> b!207681 (= c!10217 (_2!9553 (readBitPure!0 (_1!9555 lt!324188))))))

(declare-fun lt!324183 () tuple2!17798)

(declare-fun withMovedBitIndex!0 (BitStream!8280 (_ BitVec 64)) BitStream!8280)

(assert (=> b!207681 (= lt!324183 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9555 lt!324188) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!324204 e!141939)))))

(declare-fun lt!324185 () Unit!14766)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8280 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14766)

(assert (=> b!207681 (= lt!324185 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9555 lt!324188) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!324204))))

(assert (=> b!207681 (and (= (_2!9554 lt!324165) (_2!9554 lt!324183)) (= (_1!9554 lt!324165) (_1!9554 lt!324183)))))

(declare-fun lt!324199 () Unit!14766)

(assert (=> b!207681 (= lt!324199 lt!324185)))

(assert (=> b!207681 (= (_1!9555 lt!324188) (withMovedBitIndex!0 (_2!9555 lt!324188) (bvsub (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!323760))) (currentByte!9609 (_2!9552 lt!323760)) (currentBit!9604 (_2!9552 lt!323760))) (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!324179))) (currentByte!9609 (_2!9552 lt!324179)) (currentBit!9604 (_2!9552 lt!324179))))))))

(declare-fun lt!324189 () Unit!14766)

(declare-fun Unit!14771 () Unit!14766)

(assert (=> b!207681 (= lt!324189 Unit!14771)))

(assert (=> b!207681 (= (_1!9555 lt!324160) (withMovedBitIndex!0 (_2!9555 lt!324160) (bvsub (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!324186))) (currentByte!9609 (_2!9552 lt!324186)) (currentBit!9604 (_2!9552 lt!324186))) (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!324179))) (currentByte!9609 (_2!9552 lt!324179)) (currentBit!9604 (_2!9552 lt!324179))))))))

(declare-fun lt!324200 () Unit!14766)

(declare-fun Unit!14772 () Unit!14766)

(assert (=> b!207681 (= lt!324200 Unit!14772)))

(assert (=> b!207681 (= (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!323760))) (currentByte!9609 (_2!9552 lt!323760)) (currentBit!9604 (_2!9552 lt!323760))) (bvsub (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!324186))) (currentByte!9609 (_2!9552 lt!324186)) (currentBit!9604 (_2!9552 lt!324186))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!324175 () Unit!14766)

(declare-fun Unit!14773 () Unit!14766)

(assert (=> b!207681 (= lt!324175 Unit!14773)))

(assert (=> b!207681 (= (_2!9554 lt!324178) (_2!9554 lt!324168))))

(declare-fun lt!324177 () Unit!14766)

(declare-fun Unit!14774 () Unit!14766)

(assert (=> b!207681 (= lt!324177 Unit!14774)))

(assert (=> b!207681 (invariant!0 (currentBit!9604 (_2!9552 lt!324179)) (currentByte!9609 (_2!9552 lt!324179)) (size!4586 (buf!5091 (_2!9552 lt!324179))))))

(declare-fun lt!324171 () Unit!14766)

(declare-fun Unit!14775 () Unit!14766)

(assert (=> b!207681 (= lt!324171 Unit!14775)))

(assert (=> b!207681 (= (size!4586 (buf!5091 (_2!9552 lt!323760))) (size!4586 (buf!5091 (_2!9552 lt!324179))))))

(declare-fun lt!324202 () Unit!14766)

(declare-fun Unit!14776 () Unit!14766)

(assert (=> b!207681 (= lt!324202 Unit!14776)))

(assert (=> b!207681 (= (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!324179))) (currentByte!9609 (_2!9552 lt!324179)) (currentBit!9604 (_2!9552 lt!324179))) (bvsub (bvadd (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!323760))) (currentByte!9609 (_2!9552 lt!323760)) (currentBit!9604 (_2!9552 lt!323760))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!324158 () Unit!14766)

(declare-fun Unit!14777 () Unit!14766)

(assert (=> b!207681 (= lt!324158 Unit!14777)))

(declare-fun lt!324157 () Unit!14766)

(declare-fun Unit!14778 () Unit!14766)

(assert (=> b!207681 (= lt!324157 Unit!14778)))

(assert (=> b!207681 (= lt!324194 (reader!0 (_2!9552 lt!323760) (_2!9552 lt!324179)))))

(declare-fun lt!324163 () (_ BitVec 64))

(assert (=> b!207681 (= lt!324163 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!324208 () Unit!14766)

(assert (=> b!207681 (= lt!324208 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9552 lt!323760) (buf!5091 (_2!9552 lt!324179)) lt!324163))))

(assert (=> b!207681 (validate_offset_bits!1 ((_ sign_extend 32) (size!4586 (buf!5091 (_2!9552 lt!324179)))) ((_ sign_extend 32) (currentByte!9609 (_2!9552 lt!323760))) ((_ sign_extend 32) (currentBit!9604 (_2!9552 lt!323760))) lt!324163)))

(declare-fun lt!324181 () Unit!14766)

(assert (=> b!207681 (= lt!324181 lt!324208)))

(assert (=> b!207681 (= lt!324206 (readNBitsLSBFirstsLoopPure!0 (_1!9555 lt!324194) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!174259 () Bool)

(assert (=> b!207681 (= res!174259 (= (_2!9554 lt!324206) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!207681 (=> (not res!174259) (not e!141934))))

(assert (=> b!207681 e!141934))

(declare-fun lt!324167 () Unit!14766)

(declare-fun Unit!14779 () Unit!14766)

(assert (=> b!207681 (= lt!324167 Unit!14779)))

(declare-fun b!207682 () Bool)

(declare-fun res!174255 () Bool)

(assert (=> b!207682 (=> (not res!174255) (not e!141941))))

(assert (=> b!207682 (= res!174255 (= (size!4586 (buf!5091 (_2!9552 lt!323760))) (size!4586 (buf!5091 (_2!9552 lt!324203)))))))

(declare-fun b!207683 () Bool)

(assert (=> b!207683 (= e!141939 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!207684 () Bool)

(assert (=> b!207684 (= e!141936 (= (_2!9553 lt!324201) (_2!9553 lt!324173)))))

(declare-fun b!207685 () Bool)

(declare-fun Unit!14780 () Unit!14766)

(assert (=> b!207685 (= e!141938 (tuple2!17795 Unit!14780 (_2!9552 lt!323760)))))

(declare-fun lt!324172 () Unit!14766)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8280) Unit!14766)

(assert (=> b!207685 (= lt!324172 (lemmaIsPrefixRefl!0 (_2!9552 lt!323760)))))

(assert (=> b!207685 call!3273))

(declare-fun lt!324170 () Unit!14766)

(assert (=> b!207685 (= lt!324170 lt!324172)))

(assert (= (and d!70181 c!10218) b!207685))

(assert (= (and d!70181 (not c!10218)) b!207681))

(assert (= (and b!207681 res!174253) b!207673))

(assert (= (and b!207673 res!174249) b!207677))

(assert (= (and b!207677 res!174256) b!207670))

(assert (= (and b!207670 res!174250) b!207680))

(assert (= (and b!207681 res!174257) b!207684))

(assert (= (and b!207681 c!10217) b!207674))

(assert (= (and b!207681 (not c!10217)) b!207683))

(assert (= (and b!207681 res!174259) b!207671))

(assert (= (or b!207685 b!207677) bm!3270))

(assert (= (and d!70181 res!174248) b!207682))

(assert (= (and b!207682 res!174255) b!207679))

(assert (= (and b!207679 res!174258) b!207672))

(assert (= (and b!207672 res!174251) b!207678))

(assert (= (and b!207678 res!174252) b!207675))

(assert (= (and b!207678 res!174254) b!207676))

(declare-fun m!319475 () Bool)

(assert (=> b!207685 m!319475))

(declare-fun m!319477 () Bool)

(assert (=> b!207675 m!319477))

(declare-fun m!319479 () Bool)

(assert (=> bm!3270 m!319479))

(declare-fun m!319481 () Bool)

(assert (=> b!207679 m!319481))

(assert (=> b!207679 m!319215))

(declare-fun m!319483 () Bool)

(assert (=> b!207680 m!319483))

(declare-fun m!319485 () Bool)

(assert (=> b!207680 m!319485))

(declare-fun m!319487 () Bool)

(assert (=> b!207670 m!319487))

(assert (=> b!207670 m!319487))

(declare-fun m!319489 () Bool)

(assert (=> b!207670 m!319489))

(declare-fun m!319491 () Bool)

(assert (=> d!70181 m!319491))

(declare-fun m!319493 () Bool)

(assert (=> b!207672 m!319493))

(assert (=> b!207673 m!319485))

(assert (=> b!207673 m!319215))

(declare-fun m!319495 () Bool)

(assert (=> b!207681 m!319495))

(declare-fun m!319497 () Bool)

(assert (=> b!207681 m!319497))

(declare-fun m!319499 () Bool)

(assert (=> b!207681 m!319499))

(declare-fun m!319501 () Bool)

(assert (=> b!207681 m!319501))

(declare-fun m!319503 () Bool)

(assert (=> b!207681 m!319503))

(declare-fun m!319505 () Bool)

(assert (=> b!207681 m!319505))

(declare-fun m!319507 () Bool)

(assert (=> b!207681 m!319507))

(declare-fun m!319509 () Bool)

(assert (=> b!207681 m!319509))

(declare-fun m!319511 () Bool)

(assert (=> b!207681 m!319511))

(declare-fun m!319513 () Bool)

(assert (=> b!207681 m!319513))

(declare-fun m!319515 () Bool)

(assert (=> b!207681 m!319515))

(declare-fun m!319517 () Bool)

(assert (=> b!207681 m!319517))

(declare-fun m!319519 () Bool)

(assert (=> b!207681 m!319519))

(declare-fun m!319521 () Bool)

(assert (=> b!207681 m!319521))

(declare-fun m!319523 () Bool)

(assert (=> b!207681 m!319523))

(declare-fun m!319525 () Bool)

(assert (=> b!207681 m!319525))

(declare-fun m!319527 () Bool)

(assert (=> b!207681 m!319527))

(declare-fun m!319529 () Bool)

(assert (=> b!207681 m!319529))

(declare-fun m!319531 () Bool)

(assert (=> b!207681 m!319531))

(declare-fun m!319533 () Bool)

(assert (=> b!207681 m!319533))

(declare-fun m!319535 () Bool)

(assert (=> b!207681 m!319535))

(declare-fun m!319537 () Bool)

(assert (=> b!207681 m!319537))

(assert (=> b!207681 m!319507))

(declare-fun m!319539 () Bool)

(assert (=> b!207681 m!319539))

(declare-fun m!319541 () Bool)

(assert (=> b!207681 m!319541))

(declare-fun m!319543 () Bool)

(assert (=> b!207681 m!319543))

(assert (=> b!207681 m!319215))

(declare-fun m!319545 () Bool)

(assert (=> b!207681 m!319545))

(declare-fun m!319547 () Bool)

(assert (=> b!207681 m!319547))

(declare-fun m!319549 () Bool)

(assert (=> b!207681 m!319549))

(declare-fun m!319551 () Bool)

(assert (=> b!207681 m!319551))

(declare-fun m!319553 () Bool)

(assert (=> b!207681 m!319553))

(declare-fun m!319555 () Bool)

(assert (=> b!207681 m!319555))

(declare-fun m!319557 () Bool)

(assert (=> b!207681 m!319557))

(declare-fun m!319559 () Bool)

(assert (=> b!207681 m!319559))

(declare-fun m!319561 () Bool)

(assert (=> b!207678 m!319561))

(declare-fun m!319563 () Bool)

(assert (=> b!207678 m!319563))

(assert (=> b!207678 m!319503))

(assert (=> b!207678 m!319537))

(declare-fun m!319565 () Bool)

(assert (=> b!207678 m!319565))

(declare-fun m!319567 () Bool)

(assert (=> b!207678 m!319567))

(assert (=> b!207468 d!70181))

(declare-fun d!70249 () Bool)

(declare-datatypes ((tuple2!17810 0))(
  ( (tuple2!17811 (_1!9560 Bool) (_2!9560 BitStream!8280)) )
))
(declare-fun lt!324214 () tuple2!17810)

(declare-fun readBit!0 (BitStream!8280) tuple2!17810)

(assert (=> d!70249 (= lt!324214 (readBit!0 (readerFrom!0 (_2!9552 lt!323760) (currentBit!9604 thiss!1204) (currentByte!9609 thiss!1204))))))

(assert (=> d!70249 (= (readBitPure!0 (readerFrom!0 (_2!9552 lt!323760) (currentBit!9604 thiss!1204) (currentByte!9609 thiss!1204))) (tuple2!17797 (_2!9560 lt!324214) (_1!9560 lt!324214)))))

(declare-fun bs!17273 () Bool)

(assert (= bs!17273 d!70249))

(assert (=> bs!17273 m!319255))

(declare-fun m!319569 () Bool)

(assert (=> bs!17273 m!319569))

(assert (=> b!207469 d!70249))

(declare-fun d!70251 () Bool)

(declare-fun e!141944 () Bool)

(assert (=> d!70251 e!141944))

(declare-fun res!174263 () Bool)

(assert (=> d!70251 (=> (not res!174263) (not e!141944))))

(assert (=> d!70251 (= res!174263 (invariant!0 (currentBit!9604 (_2!9552 lt!323760)) (currentByte!9609 (_2!9552 lt!323760)) (size!4586 (buf!5091 (_2!9552 lt!323760)))))))

(assert (=> d!70251 (= (readerFrom!0 (_2!9552 lt!323760) (currentBit!9604 thiss!1204) (currentByte!9609 thiss!1204)) (BitStream!8281 (buf!5091 (_2!9552 lt!323760)) (currentByte!9609 thiss!1204) (currentBit!9604 thiss!1204)))))

(declare-fun b!207688 () Bool)

(assert (=> b!207688 (= e!141944 (invariant!0 (currentBit!9604 thiss!1204) (currentByte!9609 thiss!1204) (size!4586 (buf!5091 (_2!9552 lt!323760)))))))

(assert (= (and d!70251 res!174263) b!207688))

(declare-fun m!319571 () Bool)

(assert (=> d!70251 m!319571))

(assert (=> b!207688 m!319231))

(assert (=> b!207469 d!70251))

(declare-fun d!70253 () Bool)

(assert (=> d!70253 (= (invariant!0 (currentBit!9604 thiss!1204) (currentByte!9609 thiss!1204) (size!4586 (buf!5091 (_2!9552 lt!323755)))) (and (bvsge (currentBit!9604 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9604 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9609 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9609 thiss!1204) (size!4586 (buf!5091 (_2!9552 lt!323755)))) (and (= (currentBit!9604 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9609 thiss!1204) (size!4586 (buf!5091 (_2!9552 lt!323755))))))))))

(assert (=> b!207481 d!70253))

(declare-fun d!70255 () Bool)

(assert (=> d!70255 (= (invariant!0 (currentBit!9604 thiss!1204) (currentByte!9609 thiss!1204) (size!4586 (buf!5091 thiss!1204))) (and (bvsge (currentBit!9604 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9604 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9609 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9609 thiss!1204) (size!4586 (buf!5091 thiss!1204))) (and (= (currentBit!9604 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9609 thiss!1204) (size!4586 (buf!5091 thiss!1204)))))))))

(assert (=> b!207470 d!70255))

(declare-fun b!207699 () Bool)

(declare-fun e!141950 () Unit!14766)

(declare-fun Unit!14781 () Unit!14766)

(assert (=> b!207699 (= e!141950 Unit!14781)))

(declare-fun b!207700 () Bool)

(declare-fun res!174272 () Bool)

(declare-fun e!141949 () Bool)

(assert (=> b!207700 (=> (not res!174272) (not e!141949))))

(declare-fun lt!324268 () tuple2!17800)

(assert (=> b!207700 (= res!174272 (isPrefixOf!0 (_1!9555 lt!324268) thiss!1204))))

(declare-fun d!70257 () Bool)

(assert (=> d!70257 e!141949))

(declare-fun res!174270 () Bool)

(assert (=> d!70257 (=> (not res!174270) (not e!141949))))

(assert (=> d!70257 (= res!174270 (isPrefixOf!0 (_1!9555 lt!324268) (_2!9555 lt!324268)))))

(declare-fun lt!324270 () BitStream!8280)

(assert (=> d!70257 (= lt!324268 (tuple2!17801 lt!324270 (_2!9552 lt!323755)))))

(declare-fun lt!324256 () Unit!14766)

(declare-fun lt!324273 () Unit!14766)

(assert (=> d!70257 (= lt!324256 lt!324273)))

(assert (=> d!70257 (isPrefixOf!0 lt!324270 (_2!9552 lt!323755))))

(assert (=> d!70257 (= lt!324273 (lemmaIsPrefixTransitive!0 lt!324270 (_2!9552 lt!323755) (_2!9552 lt!323755)))))

(declare-fun lt!324266 () Unit!14766)

(declare-fun lt!324262 () Unit!14766)

(assert (=> d!70257 (= lt!324266 lt!324262)))

(assert (=> d!70257 (isPrefixOf!0 lt!324270 (_2!9552 lt!323755))))

(assert (=> d!70257 (= lt!324262 (lemmaIsPrefixTransitive!0 lt!324270 thiss!1204 (_2!9552 lt!323755)))))

(declare-fun lt!324272 () Unit!14766)

(assert (=> d!70257 (= lt!324272 e!141950)))

(declare-fun c!10221 () Bool)

(assert (=> d!70257 (= c!10221 (not (= (size!4586 (buf!5091 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!324269 () Unit!14766)

(declare-fun lt!324257 () Unit!14766)

(assert (=> d!70257 (= lt!324269 lt!324257)))

(assert (=> d!70257 (isPrefixOf!0 (_2!9552 lt!323755) (_2!9552 lt!323755))))

(assert (=> d!70257 (= lt!324257 (lemmaIsPrefixRefl!0 (_2!9552 lt!323755)))))

(declare-fun lt!324274 () Unit!14766)

(declare-fun lt!324255 () Unit!14766)

(assert (=> d!70257 (= lt!324274 lt!324255)))

(assert (=> d!70257 (= lt!324255 (lemmaIsPrefixRefl!0 (_2!9552 lt!323755)))))

(declare-fun lt!324265 () Unit!14766)

(declare-fun lt!324261 () Unit!14766)

(assert (=> d!70257 (= lt!324265 lt!324261)))

(assert (=> d!70257 (isPrefixOf!0 lt!324270 lt!324270)))

(assert (=> d!70257 (= lt!324261 (lemmaIsPrefixRefl!0 lt!324270))))

(declare-fun lt!324259 () Unit!14766)

(declare-fun lt!324263 () Unit!14766)

(assert (=> d!70257 (= lt!324259 lt!324263)))

(assert (=> d!70257 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!70257 (= lt!324263 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!70257 (= lt!324270 (BitStream!8281 (buf!5091 (_2!9552 lt!323755)) (currentByte!9609 thiss!1204) (currentBit!9604 thiss!1204)))))

(assert (=> d!70257 (isPrefixOf!0 thiss!1204 (_2!9552 lt!323755))))

(assert (=> d!70257 (= (reader!0 thiss!1204 (_2!9552 lt!323755)) lt!324268)))

(declare-fun lt!324271 () (_ BitVec 64))

(declare-fun lt!324260 () (_ BitVec 64))

(declare-fun b!207701 () Bool)

(assert (=> b!207701 (= e!141949 (= (_1!9555 lt!324268) (withMovedBitIndex!0 (_2!9555 lt!324268) (bvsub lt!324271 lt!324260))))))

(assert (=> b!207701 (or (= (bvand lt!324271 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!324260 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!324271 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!324271 lt!324260) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!207701 (= lt!324260 (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!323755))) (currentByte!9609 (_2!9552 lt!323755)) (currentBit!9604 (_2!9552 lt!323755))))))

(assert (=> b!207701 (= lt!324271 (bitIndex!0 (size!4586 (buf!5091 thiss!1204)) (currentByte!9609 thiss!1204) (currentBit!9604 thiss!1204)))))

(declare-fun b!207702 () Bool)

(declare-fun res!174271 () Bool)

(assert (=> b!207702 (=> (not res!174271) (not e!141949))))

(assert (=> b!207702 (= res!174271 (isPrefixOf!0 (_2!9555 lt!324268) (_2!9552 lt!323755)))))

(declare-fun b!207703 () Bool)

(declare-fun lt!324264 () Unit!14766)

(assert (=> b!207703 (= e!141950 lt!324264)))

(declare-fun lt!324267 () (_ BitVec 64))

(assert (=> b!207703 (= lt!324267 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!324258 () (_ BitVec 64))

(assert (=> b!207703 (= lt!324258 (bitIndex!0 (size!4586 (buf!5091 thiss!1204)) (currentByte!9609 thiss!1204) (currentBit!9604 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10429 array!10429 (_ BitVec 64) (_ BitVec 64)) Unit!14766)

(assert (=> b!207703 (= lt!324264 (arrayBitRangesEqSymmetric!0 (buf!5091 thiss!1204) (buf!5091 (_2!9552 lt!323755)) lt!324267 lt!324258))))

(assert (=> b!207703 (arrayBitRangesEq!0 (buf!5091 (_2!9552 lt!323755)) (buf!5091 thiss!1204) lt!324267 lt!324258)))

(assert (= (and d!70257 c!10221) b!207703))

(assert (= (and d!70257 (not c!10221)) b!207699))

(assert (= (and d!70257 res!174270) b!207700))

(assert (= (and b!207700 res!174272) b!207702))

(assert (= (and b!207702 res!174271) b!207701))

(declare-fun m!319573 () Bool)

(assert (=> b!207701 m!319573))

(assert (=> b!207701 m!319267))

(assert (=> b!207701 m!319217))

(declare-fun m!319575 () Bool)

(assert (=> b!207700 m!319575))

(declare-fun m!319577 () Bool)

(assert (=> b!207702 m!319577))

(declare-fun m!319579 () Bool)

(assert (=> d!70257 m!319579))

(declare-fun m!319581 () Bool)

(assert (=> d!70257 m!319581))

(declare-fun m!319583 () Bool)

(assert (=> d!70257 m!319583))

(declare-fun m!319585 () Bool)

(assert (=> d!70257 m!319585))

(declare-fun m!319587 () Bool)

(assert (=> d!70257 m!319587))

(declare-fun m!319589 () Bool)

(assert (=> d!70257 m!319589))

(declare-fun m!319591 () Bool)

(assert (=> d!70257 m!319591))

(declare-fun m!319593 () Bool)

(assert (=> d!70257 m!319593))

(declare-fun m!319595 () Bool)

(assert (=> d!70257 m!319595))

(assert (=> d!70257 m!319269))

(declare-fun m!319597 () Bool)

(assert (=> d!70257 m!319597))

(assert (=> b!207703 m!319217))

(declare-fun m!319599 () Bool)

(assert (=> b!207703 m!319599))

(declare-fun m!319601 () Bool)

(assert (=> b!207703 m!319601))

(assert (=> b!207476 d!70257))

(declare-fun d!70259 () Bool)

(declare-fun e!141951 () Bool)

(assert (=> d!70259 e!141951))

(declare-fun res!174273 () Bool)

(assert (=> d!70259 (=> (not res!174273) (not e!141951))))

(declare-fun lt!324279 () (_ BitVec 64))

(declare-fun lt!324275 () (_ BitVec 64))

(declare-fun lt!324277 () (_ BitVec 64))

(assert (=> d!70259 (= res!174273 (= lt!324277 (bvsub lt!324275 lt!324279)))))

(assert (=> d!70259 (or (= (bvand lt!324275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!324279 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!324275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!324275 lt!324279) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70259 (= lt!324279 (remainingBits!0 ((_ sign_extend 32) (size!4586 (buf!5091 (_1!9553 lt!323758)))) ((_ sign_extend 32) (currentByte!9609 (_1!9553 lt!323758))) ((_ sign_extend 32) (currentBit!9604 (_1!9553 lt!323758)))))))

(declare-fun lt!324276 () (_ BitVec 64))

(declare-fun lt!324280 () (_ BitVec 64))

(assert (=> d!70259 (= lt!324275 (bvmul lt!324276 lt!324280))))

(assert (=> d!70259 (or (= lt!324276 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!324280 (bvsdiv (bvmul lt!324276 lt!324280) lt!324276)))))

(assert (=> d!70259 (= lt!324280 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70259 (= lt!324276 ((_ sign_extend 32) (size!4586 (buf!5091 (_1!9553 lt!323758)))))))

(assert (=> d!70259 (= lt!324277 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9609 (_1!9553 lt!323758))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9604 (_1!9553 lt!323758)))))))

(assert (=> d!70259 (invariant!0 (currentBit!9604 (_1!9553 lt!323758)) (currentByte!9609 (_1!9553 lt!323758)) (size!4586 (buf!5091 (_1!9553 lt!323758))))))

(assert (=> d!70259 (= (bitIndex!0 (size!4586 (buf!5091 (_1!9553 lt!323758))) (currentByte!9609 (_1!9553 lt!323758)) (currentBit!9604 (_1!9553 lt!323758))) lt!324277)))

(declare-fun b!207704 () Bool)

(declare-fun res!174274 () Bool)

(assert (=> b!207704 (=> (not res!174274) (not e!141951))))

(assert (=> b!207704 (= res!174274 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!324277))))

(declare-fun b!207705 () Bool)

(declare-fun lt!324278 () (_ BitVec 64))

(assert (=> b!207705 (= e!141951 (bvsle lt!324277 (bvmul lt!324278 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!207705 (or (= lt!324278 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!324278 #b0000000000000000000000000000000000000000000000000000000000001000) lt!324278)))))

(assert (=> b!207705 (= lt!324278 ((_ sign_extend 32) (size!4586 (buf!5091 (_1!9553 lt!323758)))))))

(assert (= (and d!70259 res!174273) b!207704))

(assert (= (and b!207704 res!174274) b!207705))

(declare-fun m!319603 () Bool)

(assert (=> d!70259 m!319603))

(declare-fun m!319605 () Bool)

(assert (=> d!70259 m!319605))

(assert (=> b!207476 d!70259))

(declare-fun d!70261 () Bool)

(assert (=> d!70261 (= (invariant!0 (currentBit!9604 thiss!1204) (currentByte!9609 thiss!1204) (size!4586 (buf!5091 (_2!9552 lt!323760)))) (and (bvsge (currentBit!9604 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9604 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9609 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9609 thiss!1204) (size!4586 (buf!5091 (_2!9552 lt!323760)))) (and (= (currentBit!9604 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9609 thiss!1204) (size!4586 (buf!5091 (_2!9552 lt!323760))))))))))

(assert (=> b!207476 d!70261))

(declare-fun d!70263 () Bool)

(assert (=> d!70263 (validate_offset_bits!1 ((_ sign_extend 32) (size!4586 (buf!5091 (_2!9552 lt!323755)))) ((_ sign_extend 32) (currentByte!9609 thiss!1204)) ((_ sign_extend 32) (currentBit!9604 thiss!1204)) lt!323766)))

(declare-fun lt!324283 () Unit!14766)

(declare-fun choose!9 (BitStream!8280 array!10429 (_ BitVec 64) BitStream!8280) Unit!14766)

(assert (=> d!70263 (= lt!324283 (choose!9 thiss!1204 (buf!5091 (_2!9552 lt!323755)) lt!323766 (BitStream!8281 (buf!5091 (_2!9552 lt!323755)) (currentByte!9609 thiss!1204) (currentBit!9604 thiss!1204))))))

(assert (=> d!70263 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5091 (_2!9552 lt!323755)) lt!323766) lt!324283)))

(declare-fun bs!17274 () Bool)

(assert (= bs!17274 d!70263))

(assert (=> bs!17274 m!319227))

(declare-fun m!319607 () Bool)

(assert (=> bs!17274 m!319607))

(assert (=> b!207476 d!70263))

(declare-fun d!70265 () Bool)

(declare-fun lt!324284 () tuple2!17810)

(assert (=> d!70265 (= lt!324284 (readBit!0 (_1!9555 lt!323764)))))

(assert (=> d!70265 (= (readBitPure!0 (_1!9555 lt!323764)) (tuple2!17797 (_2!9560 lt!324284) (_1!9560 lt!324284)))))

(declare-fun bs!17275 () Bool)

(assert (= bs!17275 d!70265))

(declare-fun m!319609 () Bool)

(assert (=> bs!17275 m!319609))

(assert (=> b!207476 d!70265))

(declare-fun d!70267 () Bool)

(declare-fun lt!324285 () tuple2!17810)

(assert (=> d!70267 (= lt!324285 (readBit!0 lt!323771))))

(assert (=> d!70267 (= (readBitPure!0 lt!323771) (tuple2!17797 (_2!9560 lt!324285) (_1!9560 lt!324285)))))

(declare-fun bs!17276 () Bool)

(assert (= bs!17276 d!70267))

(declare-fun m!319611 () Bool)

(assert (=> bs!17276 m!319611))

(assert (=> b!207476 d!70267))

(declare-datatypes ((tuple2!17812 0))(
  ( (tuple2!17813 (_1!9561 (_ BitVec 64)) (_2!9561 BitStream!8280)) )
))
(declare-fun lt!324288 () tuple2!17812)

(declare-fun d!70269 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8280 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17812)

(assert (=> d!70269 (= lt!324288 (readNBitsLSBFirstsLoop!0 (_1!9555 lt!323764) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(assert (=> d!70269 (= (readNBitsLSBFirstsLoopPure!0 (_1!9555 lt!323764) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))) (tuple2!17799 (_2!9561 lt!324288) (_1!9561 lt!324288)))))

(declare-fun bs!17277 () Bool)

(assert (= bs!17277 d!70269))

(declare-fun m!319613 () Bool)

(assert (=> bs!17277 m!319613))

(assert (=> b!207476 d!70269))

(declare-fun d!70271 () Bool)

(assert (=> d!70271 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4586 (buf!5091 (_2!9552 lt!323755)))) ((_ sign_extend 32) (currentByte!9609 thiss!1204)) ((_ sign_extend 32) (currentBit!9604 thiss!1204)) lt!323766) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4586 (buf!5091 (_2!9552 lt!323755)))) ((_ sign_extend 32) (currentByte!9609 thiss!1204)) ((_ sign_extend 32) (currentBit!9604 thiss!1204))) lt!323766))))

(declare-fun bs!17278 () Bool)

(assert (= bs!17278 d!70271))

(declare-fun m!319615 () Bool)

(assert (=> bs!17278 m!319615))

(assert (=> b!207476 d!70271))

(declare-fun d!70273 () Bool)

(declare-fun lt!324289 () tuple2!17810)

(assert (=> d!70273 (= lt!324289 (readBit!0 (BitStream!8281 (buf!5091 (_2!9552 lt!323755)) (currentByte!9609 thiss!1204) (currentBit!9604 thiss!1204))))))

(assert (=> d!70273 (= (readBitPure!0 (BitStream!8281 (buf!5091 (_2!9552 lt!323755)) (currentByte!9609 thiss!1204) (currentBit!9604 thiss!1204))) (tuple2!17797 (_2!9560 lt!324289) (_1!9560 lt!324289)))))

(declare-fun bs!17279 () Bool)

(assert (= bs!17279 d!70273))

(declare-fun m!319617 () Bool)

(assert (=> bs!17279 m!319617))

(assert (=> b!207476 d!70273))

(declare-fun b!207706 () Bool)

(declare-fun e!141953 () Unit!14766)

(declare-fun Unit!14782 () Unit!14766)

(assert (=> b!207706 (= e!141953 Unit!14782)))

(declare-fun b!207707 () Bool)

(declare-fun res!174277 () Bool)

(declare-fun e!141952 () Bool)

(assert (=> b!207707 (=> (not res!174277) (not e!141952))))

(declare-fun lt!324303 () tuple2!17800)

(assert (=> b!207707 (= res!174277 (isPrefixOf!0 (_1!9555 lt!324303) (_2!9552 lt!323760)))))

(declare-fun d!70275 () Bool)

(assert (=> d!70275 e!141952))

(declare-fun res!174275 () Bool)

(assert (=> d!70275 (=> (not res!174275) (not e!141952))))

(assert (=> d!70275 (= res!174275 (isPrefixOf!0 (_1!9555 lt!324303) (_2!9555 lt!324303)))))

(declare-fun lt!324305 () BitStream!8280)

(assert (=> d!70275 (= lt!324303 (tuple2!17801 lt!324305 (_2!9552 lt!323755)))))

(declare-fun lt!324291 () Unit!14766)

(declare-fun lt!324308 () Unit!14766)

(assert (=> d!70275 (= lt!324291 lt!324308)))

(assert (=> d!70275 (isPrefixOf!0 lt!324305 (_2!9552 lt!323755))))

(assert (=> d!70275 (= lt!324308 (lemmaIsPrefixTransitive!0 lt!324305 (_2!9552 lt!323755) (_2!9552 lt!323755)))))

(declare-fun lt!324301 () Unit!14766)

(declare-fun lt!324297 () Unit!14766)

(assert (=> d!70275 (= lt!324301 lt!324297)))

(assert (=> d!70275 (isPrefixOf!0 lt!324305 (_2!9552 lt!323755))))

(assert (=> d!70275 (= lt!324297 (lemmaIsPrefixTransitive!0 lt!324305 (_2!9552 lt!323760) (_2!9552 lt!323755)))))

(declare-fun lt!324307 () Unit!14766)

(assert (=> d!70275 (= lt!324307 e!141953)))

(declare-fun c!10222 () Bool)

(assert (=> d!70275 (= c!10222 (not (= (size!4586 (buf!5091 (_2!9552 lt!323760))) #b00000000000000000000000000000000)))))

(declare-fun lt!324304 () Unit!14766)

(declare-fun lt!324292 () Unit!14766)

(assert (=> d!70275 (= lt!324304 lt!324292)))

(assert (=> d!70275 (isPrefixOf!0 (_2!9552 lt!323755) (_2!9552 lt!323755))))

(assert (=> d!70275 (= lt!324292 (lemmaIsPrefixRefl!0 (_2!9552 lt!323755)))))

(declare-fun lt!324309 () Unit!14766)

(declare-fun lt!324290 () Unit!14766)

(assert (=> d!70275 (= lt!324309 lt!324290)))

(assert (=> d!70275 (= lt!324290 (lemmaIsPrefixRefl!0 (_2!9552 lt!323755)))))

(declare-fun lt!324300 () Unit!14766)

(declare-fun lt!324296 () Unit!14766)

(assert (=> d!70275 (= lt!324300 lt!324296)))

(assert (=> d!70275 (isPrefixOf!0 lt!324305 lt!324305)))

(assert (=> d!70275 (= lt!324296 (lemmaIsPrefixRefl!0 lt!324305))))

(declare-fun lt!324294 () Unit!14766)

(declare-fun lt!324298 () Unit!14766)

(assert (=> d!70275 (= lt!324294 lt!324298)))

(assert (=> d!70275 (isPrefixOf!0 (_2!9552 lt!323760) (_2!9552 lt!323760))))

(assert (=> d!70275 (= lt!324298 (lemmaIsPrefixRefl!0 (_2!9552 lt!323760)))))

(assert (=> d!70275 (= lt!324305 (BitStream!8281 (buf!5091 (_2!9552 lt!323755)) (currentByte!9609 (_2!9552 lt!323760)) (currentBit!9604 (_2!9552 lt!323760))))))

(assert (=> d!70275 (isPrefixOf!0 (_2!9552 lt!323760) (_2!9552 lt!323755))))

(assert (=> d!70275 (= (reader!0 (_2!9552 lt!323760) (_2!9552 lt!323755)) lt!324303)))

(declare-fun lt!324295 () (_ BitVec 64))

(declare-fun b!207708 () Bool)

(declare-fun lt!324306 () (_ BitVec 64))

(assert (=> b!207708 (= e!141952 (= (_1!9555 lt!324303) (withMovedBitIndex!0 (_2!9555 lt!324303) (bvsub lt!324306 lt!324295))))))

(assert (=> b!207708 (or (= (bvand lt!324306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!324295 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!324306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!324306 lt!324295) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!207708 (= lt!324295 (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!323755))) (currentByte!9609 (_2!9552 lt!323755)) (currentBit!9604 (_2!9552 lt!323755))))))

(assert (=> b!207708 (= lt!324306 (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!323760))) (currentByte!9609 (_2!9552 lt!323760)) (currentBit!9604 (_2!9552 lt!323760))))))

(declare-fun b!207709 () Bool)

(declare-fun res!174276 () Bool)

(assert (=> b!207709 (=> (not res!174276) (not e!141952))))

(assert (=> b!207709 (= res!174276 (isPrefixOf!0 (_2!9555 lt!324303) (_2!9552 lt!323755)))))

(declare-fun b!207710 () Bool)

(declare-fun lt!324299 () Unit!14766)

(assert (=> b!207710 (= e!141953 lt!324299)))

(declare-fun lt!324302 () (_ BitVec 64))

(assert (=> b!207710 (= lt!324302 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!324293 () (_ BitVec 64))

(assert (=> b!207710 (= lt!324293 (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!323760))) (currentByte!9609 (_2!9552 lt!323760)) (currentBit!9604 (_2!9552 lt!323760))))))

(assert (=> b!207710 (= lt!324299 (arrayBitRangesEqSymmetric!0 (buf!5091 (_2!9552 lt!323760)) (buf!5091 (_2!9552 lt!323755)) lt!324302 lt!324293))))

(assert (=> b!207710 (arrayBitRangesEq!0 (buf!5091 (_2!9552 lt!323755)) (buf!5091 (_2!9552 lt!323760)) lt!324302 lt!324293)))

(assert (= (and d!70275 c!10222) b!207710))

(assert (= (and d!70275 (not c!10222)) b!207706))

(assert (= (and d!70275 res!174275) b!207707))

(assert (= (and b!207707 res!174277) b!207709))

(assert (= (and b!207709 res!174276) b!207708))

(declare-fun m!319619 () Bool)

(assert (=> b!207708 m!319619))

(assert (=> b!207708 m!319267))

(assert (=> b!207708 m!319215))

(declare-fun m!319621 () Bool)

(assert (=> b!207707 m!319621))

(declare-fun m!319623 () Bool)

(assert (=> b!207709 m!319623))

(assert (=> d!70275 m!319475))

(assert (=> d!70275 m!319581))

(declare-fun m!319625 () Bool)

(assert (=> d!70275 m!319625))

(declare-fun m!319627 () Bool)

(assert (=> d!70275 m!319627))

(declare-fun m!319629 () Bool)

(assert (=> d!70275 m!319629))

(assert (=> d!70275 m!319589))

(declare-fun m!319631 () Bool)

(assert (=> d!70275 m!319631))

(declare-fun m!319633 () Bool)

(assert (=> d!70275 m!319633))

(declare-fun m!319635 () Bool)

(assert (=> d!70275 m!319635))

(assert (=> d!70275 m!319265))

(declare-fun m!319637 () Bool)

(assert (=> d!70275 m!319637))

(assert (=> b!207710 m!319215))

(declare-fun m!319639 () Bool)

(assert (=> b!207710 m!319639))

(declare-fun m!319641 () Bool)

(assert (=> b!207710 m!319641))

(assert (=> b!207476 d!70275))

(declare-fun d!70277 () Bool)

(assert (=> d!70277 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!207476 d!70277))

(declare-fun d!70279 () Bool)

(declare-fun e!141954 () Bool)

(assert (=> d!70279 e!141954))

(declare-fun res!174278 () Bool)

(assert (=> d!70279 (=> (not res!174278) (not e!141954))))

(declare-fun lt!324310 () (_ BitVec 64))

(declare-fun lt!324314 () (_ BitVec 64))

(declare-fun lt!324312 () (_ BitVec 64))

(assert (=> d!70279 (= res!174278 (= lt!324312 (bvsub lt!324310 lt!324314)))))

(assert (=> d!70279 (or (= (bvand lt!324310 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!324314 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!324310 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!324310 lt!324314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70279 (= lt!324314 (remainingBits!0 ((_ sign_extend 32) (size!4586 (buf!5091 (_1!9553 lt!323773)))) ((_ sign_extend 32) (currentByte!9609 (_1!9553 lt!323773))) ((_ sign_extend 32) (currentBit!9604 (_1!9553 lt!323773)))))))

(declare-fun lt!324311 () (_ BitVec 64))

(declare-fun lt!324315 () (_ BitVec 64))

(assert (=> d!70279 (= lt!324310 (bvmul lt!324311 lt!324315))))

(assert (=> d!70279 (or (= lt!324311 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!324315 (bvsdiv (bvmul lt!324311 lt!324315) lt!324311)))))

(assert (=> d!70279 (= lt!324315 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70279 (= lt!324311 ((_ sign_extend 32) (size!4586 (buf!5091 (_1!9553 lt!323773)))))))

(assert (=> d!70279 (= lt!324312 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9609 (_1!9553 lt!323773))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9604 (_1!9553 lt!323773)))))))

(assert (=> d!70279 (invariant!0 (currentBit!9604 (_1!9553 lt!323773)) (currentByte!9609 (_1!9553 lt!323773)) (size!4586 (buf!5091 (_1!9553 lt!323773))))))

(assert (=> d!70279 (= (bitIndex!0 (size!4586 (buf!5091 (_1!9553 lt!323773))) (currentByte!9609 (_1!9553 lt!323773)) (currentBit!9604 (_1!9553 lt!323773))) lt!324312)))

(declare-fun b!207711 () Bool)

(declare-fun res!174279 () Bool)

(assert (=> b!207711 (=> (not res!174279) (not e!141954))))

(assert (=> b!207711 (= res!174279 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!324312))))

(declare-fun b!207712 () Bool)

(declare-fun lt!324313 () (_ BitVec 64))

(assert (=> b!207712 (= e!141954 (bvsle lt!324312 (bvmul lt!324313 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!207712 (or (= lt!324313 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!324313 #b0000000000000000000000000000000000000000000000000000000000001000) lt!324313)))))

(assert (=> b!207712 (= lt!324313 ((_ sign_extend 32) (size!4586 (buf!5091 (_1!9553 lt!323773)))))))

(assert (= (and d!70279 res!174278) b!207711))

(assert (= (and b!207711 res!174279) b!207712))

(declare-fun m!319643 () Bool)

(assert (=> d!70279 m!319643))

(declare-fun m!319645 () Bool)

(assert (=> d!70279 m!319645))

(assert (=> b!207476 d!70279))

(declare-fun d!70281 () Bool)

(declare-fun e!141957 () Bool)

(assert (=> d!70281 e!141957))

(declare-fun res!174282 () Bool)

(assert (=> d!70281 (=> (not res!174282) (not e!141957))))

(declare-fun lt!324325 () tuple2!17796)

(declare-fun lt!324326 () tuple2!17796)

(assert (=> d!70281 (= res!174282 (= (bitIndex!0 (size!4586 (buf!5091 (_1!9553 lt!324325))) (currentByte!9609 (_1!9553 lt!324325)) (currentBit!9604 (_1!9553 lt!324325))) (bitIndex!0 (size!4586 (buf!5091 (_1!9553 lt!324326))) (currentByte!9609 (_1!9553 lt!324326)) (currentBit!9604 (_1!9553 lt!324326)))))))

(declare-fun lt!324327 () Unit!14766)

(declare-fun lt!324324 () BitStream!8280)

(declare-fun choose!50 (BitStream!8280 BitStream!8280 BitStream!8280 tuple2!17796 tuple2!17796 BitStream!8280 Bool tuple2!17796 tuple2!17796 BitStream!8280 Bool) Unit!14766)

(assert (=> d!70281 (= lt!324327 (choose!50 lt!323771 (_2!9552 lt!323755) lt!324324 lt!324325 (tuple2!17797 (_1!9553 lt!324325) (_2!9553 lt!324325)) (_1!9553 lt!324325) (_2!9553 lt!324325) lt!324326 (tuple2!17797 (_1!9553 lt!324326) (_2!9553 lt!324326)) (_1!9553 lt!324326) (_2!9553 lt!324326)))))

(assert (=> d!70281 (= lt!324326 (readBitPure!0 lt!324324))))

(assert (=> d!70281 (= lt!324325 (readBitPure!0 lt!323771))))

(assert (=> d!70281 (= lt!324324 (BitStream!8281 (buf!5091 (_2!9552 lt!323755)) (currentByte!9609 lt!323771) (currentBit!9604 lt!323771)))))

(assert (=> d!70281 (invariant!0 (currentBit!9604 lt!323771) (currentByte!9609 lt!323771) (size!4586 (buf!5091 (_2!9552 lt!323755))))))

(assert (=> d!70281 (= (readBitPrefixLemma!0 lt!323771 (_2!9552 lt!323755)) lt!324327)))

(declare-fun b!207715 () Bool)

(assert (=> b!207715 (= e!141957 (= (_2!9553 lt!324325) (_2!9553 lt!324326)))))

(assert (= (and d!70281 res!174282) b!207715))

(declare-fun m!319647 () Bool)

(assert (=> d!70281 m!319647))

(declare-fun m!319649 () Bool)

(assert (=> d!70281 m!319649))

(assert (=> d!70281 m!319241))

(declare-fun m!319651 () Bool)

(assert (=> d!70281 m!319651))

(declare-fun m!319653 () Bool)

(assert (=> d!70281 m!319653))

(declare-fun m!319655 () Bool)

(assert (=> d!70281 m!319655))

(assert (=> b!207476 d!70281))

(declare-fun d!70283 () Bool)

(assert (=> d!70283 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4586 (buf!5091 thiss!1204))) ((_ sign_extend 32) (currentByte!9609 thiss!1204)) ((_ sign_extend 32) (currentBit!9604 thiss!1204)) lt!323766) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4586 (buf!5091 thiss!1204))) ((_ sign_extend 32) (currentByte!9609 thiss!1204)) ((_ sign_extend 32) (currentBit!9604 thiss!1204))) lt!323766))))

(declare-fun bs!17280 () Bool)

(assert (= bs!17280 d!70283))

(declare-fun m!319657 () Bool)

(assert (=> bs!17280 m!319657))

(assert (=> b!207477 d!70283))

(declare-fun d!70285 () Bool)

(declare-fun res!174285 () Bool)

(declare-fun e!141959 () Bool)

(assert (=> d!70285 (=> (not res!174285) (not e!141959))))

(assert (=> d!70285 (= res!174285 (= (size!4586 (buf!5091 thiss!1204)) (size!4586 (buf!5091 (_2!9552 lt!323760)))))))

(assert (=> d!70285 (= (isPrefixOf!0 thiss!1204 (_2!9552 lt!323760)) e!141959)))

(declare-fun b!207716 () Bool)

(declare-fun res!174283 () Bool)

(assert (=> b!207716 (=> (not res!174283) (not e!141959))))

(assert (=> b!207716 (= res!174283 (bvsle (bitIndex!0 (size!4586 (buf!5091 thiss!1204)) (currentByte!9609 thiss!1204) (currentBit!9604 thiss!1204)) (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!323760))) (currentByte!9609 (_2!9552 lt!323760)) (currentBit!9604 (_2!9552 lt!323760)))))))

(declare-fun b!207717 () Bool)

(declare-fun e!141958 () Bool)

(assert (=> b!207717 (= e!141959 e!141958)))

(declare-fun res!174284 () Bool)

(assert (=> b!207717 (=> res!174284 e!141958)))

(assert (=> b!207717 (= res!174284 (= (size!4586 (buf!5091 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!207718 () Bool)

(assert (=> b!207718 (= e!141958 (arrayBitRangesEq!0 (buf!5091 thiss!1204) (buf!5091 (_2!9552 lt!323760)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4586 (buf!5091 thiss!1204)) (currentByte!9609 thiss!1204) (currentBit!9604 thiss!1204))))))

(assert (= (and d!70285 res!174285) b!207716))

(assert (= (and b!207716 res!174283) b!207717))

(assert (= (and b!207717 (not res!174284)) b!207718))

(assert (=> b!207716 m!319217))

(assert (=> b!207716 m!319215))

(assert (=> b!207718 m!319217))

(assert (=> b!207718 m!319217))

(declare-fun m!319659 () Bool)

(assert (=> b!207718 m!319659))

(assert (=> b!207466 d!70285))

(declare-fun d!70287 () Bool)

(declare-fun res!174288 () Bool)

(declare-fun e!141961 () Bool)

(assert (=> d!70287 (=> (not res!174288) (not e!141961))))

(assert (=> d!70287 (= res!174288 (= (size!4586 (buf!5091 (_2!9552 lt!323760))) (size!4586 (buf!5091 (_2!9552 lt!323755)))))))

(assert (=> d!70287 (= (isPrefixOf!0 (_2!9552 lt!323760) (_2!9552 lt!323755)) e!141961)))

(declare-fun b!207719 () Bool)

(declare-fun res!174286 () Bool)

(assert (=> b!207719 (=> (not res!174286) (not e!141961))))

(assert (=> b!207719 (= res!174286 (bvsle (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!323760))) (currentByte!9609 (_2!9552 lt!323760)) (currentBit!9604 (_2!9552 lt!323760))) (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!323755))) (currentByte!9609 (_2!9552 lt!323755)) (currentBit!9604 (_2!9552 lt!323755)))))))

(declare-fun b!207720 () Bool)

(declare-fun e!141960 () Bool)

(assert (=> b!207720 (= e!141961 e!141960)))

(declare-fun res!174287 () Bool)

(assert (=> b!207720 (=> res!174287 e!141960)))

(assert (=> b!207720 (= res!174287 (= (size!4586 (buf!5091 (_2!9552 lt!323760))) #b00000000000000000000000000000000))))

(declare-fun b!207721 () Bool)

(assert (=> b!207721 (= e!141960 (arrayBitRangesEq!0 (buf!5091 (_2!9552 lt!323760)) (buf!5091 (_2!9552 lt!323755)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!323760))) (currentByte!9609 (_2!9552 lt!323760)) (currentBit!9604 (_2!9552 lt!323760)))))))

(assert (= (and d!70287 res!174288) b!207719))

(assert (= (and b!207719 res!174286) b!207720))

(assert (= (and b!207720 (not res!174287)) b!207721))

(assert (=> b!207719 m!319215))

(assert (=> b!207719 m!319267))

(assert (=> b!207721 m!319215))

(assert (=> b!207721 m!319215))

(declare-fun m!319661 () Bool)

(assert (=> b!207721 m!319661))

(assert (=> b!207467 d!70287))

(declare-fun d!70289 () Bool)

(declare-fun e!141962 () Bool)

(assert (=> d!70289 e!141962))

(declare-fun res!174289 () Bool)

(assert (=> d!70289 (=> (not res!174289) (not e!141962))))

(declare-fun lt!324332 () (_ BitVec 64))

(declare-fun lt!324330 () (_ BitVec 64))

(declare-fun lt!324328 () (_ BitVec 64))

(assert (=> d!70289 (= res!174289 (= lt!324330 (bvsub lt!324328 lt!324332)))))

(assert (=> d!70289 (or (= (bvand lt!324328 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!324332 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!324328 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!324328 lt!324332) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70289 (= lt!324332 (remainingBits!0 ((_ sign_extend 32) (size!4586 (buf!5091 (_1!9553 lt!323761)))) ((_ sign_extend 32) (currentByte!9609 (_1!9553 lt!323761))) ((_ sign_extend 32) (currentBit!9604 (_1!9553 lt!323761)))))))

(declare-fun lt!324329 () (_ BitVec 64))

(declare-fun lt!324333 () (_ BitVec 64))

(assert (=> d!70289 (= lt!324328 (bvmul lt!324329 lt!324333))))

(assert (=> d!70289 (or (= lt!324329 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!324333 (bvsdiv (bvmul lt!324329 lt!324333) lt!324329)))))

(assert (=> d!70289 (= lt!324333 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70289 (= lt!324329 ((_ sign_extend 32) (size!4586 (buf!5091 (_1!9553 lt!323761)))))))

(assert (=> d!70289 (= lt!324330 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9609 (_1!9553 lt!323761))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9604 (_1!9553 lt!323761)))))))

(assert (=> d!70289 (invariant!0 (currentBit!9604 (_1!9553 lt!323761)) (currentByte!9609 (_1!9553 lt!323761)) (size!4586 (buf!5091 (_1!9553 lt!323761))))))

(assert (=> d!70289 (= (bitIndex!0 (size!4586 (buf!5091 (_1!9553 lt!323761))) (currentByte!9609 (_1!9553 lt!323761)) (currentBit!9604 (_1!9553 lt!323761))) lt!324330)))

(declare-fun b!207722 () Bool)

(declare-fun res!174290 () Bool)

(assert (=> b!207722 (=> (not res!174290) (not e!141962))))

(assert (=> b!207722 (= res!174290 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!324330))))

(declare-fun b!207723 () Bool)

(declare-fun lt!324331 () (_ BitVec 64))

(assert (=> b!207723 (= e!141962 (bvsle lt!324330 (bvmul lt!324331 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!207723 (or (= lt!324331 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!324331 #b0000000000000000000000000000000000000000000000000000000000001000) lt!324331)))))

(assert (=> b!207723 (= lt!324331 ((_ sign_extend 32) (size!4586 (buf!5091 (_1!9553 lt!323761)))))))

(assert (= (and d!70289 res!174289) b!207722))

(assert (= (and b!207722 res!174290) b!207723))

(declare-fun m!319663 () Bool)

(assert (=> d!70289 m!319663))

(declare-fun m!319665 () Bool)

(assert (=> d!70289 m!319665))

(assert (=> b!207478 d!70289))

(declare-fun d!70291 () Bool)

(declare-fun e!141963 () Bool)

(assert (=> d!70291 e!141963))

(declare-fun res!174291 () Bool)

(assert (=> d!70291 (=> (not res!174291) (not e!141963))))

(declare-fun lt!324334 () (_ BitVec 64))

(declare-fun lt!324338 () (_ BitVec 64))

(declare-fun lt!324336 () (_ BitVec 64))

(assert (=> d!70291 (= res!174291 (= lt!324336 (bvsub lt!324334 lt!324338)))))

(assert (=> d!70291 (or (= (bvand lt!324334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!324338 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!324334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!324334 lt!324338) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70291 (= lt!324338 (remainingBits!0 ((_ sign_extend 32) (size!4586 (buf!5091 (_2!9552 lt!323760)))) ((_ sign_extend 32) (currentByte!9609 (_2!9552 lt!323760))) ((_ sign_extend 32) (currentBit!9604 (_2!9552 lt!323760)))))))

(declare-fun lt!324335 () (_ BitVec 64))

(declare-fun lt!324339 () (_ BitVec 64))

(assert (=> d!70291 (= lt!324334 (bvmul lt!324335 lt!324339))))

(assert (=> d!70291 (or (= lt!324335 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!324339 (bvsdiv (bvmul lt!324335 lt!324339) lt!324335)))))

(assert (=> d!70291 (= lt!324339 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70291 (= lt!324335 ((_ sign_extend 32) (size!4586 (buf!5091 (_2!9552 lt!323760)))))))

(assert (=> d!70291 (= lt!324336 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9609 (_2!9552 lt!323760))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9604 (_2!9552 lt!323760)))))))

(assert (=> d!70291 (invariant!0 (currentBit!9604 (_2!9552 lt!323760)) (currentByte!9609 (_2!9552 lt!323760)) (size!4586 (buf!5091 (_2!9552 lt!323760))))))

(assert (=> d!70291 (= (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!323760))) (currentByte!9609 (_2!9552 lt!323760)) (currentBit!9604 (_2!9552 lt!323760))) lt!324336)))

(declare-fun b!207724 () Bool)

(declare-fun res!174292 () Bool)

(assert (=> b!207724 (=> (not res!174292) (not e!141963))))

(assert (=> b!207724 (= res!174292 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!324336))))

(declare-fun b!207725 () Bool)

(declare-fun lt!324337 () (_ BitVec 64))

(assert (=> b!207725 (= e!141963 (bvsle lt!324336 (bvmul lt!324337 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!207725 (or (= lt!324337 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!324337 #b0000000000000000000000000000000000000000000000000000000000001000) lt!324337)))))

(assert (=> b!207725 (= lt!324337 ((_ sign_extend 32) (size!4586 (buf!5091 (_2!9552 lt!323760)))))))

(assert (= (and d!70291 res!174291) b!207724))

(assert (= (and b!207724 res!174292) b!207725))

(declare-fun m!319667 () Bool)

(assert (=> d!70291 m!319667))

(assert (=> d!70291 m!319571))

(assert (=> b!207474 d!70291))

(declare-fun d!70293 () Bool)

(declare-fun e!141964 () Bool)

(assert (=> d!70293 e!141964))

(declare-fun res!174293 () Bool)

(assert (=> d!70293 (=> (not res!174293) (not e!141964))))

(declare-fun lt!324340 () (_ BitVec 64))

(declare-fun lt!324344 () (_ BitVec 64))

(declare-fun lt!324342 () (_ BitVec 64))

(assert (=> d!70293 (= res!174293 (= lt!324342 (bvsub lt!324340 lt!324344)))))

(assert (=> d!70293 (or (= (bvand lt!324340 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!324344 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!324340 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!324340 lt!324344) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70293 (= lt!324344 (remainingBits!0 ((_ sign_extend 32) (size!4586 (buf!5091 thiss!1204))) ((_ sign_extend 32) (currentByte!9609 thiss!1204)) ((_ sign_extend 32) (currentBit!9604 thiss!1204))))))

(declare-fun lt!324341 () (_ BitVec 64))

(declare-fun lt!324345 () (_ BitVec 64))

(assert (=> d!70293 (= lt!324340 (bvmul lt!324341 lt!324345))))

(assert (=> d!70293 (or (= lt!324341 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!324345 (bvsdiv (bvmul lt!324341 lt!324345) lt!324341)))))

(assert (=> d!70293 (= lt!324345 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70293 (= lt!324341 ((_ sign_extend 32) (size!4586 (buf!5091 thiss!1204))))))

(assert (=> d!70293 (= lt!324342 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9609 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9604 thiss!1204))))))

(assert (=> d!70293 (invariant!0 (currentBit!9604 thiss!1204) (currentByte!9609 thiss!1204) (size!4586 (buf!5091 thiss!1204)))))

(assert (=> d!70293 (= (bitIndex!0 (size!4586 (buf!5091 thiss!1204)) (currentByte!9609 thiss!1204) (currentBit!9604 thiss!1204)) lt!324342)))

(declare-fun b!207726 () Bool)

(declare-fun res!174294 () Bool)

(assert (=> b!207726 (=> (not res!174294) (not e!141964))))

(assert (=> b!207726 (= res!174294 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!324342))))

(declare-fun b!207727 () Bool)

(declare-fun lt!324343 () (_ BitVec 64))

(assert (=> b!207727 (= e!141964 (bvsle lt!324342 (bvmul lt!324343 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!207727 (or (= lt!324343 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!324343 #b0000000000000000000000000000000000000000000000000000000000001000) lt!324343)))))

(assert (=> b!207727 (= lt!324343 ((_ sign_extend 32) (size!4586 (buf!5091 thiss!1204))))))

(assert (= (and d!70293 res!174293) b!207726))

(assert (= (and b!207726 res!174294) b!207727))

(assert (=> d!70293 m!319657))

(assert (=> d!70293 m!319261))

(assert (=> b!207474 d!70293))

(declare-fun d!70295 () Bool)

(assert (=> d!70295 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9604 thiss!1204) (currentByte!9609 thiss!1204) (size!4586 (buf!5091 thiss!1204))))))

(declare-fun bs!17281 () Bool)

(assert (= bs!17281 d!70295))

(assert (=> bs!17281 m!319261))

(assert (=> start!43646 d!70295))

(assert (=> b!207475 d!70291))

(assert (=> b!207475 d!70293))

(declare-fun b!207737 () Bool)

(declare-fun res!174305 () Bool)

(declare-fun e!141970 () Bool)

(assert (=> b!207737 (=> (not res!174305) (not e!141970))))

(declare-fun lt!324354 () (_ BitVec 64))

(declare-fun lt!324356 () (_ BitVec 64))

(declare-fun lt!324355 () tuple2!17794)

(assert (=> b!207737 (= res!174305 (= (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!324355))) (currentByte!9609 (_2!9552 lt!324355)) (currentBit!9604 (_2!9552 lt!324355))) (bvadd lt!324356 lt!324354)))))

(assert (=> b!207737 (or (not (= (bvand lt!324356 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!324354 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!324356 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!324356 lt!324354) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!207737 (= lt!324354 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!207737 (= lt!324356 (bitIndex!0 (size!4586 (buf!5091 thiss!1204)) (currentByte!9609 thiss!1204) (currentBit!9604 thiss!1204)))))

(declare-fun b!207738 () Bool)

(declare-fun res!174304 () Bool)

(assert (=> b!207738 (=> (not res!174304) (not e!141970))))

(assert (=> b!207738 (= res!174304 (isPrefixOf!0 thiss!1204 (_2!9552 lt!324355)))))

(declare-fun b!207739 () Bool)

(declare-fun e!141969 () Bool)

(assert (=> b!207739 (= e!141970 e!141969)))

(declare-fun res!174303 () Bool)

(assert (=> b!207739 (=> (not res!174303) (not e!141969))))

(declare-fun lt!324357 () tuple2!17796)

(assert (=> b!207739 (= res!174303 (and (= (_2!9553 lt!324357) lt!323756) (= (_1!9553 lt!324357) (_2!9552 lt!324355))))))

(assert (=> b!207739 (= lt!324357 (readBitPure!0 (readerFrom!0 (_2!9552 lt!324355) (currentBit!9604 thiss!1204) (currentByte!9609 thiss!1204))))))

(declare-fun b!207740 () Bool)

(assert (=> b!207740 (= e!141969 (= (bitIndex!0 (size!4586 (buf!5091 (_1!9553 lt!324357))) (currentByte!9609 (_1!9553 lt!324357)) (currentBit!9604 (_1!9553 lt!324357))) (bitIndex!0 (size!4586 (buf!5091 (_2!9552 lt!324355))) (currentByte!9609 (_2!9552 lt!324355)) (currentBit!9604 (_2!9552 lt!324355)))))))

(declare-fun d!70297 () Bool)

(assert (=> d!70297 e!141970))

(declare-fun res!174306 () Bool)

(assert (=> d!70297 (=> (not res!174306) (not e!141970))))

(assert (=> d!70297 (= res!174306 (= (size!4586 (buf!5091 thiss!1204)) (size!4586 (buf!5091 (_2!9552 lt!324355)))))))

(declare-fun choose!16 (BitStream!8280 Bool) tuple2!17794)

(assert (=> d!70297 (= lt!324355 (choose!16 thiss!1204 lt!323756))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!70297 (validate_offset_bit!0 ((_ sign_extend 32) (size!4586 (buf!5091 thiss!1204))) ((_ sign_extend 32) (currentByte!9609 thiss!1204)) ((_ sign_extend 32) (currentBit!9604 thiss!1204)))))

(assert (=> d!70297 (= (appendBit!0 thiss!1204 lt!323756) lt!324355)))

(assert (= (and d!70297 res!174306) b!207737))

(assert (= (and b!207737 res!174305) b!207738))

(assert (= (and b!207738 res!174304) b!207739))

(assert (= (and b!207739 res!174303) b!207740))

(declare-fun m!319669 () Bool)

(assert (=> b!207740 m!319669))

(declare-fun m!319671 () Bool)

(assert (=> b!207740 m!319671))

(declare-fun m!319673 () Bool)

(assert (=> b!207739 m!319673))

(assert (=> b!207739 m!319673))

(declare-fun m!319675 () Bool)

(assert (=> b!207739 m!319675))

(assert (=> b!207737 m!319671))

(assert (=> b!207737 m!319217))

(declare-fun m!319677 () Bool)

(assert (=> d!70297 m!319677))

(declare-fun m!319679 () Bool)

(assert (=> d!70297 m!319679))

(declare-fun m!319681 () Bool)

(assert (=> b!207738 m!319681))

(assert (=> b!207475 d!70297))

(declare-fun d!70299 () Bool)

(assert (=> d!70299 (= (array_inv!4327 (buf!5091 thiss!1204)) (bvsge (size!4586 (buf!5091 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!207471 d!70299))

(assert (=> b!207482 d!70285))

(declare-fun d!70301 () Bool)

(assert (=> d!70301 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4586 (buf!5091 (_2!9552 lt!323760)))) ((_ sign_extend 32) (currentByte!9609 (_2!9552 lt!323760))) ((_ sign_extend 32) (currentBit!9604 (_2!9552 lt!323760))) lt!323763) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4586 (buf!5091 (_2!9552 lt!323760)))) ((_ sign_extend 32) (currentByte!9609 (_2!9552 lt!323760))) ((_ sign_extend 32) (currentBit!9604 (_2!9552 lt!323760)))) lt!323763))))

(declare-fun bs!17282 () Bool)

(assert (= bs!17282 d!70301))

(assert (=> bs!17282 m!319667))

(assert (=> b!207472 d!70301))

(check-sat (not b!207552) (not b!207721) (not d!70283) (not bm!3270) (not d!70281) (not b!207678) (not d!70257) (not d!70259) (not d!70267) (not d!70291) (not b!207737) (not b!207707) (not b!207550) (not d!70263) (not b!207670) (not d!70251) (not d!70179) (not d!70175) (not b!207738) (not d!70297) (not d!70289) (not d!70301) (not d!70273) (not d!70265) (not b!207718) (not b!207685) (not d!70269) (not b!207710) (not b!207708) (not d!70271) (not b!207675) (not b!207688) (not b!207740) (not b!207672) (not b!207680) (not b!207701) (not d!70275) (not b!207739) (not b!207673) (not d!70279) (not b!207700) (not d!70293) (not b!207716) (not b!207679) (not d!70181) (not d!70295) (not b!207719) (not b!207702) (not d!70249) (not b!207681) (not b!207709) (not b!207703))
(check-sat)
