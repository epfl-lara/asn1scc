; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54680 () Bool)

(assert start!54680)

(declare-fun b!256287 () Bool)

(declare-fun res!214872 () Bool)

(declare-fun e!177576 () Bool)

(assert (=> b!256287 (=> (not res!214872) (not e!177576))))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13827 0))(
  ( (array!13828 (arr!7055 (Array (_ BitVec 32) (_ BitVec 8))) (size!6068 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11058 0))(
  ( (BitStream!11059 (buf!6585 array!13827) (currentByte!12064 (_ BitVec 32)) (currentBit!12059 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!11058)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256287 (= res!214872 (validate_offset_bits!1 ((_ sign_extend 32) (size!6068 (buf!6585 thiss!1005))) ((_ sign_extend 32) (currentByte!12064 thiss!1005)) ((_ sign_extend 32) (currentBit!12059 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!256288 () Bool)

(declare-fun e!177577 () Bool)

(declare-fun e!177574 () Bool)

(assert (=> b!256288 (= e!177577 e!177574)))

(declare-fun res!214871 () Bool)

(assert (=> b!256288 (=> res!214871 e!177574)))

(declare-fun lt!397690 () (_ BitVec 64))

(assert (=> b!256288 (= res!214871 (not (= lt!397690 (bvadd lt!397690 (bvsub nBits!297 from!289)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256288 (= lt!397690 (bitIndex!0 (size!6068 (buf!6585 thiss!1005)) (currentByte!12064 thiss!1005) (currentBit!12059 thiss!1005)))))

(declare-fun res!214869 () Bool)

(assert (=> start!54680 (=> (not res!214869) (not e!177576))))

(assert (=> start!54680 (= res!214869 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54680 e!177576))

(assert (=> start!54680 true))

(declare-fun e!177575 () Bool)

(declare-fun inv!12 (BitStream!11058) Bool)

(assert (=> start!54680 (and (inv!12 thiss!1005) e!177575)))

(declare-fun b!256289 () Bool)

(assert (=> b!256289 (= e!177574 true)))

(declare-datatypes ((tuple2!21932 0))(
  ( (tuple2!21933 (_1!11900 BitStream!11058) (_2!11900 BitStream!11058)) )
))
(declare-fun lt!397691 () tuple2!21932)

(declare-fun reader!0 (BitStream!11058 BitStream!11058) tuple2!21932)

(assert (=> b!256289 (= lt!397691 (reader!0 thiss!1005 thiss!1005))))

(declare-fun b!256290 () Bool)

(assert (=> b!256290 (= e!177576 (not e!177577))))

(declare-fun res!214868 () Bool)

(assert (=> b!256290 (=> res!214868 e!177577)))

(assert (=> b!256290 (= res!214868 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!11058 BitStream!11058) Bool)

(assert (=> b!256290 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!18344 0))(
  ( (Unit!18345) )
))
(declare-fun lt!397692 () Unit!18344)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11058) Unit!18344)

(assert (=> b!256290 (= lt!397692 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!256291 () Bool)

(declare-fun res!214870 () Bool)

(assert (=> b!256291 (=> (not res!214870) (not e!177576))))

(assert (=> b!256291 (= res!214870 (bvsge from!289 nBits!297))))

(declare-fun b!256292 () Bool)

(declare-fun array_inv!5809 (array!13827) Bool)

(assert (=> b!256292 (= e!177575 (array_inv!5809 (buf!6585 thiss!1005)))))

(assert (= (and start!54680 res!214869) b!256287))

(assert (= (and b!256287 res!214872) b!256291))

(assert (= (and b!256291 res!214870) b!256290))

(assert (= (and b!256290 (not res!214868)) b!256288))

(assert (= (and b!256288 (not res!214871)) b!256289))

(assert (= start!54680 b!256292))

(declare-fun m!385895 () Bool)

(assert (=> b!256287 m!385895))

(declare-fun m!385897 () Bool)

(assert (=> b!256288 m!385897))

(declare-fun m!385899 () Bool)

(assert (=> start!54680 m!385899))

(declare-fun m!385901 () Bool)

(assert (=> b!256292 m!385901))

(declare-fun m!385903 () Bool)

(assert (=> b!256290 m!385903))

(declare-fun m!385905 () Bool)

(assert (=> b!256290 m!385905))

(declare-fun m!385907 () Bool)

(assert (=> b!256289 m!385907))

(check-sat (not b!256289) (not b!256288) (not b!256287) (not b!256292) (not b!256290) (not start!54680))
