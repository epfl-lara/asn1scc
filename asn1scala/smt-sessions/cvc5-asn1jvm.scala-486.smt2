; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14340 () Bool)

(assert start!14340)

(declare-fun b!74352 () Bool)

(declare-fun e!48607 () Bool)

(declare-fun e!48605 () Bool)

(assert (=> b!74352 (= e!48607 (not e!48605))))

(declare-fun res!61463 () Bool)

(assert (=> b!74352 (=> res!61463 e!48605)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!119679 () (_ BitVec 64))

(assert (=> b!74352 (= res!61463 (or (bvslt i!635 to!314) (not (= lt!119679 (bvsub (bvadd lt!119679 to!314) i!635)))))))

(declare-datatypes ((array!3028 0))(
  ( (array!3029 (arr!2009 (Array (_ BitVec 32) (_ BitVec 8))) (size!1415 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2404 0))(
  ( (BitStream!2405 (buf!1796 array!3028) (currentByte!3540 (_ BitVec 32)) (currentBit!3535 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2404)

(declare-fun isPrefixOf!0 (BitStream!2404 BitStream!2404) Bool)

(assert (=> b!74352 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4907 0))(
  ( (Unit!4908) )
))
(declare-fun lt!119678 () Unit!4907)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2404) Unit!4907)

(assert (=> b!74352 (= lt!119678 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!74352 (= lt!119679 (bitIndex!0 (size!1415 (buf!1796 thiss!1379)) (currentByte!3540 thiss!1379) (currentBit!3535 thiss!1379)))))

(declare-fun res!61462 () Bool)

(assert (=> start!14340 (=> (not res!61462) (not e!48607))))

(declare-fun srcBuffer!2 () array!3028)

(assert (=> start!14340 (= res!61462 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1415 srcBuffer!2))))))))

(assert (=> start!14340 e!48607))

(assert (=> start!14340 true))

(declare-fun array_inv!1261 (array!3028) Bool)

(assert (=> start!14340 (array_inv!1261 srcBuffer!2)))

(declare-fun e!48608 () Bool)

(declare-fun inv!12 (BitStream!2404) Bool)

(assert (=> start!14340 (and (inv!12 thiss!1379) e!48608)))

(declare-fun b!74353 () Bool)

(declare-fun res!61461 () Bool)

(assert (=> b!74353 (=> res!61461 e!48605)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!74353 (= res!61461 (not (invariant!0 (currentBit!3535 thiss!1379) (currentByte!3540 thiss!1379) (size!1415 (buf!1796 thiss!1379)))))))

(declare-fun b!74354 () Bool)

(declare-fun res!61464 () Bool)

(assert (=> b!74354 (=> (not res!61464) (not e!48607))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74354 (= res!61464 (validate_offset_bits!1 ((_ sign_extend 32) (size!1415 (buf!1796 thiss!1379))) ((_ sign_extend 32) (currentByte!3540 thiss!1379)) ((_ sign_extend 32) (currentBit!3535 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!74355 () Bool)

(assert (=> b!74355 (= e!48605 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((tuple2!6408 0))(
  ( (tuple2!6409 (_1!3318 BitStream!2404) (_2!3318 BitStream!2404)) )
))
(declare-fun lt!119680 () tuple2!6408)

(declare-fun reader!0 (BitStream!2404 BitStream!2404) tuple2!6408)

(assert (=> b!74355 (= lt!119680 (reader!0 thiss!1379 thiss!1379))))

(declare-fun b!74356 () Bool)

(assert (=> b!74356 (= e!48608 (array_inv!1261 (buf!1796 thiss!1379)))))

(assert (= (and start!14340 res!61462) b!74354))

(assert (= (and b!74354 res!61464) b!74352))

(assert (= (and b!74352 (not res!61463)) b!74353))

(assert (= (and b!74353 (not res!61461)) b!74355))

(assert (= start!14340 b!74356))

(declare-fun m!119305 () Bool)

(assert (=> b!74354 m!119305))

(declare-fun m!119307 () Bool)

(assert (=> b!74353 m!119307))

(declare-fun m!119309 () Bool)

(assert (=> start!14340 m!119309))

(declare-fun m!119311 () Bool)

(assert (=> start!14340 m!119311))

(declare-fun m!119313 () Bool)

(assert (=> b!74352 m!119313))

(declare-fun m!119315 () Bool)

(assert (=> b!74352 m!119315))

(declare-fun m!119317 () Bool)

(assert (=> b!74352 m!119317))

(declare-fun m!119319 () Bool)

(assert (=> b!74356 m!119319))

(declare-fun m!119321 () Bool)

(assert (=> b!74355 m!119321))

(push 1)

(assert (not b!74354))

(assert (not start!14340))

(assert (not b!74355))

(assert (not b!74353))

(assert (not b!74356))

(assert (not b!74352))

(check-sat)

(pop 1)

(push 1)

(check-sat)

