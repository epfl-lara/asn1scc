; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2698 () Bool)

(assert start!2698)

(declare-fun b!13075 () Bool)

(declare-fun res!12438 () Bool)

(declare-fun e!7932 () Bool)

(assert (=> b!13075 (=> (not res!12438) (not e!7932))))

(declare-datatypes ((array!713 0))(
  ( (array!714 (arr!740 (Array (_ BitVec 32) (_ BitVec 8))) (size!311 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!582 0))(
  ( (BitStream!583 (buf!662 array!713) (currentByte!1746 (_ BitVec 32)) (currentBit!1741 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1105 0))(
  ( (Unit!1106) )
))
(declare-datatypes ((tuple2!1552 0))(
  ( (tuple2!1553 (_1!831 Unit!1105) (_2!831 BitStream!582)) )
))
(declare-fun lt!20815 () tuple2!1552)

(declare-fun thiss!1486 () BitStream!582)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!13075 (= res!12438 (= (bitIndex!0 (size!311 (buf!662 (_2!831 lt!20815))) (currentByte!1746 (_2!831 lt!20815)) (currentBit!1741 (_2!831 lt!20815))) (bvadd (bitIndex!0 (size!311 (buf!662 thiss!1486)) (currentByte!1746 thiss!1486) (currentBit!1741 thiss!1486)) nBits!460)))))

(declare-fun b!13076 () Bool)

(declare-fun res!12439 () Bool)

(declare-fun e!7936 () Bool)

(assert (=> b!13076 (=> (not res!12439) (not e!7936))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!13076 (= res!12439 (validate_offset_bits!1 ((_ sign_extend 32) (size!311 (buf!662 thiss!1486))) ((_ sign_extend 32) (currentByte!1746 thiss!1486)) ((_ sign_extend 32) (currentBit!1741 thiss!1486)) nBits!460))))

(declare-fun b!13077 () Bool)

(assert (=> b!13077 (= e!7936 e!7932)))

(declare-fun res!12437 () Bool)

(assert (=> b!13077 (=> (not res!12437) (not e!7932))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!13077 (= res!12437 (invariant!0 (currentBit!1741 (_2!831 lt!20815)) (currentByte!1746 (_2!831 lt!20815)) (size!311 (buf!662 (_2!831 lt!20815)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!713)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!582 array!713 (_ BitVec 64) (_ BitVec 64)) tuple2!1552)

(assert (=> b!13077 (= lt!20815 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!13078 () Bool)

(declare-fun res!12436 () Bool)

(assert (=> b!13078 (=> (not res!12436) (not e!7932))))

(assert (=> b!13078 (= res!12436 (= (size!311 (buf!662 thiss!1486)) (size!311 (buf!662 (_2!831 lt!20815)))))))

(declare-fun b!13079 () Bool)

(declare-fun e!7935 () Bool)

(assert (=> b!13079 (= e!7935 true)))

(declare-fun lt!20811 () Unit!1105)

(declare-datatypes ((tuple2!1554 0))(
  ( (tuple2!1555 (_1!832 array!713) (_2!832 BitStream!582)) )
))
(declare-fun lt!20812 () tuple2!1554)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!582 array!713 array!713 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1105)

(assert (=> b!13079 (= lt!20811 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!831 lt!20815) srcBuffer!6 (_1!832 lt!20812) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!13080 () Bool)

(declare-fun res!12435 () Bool)

(assert (=> b!13080 (=> res!12435 e!7935)))

(declare-datatypes ((List!187 0))(
  ( (Nil!184) (Cons!183 (h!302 Bool) (t!937 List!187)) )
))
(declare-fun lt!20814 () List!187)

(declare-fun byteArrayBitContentToList!0 (BitStream!582 array!713 (_ BitVec 64) (_ BitVec 64)) List!187)

(assert (=> b!13080 (= res!12435 (not (= lt!20814 (byteArrayBitContentToList!0 (_2!831 lt!20815) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!13081 () Bool)

(declare-fun res!12434 () Bool)

(assert (=> b!13081 (=> (not res!12434) (not e!7932))))

(declare-fun isPrefixOf!0 (BitStream!582 BitStream!582) Bool)

(assert (=> b!13081 (= res!12434 (isPrefixOf!0 thiss!1486 (_2!831 lt!20815)))))

(declare-fun res!12433 () Bool)

(assert (=> start!2698 (=> (not res!12433) (not e!7936))))

(assert (=> start!2698 (= res!12433 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!311 srcBuffer!6))))))))

(assert (=> start!2698 e!7936))

(assert (=> start!2698 true))

(declare-fun array_inv!300 (array!713) Bool)

(assert (=> start!2698 (array_inv!300 srcBuffer!6)))

(declare-fun e!7937 () Bool)

(declare-fun inv!12 (BitStream!582) Bool)

(assert (=> start!2698 (and (inv!12 thiss!1486) e!7937)))

(declare-fun b!13082 () Bool)

(assert (=> b!13082 (= e!7937 (array_inv!300 (buf!662 thiss!1486)))))

(declare-fun b!13083 () Bool)

(assert (=> b!13083 (= e!7932 (not e!7935))))

(declare-fun res!12432 () Bool)

(assert (=> b!13083 (=> res!12432 e!7935)))

(assert (=> b!13083 (= res!12432 (not (= (byteArrayBitContentToList!0 (_2!831 lt!20815) (_1!832 lt!20812) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!20814)))))

(declare-datatypes ((tuple2!1556 0))(
  ( (tuple2!1557 (_1!833 BitStream!582) (_2!833 BitStream!582)) )
))
(declare-fun lt!20816 () tuple2!1556)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!582 BitStream!582 (_ BitVec 64)) List!187)

(assert (=> b!13083 (= lt!20814 (bitStreamReadBitsIntoList!0 (_2!831 lt!20815) (_1!833 lt!20816) nBits!460))))

(declare-fun readBits!0 (BitStream!582 (_ BitVec 64)) tuple2!1554)

(assert (=> b!13083 (= lt!20812 (readBits!0 (_1!833 lt!20816) nBits!460))))

(assert (=> b!13083 (validate_offset_bits!1 ((_ sign_extend 32) (size!311 (buf!662 (_2!831 lt!20815)))) ((_ sign_extend 32) (currentByte!1746 thiss!1486)) ((_ sign_extend 32) (currentBit!1741 thiss!1486)) nBits!460)))

(declare-fun lt!20813 () Unit!1105)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!582 array!713 (_ BitVec 64)) Unit!1105)

(assert (=> b!13083 (= lt!20813 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!662 (_2!831 lt!20815)) nBits!460))))

(declare-fun reader!0 (BitStream!582 BitStream!582) tuple2!1556)

(assert (=> b!13083 (= lt!20816 (reader!0 thiss!1486 (_2!831 lt!20815)))))

(assert (= (and start!2698 res!12433) b!13076))

(assert (= (and b!13076 res!12439) b!13077))

(assert (= (and b!13077 res!12437) b!13078))

(assert (= (and b!13078 res!12436) b!13075))

(assert (= (and b!13075 res!12438) b!13081))

(assert (= (and b!13081 res!12434) b!13083))

(assert (= (and b!13083 (not res!12432)) b!13080))

(assert (= (and b!13080 (not res!12435)) b!13079))

(assert (= start!2698 b!13082))

(declare-fun m!19695 () Bool)

(assert (=> b!13080 m!19695))

(declare-fun m!19697 () Bool)

(assert (=> start!2698 m!19697))

(declare-fun m!19699 () Bool)

(assert (=> start!2698 m!19699))

(declare-fun m!19701 () Bool)

(assert (=> b!13079 m!19701))

(declare-fun m!19703 () Bool)

(assert (=> b!13081 m!19703))

(declare-fun m!19705 () Bool)

(assert (=> b!13077 m!19705))

(declare-fun m!19707 () Bool)

(assert (=> b!13077 m!19707))

(declare-fun m!19709 () Bool)

(assert (=> b!13083 m!19709))

(declare-fun m!19711 () Bool)

(assert (=> b!13083 m!19711))

(declare-fun m!19713 () Bool)

(assert (=> b!13083 m!19713))

(declare-fun m!19715 () Bool)

(assert (=> b!13083 m!19715))

(declare-fun m!19717 () Bool)

(assert (=> b!13083 m!19717))

(declare-fun m!19719 () Bool)

(assert (=> b!13083 m!19719))

(declare-fun m!19721 () Bool)

(assert (=> b!13076 m!19721))

(declare-fun m!19723 () Bool)

(assert (=> b!13075 m!19723))

(declare-fun m!19725 () Bool)

(assert (=> b!13075 m!19725))

(declare-fun m!19727 () Bool)

(assert (=> b!13082 m!19727))

(check-sat (not b!13076) (not b!13079) (not b!13075) (not b!13083) (not b!13081) (not b!13082) (not b!13077) (not b!13080) (not start!2698))
