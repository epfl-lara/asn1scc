; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2366 () Bool)

(assert start!2366)

(declare-fun b!11176 () Bool)

(declare-fun e!6828 () Bool)

(declare-fun e!6832 () Bool)

(assert (=> b!11176 (= e!6828 e!6832)))

(declare-fun res!11008 () Bool)

(assert (=> b!11176 (=> (not res!11008) (not e!6832))))

(declare-datatypes ((array!657 0))(
  ( (array!658 (arr!703 (Array (_ BitVec 32) (_ BitVec 8))) (size!283 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!532 0))(
  ( (BitStream!533 (buf!628 array!657) (currentByte!1700 (_ BitVec 32)) (currentBit!1695 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!962 0))(
  ( (Unit!963) )
))
(declare-datatypes ((tuple2!1372 0))(
  ( (tuple2!1373 (_1!732 Unit!962) (_2!732 BitStream!532)) )
))
(declare-fun lt!17630 () tuple2!1372)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!11176 (= res!11008 (invariant!0 (currentBit!1695 (_2!732 lt!17630)) (currentByte!1700 (_2!732 lt!17630)) (size!283 (buf!628 (_2!732 lt!17630)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!657)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!532)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!532 array!657 (_ BitVec 64) (_ BitVec 64)) tuple2!1372)

(assert (=> b!11176 (= lt!17630 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!11177 () Bool)

(declare-fun e!6830 () Bool)

(assert (=> b!11177 (= e!6830 true)))

(declare-datatypes ((tuple2!1374 0))(
  ( (tuple2!1375 (_1!733 array!657) (_2!733 BitStream!532)) )
))
(declare-fun lt!17628 () tuple2!1374)

(declare-fun lt!17626 () Unit!962)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!532 array!657 array!657 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!962)

(assert (=> b!11177 (= lt!17626 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!732 lt!17630) srcBuffer!6 (_1!733 lt!17628) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!11178 () Bool)

(declare-fun res!11003 () Bool)

(assert (=> b!11178 (=> (not res!11003) (not e!6832))))

(assert (=> b!11178 (= res!11003 (= (size!283 (buf!628 thiss!1486)) (size!283 (buf!628 (_2!732 lt!17630)))))))

(declare-fun b!11179 () Bool)

(declare-fun res!11001 () Bool)

(assert (=> b!11179 (=> (not res!11001) (not e!6828))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!11179 (= res!11001 (validate_offset_bits!1 ((_ sign_extend 32) (size!283 (buf!628 thiss!1486))) ((_ sign_extend 32) (currentByte!1700 thiss!1486)) ((_ sign_extend 32) (currentBit!1695 thiss!1486)) nBits!460))))

(declare-fun b!11180 () Bool)

(declare-fun e!6829 () Bool)

(declare-fun array_inv!275 (array!657) Bool)

(assert (=> b!11180 (= e!6829 (array_inv!275 (buf!628 thiss!1486)))))

(declare-fun b!11181 () Bool)

(declare-fun res!11007 () Bool)

(assert (=> b!11181 (=> res!11007 e!6830)))

(declare-datatypes ((List!162 0))(
  ( (Nil!159) (Cons!158 (h!277 Bool) (t!912 List!162)) )
))
(declare-fun lt!17625 () List!162)

(declare-fun byteArrayBitContentToList!0 (BitStream!532 array!657 (_ BitVec 64) (_ BitVec 64)) List!162)

(assert (=> b!11181 (= res!11007 (not (= lt!17625 (byteArrayBitContentToList!0 (_2!732 lt!17630) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!11182 () Bool)

(declare-fun res!11006 () Bool)

(assert (=> b!11182 (=> (not res!11006) (not e!6832))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!11182 (= res!11006 (= (bitIndex!0 (size!283 (buf!628 (_2!732 lt!17630))) (currentByte!1700 (_2!732 lt!17630)) (currentBit!1695 (_2!732 lt!17630))) (bvadd (bitIndex!0 (size!283 (buf!628 thiss!1486)) (currentByte!1700 thiss!1486) (currentBit!1695 thiss!1486)) nBits!460)))))

(declare-fun b!11183 () Bool)

(assert (=> b!11183 (= e!6832 (not e!6830))))

(declare-fun res!11002 () Bool)

(assert (=> b!11183 (=> res!11002 e!6830)))

(assert (=> b!11183 (= res!11002 (not (= (byteArrayBitContentToList!0 (_2!732 lt!17630) (_1!733 lt!17628) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!17625)))))

(declare-datatypes ((tuple2!1376 0))(
  ( (tuple2!1377 (_1!734 BitStream!532) (_2!734 BitStream!532)) )
))
(declare-fun lt!17629 () tuple2!1376)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!532 BitStream!532 (_ BitVec 64)) List!162)

(assert (=> b!11183 (= lt!17625 (bitStreamReadBitsIntoList!0 (_2!732 lt!17630) (_1!734 lt!17629) nBits!460))))

(declare-fun readBits!0 (BitStream!532 (_ BitVec 64)) tuple2!1374)

(assert (=> b!11183 (= lt!17628 (readBits!0 (_1!734 lt!17629) nBits!460))))

(assert (=> b!11183 (validate_offset_bits!1 ((_ sign_extend 32) (size!283 (buf!628 (_2!732 lt!17630)))) ((_ sign_extend 32) (currentByte!1700 thiss!1486)) ((_ sign_extend 32) (currentBit!1695 thiss!1486)) nBits!460)))

(declare-fun lt!17627 () Unit!962)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!532 array!657 (_ BitVec 64)) Unit!962)

(assert (=> b!11183 (= lt!17627 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!628 (_2!732 lt!17630)) nBits!460))))

(declare-fun reader!0 (BitStream!532 BitStream!532) tuple2!1376)

(assert (=> b!11183 (= lt!17629 (reader!0 thiss!1486 (_2!732 lt!17630)))))

(declare-fun res!11005 () Bool)

(assert (=> start!2366 (=> (not res!11005) (not e!6828))))

(assert (=> start!2366 (= res!11005 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!283 srcBuffer!6))))))))

(assert (=> start!2366 e!6828))

(assert (=> start!2366 true))

(assert (=> start!2366 (array_inv!275 srcBuffer!6)))

(declare-fun inv!12 (BitStream!532) Bool)

(assert (=> start!2366 (and (inv!12 thiss!1486) e!6829)))

(declare-fun b!11184 () Bool)

(declare-fun res!11004 () Bool)

(assert (=> b!11184 (=> (not res!11004) (not e!6832))))

(declare-fun isPrefixOf!0 (BitStream!532 BitStream!532) Bool)

(assert (=> b!11184 (= res!11004 (isPrefixOf!0 thiss!1486 (_2!732 lt!17630)))))

(assert (= (and start!2366 res!11005) b!11179))

(assert (= (and b!11179 res!11001) b!11176))

(assert (= (and b!11176 res!11008) b!11178))

(assert (= (and b!11178 res!11003) b!11182))

(assert (= (and b!11182 res!11006) b!11184))

(assert (= (and b!11184 res!11004) b!11183))

(assert (= (and b!11183 (not res!11002)) b!11181))

(assert (= (and b!11181 (not res!11007)) b!11177))

(assert (= start!2366 b!11180))

(declare-fun m!16331 () Bool)

(assert (=> b!11184 m!16331))

(declare-fun m!16333 () Bool)

(assert (=> b!11177 m!16333))

(declare-fun m!16335 () Bool)

(assert (=> b!11179 m!16335))

(declare-fun m!16337 () Bool)

(assert (=> b!11181 m!16337))

(declare-fun m!16339 () Bool)

(assert (=> start!2366 m!16339))

(declare-fun m!16341 () Bool)

(assert (=> start!2366 m!16341))

(declare-fun m!16343 () Bool)

(assert (=> b!11176 m!16343))

(declare-fun m!16345 () Bool)

(assert (=> b!11176 m!16345))

(declare-fun m!16347 () Bool)

(assert (=> b!11183 m!16347))

(declare-fun m!16349 () Bool)

(assert (=> b!11183 m!16349))

(declare-fun m!16351 () Bool)

(assert (=> b!11183 m!16351))

(declare-fun m!16353 () Bool)

(assert (=> b!11183 m!16353))

(declare-fun m!16355 () Bool)

(assert (=> b!11183 m!16355))

(declare-fun m!16357 () Bool)

(assert (=> b!11183 m!16357))

(declare-fun m!16359 () Bool)

(assert (=> b!11182 m!16359))

(declare-fun m!16361 () Bool)

(assert (=> b!11182 m!16361))

(declare-fun m!16363 () Bool)

(assert (=> b!11180 m!16363))

(push 1)

(assert (not b!11176))

(assert (not b!11177))

(assert (not b!11181))

(assert (not b!11184))

(assert (not start!2366))

(assert (not b!11183))

(assert (not b!11179))

(assert (not b!11182))

(assert (not b!11180))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

