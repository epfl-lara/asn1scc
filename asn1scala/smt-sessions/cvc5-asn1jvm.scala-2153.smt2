; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54684 () Bool)

(assert start!54684)

(declare-fun b!256323 () Bool)

(declare-fun e!177607 () Bool)

(declare-fun e!177604 () Bool)

(assert (=> b!256323 (= e!177607 (not e!177604))))

(declare-fun res!214899 () Bool)

(assert (=> b!256323 (=> res!214899 e!177604)))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!256323 (= res!214899 (not (= nBits!297 from!289)))))

(declare-datatypes ((array!13831 0))(
  ( (array!13832 (arr!7057 (Array (_ BitVec 32) (_ BitVec 8))) (size!6070 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11062 0))(
  ( (BitStream!11063 (buf!6587 array!13831) (currentByte!12066 (_ BitVec 32)) (currentBit!12061 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!11062)

(declare-fun isPrefixOf!0 (BitStream!11062 BitStream!11062) Bool)

(assert (=> b!256323 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!18348 0))(
  ( (Unit!18349) )
))
(declare-fun lt!397709 () Unit!18348)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11062) Unit!18348)

(assert (=> b!256323 (= lt!397709 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun res!214902 () Bool)

(assert (=> start!54684 (=> (not res!214902) (not e!177607))))

(assert (=> start!54684 (= res!214902 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54684 e!177607))

(assert (=> start!54684 true))

(declare-fun e!177606 () Bool)

(declare-fun inv!12 (BitStream!11062) Bool)

(assert (=> start!54684 (and (inv!12 thiss!1005) e!177606)))

(declare-fun b!256324 () Bool)

(declare-fun res!214898 () Bool)

(assert (=> b!256324 (=> (not res!214898) (not e!177607))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256324 (= res!214898 (validate_offset_bits!1 ((_ sign_extend 32) (size!6070 (buf!6587 thiss!1005))) ((_ sign_extend 32) (currentByte!12066 thiss!1005)) ((_ sign_extend 32) (currentBit!12061 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!256325 () Bool)

(declare-fun e!177605 () Bool)

(assert (=> b!256325 (= e!177605 true)))

(declare-datatypes ((tuple2!21936 0))(
  ( (tuple2!21937 (_1!11902 BitStream!11062) (_2!11902 BitStream!11062)) )
))
(declare-fun lt!397708 () tuple2!21936)

(declare-fun reader!0 (BitStream!11062 BitStream!11062) tuple2!21936)

(assert (=> b!256325 (= lt!397708 (reader!0 thiss!1005 thiss!1005))))

(declare-fun b!256326 () Bool)

(assert (=> b!256326 (= e!177604 e!177605)))

(declare-fun res!214900 () Bool)

(assert (=> b!256326 (=> res!214900 e!177605)))

(declare-fun lt!397710 () (_ BitVec 64))

(assert (=> b!256326 (= res!214900 (not (= lt!397710 (bvadd lt!397710 (bvsub nBits!297 from!289)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256326 (= lt!397710 (bitIndex!0 (size!6070 (buf!6587 thiss!1005)) (currentByte!12066 thiss!1005) (currentBit!12061 thiss!1005)))))

(declare-fun b!256327 () Bool)

(declare-fun array_inv!5811 (array!13831) Bool)

(assert (=> b!256327 (= e!177606 (array_inv!5811 (buf!6587 thiss!1005)))))

(declare-fun b!256328 () Bool)

(declare-fun res!214901 () Bool)

(assert (=> b!256328 (=> (not res!214901) (not e!177607))))

(assert (=> b!256328 (= res!214901 (bvsge from!289 nBits!297))))

(assert (= (and start!54684 res!214902) b!256324))

(assert (= (and b!256324 res!214898) b!256328))

(assert (= (and b!256328 res!214901) b!256323))

(assert (= (and b!256323 (not res!214899)) b!256326))

(assert (= (and b!256326 (not res!214900)) b!256325))

(assert (= start!54684 b!256327))

(declare-fun m!385923 () Bool)

(assert (=> b!256325 m!385923))

(declare-fun m!385925 () Bool)

(assert (=> b!256324 m!385925))

(declare-fun m!385927 () Bool)

(assert (=> start!54684 m!385927))

(declare-fun m!385929 () Bool)

(assert (=> b!256326 m!385929))

(declare-fun m!385931 () Bool)

(assert (=> b!256323 m!385931))

(declare-fun m!385933 () Bool)

(assert (=> b!256323 m!385933))

(declare-fun m!385935 () Bool)

(assert (=> b!256327 m!385935))

(push 1)

(assert (not start!54684))

(assert (not b!256327))

(assert (not b!256326))

(assert (not b!256325))

(assert (not b!256324))

(assert (not b!256323))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

