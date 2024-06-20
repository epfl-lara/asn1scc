; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2370 () Bool)

(assert start!2370)

(declare-fun b!11230 () Bool)

(declare-fun e!6865 () Bool)

(declare-fun e!6868 () Bool)

(assert (=> b!11230 (= e!6865 e!6868)))

(declare-fun res!11050 () Bool)

(assert (=> b!11230 (=> (not res!11050) (not e!6868))))

(declare-datatypes ((array!661 0))(
  ( (array!662 (arr!705 (Array (_ BitVec 32) (_ BitVec 8))) (size!285 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!536 0))(
  ( (BitStream!537 (buf!630 array!661) (currentByte!1702 (_ BitVec 32)) (currentBit!1697 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!966 0))(
  ( (Unit!967) )
))
(declare-datatypes ((tuple2!1384 0))(
  ( (tuple2!1385 (_1!738 Unit!966) (_2!738 BitStream!536)) )
))
(declare-fun lt!17663 () tuple2!1384)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!11230 (= res!11050 (invariant!0 (currentBit!1697 (_2!738 lt!17663)) (currentByte!1702 (_2!738 lt!17663)) (size!285 (buf!630 (_2!738 lt!17663)))))))

(declare-fun srcBuffer!6 () array!661)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!536)

(declare-fun from!367 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!536 array!661 (_ BitVec 64) (_ BitVec 64)) tuple2!1384)

(assert (=> b!11230 (= lt!17663 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!11231 () Bool)

(declare-fun e!6869 () Bool)

(assert (=> b!11231 (= e!6868 (not e!6869))))

(declare-fun res!11055 () Bool)

(assert (=> b!11231 (=> res!11055 e!6869)))

(declare-datatypes ((tuple2!1386 0))(
  ( (tuple2!1387 (_1!739 array!661) (_2!739 BitStream!536)) )
))
(declare-fun lt!17666 () tuple2!1386)

(declare-datatypes ((List!164 0))(
  ( (Nil!161) (Cons!160 (h!279 Bool) (t!914 List!164)) )
))
(declare-fun lt!17664 () List!164)

(declare-fun byteArrayBitContentToList!0 (BitStream!536 array!661 (_ BitVec 64) (_ BitVec 64)) List!164)

(assert (=> b!11231 (= res!11055 (not (= (byteArrayBitContentToList!0 (_2!738 lt!17663) (_1!739 lt!17666) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!17664)))))

(declare-datatypes ((tuple2!1388 0))(
  ( (tuple2!1389 (_1!740 BitStream!536) (_2!740 BitStream!536)) )
))
(declare-fun lt!17662 () tuple2!1388)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!536 BitStream!536 (_ BitVec 64)) List!164)

(assert (=> b!11231 (= lt!17664 (bitStreamReadBitsIntoList!0 (_2!738 lt!17663) (_1!740 lt!17662) nBits!460))))

(declare-fun readBits!0 (BitStream!536 (_ BitVec 64)) tuple2!1386)

(assert (=> b!11231 (= lt!17666 (readBits!0 (_1!740 lt!17662) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!11231 (validate_offset_bits!1 ((_ sign_extend 32) (size!285 (buf!630 (_2!738 lt!17663)))) ((_ sign_extend 32) (currentByte!1702 thiss!1486)) ((_ sign_extend 32) (currentBit!1697 thiss!1486)) nBits!460)))

(declare-fun lt!17661 () Unit!966)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!536 array!661 (_ BitVec 64)) Unit!966)

(assert (=> b!11231 (= lt!17661 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!630 (_2!738 lt!17663)) nBits!460))))

(declare-fun reader!0 (BitStream!536 BitStream!536) tuple2!1388)

(assert (=> b!11231 (= lt!17662 (reader!0 thiss!1486 (_2!738 lt!17663)))))

(declare-fun res!11054 () Bool)

(assert (=> start!2370 (=> (not res!11054) (not e!6865))))

(assert (=> start!2370 (= res!11054 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!285 srcBuffer!6))))))))

(assert (=> start!2370 e!6865))

(assert (=> start!2370 true))

(declare-fun array_inv!277 (array!661) Bool)

(assert (=> start!2370 (array_inv!277 srcBuffer!6)))

(declare-fun e!6866 () Bool)

(declare-fun inv!12 (BitStream!536) Bool)

(assert (=> start!2370 (and (inv!12 thiss!1486) e!6866)))

(declare-fun b!11232 () Bool)

(declare-fun res!11056 () Bool)

