; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27006 () Bool)

(assert start!27006)

(declare-fun b!139088 () Bool)

(declare-fun res!115948 () Bool)

(declare-fun e!92605 () Bool)

(assert (=> b!139088 (=> (not res!115948) (not e!92605))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!139088 (= res!115948 (bvsge from!447 to!404))))

(declare-fun b!139089 () Bool)

(declare-fun e!92604 () Bool)

(assert (=> b!139089 (= e!92604 true)))

(declare-datatypes ((array!6322 0))(
  ( (array!6323 (arr!3557 (Array (_ BitVec 32) (_ BitVec 8))) (size!2862 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4988 0))(
  ( (BitStream!4989 (buf!3275 array!6322) (currentByte!6099 (_ BitVec 32)) (currentBit!6094 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4988)

(declare-fun lt!216825 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!139089 (validate_offset_bits!1 ((_ sign_extend 32) (size!2862 (buf!3275 thiss!1634))) ((_ sign_extend 32) (currentByte!6099 thiss!1634)) ((_ sign_extend 32) (currentBit!6094 thiss!1634)) lt!216825)))

(declare-datatypes ((Unit!8680 0))(
  ( (Unit!8681) )
))
(declare-fun lt!216824 () Unit!8680)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4988 array!6322 (_ BitVec 64)) Unit!8680)

(assert (=> b!139089 (= lt!216824 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3275 thiss!1634) lt!216825))))

(declare-datatypes ((tuple2!12174 0))(
  ( (tuple2!12175 (_1!6413 BitStream!4988) (_2!6413 BitStream!4988)) )
))
(declare-fun lt!216828 () tuple2!12174)

(declare-fun reader!0 (BitStream!4988 BitStream!4988) tuple2!12174)

(assert (=> b!139089 (= lt!216828 (reader!0 thiss!1634 thiss!1634))))

(declare-fun b!139090 () Bool)

(declare-fun e!92606 () Bool)

(declare-fun array_inv!2651 (array!6322) Bool)

(assert (=> b!139090 (= e!92606 (array_inv!2651 (buf!3275 thiss!1634)))))

(declare-fun b!139091 () Bool)

(declare-fun res!115950 () Bool)

(assert (=> b!139091 (=> (not res!115950) (not e!92605))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139091 (= res!115950 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2862 (buf!3275 thiss!1634))) ((_ sign_extend 32) (currentByte!6099 thiss!1634)) ((_ sign_extend 32) (currentBit!6094 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!115949 () Bool)

(assert (=> start!27006 (=> (not res!115949) (not e!92605))))

(declare-fun arr!237 () array!6322)

(assert (=> start!27006 (= res!115949 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2862 arr!237))))))

(assert (=> start!27006 e!92605))

(assert (=> start!27006 true))

(assert (=> start!27006 (array_inv!2651 arr!237)))

(declare-fun inv!12 (BitStream!4988) Bool)

(assert (=> start!27006 (and (inv!12 thiss!1634) e!92606)))

(declare-fun b!139092 () Bool)

(assert (=> b!139092 (= e!92605 (not e!92604))))

(declare-fun res!115947 () Bool)

(assert (=> b!139092 (=> res!115947 e!92604)))

(declare-fun lt!216826 () (_ BitVec 64))

(assert (=> b!139092 (= res!115947 (not (= lt!216826 (bvadd lt!216826 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!216825)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!139092 (= lt!216826 (bitIndex!0 (size!2862 (buf!3275 thiss!1634)) (currentByte!6099 thiss!1634) (currentBit!6094 thiss!1634)))))

(assert (=> b!139092 (= lt!216825 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun isPrefixOf!0 (BitStream!4988 BitStream!4988) Bool)

(assert (=> b!139092 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!216827 () Unit!8680)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4988) Unit!8680)

(assert (=> b!139092 (= lt!216827 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (= (and start!27006 res!115949) b!139091))

(assert (= (and b!139091 res!115950) b!139088))

(assert (= (and b!139088 res!115948) b!139092))

(assert (= (and b!139092 (not res!115947)) b!139089))

(assert (= start!27006 b!139090))

(declare-fun m!214025 () Bool)

(assert (=> b!139091 m!214025))

(declare-fun m!214027 () Bool)

(assert (=> b!139089 m!214027))

(declare-fun m!214029 () Bool)

(assert (=> b!139089 m!214029))

(declare-fun m!214031 () Bool)

(assert (=> b!139089 m!214031))

(declare-fun m!214033 () Bool)

(assert (=> b!139090 m!214033))

(declare-fun m!214035 () Bool)

(assert (=> b!139092 m!214035))

(declare-fun m!214037 () Bool)

(assert (=> b!139092 m!214037))

(declare-fun m!214039 () Bool)

(assert (=> b!139092 m!214039))

(declare-fun m!214041 () Bool)

(assert (=> start!27006 m!214041))

(declare-fun m!214043 () Bool)

(assert (=> start!27006 m!214043))

(push 1)

(assert (not b!139089))

(assert (not b!139092))

(assert (not b!139090))

(assert (not b!139091))

(assert (not start!27006))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

