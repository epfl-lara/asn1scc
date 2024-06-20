; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14778 () Bool)

(assert start!14778)

(declare-fun res!63025 () Bool)

(declare-fun e!50002 () Bool)

(assert (=> start!14778 (=> (not res!63025) (not e!50002))))

(declare-datatypes ((array!3145 0))(
  ( (array!3146 (arr!2064 (Array (_ BitVec 32) (_ BitVec 8))) (size!1466 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!3145)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!14778 (= res!63025 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1466 srcBuffer!2))))))))

(assert (=> start!14778 e!50002))

(assert (=> start!14778 true))

(declare-fun array_inv!1312 (array!3145) Bool)

(assert (=> start!14778 (array_inv!1312 srcBuffer!2)))

(declare-datatypes ((BitStream!2506 0))(
  ( (BitStream!2507 (buf!1847 array!3145) (currentByte!3638 (_ BitVec 32)) (currentBit!3633 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2506)

(declare-fun e!50001 () Bool)

(declare-fun inv!12 (BitStream!2506) Bool)

(assert (=> start!14778 (and (inv!12 thiss!1379) e!50001)))

(declare-fun b!76222 () Bool)

(assert (=> b!76222 (= e!50001 (array_inv!1312 (buf!1847 thiss!1379)))))

(declare-fun b!76223 () Bool)

(declare-fun res!63024 () Bool)

(assert (=> b!76223 (=> (not res!63024) (not e!50002))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76223 (= res!63024 (validate_offset_bits!1 ((_ sign_extend 32) (size!1466 (buf!1847 thiss!1379))) ((_ sign_extend 32) (currentByte!3638 thiss!1379)) ((_ sign_extend 32) (currentBit!3633 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!76224 () Bool)

(declare-fun res!63028 () Bool)

(declare-fun e!50003 () Bool)

(assert (=> b!76224 (=> res!63028 e!50003)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!76224 (= res!63028 (not (invariant!0 (currentBit!3633 thiss!1379) (currentByte!3638 thiss!1379) (size!1466 (buf!1847 thiss!1379)))))))

(declare-fun b!76225 () Bool)

(declare-fun e!50004 () Bool)

(assert (=> b!76225 (= e!50004 true)))

(declare-datatypes ((tuple2!6622 0))(
  ( (tuple2!6623 (_1!3442 array!3145) (_2!3442 BitStream!2506)) )
))
(declare-fun lt!122164 () tuple2!6622)

(declare-fun checkByteArrayBitContent!0 (BitStream!2506 array!3145 array!3145 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76225 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3442 lt!122164) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!76226 () Bool)

(assert (=> b!76226 (= e!50002 (not e!50003))))

(declare-fun res!63027 () Bool)

(assert (=> b!76226 (=> res!63027 e!50003)))

(declare-fun lt!122166 () (_ BitVec 64))

(assert (=> b!76226 (= res!63027 (or (bvslt i!635 to!314) (not (= lt!122166 (bvsub (bvadd lt!122166 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2506 BitStream!2506) Bool)

(assert (=> b!76226 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!5032 0))(
  ( (Unit!5033) )
))
(declare-fun lt!122165 () Unit!5032)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2506) Unit!5032)

(assert (=> b!76226 (= lt!122165 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!76226 (= lt!122166 (bitIndex!0 (size!1466 (buf!1847 thiss!1379)) (currentByte!3638 thiss!1379) (currentBit!3633 thiss!1379)))))

(declare-fun b!76227 () Bool)

(assert (=> b!76227 (= e!50003 e!50004)))

(declare-fun res!63026 () Bool)

(assert (=> b!76227 (=> res!63026 e!50004)))

(assert (=> b!76227 (= res!63026 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2506 (_ BitVec 64)) tuple2!6622)

(declare-datatypes ((tuple2!6624 0))(
  ( (tuple2!6625 (_1!3443 BitStream!2506) (_2!3443 BitStream!2506)) )
))
(declare-fun reader!0 (BitStream!2506 BitStream!2506) tuple2!6624)

(assert (=> b!76227 (= lt!122164 (readBits!0 (_1!3443 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!14778 res!63025) b!76223))

(assert (= (and b!76223 res!63024) b!76226))

(assert (= (and b!76226 (not res!63027)) b!76224))

(assert (= (and b!76224 (not res!63028)) b!76227))

(assert (= (and b!76227 (not res!63026)) b!76225))

(assert (= start!14778 b!76222))

(declare-fun m!121433 () Bool)

(assert (=> start!14778 m!121433))

(declare-fun m!121435 () Bool)

(assert (=> start!14778 m!121435))

(declare-fun m!121437 () Bool)

(assert (=> b!76227 m!121437))

(declare-fun m!121439 () Bool)

(assert (=> b!76227 m!121439))

(declare-fun m!121441 () Bool)

(assert (=> b!76225 m!121441))

(declare-fun m!121443 () Bool)

(assert (=> b!76226 m!121443))

(declare-fun m!121445 () Bool)

(assert (=> b!76226 m!121445))

(declare-fun m!121447 () Bool)

(assert (=> b!76226 m!121447))

(declare-fun m!121449 () Bool)

(assert (=> b!76222 m!121449))

(declare-fun m!121451 () Bool)

(assert (=> b!76224 m!121451))

(declare-fun m!121453 () Bool)

(assert (=> b!76223 m!121453))

(push 1)

(assert (not b!76227))

(assert (not b!76225))

(assert (not start!14778))

(assert (not b!76224))

(assert (not b!76222))

(assert (not b!76226))

(assert (not b!76223))

