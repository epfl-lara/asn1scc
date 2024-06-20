; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14338 () Bool)

(assert start!14338)

(declare-fun res!61452 () Bool)

(declare-fun e!48592 () Bool)

(assert (=> start!14338 (=> (not res!61452) (not e!48592))))

(declare-datatypes ((array!3026 0))(
  ( (array!3027 (arr!2008 (Array (_ BitVec 32) (_ BitVec 8))) (size!1414 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!3026)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!14338 (= res!61452 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1414 srcBuffer!2))))))))

(assert (=> start!14338 e!48592))

(assert (=> start!14338 true))

(declare-fun array_inv!1260 (array!3026) Bool)

(assert (=> start!14338 (array_inv!1260 srcBuffer!2)))

(declare-datatypes ((BitStream!2402 0))(
  ( (BitStream!2403 (buf!1795 array!3026) (currentByte!3539 (_ BitVec 32)) (currentBit!3534 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2402)

(declare-fun e!48591 () Bool)

(declare-fun inv!12 (BitStream!2402) Bool)

(assert (=> start!14338 (and (inv!12 thiss!1379) e!48591)))

(declare-fun b!74339 () Bool)

(declare-fun res!61451 () Bool)

(assert (=> b!74339 (=> (not res!61451) (not e!48592))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74339 (= res!61451 (validate_offset_bits!1 ((_ sign_extend 32) (size!1414 (buf!1795 thiss!1379))) ((_ sign_extend 32) (currentByte!3539 thiss!1379)) ((_ sign_extend 32) (currentBit!3534 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!74340 () Bool)

(assert (=> b!74340 (= e!48592 (not true))))

(declare-fun isPrefixOf!0 (BitStream!2402 BitStream!2402) Bool)

(assert (=> b!74340 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4905 0))(
  ( (Unit!4906) )
))
(declare-fun lt!119670 () Unit!4905)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2402) Unit!4905)

(assert (=> b!74340 (= lt!119670 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!119671 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!74340 (= lt!119671 (bitIndex!0 (size!1414 (buf!1795 thiss!1379)) (currentByte!3539 thiss!1379) (currentBit!3534 thiss!1379)))))

(declare-fun b!74341 () Bool)

(assert (=> b!74341 (= e!48591 (array_inv!1260 (buf!1795 thiss!1379)))))

(assert (= (and start!14338 res!61452) b!74339))

(assert (= (and b!74339 res!61451) b!74340))

(assert (= start!14338 b!74341))

(declare-fun m!119291 () Bool)

(assert (=> start!14338 m!119291))

(declare-fun m!119293 () Bool)

(assert (=> start!14338 m!119293))

(declare-fun m!119295 () Bool)

(assert (=> b!74339 m!119295))

(declare-fun m!119297 () Bool)

(assert (=> b!74340 m!119297))

(declare-fun m!119299 () Bool)

(assert (=> b!74340 m!119299))

(declare-fun m!119301 () Bool)

(assert (=> b!74340 m!119301))

(declare-fun m!119303 () Bool)

(assert (=> b!74341 m!119303))

(push 1)

(assert (not b!74341))

(assert (not b!74340))

(assert (not start!14338))

(assert (not b!74339))

(check-sat)

