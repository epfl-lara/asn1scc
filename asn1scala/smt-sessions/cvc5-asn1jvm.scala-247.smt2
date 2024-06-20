; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4840 () Bool)

(assert start!4840)

(declare-fun b!19121 () Bool)

(declare-fun res!16720 () Bool)

(declare-fun e!12575 () Bool)

(assert (=> b!19121 (=> (not res!16720) (not e!12575))))

(declare-datatypes ((array!1364 0))(
  ( (array!1365 (arr!1018 (Array (_ BitVec 32) (_ BitVec 8))) (size!577 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!988 0))(
  ( (BitStream!989 (buf!877 array!1364) (currentByte!2157 (_ BitVec 32)) (currentBit!2152 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!988)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19121 (= res!16720 (validate_offset_bits!1 ((_ sign_extend 32) (size!577 (buf!877 thiss!1379))) ((_ sign_extend 32) (currentByte!2157 thiss!1379)) ((_ sign_extend 32) (currentBit!2152 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!19123 () Bool)

(declare-fun e!12576 () Bool)

(assert (=> b!19123 (= e!12576 true)))

(declare-fun lt!27181 () Bool)

(declare-datatypes ((Unit!1698 0))(
  ( (Unit!1699) )
))
(declare-datatypes ((tuple2!2162 0))(
  ( (tuple2!2163 (_1!1166 Unit!1698) (_2!1166 BitStream!988)) )
))
(declare-fun lt!27179 () tuple2!2162)

(declare-fun isPrefixOf!0 (BitStream!988 BitStream!988) Bool)

(assert (=> b!19123 (= lt!27181 (isPrefixOf!0 thiss!1379 (_2!1166 lt!27179)))))

(assert (=> b!19123 (validate_offset_bits!1 ((_ sign_extend 32) (size!577 (buf!877 (_2!1166 lt!27179)))) ((_ sign_extend 32) (currentByte!2157 (_2!1166 lt!27179))) ((_ sign_extend 32) (currentBit!2152 (_2!1166 lt!27179))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!27180 () Unit!1698)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!988 BitStream!988 (_ BitVec 64) (_ BitVec 64)) Unit!1698)

(assert (=> b!19123 (= lt!27180 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1166 lt!27179) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1364)

(declare-fun appendBitFromByte!0 (BitStream!988 (_ BitVec 8) (_ BitVec 32)) tuple2!2162)

(assert (=> b!19123 (= lt!27179 (appendBitFromByte!0 thiss!1379 (select (arr!1018 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!16719 () Bool)

(assert (=> start!4840 (=> (not res!16719) (not e!12575))))

(assert (=> start!4840 (= res!16719 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!577 srcBuffer!2))))))))

(assert (=> start!4840 e!12575))

(assert (=> start!4840 true))

(declare-fun array_inv!547 (array!1364) Bool)

(assert (=> start!4840 (array_inv!547 srcBuffer!2)))

(declare-fun e!12574 () Bool)

(declare-fun inv!12 (BitStream!988) Bool)

(assert (=> start!4840 (and (inv!12 thiss!1379) e!12574)))

(declare-fun b!19122 () Bool)

(assert (=> b!19122 (= e!12575 (not e!12576))))

(declare-fun res!16721 () Bool)

(assert (=> b!19122 (=> res!16721 e!12576)))

(assert (=> b!19122 (= res!16721 (bvsge i!635 to!314))))

(assert (=> b!19122 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!27178 () Unit!1698)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!988) Unit!1698)

(assert (=> b!19122 (= lt!27178 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27177 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19122 (= lt!27177 (bitIndex!0 (size!577 (buf!877 thiss!1379)) (currentByte!2157 thiss!1379) (currentBit!2152 thiss!1379)))))

(declare-fun b!19124 () Bool)

(assert (=> b!19124 (= e!12574 (array_inv!547 (buf!877 thiss!1379)))))

(assert (= (and start!4840 res!16719) b!19121))

(assert (= (and b!19121 res!16720) b!19122))

(assert (= (and b!19122 (not res!16721)) b!19123))

(assert (= start!4840 b!19124))

(declare-fun m!25635 () Bool)

(assert (=> b!19124 m!25635))

(declare-fun m!25637 () Bool)

(assert (=> start!4840 m!25637))

(declare-fun m!25639 () Bool)

(assert (=> start!4840 m!25639))

(declare-fun m!25641 () Bool)

(assert (=> b!19123 m!25641))

(declare-fun m!25643 () Bool)

(assert (=> b!19123 m!25643))

(declare-fun m!25645 () Bool)

(assert (=> b!19123 m!25645))

(assert (=> b!19123 m!25641))

(declare-fun m!25647 () Bool)

(assert (=> b!19123 m!25647))

(declare-fun m!25649 () Bool)

(assert (=> b!19123 m!25649))

(declare-fun m!25651 () Bool)

(assert (=> b!19122 m!25651))

(declare-fun m!25653 () Bool)

(assert (=> b!19122 m!25653))

(declare-fun m!25655 () Bool)

(assert (=> b!19122 m!25655))

(declare-fun m!25657 () Bool)

(assert (=> b!19121 m!25657))

(push 1)

(assert (not start!4840))

(assert (not b!19123))

(assert (not b!19121))

(assert (not b!19122))

(assert (not b!19124))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

