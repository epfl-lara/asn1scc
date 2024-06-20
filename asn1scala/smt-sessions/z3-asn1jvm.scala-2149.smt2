; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54662 () Bool)

(assert start!54662)

(declare-fun b!256129 () Bool)

(declare-fun e!177444 () Bool)

(declare-datatypes ((array!13809 0))(
  ( (array!13810 (arr!7046 (Array (_ BitVec 32) (_ BitVec 8))) (size!6059 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11040 0))(
  ( (BitStream!11041 (buf!6576 array!13809) (currentByte!12055 (_ BitVec 32)) (currentBit!12050 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!11040)

(declare-fun array_inv!5800 (array!13809) Bool)

(assert (=> b!256129 (= e!177444 (array_inv!5800 (buf!6576 thiss!1005)))))

(declare-fun b!256130 () Bool)

(declare-fun res!214740 () Bool)

(declare-fun e!177445 () Bool)

(assert (=> b!256130 (=> (not res!214740) (not e!177445))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256130 (= res!214740 (validate_offset_bits!1 ((_ sign_extend 32) (size!6059 (buf!6576 thiss!1005))) ((_ sign_extend 32) (currentByte!12055 thiss!1005)) ((_ sign_extend 32) (currentBit!12050 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun lt!397610 () (_ BitVec 64))

(declare-fun lt!397611 () (_ BitVec 64))

(declare-fun b!256131 () Bool)

(declare-fun e!177443 () Bool)

(assert (=> b!256131 (= e!177443 (or (not (= lt!397611 (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!397611 (bvand (bvadd lt!397610 (bvsub nBits!297 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!256131 (= lt!397611 (bvand lt!397610 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256131 (= lt!397610 (bitIndex!0 (size!6059 (buf!6576 thiss!1005)) (currentByte!12055 thiss!1005) (currentBit!12050 thiss!1005)))))

(declare-fun b!256132 () Bool)

(declare-fun res!214738 () Bool)

(assert (=> b!256132 (=> (not res!214738) (not e!177445))))

(assert (=> b!256132 (= res!214738 (bvsge from!289 nBits!297))))

(declare-fun res!214739 () Bool)

(assert (=> start!54662 (=> (not res!214739) (not e!177445))))

(assert (=> start!54662 (= res!214739 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54662 e!177445))

(assert (=> start!54662 true))

(declare-fun inv!12 (BitStream!11040) Bool)

(assert (=> start!54662 (and (inv!12 thiss!1005) e!177444)))

(declare-fun b!256133 () Bool)

(assert (=> b!256133 (= e!177445 (not e!177443))))

(declare-fun res!214737 () Bool)

(assert (=> b!256133 (=> res!214737 e!177443)))

(assert (=> b!256133 (= res!214737 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!11040 BitStream!11040) Bool)

(assert (=> b!256133 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!18326 0))(
  ( (Unit!18327) )
))
(declare-fun lt!397609 () Unit!18326)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11040) Unit!18326)

(assert (=> b!256133 (= lt!397609 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (= (and start!54662 res!214739) b!256130))

(assert (= (and b!256130 res!214740) b!256132))

(assert (= (and b!256132 res!214738) b!256133))

(assert (= (and b!256133 (not res!214737)) b!256131))

(assert (= start!54662 b!256129))

(declare-fun m!385773 () Bool)

(assert (=> b!256133 m!385773))

(declare-fun m!385775 () Bool)

(assert (=> b!256133 m!385775))

(declare-fun m!385777 () Bool)

(assert (=> start!54662 m!385777))

(declare-fun m!385779 () Bool)

(assert (=> b!256130 m!385779))

(declare-fun m!385781 () Bool)

(assert (=> b!256131 m!385781))

(declare-fun m!385783 () Bool)

(assert (=> b!256129 m!385783))

(check-sat (not b!256129) (not b!256131) (not start!54662) (not b!256130) (not b!256133))
