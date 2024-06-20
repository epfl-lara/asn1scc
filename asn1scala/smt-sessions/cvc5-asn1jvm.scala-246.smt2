; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4834 () Bool)

(assert start!4834)

(declare-fun b!19078 () Bool)

(declare-fun e!12520 () Bool)

(declare-datatypes ((array!1358 0))(
  ( (array!1359 (arr!1015 (Array (_ BitVec 32) (_ BitVec 8))) (size!574 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!982 0))(
  ( (BitStream!983 (buf!874 array!1358) (currentByte!2154 (_ BitVec 32)) (currentBit!2149 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!982)

(declare-fun array_inv!544 (array!1358) Bool)

(assert (=> b!19078 (= e!12520 (array_inv!544 (buf!874 thiss!1379)))))

(declare-fun res!16685 () Bool)

(declare-fun e!12523 () Bool)

(assert (=> start!4834 (=> (not res!16685) (not e!12523))))

(declare-fun srcBuffer!2 () array!1358)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!4834 (= res!16685 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!574 srcBuffer!2))))))))

(assert (=> start!4834 e!12523))

(assert (=> start!4834 true))

(assert (=> start!4834 (array_inv!544 srcBuffer!2)))

(declare-fun inv!12 (BitStream!982) Bool)

(assert (=> start!4834 (and (inv!12 thiss!1379) e!12520)))

(declare-fun b!19079 () Bool)

(declare-fun e!12525 () Bool)

(assert (=> b!19079 (= e!12523 (not e!12525))))

(declare-fun res!16687 () Bool)

(assert (=> b!19079 (=> res!16687 e!12525)))

(assert (=> b!19079 (= res!16687 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!982 BitStream!982) Bool)

(assert (=> b!19079 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1692 0))(
  ( (Unit!1693) )
))
(declare-fun lt!27141 () Unit!1692)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!982) Unit!1692)

(assert (=> b!19079 (= lt!27141 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27142 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19079 (= lt!27142 (bitIndex!0 (size!574 (buf!874 thiss!1379)) (currentByte!2154 thiss!1379) (currentBit!2149 thiss!1379)))))

(declare-fun b!19080 () Bool)

(declare-fun res!16686 () Bool)

(assert (=> b!19080 (=> (not res!16686) (not e!12523))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19080 (= res!16686 (validate_offset_bits!1 ((_ sign_extend 32) (size!574 (buf!874 thiss!1379))) ((_ sign_extend 32) (currentByte!2154 thiss!1379)) ((_ sign_extend 32) (currentBit!2149 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!19081 () Bool)

(declare-fun e!12522 () Bool)

(assert (=> b!19081 (= e!12525 e!12522)))

(declare-fun res!16688 () Bool)

(assert (=> b!19081 (=> res!16688 e!12522)))

(declare-datatypes ((tuple2!2156 0))(
  ( (tuple2!2157 (_1!1163 Unit!1692) (_2!1163 BitStream!982)) )
))
(declare-fun lt!27139 () tuple2!2156)

(assert (=> b!19081 (= res!16688 (not (= (size!574 (buf!874 thiss!1379)) (size!574 (buf!874 (_2!1163 lt!27139))))))))

(declare-fun appendBitFromByte!0 (BitStream!982 (_ BitVec 8) (_ BitVec 32)) tuple2!2156)

(assert (=> b!19081 (= lt!27139 (appendBitFromByte!0 thiss!1379 (select (arr!1015 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19082 () Bool)

(assert (=> b!19082 (= e!12522 true)))

(declare-fun lt!27140 () (_ BitVec 64))

(assert (=> b!19082 (= lt!27140 (bitIndex!0 (size!574 (buf!874 (_2!1163 lt!27139))) (currentByte!2154 (_2!1163 lt!27139)) (currentBit!2149 (_2!1163 lt!27139))))))

(assert (= (and start!4834 res!16685) b!19080))

(assert (= (and b!19080 res!16686) b!19079))

(assert (= (and b!19079 (not res!16687)) b!19081))

(assert (= (and b!19081 (not res!16688)) b!19082))

(assert (= start!4834 b!19078))

(declare-fun m!25575 () Bool)

(assert (=> b!19080 m!25575))

(declare-fun m!25577 () Bool)

(assert (=> b!19079 m!25577))

(declare-fun m!25579 () Bool)

(assert (=> b!19079 m!25579))

(declare-fun m!25581 () Bool)

(assert (=> b!19079 m!25581))

(declare-fun m!25583 () Bool)

(assert (=> b!19078 m!25583))

(declare-fun m!25585 () Bool)

(assert (=> start!4834 m!25585))

(declare-fun m!25587 () Bool)

(assert (=> start!4834 m!25587))

(declare-fun m!25589 () Bool)

(assert (=> b!19081 m!25589))

(assert (=> b!19081 m!25589))

(declare-fun m!25591 () Bool)

(assert (=> b!19081 m!25591))

(declare-fun m!25593 () Bool)

(assert (=> b!19082 m!25593))

(push 1)

(assert (not b!19081))

(assert (not b!19079))

(assert (not b!19082))

(assert (not b!19078))

(assert (not b!19080))

(assert (not start!4834))

(check-sat)

(pop 1)

