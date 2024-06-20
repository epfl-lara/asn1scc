; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54688 () Bool)

(assert start!54688)

(declare-fun b!256359 () Bool)

(declare-fun e!177636 () Bool)

(declare-fun e!177638 () Bool)

(assert (=> b!256359 (= e!177636 (not e!177638))))

(declare-fun res!214932 () Bool)

(assert (=> b!256359 (=> res!214932 e!177638)))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!256359 (= res!214932 (not (= nBits!297 from!289)))))

(declare-datatypes ((array!13835 0))(
  ( (array!13836 (arr!7059 (Array (_ BitVec 32) (_ BitVec 8))) (size!6072 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11066 0))(
  ( (BitStream!11067 (buf!6589 array!13835) (currentByte!12068 (_ BitVec 32)) (currentBit!12063 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!11066)

(declare-fun isPrefixOf!0 (BitStream!11066 BitStream!11066) Bool)

(assert (=> b!256359 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!18352 0))(
  ( (Unit!18353) )
))
(declare-fun lt!397728 () Unit!18352)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11066) Unit!18352)

(assert (=> b!256359 (= lt!397728 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun res!214930 () Bool)

(assert (=> start!54688 (=> (not res!214930) (not e!177636))))

(assert (=> start!54688 (= res!214930 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54688 e!177636))

(assert (=> start!54688 true))

(declare-fun e!177634 () Bool)

(declare-fun inv!12 (BitStream!11066) Bool)

(assert (=> start!54688 (and (inv!12 thiss!1005) e!177634)))

(declare-fun b!256360 () Bool)

(declare-fun res!214928 () Bool)

(assert (=> b!256360 (=> (not res!214928) (not e!177636))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256360 (= res!214928 (validate_offset_bits!1 ((_ sign_extend 32) (size!6072 (buf!6589 thiss!1005))) ((_ sign_extend 32) (currentByte!12068 thiss!1005)) ((_ sign_extend 32) (currentBit!12063 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!256361 () Bool)

(declare-fun e!177635 () Bool)

(assert (=> b!256361 (= e!177635 true)))

(declare-datatypes ((tuple2!21940 0))(
  ( (tuple2!21941 (_1!11904 BitStream!11066) (_2!11904 BitStream!11066)) )
))
(declare-fun lt!397726 () tuple2!21940)

(declare-fun reader!0 (BitStream!11066 BitStream!11066) tuple2!21940)

(assert (=> b!256361 (= lt!397726 (reader!0 thiss!1005 thiss!1005))))

(declare-fun b!256362 () Bool)

(declare-fun array_inv!5813 (array!13835) Bool)

(assert (=> b!256362 (= e!177634 (array_inv!5813 (buf!6589 thiss!1005)))))

(declare-fun b!256363 () Bool)

(assert (=> b!256363 (= e!177638 e!177635)))

(declare-fun res!214929 () Bool)

(assert (=> b!256363 (=> res!214929 e!177635)))

(declare-fun lt!397727 () (_ BitVec 64))

(assert (=> b!256363 (= res!214929 (not (= lt!397727 (bvadd lt!397727 (bvsub nBits!297 from!289)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256363 (= lt!397727 (bitIndex!0 (size!6072 (buf!6589 thiss!1005)) (currentByte!12068 thiss!1005) (currentBit!12063 thiss!1005)))))

(declare-fun b!256364 () Bool)

(declare-fun res!214931 () Bool)

(assert (=> b!256364 (=> (not res!214931) (not e!177636))))

(assert (=> b!256364 (= res!214931 (bvsge from!289 nBits!297))))

(assert (= (and start!54688 res!214930) b!256360))

(assert (= (and b!256360 res!214928) b!256364))

(assert (= (and b!256364 res!214931) b!256359))

(assert (= (and b!256359 (not res!214932)) b!256363))

(assert (= (and b!256363 (not res!214929)) b!256361))

(assert (= start!54688 b!256362))

(declare-fun m!385951 () Bool)

(assert (=> b!256363 m!385951))

(declare-fun m!385953 () Bool)

(assert (=> start!54688 m!385953))

(declare-fun m!385955 () Bool)

(assert (=> b!256359 m!385955))

(declare-fun m!385957 () Bool)

(assert (=> b!256359 m!385957))

(declare-fun m!385959 () Bool)

(assert (=> b!256361 m!385959))

(declare-fun m!385961 () Bool)

(assert (=> b!256362 m!385961))

(declare-fun m!385963 () Bool)

(assert (=> b!256360 m!385963))

(push 1)

(assert (not b!256363))

(assert (not b!256361))

(assert (not b!256362))

