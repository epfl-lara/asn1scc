; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10456 () Bool)

(assert start!10456)

(declare-fun b!52534 () Bool)

(declare-fun e!34961 () Bool)

(declare-datatypes ((array!2477 0))(
  ( (array!2478 (arr!1669 (Array (_ BitVec 32) (_ BitVec 8))) (size!1133 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1958 0))(
  ( (BitStream!1959 (buf!1483 array!2477) (currentByte!3026 (_ BitVec 32)) (currentBit!3021 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1958)

(declare-fun array_inv!1038 (array!2477) Bool)

(assert (=> b!52534 (= e!34961 (array_inv!1038 (buf!1483 thiss!1379)))))

(declare-fun b!52532 () Bool)

(declare-fun e!34964 () Bool)

(declare-fun e!34963 () Bool)

(assert (=> b!52532 (= e!34964 (not e!34963))))

(declare-fun res!43846 () Bool)

(assert (=> b!52532 (=> res!43846 e!34963)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!52532 (= res!43846 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1958 BitStream!1958) Bool)

(assert (=> b!52532 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3670 0))(
  ( (Unit!3671) )
))
(declare-fun lt!81490 () Unit!3670)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1958) Unit!3670)

(assert (=> b!52532 (= lt!81490 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81489 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52532 (= lt!81489 (bitIndex!0 (size!1133 (buf!1483 thiss!1379)) (currentByte!3026 thiss!1379) (currentBit!3021 thiss!1379)))))

(declare-fun srcBuffer!2 () array!2477)

(declare-fun b!52533 () Bool)

(declare-datatypes ((tuple2!4776 0))(
  ( (tuple2!4777 (_1!2493 Unit!3670) (_2!2493 BitStream!1958)) )
))
(declare-fun appendBitFromByte!0 (BitStream!1958 (_ BitVec 8) (_ BitVec 32)) tuple2!4776)

(assert (=> b!52533 (= e!34963 (= (size!1133 (buf!1483 thiss!1379)) (size!1133 (buf!1483 (_2!2493 (appendBitFromByte!0 thiss!1379 (select (arr!1669 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))))))

(declare-fun b!52531 () Bool)

(declare-fun res!43847 () Bool)

(assert (=> b!52531 (=> (not res!43847) (not e!34964))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52531 (= res!43847 (validate_offset_bits!1 ((_ sign_extend 32) (size!1133 (buf!1483 thiss!1379))) ((_ sign_extend 32) (currentByte!3026 thiss!1379)) ((_ sign_extend 32) (currentBit!3021 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!43848 () Bool)

(assert (=> start!10456 (=> (not res!43848) (not e!34964))))

(assert (=> start!10456 (= res!43848 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1133 srcBuffer!2))))))))

(assert (=> start!10456 e!34964))

(assert (=> start!10456 true))

(assert (=> start!10456 (array_inv!1038 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1958) Bool)

(assert (=> start!10456 (and (inv!12 thiss!1379) e!34961)))

(assert (= (and start!10456 res!43848) b!52531))

(assert (= (and b!52531 res!43847) b!52532))

(assert (= (and b!52532 (not res!43846)) b!52533))

(assert (= start!10456 b!52534))

(declare-fun m!82921 () Bool)

(assert (=> b!52533 m!82921))

(assert (=> b!52533 m!82921))

(declare-fun m!82923 () Bool)

(assert (=> b!52533 m!82923))

(declare-fun m!82925 () Bool)

(assert (=> start!10456 m!82925))

(declare-fun m!82927 () Bool)

(assert (=> start!10456 m!82927))

(declare-fun m!82929 () Bool)

(assert (=> b!52532 m!82929))

(declare-fun m!82931 () Bool)

(assert (=> b!52532 m!82931))

(declare-fun m!82933 () Bool)

(assert (=> b!52532 m!82933))

(declare-fun m!82935 () Bool)

(assert (=> b!52531 m!82935))

(declare-fun m!82937 () Bool)

(assert (=> b!52534 m!82937))

(push 1)

(assert (not b!52534))

(assert (not b!52531))

(assert (not start!10456))

(assert (not b!52532))

(assert (not b!52533))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!16650 () Bool)

(declare-fun res!43870 () Bool)

(declare-fun e!34978 () Bool)

(assert (=> d!16650 (=> (not res!43870) (not e!34978))))

