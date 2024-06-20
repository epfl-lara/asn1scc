; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2682 () Bool)

(assert start!2682)

(declare-fun b!12859 () Bool)

(declare-fun e!7793 () Bool)

(declare-fun e!7789 () Bool)

(assert (=> b!12859 (= e!7793 e!7789)))

(declare-fun res!12242 () Bool)

(assert (=> b!12859 (=> (not res!12242) (not e!7789))))

(declare-datatypes ((array!697 0))(
  ( (array!698 (arr!732 (Array (_ BitVec 32) (_ BitVec 8))) (size!303 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!566 0))(
  ( (BitStream!567 (buf!654 array!697) (currentByte!1738 (_ BitVec 32)) (currentBit!1733 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1089 0))(
  ( (Unit!1090) )
))
(declare-datatypes ((tuple2!1504 0))(
  ( (tuple2!1505 (_1!807 Unit!1089) (_2!807 BitStream!566)) )
))
(declare-fun lt!20672 () tuple2!1504)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!12859 (= res!12242 (invariant!0 (currentBit!1733 (_2!807 lt!20672)) (currentByte!1738 (_2!807 lt!20672)) (size!303 (buf!654 (_2!807 lt!20672)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!697)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!566)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!566 array!697 (_ BitVec 64) (_ BitVec 64)) tuple2!1504)

(assert (=> b!12859 (= lt!20672 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!12860 () Bool)

(declare-fun e!7792 () Bool)

(declare-fun array_inv!292 (array!697) Bool)

(assert (=> b!12860 (= e!7792 (array_inv!292 (buf!654 thiss!1486)))))

(declare-fun b!12861 () Bool)

(declare-fun res!12247 () Bool)

(assert (=> b!12861 (=> (not res!12247) (not e!7789))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!12861 (= res!12247 (= (bitIndex!0 (size!303 (buf!654 (_2!807 lt!20672))) (currentByte!1738 (_2!807 lt!20672)) (currentBit!1733 (_2!807 lt!20672))) (bvadd (bitIndex!0 (size!303 (buf!654 thiss!1486)) (currentByte!1738 thiss!1486) (currentBit!1733 thiss!1486)) nBits!460)))))

(declare-fun b!12862 () Bool)

(declare-fun res!12243 () Bool)

(declare-fun e!7788 () Bool)

(assert (=> b!12862 (=> res!12243 e!7788)))

(declare-datatypes ((List!179 0))(
  ( (Nil!176) (Cons!175 (h!294 Bool) (t!929 List!179)) )
))
(declare-fun lt!20669 () List!179)

(declare-fun byteArrayBitContentToList!0 (BitStream!566 array!697 (_ BitVec 64) (_ BitVec 64)) List!179)

(assert (=> b!12862 (= res!12243 (not (= lt!20669 (byteArrayBitContentToList!0 (_2!807 lt!20672) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!12863 () Bool)

(assert (=> b!12863 (= e!7789 (not e!7788))))

(declare-fun res!12245 () Bool)

(assert (=> b!12863 (=> res!12245 e!7788)))

(declare-datatypes ((tuple2!1506 0))(
  ( (tuple2!1507 (_1!808 array!697) (_2!808 BitStream!566)) )
))
(declare-fun lt!20671 () tuple2!1506)

(assert (=> b!12863 (= res!12245 (not (= (byteArrayBitContentToList!0 (_2!807 lt!20672) (_1!808 lt!20671) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!20669)))))

(declare-datatypes ((tuple2!1508 0))(
  ( (tuple2!1509 (_1!809 BitStream!566) (_2!809 BitStream!566)) )
))
(declare-fun lt!20668 () tuple2!1508)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!566 BitStream!566 (_ BitVec 64)) List!179)

(assert (=> b!12863 (= lt!20669 (bitStreamReadBitsIntoList!0 (_2!807 lt!20672) (_1!809 lt!20668) nBits!460))))

(declare-fun readBits!0 (BitStream!566 (_ BitVec 64)) tuple2!1506)

(assert (=> b!12863 (= lt!20671 (readBits!0 (_1!809 lt!20668) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!12863 (validate_offset_bits!1 ((_ sign_extend 32) (size!303 (buf!654 (_2!807 lt!20672)))) ((_ sign_extend 32) (currentByte!1738 thiss!1486)) ((_ sign_extend 32) (currentBit!1733 thiss!1486)) nBits!460)))

(declare-fun lt!20670 () Unit!1089)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!566 array!697 (_ BitVec 64)) Unit!1089)

(assert (=> b!12863 (= lt!20670 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!654 (_2!807 lt!20672)) nBits!460))))

(declare-fun reader!0 (BitStream!566 BitStream!566) tuple2!1508)

(assert (=> b!12863 (= lt!20668 (reader!0 thiss!1486 (_2!807 lt!20672)))))

(declare-fun b!12864 () Bool)

(declare-fun res!12244 () Bool)

(assert (=> b!12864 (=> (not res!12244) (not e!7793))))

(assert (=> b!12864 (= res!12244 (validate_offset_bits!1 ((_ sign_extend 32) (size!303 (buf!654 thiss!1486))) ((_ sign_extend 32) (currentByte!1738 thiss!1486)) ((_ sign_extend 32) (currentBit!1733 thiss!1486)) nBits!460))))

(declare-fun res!12241 () Bool)

(assert (=> start!2682 (=> (not res!12241) (not e!7793))))

(assert (=> start!2682 (= res!12241 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!303 srcBuffer!6))))))))

(assert (=> start!2682 e!7793))

(assert (=> start!2682 true))

(assert (=> start!2682 (array_inv!292 srcBuffer!6)))

(declare-fun inv!12 (BitStream!566) Bool)

(assert (=> start!2682 (and (inv!12 thiss!1486) e!7792)))

(declare-fun b!12865 () Bool)

(assert (=> b!12865 (= e!7788 true)))

(declare-fun lt!20667 () Unit!1089)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!566 array!697 array!697 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1089)

(assert (=> b!12865 (= lt!20667 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!807 lt!20672) srcBuffer!6 (_1!808 lt!20671) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!12866 () Bool)

(declare-fun res!12240 () Bool)

(assert (=> b!12866 (=> (not res!12240) (not e!7789))))

(assert (=> b!12866 (= res!12240 (= (size!303 (buf!654 thiss!1486)) (size!303 (buf!654 (_2!807 lt!20672)))))))

(declare-fun b!12867 () Bool)

(declare-fun res!12246 () Bool)

(assert (=> b!12867 (=> (not res!12246) (not e!7789))))

(declare-fun isPrefixOf!0 (BitStream!566 BitStream!566) Bool)

(assert (=> b!12867 (= res!12246 (isPrefixOf!0 thiss!1486 (_2!807 lt!20672)))))

(assert (= (and start!2682 res!12241) b!12864))

(assert (= (and b!12864 res!12244) b!12859))

(assert (= (and b!12859 res!12242) b!12866))

(assert (= (and b!12866 res!12240) b!12861))

(assert (= (and b!12861 res!12247) b!12867))

(assert (= (and b!12867 res!12246) b!12863))

(assert (= (and b!12863 (not res!12245)) b!12862))

(assert (= (and b!12862 (not res!12243)) b!12865))

(assert (= start!2682 b!12860))

(declare-fun m!19423 () Bool)

(assert (=> b!12867 m!19423))

(declare-fun m!19425 () Bool)

(assert (=> start!2682 m!19425))

(declare-fun m!19427 () Bool)

(assert (=> start!2682 m!19427))

(declare-fun m!19429 () Bool)

(assert (=> b!12865 m!19429))

(declare-fun m!19431 () Bool)

(assert (=> b!12863 m!19431))

(declare-fun m!19433 () Bool)

(assert (=> b!12863 m!19433))

(declare-fun m!19435 () Bool)

(assert (=> b!12863 m!19435))

(declare-fun m!19437 () Bool)

(assert (=> b!12863 m!19437))

(declare-fun m!19439 () Bool)

(assert (=> b!12863 m!19439))

(declare-fun m!19441 () Bool)

(assert (=> b!12863 m!19441))

(declare-fun m!19443 () Bool)

(assert (=> b!12860 m!19443))

(declare-fun m!19445 () Bool)

(assert (=> b!12864 m!19445))

(declare-fun m!19447 () Bool)

(assert (=> b!12862 m!19447))

(declare-fun m!19449 () Bool)

(assert (=> b!12861 m!19449))

(declare-fun m!19451 () Bool)

(assert (=> b!12861 m!19451))

(declare-fun m!19453 () Bool)

(assert (=> b!12859 m!19453))

(declare-fun m!19455 () Bool)

(assert (=> b!12859 m!19455))

(push 1)

(assert (not start!2682))

(assert (not b!12865))

(assert (not b!12863))

(assert (not b!12867))

(assert (not b!12864))

(assert (not b!12862))

(assert (not b!12859))

(assert (not b!12860))

(assert (not b!12861))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

