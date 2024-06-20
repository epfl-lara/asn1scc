; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10298 () Bool)

(assert start!10298)

(declare-fun res!43449 () Bool)

(declare-fun e!34271 () Bool)

(assert (=> start!10298 (=> (not res!43449) (not e!34271))))

(declare-datatypes ((array!2362 0))(
  ( (array!2363 (arr!1613 (Array (_ BitVec 32) (_ BitVec 8))) (size!1077 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2362)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10298 (= res!43449 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1077 srcBuffer!2))))))))

(assert (=> start!10298 e!34271))

(assert (=> start!10298 true))

(declare-fun array_inv!982 (array!2362) Bool)

(assert (=> start!10298 (array_inv!982 srcBuffer!2)))

(declare-datatypes ((BitStream!1858 0))(
  ( (BitStream!1859 (buf!1433 array!2362) (currentByte!2968 (_ BitVec 32)) (currentBit!2963 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1858)

(declare-fun e!34272 () Bool)

(declare-fun inv!12 (BitStream!1858) Bool)

(assert (=> start!10298 (and (inv!12 thiss!1379) e!34272)))

(declare-fun b!51983 () Bool)

(declare-fun res!43448 () Bool)

(assert (=> b!51983 (=> (not res!43448) (not e!34271))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!51983 (= res!43448 (validate_offset_bits!1 ((_ sign_extend 32) (size!1077 (buf!1433 thiss!1379))) ((_ sign_extend 32) (currentByte!2968 thiss!1379)) ((_ sign_extend 32) (currentBit!2963 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!51984 () Bool)

(declare-fun lt!81117 () (_ BitVec 64))

(assert (=> b!51984 (= e!34271 (not (or (bvslt i!635 to!314) (= lt!81117 (bvsub (bvadd lt!81117 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1858 BitStream!1858) Bool)

(assert (=> b!51984 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3576 0))(
  ( (Unit!3577) )
))
(declare-fun lt!81118 () Unit!3576)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1858) Unit!3576)

(assert (=> b!51984 (= lt!81118 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!51984 (= lt!81117 (bitIndex!0 (size!1077 (buf!1433 thiss!1379)) (currentByte!2968 thiss!1379) (currentBit!2963 thiss!1379)))))

(declare-fun b!51985 () Bool)

(assert (=> b!51985 (= e!34272 (array_inv!982 (buf!1433 thiss!1379)))))

(assert (= (and start!10298 res!43449) b!51983))

(assert (= (and b!51983 res!43448) b!51984))

(assert (= start!10298 b!51985))

(declare-fun m!82155 () Bool)

(assert (=> start!10298 m!82155))

(declare-fun m!82157 () Bool)

(assert (=> start!10298 m!82157))

(declare-fun m!82159 () Bool)

(assert (=> b!51983 m!82159))

(declare-fun m!82161 () Bool)

(assert (=> b!51984 m!82161))

(declare-fun m!82163 () Bool)

(assert (=> b!51984 m!82163))

(declare-fun m!82165 () Bool)

(assert (=> b!51984 m!82165))

(declare-fun m!82167 () Bool)

(assert (=> b!51985 m!82167))

(push 1)

(assert (not b!51985))

(assert (not b!51984))

(assert (not start!10298))

(assert (not b!51983))

(check-sat)

(pop 1)

(push 1)

(check-sat)

