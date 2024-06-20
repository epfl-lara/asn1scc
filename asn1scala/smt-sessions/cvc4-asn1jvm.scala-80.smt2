; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1560 () Bool)

(assert start!1560)

(declare-fun res!8398 () Bool)

(declare-fun e!4801 () Bool)

(assert (=> start!1560 (=> (not res!8398) (not e!4801))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!517 0))(
  ( (array!518 (arr!627 (Array (_ BitVec 32) (_ BitVec 8))) (size!225 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!517)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!1560 (= res!8398 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!225 srcBuffer!6))))))))

(assert (=> start!1560 e!4801))

(assert (=> start!1560 true))

(declare-fun array_inv!220 (array!517) Bool)

(assert (=> start!1560 (array_inv!220 srcBuffer!6)))

(declare-datatypes ((BitStream!428 0))(
  ( (BitStream!429 (buf!558 array!517) (currentByte!1561 (_ BitVec 32)) (currentBit!1556 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!428)

(declare-fun e!4802 () Bool)

(declare-fun inv!12 (BitStream!428) Bool)

(assert (=> start!1560 (and (inv!12 thiss!1486) e!4802)))

(declare-fun b!7651 () Bool)

(assert (=> b!7651 (= e!4802 (array_inv!220 (buf!558 thiss!1486)))))

(declare-fun b!7652 () Bool)

(declare-fun res!8395 () Bool)

(assert (=> b!7652 (=> (not res!8395) (not e!4801))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7652 (= res!8395 (validate_offset_bits!1 ((_ sign_extend 32) (size!225 (buf!558 thiss!1486))) ((_ sign_extend 32) (currentByte!1561 thiss!1486)) ((_ sign_extend 32) (currentBit!1556 thiss!1486)) nBits!460))))

(declare-fun b!7653 () Bool)

(declare-fun res!8393 () Bool)

(declare-fun e!4800 () Bool)

(assert (=> b!7653 (=> (not res!8393) (not e!4800))))

(declare-datatypes ((Unit!596 0))(
  ( (Unit!597) )
))
(declare-datatypes ((tuple2!1042 0))(
  ( (tuple2!1043 (_1!549 Unit!596) (_2!549 BitStream!428)) )
))
(declare-fun lt!9898 () tuple2!1042)

(assert (=> b!7653 (= res!8393 (= (size!225 (buf!558 thiss!1486)) (size!225 (buf!558 (_2!549 lt!9898)))))))

(declare-fun b!7654 () Bool)

(declare-fun e!4804 () Bool)

(assert (=> b!7654 (= e!4800 (not e!4804))))

(declare-fun res!8396 () Bool)

(assert (=> b!7654 (=> res!8396 e!4804)))

(declare-datatypes ((tuple2!1044 0))(
  ( (tuple2!1045 (_1!550 array!517) (_2!550 BitStream!428)) )
))
(declare-fun lt!9897 () tuple2!1044)

(declare-datatypes ((List!125 0))(
  ( (Nil!122) (Cons!121 (h!240 Bool) (t!875 List!125)) )
))
(declare-fun lt!9896 () List!125)

(declare-fun byteArrayBitContentToList!0 (BitStream!428 array!517 (_ BitVec 64) (_ BitVec 64)) List!125)

(assert (=> b!7654 (= res!8396 (not (= (byteArrayBitContentToList!0 (_2!549 lt!9898) (_1!550 lt!9897) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!9896)))))

(declare-datatypes ((tuple2!1046 0))(
  ( (tuple2!1047 (_1!551 BitStream!428) (_2!551 BitStream!428)) )
))
(declare-fun lt!9899 () tuple2!1046)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!428 BitStream!428 (_ BitVec 64)) List!125)

(assert (=> b!7654 (= lt!9896 (bitStreamReadBitsIntoList!0 (_2!549 lt!9898) (_1!551 lt!9899) nBits!460))))

(declare-fun readBits!0 (BitStream!428 (_ BitVec 64)) tuple2!1044)

(assert (=> b!7654 (= lt!9897 (readBits!0 (_1!551 lt!9899) nBits!460))))

(assert (=> b!7654 (validate_offset_bits!1 ((_ sign_extend 32) (size!225 (buf!558 (_2!549 lt!9898)))) ((_ sign_extend 32) (currentByte!1561 thiss!1486)) ((_ sign_extend 32) (currentBit!1556 thiss!1486)) nBits!460)))

(declare-fun lt!9894 () Unit!596)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!428 array!517 (_ BitVec 64)) Unit!596)

(assert (=> b!7654 (= lt!9894 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!558 (_2!549 lt!9898)) nBits!460))))

