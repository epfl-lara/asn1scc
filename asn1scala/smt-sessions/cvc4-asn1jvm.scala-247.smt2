; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4844 () Bool)

(assert start!4844)

(declare-fun b!19145 () Bool)

(declare-fun res!16737 () Bool)

(declare-fun e!12606 () Bool)

(assert (=> b!19145 (=> (not res!16737) (not e!12606))))

(declare-datatypes ((array!1368 0))(
  ( (array!1369 (arr!1020 (Array (_ BitVec 32) (_ BitVec 8))) (size!579 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!992 0))(
  ( (BitStream!993 (buf!879 array!1368) (currentByte!2159 (_ BitVec 32)) (currentBit!2154 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!992)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19145 (= res!16737 (validate_offset_bits!1 ((_ sign_extend 32) (size!579 (buf!879 thiss!1379))) ((_ sign_extend 32) (currentByte!2159 thiss!1379)) ((_ sign_extend 32) (currentBit!2154 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!19146 () Bool)

(declare-fun e!12602 () Bool)

(assert (=> b!19146 (= e!12606 (not e!12602))))

(declare-fun res!16738 () Bool)

(assert (=> b!19146 (=> res!16738 e!12602)))

(assert (=> b!19146 (= res!16738 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!992 BitStream!992) Bool)

(assert (=> b!19146 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1702 0))(
  ( (Unit!1703) )
))
(declare-fun lt!27207 () Unit!1702)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!992) Unit!1702)

(assert (=> b!19146 (= lt!27207 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27211 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19146 (= lt!27211 (bitIndex!0 (size!579 (buf!879 thiss!1379)) (currentByte!2159 thiss!1379) (currentBit!2154 thiss!1379)))))

(declare-fun b!19147 () Bool)

(assert (=> b!19147 (= e!12602 true)))

(declare-fun lt!27209 () Bool)

(declare-datatypes ((tuple2!2166 0))(
  ( (tuple2!2167 (_1!1168 Unit!1702) (_2!1168 BitStream!992)) )
))
(declare-fun lt!27208 () tuple2!2166)

(assert (=> b!19147 (= lt!27209 (isPrefixOf!0 thiss!1379 (_2!1168 lt!27208)))))

(assert (=> b!19147 (validate_offset_bits!1 ((_ sign_extend 32) (size!579 (buf!879 (_2!1168 lt!27208)))) ((_ sign_extend 32) (currentByte!2159 (_2!1168 lt!27208))) ((_ sign_extend 32) (currentBit!2154 (_2!1168 lt!27208))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!27210 () Unit!1702)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!992 BitStream!992 (_ BitVec 64) (_ BitVec 64)) Unit!1702)

(assert (=> b!19147 (= lt!27210 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1168 lt!27208) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1368)

(declare-fun appendBitFromByte!0 (BitStream!992 (_ BitVec 8) (_ BitVec 32)) tuple2!2166)

(assert (=> b!19147 (= lt!27208 (appendBitFromByte!0 thiss!1379 (select (arr!1020 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19148 () Bool)

(declare-fun e!12605 () Bool)

(declare-fun array_inv!549 (array!1368) Bool)

(assert (=> b!19148 (= e!12605 (array_inv!549 (buf!879 thiss!1379)))))

(declare-fun res!16739 () Bool)

(assert (=> start!4844 (=> (not res!16739) (not e!12606))))

(assert (=> start!4844 (= res!16739 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!579 srcBuffer!2))))))))

(assert (=> start!4844 e!12606))

(assert (=> start!4844 true))

(assert (=> start!4844 (array_inv!549 srcBuffer!2)))

(declare-fun inv!12 (BitStream!992) Bool)

(assert (=> start!4844 (and (inv!12 thiss!1379) e!12605)))

(assert (= (and start!4844 res!16739) b!19145))

(assert (= (and b!19145 res!16737) b!19146))

(assert (= (and b!19146 (not res!16738)) b!19147))

(assert (= start!4844 b!19148))

(declare-fun m!25683 () Bool)

(assert (=> b!19147 m!25683))

(declare-fun m!25685 () Bool)

(assert (=> b!19147 m!25685))

(assert (=> b!19147 m!25683))

(declare-fun m!25687 () Bool)

(assert (=> b!19147 m!25687))

(declare-fun m!25689 () Bool)

(assert (=> b!19147 m!25689))

(declare-fun m!25691 () Bool)

(assert (=> b!19147 m!25691))

(declare-fun m!25693 () Bool)

(assert (=> b!19148 m!25693))

(declare-fun m!25695 () Bool)

(assert (=> start!4844 m!25695))

(declare-fun m!25697 () Bool)

(assert (=> start!4844 m!25697))

(declare-fun m!25699 () Bool)

(assert (=> b!19146 m!25699))

(declare-fun m!25701 () Bool)

(assert (=> b!19146 m!25701))

(declare-fun m!25703 () Bool)

(assert (=> b!19146 m!25703))

(declare-fun m!25705 () Bool)

(assert (=> b!19145 m!25705))

(push 1)

(assert (not b!19146))

(assert (not start!4844))

(assert (not b!19145))

(assert (not b!19147))

(assert (not b!19148))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

