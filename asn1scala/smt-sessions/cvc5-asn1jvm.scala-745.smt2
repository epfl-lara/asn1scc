; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21232 () Bool)

(assert start!21232)

(declare-fun b!106894 () Bool)

(declare-fun e!69964 () Bool)

(declare-fun e!69961 () Bool)

(assert (=> b!106894 (= e!69964 (not e!69961))))

(declare-fun res!88059 () Bool)

(assert (=> b!106894 (=> res!88059 e!69961)))

(declare-fun lt!159408 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-datatypes ((array!4910 0))(
  ( (array!4911 (arr!2829 (Array (_ BitVec 32) (_ BitVec 8))) (size!2236 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3946 0))(
  ( (BitStream!3947 (buf!2618 array!4910) (currentByte!5136 (_ BitVec 32)) (currentBit!5131 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8788 0))(
  ( (tuple2!8789 (_1!4651 BitStream!3946) (_2!4651 BitStream!3946)) )
))
(declare-fun lt!159401 () tuple2!8788)

(declare-fun i!615 () (_ BitVec 32))

(declare-datatypes ((tuple2!8790 0))(
  ( (tuple2!8791 (_1!4652 BitStream!3946) (_2!4652 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3946 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8790)

(assert (=> b!106894 (= res!88059 (not (= (_1!4652 (readNLeastSignificantBitsLoopPure!0 (_1!4651 lt!159401) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159408)) (_2!4651 lt!159401))))))

(declare-datatypes ((Unit!6550 0))(
  ( (Unit!6551) )
))
(declare-datatypes ((tuple2!8792 0))(
  ( (tuple2!8793 (_1!4653 Unit!6550) (_2!4653 BitStream!3946)) )
))
(declare-fun lt!159391 () tuple2!8792)

(declare-fun lt!159386 () tuple2!8792)

(declare-fun lt!159385 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!106894 (validate_offset_bits!1 ((_ sign_extend 32) (size!2236 (buf!2618 (_2!4653 lt!159391)))) ((_ sign_extend 32) (currentByte!5136 (_2!4653 lt!159386))) ((_ sign_extend 32) (currentBit!5131 (_2!4653 lt!159386))) lt!159385)))

(declare-fun lt!159405 () Unit!6550)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3946 array!4910 (_ BitVec 64)) Unit!6550)

(assert (=> b!106894 (= lt!159405 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4653 lt!159386) (buf!2618 (_2!4653 lt!159391)) lt!159385))))

(assert (=> b!106894 (= lt!159385 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!159407 () (_ BitVec 64))

(declare-fun lt!159394 () (_ BitVec 64))

(declare-datatypes ((tuple2!8794 0))(
  ( (tuple2!8795 (_1!4654 BitStream!3946) (_2!4654 Bool)) )
))
(declare-fun lt!159389 () tuple2!8794)

(assert (=> b!106894 (= lt!159408 (bvor lt!159407 (ite (_2!4654 lt!159389) lt!159394 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!159384 () tuple2!8788)

(declare-fun lt!159402 () tuple2!8790)

(assert (=> b!106894 (= lt!159402 (readNLeastSignificantBitsLoopPure!0 (_1!4651 lt!159384) nBits!396 i!615 lt!159407))))

(declare-fun thiss!1305 () BitStream!3946)

(declare-fun lt!159404 () (_ BitVec 64))

(assert (=> b!106894 (validate_offset_bits!1 ((_ sign_extend 32) (size!2236 (buf!2618 (_2!4653 lt!159391)))) ((_ sign_extend 32) (currentByte!5136 thiss!1305)) ((_ sign_extend 32) (currentBit!5131 thiss!1305)) lt!159404)))

(declare-fun lt!159392 () Unit!6550)

(assert (=> b!106894 (= lt!159392 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2618 (_2!4653 lt!159391)) lt!159404))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!106894 (= lt!159407 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!159395 () Bool)

(assert (=> b!106894 (= (_2!4654 lt!159389) lt!159395)))

(declare-fun readBitPure!0 (BitStream!3946) tuple2!8794)

(assert (=> b!106894 (= lt!159389 (readBitPure!0 (_1!4651 lt!159384)))))

(declare-fun reader!0 (BitStream!3946 BitStream!3946) tuple2!8788)

(assert (=> b!106894 (= lt!159401 (reader!0 (_2!4653 lt!159386) (_2!4653 lt!159391)))))

(assert (=> b!106894 (= lt!159384 (reader!0 thiss!1305 (_2!4653 lt!159391)))))

(declare-fun e!69962 () Bool)

(assert (=> b!106894 e!69962))

(declare-fun res!88065 () Bool)

(assert (=> b!106894 (=> (not res!88065) (not e!69962))))

(declare-fun lt!159393 () tuple2!8794)

(declare-fun lt!159398 () tuple2!8794)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!106894 (= res!88065 (= (bitIndex!0 (size!2236 (buf!2618 (_1!4654 lt!159393))) (currentByte!5136 (_1!4654 lt!159393)) (currentBit!5131 (_1!4654 lt!159393))) (bitIndex!0 (size!2236 (buf!2618 (_1!4654 lt!159398))) (currentByte!5136 (_1!4654 lt!159398)) (currentBit!5131 (_1!4654 lt!159398)))))))

(declare-fun lt!159383 () Unit!6550)

(declare-fun lt!159387 () BitStream!3946)

(declare-fun readBitPrefixLemma!0 (BitStream!3946 BitStream!3946) Unit!6550)

(assert (=> b!106894 (= lt!159383 (readBitPrefixLemma!0 lt!159387 (_2!4653 lt!159391)))))

(assert (=> b!106894 (= lt!159398 (readBitPure!0 (BitStream!3947 (buf!2618 (_2!4653 lt!159391)) (currentByte!5136 thiss!1305) (currentBit!5131 thiss!1305))))))

(assert (=> b!106894 (= lt!159393 (readBitPure!0 lt!159387))))

(assert (=> b!106894 (= lt!159387 (BitStream!3947 (buf!2618 (_2!4653 lt!159386)) (currentByte!5136 thiss!1305) (currentBit!5131 thiss!1305)))))

(declare-fun e!69963 () Bool)

(assert (=> b!106894 e!69963))

(declare-fun res!88060 () Bool)

(assert (=> b!106894 (=> (not res!88060) (not e!69963))))

(declare-fun isPrefixOf!0 (BitStream!3946 BitStream!3946) Bool)

(assert (=> b!106894 (= res!88060 (isPrefixOf!0 thiss!1305 (_2!4653 lt!159391)))))

(declare-fun lt!159388 () Unit!6550)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3946 BitStream!3946 BitStream!3946) Unit!6550)

(assert (=> b!106894 (= lt!159388 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4653 lt!159386) (_2!4653 lt!159391)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3946 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8792)

(assert (=> b!106894 (= lt!159391 (appendNLeastSignificantBitsLoop!0 (_2!4653 lt!159386) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!69966 () Bool)

(assert (=> b!106894 e!69966))

(declare-fun res!88068 () Bool)

(assert (=> b!106894 (=> (not res!88068) (not e!69966))))

(assert (=> b!106894 (= res!88068 (= (size!2236 (buf!2618 thiss!1305)) (size!2236 (buf!2618 (_2!4653 lt!159386)))))))

(declare-fun appendBit!0 (BitStream!3946 Bool) tuple2!8792)

(assert (=> b!106894 (= lt!159386 (appendBit!0 thiss!1305 lt!159395))))

(assert (=> b!106894 (= lt!159395 (not (= (bvand v!199 lt!159394) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106894 (= lt!159394 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!106895 () Bool)

(declare-fun e!69957 () Bool)

(declare-fun e!69956 () Bool)

(assert (=> b!106895 (= e!69957 e!69956)))

(declare-fun res!88066 () Bool)

(assert (=> b!106895 (=> (not res!88066) (not e!69956))))

(declare-fun lt!159403 () tuple2!8794)

(assert (=> b!106895 (= res!88066 (and (= (_2!4654 lt!159403) lt!159395) (= (_1!4654 lt!159403) (_2!4653 lt!159386))))))

(declare-fun readerFrom!0 (BitStream!3946 (_ BitVec 32) (_ BitVec 32)) BitStream!3946)

(assert (=> b!106895 (= lt!159403 (readBitPure!0 (readerFrom!0 (_2!4653 lt!159386) (currentBit!5131 thiss!1305) (currentByte!5136 thiss!1305))))))

(declare-fun b!106896 () Bool)

(declare-fun res!88061 () Bool)

(assert (=> b!106896 (=> (not res!88061) (not e!69964))))

(assert (=> b!106896 (= res!88061 (bvslt i!615 nBits!396))))

(declare-fun b!106897 () Bool)

(declare-fun e!69965 () Bool)

(assert (=> b!106897 (= e!69965 e!69964)))

(declare-fun res!88067 () Bool)

(assert (=> b!106897 (=> (not res!88067) (not e!69964))))

(assert (=> b!106897 (= res!88067 (validate_offset_bits!1 ((_ sign_extend 32) (size!2236 (buf!2618 thiss!1305))) ((_ sign_extend 32) (currentByte!5136 thiss!1305)) ((_ sign_extend 32) (currentBit!5131 thiss!1305)) lt!159404))))

(assert (=> b!106897 (= lt!159404 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun res!88057 () Bool)

(assert (=> start!21232 (=> (not res!88057) (not e!69965))))

(assert (=> start!21232 (= res!88057 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21232 e!69965))

(assert (=> start!21232 true))

(declare-fun e!69959 () Bool)

(declare-fun inv!12 (BitStream!3946) Bool)

(assert (=> start!21232 (and (inv!12 thiss!1305) e!69959)))

(declare-fun b!106898 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!106898 (= e!69963 (invariant!0 (currentBit!5131 thiss!1305) (currentByte!5136 thiss!1305) (size!2236 (buf!2618 (_2!4653 lt!159391)))))))

(declare-fun b!106899 () Bool)

(declare-fun lt!159396 () (_ BitVec 64))

(assert (=> b!106899 (= e!69956 (= (bitIndex!0 (size!2236 (buf!2618 (_1!4654 lt!159403))) (currentByte!5136 (_1!4654 lt!159403)) (currentBit!5131 (_1!4654 lt!159403))) lt!159396))))

(declare-fun e!69958 () Bool)

(declare-fun lt!159400 () (_ BitVec 64))

(declare-fun b!106900 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!3946 (_ BitVec 64)) BitStream!3946)

(assert (=> b!106900 (= e!69958 (= (_1!4651 lt!159401) (withMovedBitIndex!0 (_2!4651 lt!159401) (bvsub (bitIndex!0 (size!2236 (buf!2618 (_2!4653 lt!159386))) (currentByte!5136 (_2!4653 lt!159386)) (currentBit!5131 (_2!4653 lt!159386))) lt!159400))))))

(declare-fun b!106901 () Bool)

(assert (=> b!106901 (= e!69961 (invariant!0 (currentBit!5131 thiss!1305) (currentByte!5136 thiss!1305) (size!2236 (buf!2618 thiss!1305))))))

(assert (=> b!106901 e!69958))

(declare-fun res!88056 () Bool)

(assert (=> b!106901 (=> (not res!88056) (not e!69958))))

(declare-fun lt!159390 () (_ BitVec 64))

(assert (=> b!106901 (= res!88056 (= (_1!4651 lt!159384) (withMovedBitIndex!0 (_2!4651 lt!159384) (bvsub lt!159390 lt!159400))))))

(assert (=> b!106901 (= lt!159400 (bitIndex!0 (size!2236 (buf!2618 (_2!4653 lt!159391))) (currentByte!5136 (_2!4653 lt!159391)) (currentBit!5131 (_2!4653 lt!159391))))))

(assert (=> b!106901 (= lt!159390 (bitIndex!0 (size!2236 (buf!2618 thiss!1305)) (currentByte!5136 thiss!1305) (currentBit!5131 thiss!1305)))))

(declare-fun lt!159406 () tuple2!8790)

(assert (=> b!106901 (and (= (_2!4652 lt!159402) (_2!4652 lt!159406)) (= (_1!4652 lt!159402) (_1!4652 lt!159406)))))

(declare-fun lt!159399 () Unit!6550)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3946 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6550)

(assert (=> b!106901 (= lt!159399 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4651 lt!159384) nBits!396 i!615 lt!159407))))

(assert (=> b!106901 (= lt!159406 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4651 lt!159384) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159408))))

(declare-fun b!106902 () Bool)

(assert (=> b!106902 (= e!69962 (= (_2!4654 lt!159393) (_2!4654 lt!159398)))))

(declare-fun b!106903 () Bool)

(declare-fun array_inv!2038 (array!4910) Bool)

(assert (=> b!106903 (= e!69959 (array_inv!2038 (buf!2618 thiss!1305)))))

(declare-fun b!106904 () Bool)

(declare-fun res!88058 () Bool)

(assert (=> b!106904 (=> (not res!88058) (not e!69964))))

(assert (=> b!106904 (= res!88058 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!106905 () Bool)

(declare-fun res!88063 () Bool)

(assert (=> b!106905 (=> (not res!88063) (not e!69963))))

(assert (=> b!106905 (= res!88063 (invariant!0 (currentBit!5131 thiss!1305) (currentByte!5136 thiss!1305) (size!2236 (buf!2618 (_2!4653 lt!159386)))))))

(declare-fun b!106906 () Bool)

(assert (=> b!106906 (= e!69966 e!69957)))

(declare-fun res!88062 () Bool)

(assert (=> b!106906 (=> (not res!88062) (not e!69957))))

(declare-fun lt!159397 () (_ BitVec 64))

(assert (=> b!106906 (= res!88062 (= lt!159396 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!159397)))))

(assert (=> b!106906 (= lt!159396 (bitIndex!0 (size!2236 (buf!2618 (_2!4653 lt!159386))) (currentByte!5136 (_2!4653 lt!159386)) (currentBit!5131 (_2!4653 lt!159386))))))

(assert (=> b!106906 (= lt!159397 (bitIndex!0 (size!2236 (buf!2618 thiss!1305)) (currentByte!5136 thiss!1305) (currentBit!5131 thiss!1305)))))

(declare-fun b!106907 () Bool)

(declare-fun res!88064 () Bool)

(assert (=> b!106907 (=> (not res!88064) (not e!69957))))

(assert (=> b!106907 (= res!88064 (isPrefixOf!0 thiss!1305 (_2!4653 lt!159386)))))

(assert (= (and start!21232 res!88057) b!106897))

(assert (= (and b!106897 res!88067) b!106904))

(assert (= (and b!106904 res!88058) b!106896))

(assert (= (and b!106896 res!88061) b!106894))

(assert (= (and b!106894 res!88068) b!106906))

(assert (= (and b!106906 res!88062) b!106907))

(assert (= (and b!106907 res!88064) b!106895))

(assert (= (and b!106895 res!88066) b!106899))

(assert (= (and b!106894 res!88060) b!106905))

(assert (= (and b!106905 res!88063) b!106898))

(assert (= (and b!106894 res!88065) b!106902))

(assert (= (and b!106894 (not res!88059)) b!106901))

(assert (= (and b!106901 res!88056) b!106900))

(assert (= start!21232 b!106903))

(declare-fun m!157671 () Bool)

(assert (=> b!106905 m!157671))

(declare-fun m!157673 () Bool)

(assert (=> b!106895 m!157673))

(assert (=> b!106895 m!157673))

(declare-fun m!157675 () Bool)

(assert (=> b!106895 m!157675))

(declare-fun m!157677 () Bool)

(assert (=> b!106894 m!157677))

(declare-fun m!157679 () Bool)

(assert (=> b!106894 m!157679))

(declare-fun m!157681 () Bool)

(assert (=> b!106894 m!157681))

(declare-fun m!157683 () Bool)

(assert (=> b!106894 m!157683))

(declare-fun m!157685 () Bool)

(assert (=> b!106894 m!157685))

(declare-fun m!157687 () Bool)

(assert (=> b!106894 m!157687))

(declare-fun m!157689 () Bool)

(assert (=> b!106894 m!157689))

(declare-fun m!157691 () Bool)

(assert (=> b!106894 m!157691))

(declare-fun m!157693 () Bool)

(assert (=> b!106894 m!157693))

(declare-fun m!157695 () Bool)

(assert (=> b!106894 m!157695))

(declare-fun m!157697 () Bool)

(assert (=> b!106894 m!157697))

(declare-fun m!157699 () Bool)

(assert (=> b!106894 m!157699))

(declare-fun m!157701 () Bool)

(assert (=> b!106894 m!157701))

(declare-fun m!157703 () Bool)

(assert (=> b!106894 m!157703))

(declare-fun m!157705 () Bool)

(assert (=> b!106894 m!157705))

(declare-fun m!157707 () Bool)

(assert (=> b!106894 m!157707))

(declare-fun m!157709 () Bool)

(assert (=> b!106894 m!157709))

(declare-fun m!157711 () Bool)

(assert (=> b!106894 m!157711))

(declare-fun m!157713 () Bool)

(assert (=> b!106894 m!157713))

(declare-fun m!157715 () Bool)

(assert (=> b!106907 m!157715))

(declare-fun m!157717 () Bool)

(assert (=> b!106904 m!157717))

(declare-fun m!157719 () Bool)

(assert (=> b!106897 m!157719))

(declare-fun m!157721 () Bool)

(assert (=> start!21232 m!157721))

(declare-fun m!157723 () Bool)

(assert (=> b!106903 m!157723))

(declare-fun m!157725 () Bool)

(assert (=> b!106900 m!157725))

(declare-fun m!157727 () Bool)

(assert (=> b!106900 m!157727))

(declare-fun m!157729 () Bool)

(assert (=> b!106898 m!157729))

(declare-fun m!157731 () Bool)

(assert (=> b!106899 m!157731))

(declare-fun m!157733 () Bool)

(assert (=> b!106901 m!157733))

(declare-fun m!157735 () Bool)

(assert (=> b!106901 m!157735))

(assert (=> b!106901 m!157733))

(declare-fun m!157737 () Bool)

(assert (=> b!106901 m!157737))

(declare-fun m!157739 () Bool)

(assert (=> b!106901 m!157739))

(declare-fun m!157741 () Bool)

(assert (=> b!106901 m!157741))

(declare-fun m!157743 () Bool)

(assert (=> b!106901 m!157743))

(declare-fun m!157745 () Bool)

(assert (=> b!106901 m!157745))

(assert (=> b!106906 m!157725))

(assert (=> b!106906 m!157739))

(push 1)

(assert (not b!106900))

(assert (not b!106903))

(assert (not b!106907))

(assert (not b!106899))

(assert (not b!106898))

(assert (not b!106895))

(assert (not start!21232))

(assert (not b!106904))

(assert (not b!106897))

(assert (not b!106901))

(assert (not b!106894))

(assert (not b!106905))

(assert (not b!106906))