(declare-fun reader!0 (BitStream!428 BitStream!428) tuple2!1046)

(assert (=> b!7654 (= lt!9899 (reader!0 thiss!1486 (_2!549 lt!9898)))))

(declare-fun b!7655 () Bool)

(declare-fun res!8392 () Bool)

(assert (=> b!7655 (=> (not res!8392) (not e!4800))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!7655 (= res!8392 (= (bitIndex!0 (size!225 (buf!558 (_2!549 lt!9898))) (currentByte!1561 (_2!549 lt!9898)) (currentBit!1556 (_2!549 lt!9898))) (bvadd (bitIndex!0 (size!225 (buf!558 thiss!1486)) (currentByte!1561 thiss!1486) (currentBit!1556 thiss!1486)) nBits!460)))))

(declare-fun b!7656 () Bool)

(assert (=> b!7656 (= e!4804 true)))

(declare-fun lt!9895 () Unit!596)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!428 array!517 array!517 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!596)

(assert (=> b!7656 (= lt!9895 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!549 lt!9898) srcBuffer!6 (_1!550 lt!9897) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!7657 () Bool)

(declare-fun res!8391 () Bool)

(assert (=> b!7657 (=> (not res!8391) (not e!4800))))

(declare-fun isPrefixOf!0 (BitStream!428 BitStream!428) Bool)

(assert (=> b!7657 (= res!8391 (isPrefixOf!0 thiss!1486 (_2!549 lt!9898)))))

(declare-fun b!7658 () Bool)

(declare-fun res!8397 () Bool)

(assert (=> b!7658 (=> res!8397 e!4804)))

(assert (=> b!7658 (= res!8397 (not (= lt!9896 (byteArrayBitContentToList!0 (_2!549 lt!9898) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!7659 () Bool)

(assert (=> b!7659 (= e!4801 e!4800)))

(declare-fun res!8394 () Bool)

(assert (=> b!7659 (=> (not res!8394) (not e!4800))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!7659 (= res!8394 (invariant!0 (currentBit!1556 (_2!549 lt!9898)) (currentByte!1561 (_2!549 lt!9898)) (size!225 (buf!558 (_2!549 lt!9898)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!428 array!517 (_ BitVec 64) (_ BitVec 64)) tuple2!1042)

(assert (=> b!7659 (= lt!9898 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(assert (= (and start!1560 res!8398) b!7652))

(assert (= (and b!7652 res!8395) b!7659))

(assert (= (and b!7659 res!8394) b!7653))

(assert (= (and b!7653 res!8393) b!7655))

(assert (= (and b!7655 res!8392) b!7657))

(assert (= (and b!7657 res!8391) b!7654))

(assert (= (and b!7654 (not res!8396)) b!7658))

(assert (= (and b!7658 (not res!8397)) b!7656))

(assert (= start!1560 b!7651))

(declare-fun m!9785 () Bool)

(assert (=> b!7659 m!9785))

(declare-fun m!9787 () Bool)

(assert (=> b!7659 m!9787))

(declare-fun m!9789 () Bool)

(assert (=> b!7652 m!9789))

(declare-fun m!9791 () Bool)

(assert (=> b!7658 m!9791))

(declare-fun m!9793 () Bool)

(assert (=> b!7655 m!9793))

(declare-fun m!9795 () Bool)

(assert (=> b!7655 m!9795))

(declare-fun m!9797 () Bool)

(assert (=> b!7656 m!9797))

(declare-fun m!9799 () Bool)

(assert (=> b!7654 m!9799))

(declare-fun m!9801 () Bool)

(assert (=> b!7654 m!9801))

(declare-fun m!9803 () Bool)

(assert (=> b!7654 m!9803))

(declare-fun m!9805 () Bool)

(assert (=> b!7654 m!9805))

(declare-fun m!9807 () Bool)

(assert (=> b!7654 m!9807))

(declare-fun m!9809 () Bool)

(assert (=> b!7654 m!9809))

(declare-fun m!9811 () Bool)

(assert (=> start!1560 m!9811))

(declare-fun m!9813 () Bool)

(assert (=> start!1560 m!9813))

(declare-fun m!9815 () Bool)

(assert (=> b!7651 m!9815))

(declare-fun m!9817 () Bool)

(assert (=> b!7657 m!9817))

(push 1)