(assert (=> b!11232 (=> (not res!11056) (not e!6868))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!11232 (= res!11056 (= (bitIndex!0 (size!285 (buf!630 (_2!738 lt!17663))) (currentByte!1702 (_2!738 lt!17663)) (currentBit!1697 (_2!738 lt!17663))) (bvadd (bitIndex!0 (size!285 (buf!630 thiss!1486)) (currentByte!1702 thiss!1486) (currentBit!1697 thiss!1486)) nBits!460)))))

(declare-fun b!11233 () Bool)

(assert (=> b!11233 (= e!6869 true)))

(declare-fun lt!17665 () Unit!966)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!536 array!661 array!661 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!966)

(assert (=> b!11233 (= lt!17665 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!738 lt!17663) srcBuffer!6 (_1!739 lt!17666) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!11234 () Bool)

(declare-fun res!11049 () Bool)

(assert (=> b!11234 (=> (not res!11049) (not e!6868))))

(assert (=> b!11234 (= res!11049 (= (size!285 (buf!630 thiss!1486)) (size!285 (buf!630 (_2!738 lt!17663)))))))

(declare-fun b!11235 () Bool)

(declare-fun res!11051 () Bool)

(assert (=> b!11235 (=> (not res!11051) (not e!6865))))

(assert (=> b!11235 (= res!11051 (validate_offset_bits!1 ((_ sign_extend 32) (size!285 (buf!630 thiss!1486))) ((_ sign_extend 32) (currentByte!1702 thiss!1486)) ((_ sign_extend 32) (currentBit!1697 thiss!1486)) nBits!460))))

(declare-fun b!11236 () Bool)

(declare-fun res!11053 () Bool)

(assert (=> b!11236 (=> (not res!11053) (not e!6868))))

(declare-fun isPrefixOf!0 (BitStream!536 BitStream!536) Bool)

(assert (=> b!11236 (= res!11053 (isPrefixOf!0 thiss!1486 (_2!738 lt!17663)))))

(declare-fun b!11237 () Bool)

(assert (=> b!11237 (= e!6866 (array_inv!277 (buf!630 thiss!1486)))))

(declare-fun b!11238 () Bool)

(declare-fun res!11052 () Bool)

(assert (=> b!11238 (=> res!11052 e!6869)))

(assert (=> b!11238 (= res!11052 (not (= lt!17664 (byteArrayBitContentToList!0 (_2!738 lt!17663) srcBuffer!6 from!367 nBits!460))))))

(assert (= (and start!2370 res!11054) b!11235))

(assert (= (and b!11235 res!11051) b!11230))

(assert (= (and b!11230 res!11050) b!11234))

(assert (= (and b!11234 res!11049) b!11232))

(assert (= (and b!11232 res!11056) b!11236))

(assert (= (and b!11236 res!11053) b!11231))

(assert (= (and b!11231 (not res!11055)) b!11238))

(assert (= (and b!11238 (not res!11052)) b!11233))

(assert (= start!2370 b!11237))

(declare-fun m!16399 () Bool)

(assert (=> b!11236 m!16399))

(declare-fun m!16401 () Bool)

(assert (=> b!11230 m!16401))

(declare-fun m!16403 () Bool)

(assert (=> b!11230 m!16403))

(declare-fun m!16405 () Bool)

(assert (=> b!11232 m!16405))

(declare-fun m!16407 () Bool)

(assert (=> b!11232 m!16407))

(declare-fun m!16409 () Bool)

(assert (=> b!11238 m!16409))

(declare-fun m!16411 () Bool)

(assert (=> start!2370 m!16411))

(declare-fun m!16413 () Bool)

(assert (=> start!2370 m!16413))

(declare-fun m!16415 () Bool)

(assert (=> b!11233 m!16415))

(declare-fun m!16417 () Bool)

(assert (=> b!11237 m!16417))

(declare-fun m!16419 () Bool)

(assert (=> b!11231 m!16419))

(declare-fun m!16421 () Bool)

(assert (=> b!11231 m!16421))

(declare-fun m!16423 () Bool)

(assert (=> b!11231 m!16423))

(declare-fun m!16425 () Bool)

(assert (=> b!11231 m!16425))

(declare-fun m!16427 () Bool)

(assert (=> b!11231 m!16427))

(declare-fun m!16429 () Bool)

(assert (=> b!11231 m!16429))

(declare-fun m!16431 () Bool)

(assert (=> b!11235 m!16431))

(push 1)

