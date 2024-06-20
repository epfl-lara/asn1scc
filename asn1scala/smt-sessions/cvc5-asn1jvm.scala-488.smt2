; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14352 () Bool)

(assert start!14352)

(declare-fun b!74442 () Bool)

(declare-fun e!48697 () Bool)

(declare-fun e!48696 () Bool)

(assert (=> b!74442 (= e!48697 (not e!48696))))

(declare-fun res!61534 () Bool)

(assert (=> b!74442 (=> res!61534 e!48696)))

(declare-fun lt!119734 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!74442 (= res!61534 (or (bvslt i!635 to!314) (not (= lt!119734 (bvsub (bvadd lt!119734 to!314) i!635)))))))

(declare-datatypes ((array!3040 0))(
  ( (array!3041 (arr!2015 (Array (_ BitVec 32) (_ BitVec 8))) (size!1421 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2416 0))(
  ( (BitStream!2417 (buf!1802 array!3040) (currentByte!3546 (_ BitVec 32)) (currentBit!3541 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2416)

(declare-fun isPrefixOf!0 (BitStream!2416 BitStream!2416) Bool)

(assert (=> b!74442 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4919 0))(
  ( (Unit!4920) )
))
(declare-fun lt!119733 () Unit!4919)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2416) Unit!4919)

(assert (=> b!74442 (= lt!119733 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!74442 (= lt!119734 (bitIndex!0 (size!1421 (buf!1802 thiss!1379)) (currentByte!3546 thiss!1379) (currentBit!3541 thiss!1379)))))

(declare-fun b!74443 () Bool)

(declare-fun res!61535 () Bool)

(assert (=> b!74443 (=> (not res!61535) (not e!48697))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74443 (= res!61535 (validate_offset_bits!1 ((_ sign_extend 32) (size!1421 (buf!1802 thiss!1379))) ((_ sign_extend 32) (currentByte!3546 thiss!1379)) ((_ sign_extend 32) (currentBit!3541 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!74444 () Bool)

(declare-fun res!61533 () Bool)

(assert (=> b!74444 (=> res!61533 e!48696)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!74444 (= res!61533 (not (invariant!0 (currentBit!3541 thiss!1379) (currentByte!3546 thiss!1379) (size!1421 (buf!1802 thiss!1379)))))))

(declare-fun b!74446 () Bool)

(declare-fun e!48694 () Bool)

(declare-fun array_inv!1267 (array!3040) Bool)

(assert (=> b!74446 (= e!48694 (array_inv!1267 (buf!1802 thiss!1379)))))

(declare-fun b!74445 () Bool)

(assert (=> b!74445 (= e!48696 (or (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((tuple2!6426 0))(
  ( (tuple2!6427 (_1!3327 array!3040) (_2!3327 BitStream!2416)) )
))
(declare-fun lt!119732 () tuple2!6426)

(declare-fun readBits!0 (BitStream!2416 (_ BitVec 64)) tuple2!6426)

(declare-datatypes ((tuple2!6428 0))(
  ( (tuple2!6429 (_1!3328 BitStream!2416) (_2!3328 BitStream!2416)) )
))
(declare-fun reader!0 (BitStream!2416 BitStream!2416) tuple2!6428)

(assert (=> b!74445 (= lt!119732 (readBits!0 (_1!3328 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!61536 () Bool)

(assert (=> start!14352 (=> (not res!61536) (not e!48697))))

(declare-fun srcBuffer!2 () array!3040)

(assert (=> start!14352 (= res!61536 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1421 srcBuffer!2))))))))

(assert (=> start!14352 e!48697))

(assert (=> start!14352 true))

(assert (=> start!14352 (array_inv!1267 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2416) Bool)

(assert (=> start!14352 (and (inv!12 thiss!1379) e!48694)))

(assert (= (and start!14352 res!61536) b!74443))

(assert (= (and b!74443 res!61535) b!74442))

(assert (= (and b!74442 (not res!61534)) b!74444))

(assert (= (and b!74444 (not res!61533)) b!74445))

(assert (= start!14352 b!74446))

(declare-fun m!119419 () Bool)

(assert (=> b!74445 m!119419))

(declare-fun m!119421 () Bool)

(assert (=> b!74445 m!119421))

(declare-fun m!119423 () Bool)

(assert (=> b!74442 m!119423))

(declare-fun m!119425 () Bool)

(assert (=> b!74442 m!119425))

(declare-fun m!119427 () Bool)

(assert (=> b!74442 m!119427))

(declare-fun m!119429 () Bool)

(assert (=> b!74443 m!119429))

(declare-fun m!119431 () Bool)

(assert (=> start!14352 m!119431))

(declare-fun m!119433 () Bool)

(assert (=> start!14352 m!119433))

(declare-fun m!119435 () Bool)

(assert (=> b!74444 m!119435))

(declare-fun m!119437 () Bool)

(assert (=> b!74446 m!119437))

(push 1)

(assert (not b!74442))

(assert (not b!74446))

(assert (not b!74443))

(assert (not start!14352))

(assert (not b!74445))

(assert (not b!74444))

(check-sat)

(pop 1)

(push 1)

(check-sat)

