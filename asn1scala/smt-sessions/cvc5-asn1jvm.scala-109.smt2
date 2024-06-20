; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2696 () Bool)

(assert start!2696)

(declare-fun b!13048 () Bool)

(declare-fun res!12410 () Bool)

(declare-fun e!7916 () Bool)

(assert (=> b!13048 (=> res!12410 e!7916)))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!711 0))(
  ( (array!712 (arr!739 (Array (_ BitVec 32) (_ BitVec 8))) (size!310 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!711)

(declare-datatypes ((BitStream!580 0))(
  ( (BitStream!581 (buf!661 array!711) (currentByte!1745 (_ BitVec 32)) (currentBit!1740 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1103 0))(
  ( (Unit!1104) )
))
(declare-datatypes ((tuple2!1546 0))(
  ( (tuple2!1547 (_1!828 Unit!1103) (_2!828 BitStream!580)) )
))
(declare-fun lt!20795 () tuple2!1546)

(declare-datatypes ((List!186 0))(
  ( (Nil!183) (Cons!182 (h!301 Bool) (t!936 List!186)) )
))
(declare-fun lt!20793 () List!186)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun byteArrayBitContentToList!0 (BitStream!580 array!711 (_ BitVec 64) (_ BitVec 64)) List!186)

(assert (=> b!13048 (= res!12410 (not (= lt!20793 (byteArrayBitContentToList!0 (_2!828 lt!20795) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!13049 () Bool)

(declare-fun res!12409 () Bool)

(declare-fun e!7918 () Bool)

(assert (=> b!13049 (=> (not res!12409) (not e!7918))))

(declare-fun thiss!1486 () BitStream!580)

(assert (=> b!13049 (= res!12409 (= (size!310 (buf!661 thiss!1486)) (size!310 (buf!661 (_2!828 lt!20795)))))))

(declare-fun b!13050 () Bool)

(declare-fun res!12413 () Bool)

(declare-fun e!7917 () Bool)

(assert (=> b!13050 (=> (not res!12413) (not e!7917))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!13050 (= res!12413 (validate_offset_bits!1 ((_ sign_extend 32) (size!310 (buf!661 thiss!1486))) ((_ sign_extend 32) (currentByte!1745 thiss!1486)) ((_ sign_extend 32) (currentBit!1740 thiss!1486)) nBits!460))))

(declare-fun b!13051 () Bool)

(declare-fun res!12411 () Bool)

(assert (=> b!13051 (=> (not res!12411) (not e!7918))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!13051 (= res!12411 (= (bitIndex!0 (size!310 (buf!661 (_2!828 lt!20795))) (currentByte!1745 (_2!828 lt!20795)) (currentBit!1740 (_2!828 lt!20795))) (bvadd (bitIndex!0 (size!310 (buf!661 thiss!1486)) (currentByte!1745 thiss!1486) (currentBit!1740 thiss!1486)) nBits!460)))))

(declare-fun res!12415 () Bool)

(assert (=> start!2696 (=> (not res!12415) (not e!7917))))

(assert (=> start!2696 (= res!12415 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!310 srcBuffer!6))))))))

(assert (=> start!2696 e!7917))

(assert (=> start!2696 true))

(declare-fun array_inv!299 (array!711) Bool)

(assert (=> start!2696 (array_inv!299 srcBuffer!6)))

(declare-fun e!7914 () Bool)

(declare-fun inv!12 (BitStream!580) Bool)

(assert (=> start!2696 (and (inv!12 thiss!1486) e!7914)))

(declare-fun b!13052 () Bool)

(assert (=> b!13052 (= e!7917 e!7918)))

(declare-fun res!12412 () Bool)

(assert (=> b!13052 (=> (not res!12412) (not e!7918))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!13052 (= res!12412 (invariant!0 (currentBit!1740 (_2!828 lt!20795)) (currentByte!1745 (_2!828 lt!20795)) (size!310 (buf!661 (_2!828 lt!20795)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!580 array!711 (_ BitVec 64) (_ BitVec 64)) tuple2!1546)

(assert (=> b!13052 (= lt!20795 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!13053 () Bool)

(assert (=> b!13053 (= e!7916 true)))

(declare-datatypes ((tuple2!1548 0))(
  ( (tuple2!1549 (_1!829 array!711) (_2!829 BitStream!580)) )
))
(declare-fun lt!20797 () tuple2!1548)

(declare-fun lt!20798 () Unit!1103)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!580 array!711 array!711 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1103)

(assert (=> b!13053 (= lt!20798 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!828 lt!20795) srcBuffer!6 (_1!829 lt!20797) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!13054 () Bool)

(declare-fun res!12408 () Bool)

(assert (=> b!13054 (=> (not res!12408) (not e!7918))))

(declare-fun isPrefixOf!0 (BitStream!580 BitStream!580) Bool)

(assert (=> b!13054 (= res!12408 (isPrefixOf!0 thiss!1486 (_2!828 lt!20795)))))

(declare-fun b!13055 () Bool)

(assert (=> b!13055 (= e!7914 (array_inv!299 (buf!661 thiss!1486)))))

(declare-fun b!13056 () Bool)

(assert (=> b!13056 (= e!7918 (not e!7916))))

(declare-fun res!12414 () Bool)

(assert (=> b!13056 (=> res!12414 e!7916)))

(assert (=> b!13056 (= res!12414 (not (= (byteArrayBitContentToList!0 (_2!828 lt!20795) (_1!829 lt!20797) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!20793)))))

(declare-datatypes ((tuple2!1550 0))(
  ( (tuple2!1551 (_1!830 BitStream!580) (_2!830 BitStream!580)) )
))
(declare-fun lt!20794 () tuple2!1550)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!580 BitStream!580 (_ BitVec 64)) List!186)

(assert (=> b!13056 (= lt!20793 (bitStreamReadBitsIntoList!0 (_2!828 lt!20795) (_1!830 lt!20794) nBits!460))))

(declare-fun readBits!0 (BitStream!580 (_ BitVec 64)) tuple2!1548)

(assert (=> b!13056 (= lt!20797 (readBits!0 (_1!830 lt!20794) nBits!460))))

(assert (=> b!13056 (validate_offset_bits!1 ((_ sign_extend 32) (size!310 (buf!661 (_2!828 lt!20795)))) ((_ sign_extend 32) (currentByte!1745 thiss!1486)) ((_ sign_extend 32) (currentBit!1740 thiss!1486)) nBits!460)))

(declare-fun lt!20796 () Unit!1103)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!580 array!711 (_ BitVec 64)) Unit!1103)

(assert (=> b!13056 (= lt!20796 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!661 (_2!828 lt!20795)) nBits!460))))

(declare-fun reader!0 (BitStream!580 BitStream!580) tuple2!1550)

(assert (=> b!13056 (= lt!20794 (reader!0 thiss!1486 (_2!828 lt!20795)))))

(assert (= (and start!2696 res!12415) b!13050))

(assert (= (and b!13050 res!12413) b!13052))

(assert (= (and b!13052 res!12412) b!13049))

(assert (= (and b!13049 res!12409) b!13051))

(assert (= (and b!13051 res!12411) b!13054))

(assert (= (and b!13054 res!12408) b!13056))

(assert (= (and b!13056 (not res!12414)) b!13048))

(assert (= (and b!13048 (not res!12410)) b!13053))

(assert (= start!2696 b!13055))

(declare-fun m!19661 () Bool)

(assert (=> b!13056 m!19661))

(declare-fun m!19663 () Bool)

(assert (=> b!13056 m!19663))

(declare-fun m!19665 () Bool)

(assert (=> b!13056 m!19665))

(declare-fun m!19667 () Bool)

(assert (=> b!13056 m!19667))

(declare-fun m!19669 () Bool)

(assert (=> b!13056 m!19669))

(declare-fun m!19671 () Bool)

(assert (=> b!13056 m!19671))

(declare-fun m!19673 () Bool)

(assert (=> start!2696 m!19673))

(declare-fun m!19675 () Bool)

(assert (=> start!2696 m!19675))

(declare-fun m!19677 () Bool)

(assert (=> b!13054 m!19677))

(declare-fun m!19679 () Bool)

(assert (=> b!13051 m!19679))

(declare-fun m!19681 () Bool)

(assert (=> b!13051 m!19681))

(declare-fun m!19683 () Bool)

(assert (=> b!13055 m!19683))

(declare-fun m!19685 () Bool)

(assert (=> b!13053 m!19685))

(declare-fun m!19687 () Bool)

(assert (=> b!13052 m!19687))

(declare-fun m!19689 () Bool)

(assert (=> b!13052 m!19689))

(declare-fun m!19691 () Bool)

(assert (=> b!13050 m!19691))

(declare-fun m!19693 () Bool)

(assert (=> b!13048 m!19693))

(push 1)

(assert (not b!13051))

(assert (not b!13050))

(assert (not start!2696))

(assert (not b!13053))

(assert (not b!13055))

(assert (not b!13056))

(assert (not b!13048))

(assert (not b!13054))

(assert (not b!13052))

(check-sat)

(pop 1)

