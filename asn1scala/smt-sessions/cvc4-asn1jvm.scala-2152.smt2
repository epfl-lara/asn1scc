; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54682 () Bool)

(assert start!54682)

(declare-fun b!256305 () Bool)

(declare-fun e!177593 () Bool)

(declare-datatypes ((array!13829 0))(
  ( (array!13830 (arr!7056 (Array (_ BitVec 32) (_ BitVec 8))) (size!6069 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11060 0))(
  ( (BitStream!11061 (buf!6586 array!13829) (currentByte!12065 (_ BitVec 32)) (currentBit!12060 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!11060)

(declare-fun array_inv!5810 (array!13829) Bool)

(assert (=> b!256305 (= e!177593 (array_inv!5810 (buf!6586 thiss!1005)))))

(declare-fun b!256306 () Bool)

(declare-fun res!214887 () Bool)

(declare-fun e!177589 () Bool)

(assert (=> b!256306 (=> (not res!214887) (not e!177589))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256306 (= res!214887 (validate_offset_bits!1 ((_ sign_extend 32) (size!6069 (buf!6586 thiss!1005))) ((_ sign_extend 32) (currentByte!12065 thiss!1005)) ((_ sign_extend 32) (currentBit!12060 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!256308 () Bool)

(declare-fun e!177592 () Bool)

(assert (=> b!256308 (= e!177589 (not e!177592))))

(declare-fun res!214885 () Bool)

(assert (=> b!256308 (=> res!214885 e!177592)))

(assert (=> b!256308 (= res!214885 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!11060 BitStream!11060) Bool)

(assert (=> b!256308 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!18346 0))(
  ( (Unit!18347) )
))
(declare-fun lt!397701 () Unit!18346)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11060) Unit!18346)

(assert (=> b!256308 (= lt!397701 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!256309 () Bool)

(declare-fun e!177591 () Bool)

(assert (=> b!256309 (= e!177591 true)))

(declare-datatypes ((tuple2!21934 0))(
  ( (tuple2!21935 (_1!11901 BitStream!11060) (_2!11901 BitStream!11060)) )
))
(declare-fun lt!397699 () tuple2!21934)

(declare-fun reader!0 (BitStream!11060 BitStream!11060) tuple2!21934)

(assert (=> b!256309 (= lt!397699 (reader!0 thiss!1005 thiss!1005))))

(declare-fun b!256310 () Bool)

(declare-fun res!214886 () Bool)

(assert (=> b!256310 (=> (not res!214886) (not e!177589))))

(assert (=> b!256310 (= res!214886 (bvsge from!289 nBits!297))))

(declare-fun res!214883 () Bool)

(assert (=> start!54682 (=> (not res!214883) (not e!177589))))

(assert (=> start!54682 (= res!214883 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54682 e!177589))

(assert (=> start!54682 true))

(declare-fun inv!12 (BitStream!11060) Bool)

(assert (=> start!54682 (and (inv!12 thiss!1005) e!177593)))

(declare-fun b!256307 () Bool)

(assert (=> b!256307 (= e!177592 e!177591)))

(declare-fun res!214884 () Bool)

(assert (=> b!256307 (=> res!214884 e!177591)))

(declare-fun lt!397700 () (_ BitVec 64))

(assert (=> b!256307 (= res!214884 (not (= lt!397700 (bvadd lt!397700 (bvsub nBits!297 from!289)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256307 (= lt!397700 (bitIndex!0 (size!6069 (buf!6586 thiss!1005)) (currentByte!12065 thiss!1005) (currentBit!12060 thiss!1005)))))

(assert (= (and start!54682 res!214883) b!256306))

(assert (= (and b!256306 res!214887) b!256310))

(assert (= (and b!256310 res!214886) b!256308))

(assert (= (and b!256308 (not res!214885)) b!256307))

(assert (= (and b!256307 (not res!214884)) b!256309))

(assert (= start!54682 b!256305))

(declare-fun m!385909 () Bool)

(assert (=> b!256305 m!385909))

(declare-fun m!385911 () Bool)

(assert (=> b!256308 m!385911))

(declare-fun m!385913 () Bool)

(assert (=> b!256308 m!385913))

(declare-fun m!385915 () Bool)

(assert (=> b!256306 m!385915))

(declare-fun m!385917 () Bool)

(assert (=> start!54682 m!385917))

(declare-fun m!385919 () Bool)

(assert (=> b!256307 m!385919))

(declare-fun m!385921 () Bool)

(assert (=> b!256309 m!385921))

(push 1)

(assert (not b!256307))

(assert (not b!256309))

(assert (not b!256305))

(assert (not b!256308))

(assert (not b!256306))

(assert (not start!54682))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

