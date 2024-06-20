; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14782 () Bool)

(assert start!14782)

(declare-fun b!76258 () Bool)

(declare-fun e!50036 () Bool)

(declare-fun e!50040 () Bool)

(assert (=> b!76258 (= e!50036 e!50040)))

(declare-fun res!63056 () Bool)

(assert (=> b!76258 (=> res!63056 e!50040)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!76258 (= res!63056 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((array!3149 0))(
  ( (array!3150 (arr!2066 (Array (_ BitVec 32) (_ BitVec 8))) (size!1468 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2510 0))(
  ( (BitStream!2511 (buf!1849 array!3149) (currentByte!3640 (_ BitVec 32)) (currentBit!3635 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!6630 0))(
  ( (tuple2!6631 (_1!3446 array!3149) (_2!3446 BitStream!2510)) )
))
(declare-fun lt!122184 () tuple2!6630)

(declare-fun thiss!1379 () BitStream!2510)

(declare-fun readBits!0 (BitStream!2510 (_ BitVec 64)) tuple2!6630)

(declare-datatypes ((tuple2!6632 0))(
  ( (tuple2!6633 (_1!3447 BitStream!2510) (_2!3447 BitStream!2510)) )
))
(declare-fun reader!0 (BitStream!2510 BitStream!2510) tuple2!6632)

(assert (=> b!76258 (= lt!122184 (readBits!0 (_1!3447 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!63057 () Bool)

(declare-fun e!50039 () Bool)

(assert (=> start!14782 (=> (not res!63057) (not e!50039))))

(declare-fun srcBuffer!2 () array!3149)

(assert (=> start!14782 (= res!63057 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1468 srcBuffer!2))))))))

(assert (=> start!14782 e!50039))

(assert (=> start!14782 true))

(declare-fun array_inv!1314 (array!3149) Bool)

(assert (=> start!14782 (array_inv!1314 srcBuffer!2)))

(declare-fun e!50035 () Bool)

(declare-fun inv!12 (BitStream!2510) Bool)

(assert (=> start!14782 (and (inv!12 thiss!1379) e!50035)))

(declare-fun b!76259 () Bool)

(declare-fun res!63058 () Bool)

(assert (=> b!76259 (=> res!63058 e!50036)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!76259 (= res!63058 (not (invariant!0 (currentBit!3635 thiss!1379) (currentByte!3640 thiss!1379) (size!1468 (buf!1849 thiss!1379)))))))

(declare-fun b!76260 () Bool)

(assert (=> b!76260 (= e!50035 (array_inv!1314 (buf!1849 thiss!1379)))))

(declare-fun b!76261 () Bool)

(declare-fun res!63055 () Bool)

(assert (=> b!76261 (=> (not res!63055) (not e!50039))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76261 (= res!63055 (validate_offset_bits!1 ((_ sign_extend 32) (size!1468 (buf!1849 thiss!1379))) ((_ sign_extend 32) (currentByte!3640 thiss!1379)) ((_ sign_extend 32) (currentBit!3635 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!76262 () Bool)

(assert (=> b!76262 (= e!50040 true)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2510 array!3149 array!3149 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76262 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3446 lt!122184) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!76263 () Bool)

(assert (=> b!76263 (= e!50039 (not e!50036))))

(declare-fun res!63054 () Bool)

(assert (=> b!76263 (=> res!63054 e!50036)))

(declare-fun lt!122183 () (_ BitVec 64))

(assert (=> b!76263 (= res!63054 (or (bvslt i!635 to!314) (not (= lt!122183 (bvsub (bvadd lt!122183 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2510 BitStream!2510) Bool)

(assert (=> b!76263 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!5036 0))(
  ( (Unit!5037) )
))
(declare-fun lt!122182 () Unit!5036)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2510) Unit!5036)

(assert (=> b!76263 (= lt!122182 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!76263 (= lt!122183 (bitIndex!0 (size!1468 (buf!1849 thiss!1379)) (currentByte!3640 thiss!1379) (currentBit!3635 thiss!1379)))))

(assert (= (and start!14782 res!63057) b!76261))

(assert (= (and b!76261 res!63055) b!76263))

(assert (= (and b!76263 (not res!63054)) b!76259))

(assert (= (and b!76259 (not res!63058)) b!76258))

(assert (= (and b!76258 (not res!63056)) b!76262))

(assert (= start!14782 b!76260))

(declare-fun m!121477 () Bool)

(assert (=> b!76263 m!121477))

(declare-fun m!121479 () Bool)

(assert (=> b!76263 m!121479))

(declare-fun m!121481 () Bool)

(assert (=> b!76263 m!121481))

(declare-fun m!121483 () Bool)

(assert (=> b!76260 m!121483))

(declare-fun m!121485 () Bool)

(assert (=> b!76259 m!121485))

(declare-fun m!121487 () Bool)

(assert (=> b!76258 m!121487))

(declare-fun m!121489 () Bool)

(assert (=> b!76258 m!121489))

(declare-fun m!121491 () Bool)

(assert (=> start!14782 m!121491))

(declare-fun m!121493 () Bool)

(assert (=> start!14782 m!121493))

(declare-fun m!121495 () Bool)

(assert (=> b!76261 m!121495))

(declare-fun m!121497 () Bool)

(assert (=> b!76262 m!121497))

(push 1)

(assert (not start!14782))

(assert (not b!76260))

(assert (not b!76262))

(assert (not b!76259))

(assert (not b!76261))

(assert (not b!76263))

(assert (not b!76258))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

