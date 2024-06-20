; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14766 () Bool)

(assert start!14766)

(declare-fun b!76114 () Bool)

(declare-fun res!62936 () Bool)

(declare-fun e!49892 () Bool)

(assert (=> b!76114 (=> (not res!62936) (not e!49892))))

(declare-datatypes ((array!3133 0))(
  ( (array!3134 (arr!2058 (Array (_ BitVec 32) (_ BitVec 8))) (size!1460 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2494 0))(
  ( (BitStream!2495 (buf!1841 array!3133) (currentByte!3632 (_ BitVec 32)) (currentBit!3627 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2494)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76114 (= res!62936 (validate_offset_bits!1 ((_ sign_extend 32) (size!1460 (buf!1841 thiss!1379))) ((_ sign_extend 32) (currentByte!3632 thiss!1379)) ((_ sign_extend 32) (currentBit!3627 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!76115 () Bool)

(declare-fun res!62935 () Bool)

(declare-fun e!49894 () Bool)

(assert (=> b!76115 (=> res!62935 e!49894)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!76115 (= res!62935 (not (invariant!0 (currentBit!3627 thiss!1379) (currentByte!3632 thiss!1379) (size!1460 (buf!1841 thiss!1379)))))))

(declare-fun b!76116 () Bool)

(declare-fun e!49895 () Bool)

(declare-fun array_inv!1306 (array!3133) Bool)

(assert (=> b!76116 (= e!49895 (array_inv!1306 (buf!1841 thiss!1379)))))

(declare-fun res!62937 () Bool)

(assert (=> start!14766 (=> (not res!62937) (not e!49892))))

(declare-fun srcBuffer!2 () array!3133)

(assert (=> start!14766 (= res!62937 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1460 srcBuffer!2))))))))

(assert (=> start!14766 e!49892))

(assert (=> start!14766 true))

(assert (=> start!14766 (array_inv!1306 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2494) Bool)

(assert (=> start!14766 (and (inv!12 thiss!1379) e!49895)))

(declare-fun b!76117 () Bool)

(declare-fun e!49893 () Bool)

(assert (=> b!76117 (= e!49893 true)))

(declare-datatypes ((tuple2!6598 0))(
  ( (tuple2!6599 (_1!3430 array!3133) (_2!3430 BitStream!2494)) )
))
(declare-fun lt!122111 () tuple2!6598)

(declare-fun checkByteArrayBitContent!0 (BitStream!2494 array!3133 array!3133 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76117 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3430 lt!122111) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!76118 () Bool)

(assert (=> b!76118 (= e!49894 e!49893)))

(declare-fun res!62934 () Bool)

(assert (=> b!76118 (=> res!62934 e!49893)))

(assert (=> b!76118 (= res!62934 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2494 (_ BitVec 64)) tuple2!6598)

(declare-datatypes ((tuple2!6600 0))(
  ( (tuple2!6601 (_1!3431 BitStream!2494) (_2!3431 BitStream!2494)) )
))
(declare-fun reader!0 (BitStream!2494 BitStream!2494) tuple2!6600)

(assert (=> b!76118 (= lt!122111 (readBits!0 (_1!3431 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!76119 () Bool)

(assert (=> b!76119 (= e!49892 (not e!49894))))

(declare-fun res!62938 () Bool)

(assert (=> b!76119 (=> res!62938 e!49894)))

(declare-fun lt!122112 () (_ BitVec 64))

(assert (=> b!76119 (= res!62938 (or (bvslt i!635 to!314) (not (= lt!122112 (bvsub (bvadd lt!122112 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2494 BitStream!2494) Bool)

(assert (=> b!76119 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!5020 0))(
  ( (Unit!5021) )
))
(declare-fun lt!122110 () Unit!5020)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2494) Unit!5020)

(assert (=> b!76119 (= lt!122110 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!76119 (= lt!122112 (bitIndex!0 (size!1460 (buf!1841 thiss!1379)) (currentByte!3632 thiss!1379) (currentBit!3627 thiss!1379)))))

(assert (= (and start!14766 res!62937) b!76114))

(assert (= (and b!76114 res!62936) b!76119))

(assert (= (and b!76119 (not res!62938)) b!76115))

(assert (= (and b!76115 (not res!62935)) b!76118))

(assert (= (and b!76118 (not res!62934)) b!76117))

(assert (= start!14766 b!76116))

(declare-fun m!121301 () Bool)

(assert (=> b!76118 m!121301))

(declare-fun m!121303 () Bool)

(assert (=> b!76118 m!121303))

(declare-fun m!121305 () Bool)

(assert (=> b!76116 m!121305))

(declare-fun m!121307 () Bool)

(assert (=> b!76117 m!121307))

(declare-fun m!121309 () Bool)

(assert (=> b!76119 m!121309))

(declare-fun m!121311 () Bool)

(assert (=> b!76119 m!121311))

(declare-fun m!121313 () Bool)

(assert (=> b!76119 m!121313))

(declare-fun m!121315 () Bool)

(assert (=> start!14766 m!121315))

(declare-fun m!121317 () Bool)

(assert (=> start!14766 m!121317))

(declare-fun m!121319 () Bool)

(assert (=> b!76115 m!121319))

(declare-fun m!121321 () Bool)

(assert (=> b!76114 m!121321))

(push 1)

(assert (not b!76116))

(assert (not b!76115))

(assert (not b!76114))

(assert (not start!14766))

(assert (not b!76119))

(assert (not b!76118))

(assert (not b!76117))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

