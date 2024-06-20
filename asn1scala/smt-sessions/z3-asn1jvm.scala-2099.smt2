; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53318 () Bool)

(assert start!53318)

(declare-fun b!247426 () Bool)

(declare-fun e!171394 () Bool)

(assert (=> b!247426 (= e!171394 true)))

(declare-fun lt!385845 () (_ BitVec 64))

(declare-datatypes ((array!13488 0))(
  ( (array!13489 (arr!6899 (Array (_ BitVec 32) (_ BitVec 8))) (size!5912 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10746 0))(
  ( (BitStream!10747 (buf!6396 array!13488) (currentByte!11809 (_ BitVec 32)) (currentBit!11804 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10746)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247426 (= lt!385845 (bitIndex!0 (size!5912 (buf!6396 thiss!1005)) (currentByte!11809 thiss!1005) (currentBit!11804 thiss!1005)))))

(declare-fun b!247428 () Bool)

(declare-fun e!171392 () Bool)

(declare-fun array_inv!5653 (array!13488) Bool)

(assert (=> b!247428 (= e!171392 (array_inv!5653 (buf!6396 thiss!1005)))))

(declare-fun res!207063 () Bool)

(declare-fun e!171393 () Bool)

(assert (=> start!53318 (=> (not res!207063) (not e!171393))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53318 (= res!207063 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53318 e!171393))

(assert (=> start!53318 true))

(declare-fun inv!12 (BitStream!10746) Bool)

(assert (=> start!53318 (and (inv!12 thiss!1005) e!171392)))

(declare-fun b!247427 () Bool)

(assert (=> b!247427 (= e!171393 (not e!171394))))

(declare-fun res!207066 () Bool)

(assert (=> b!247427 (=> res!207066 e!171394)))

(assert (=> b!247427 (= res!207066 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!10746 BitStream!10746) Bool)

(assert (=> b!247427 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!17942 0))(
  ( (Unit!17943) )
))
(declare-fun lt!385844 () Unit!17942)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10746) Unit!17942)

(assert (=> b!247427 (= lt!385844 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!247429 () Bool)

(declare-fun res!207065 () Bool)

(assert (=> b!247429 (=> (not res!207065) (not e!171393))))

(assert (=> b!247429 (= res!207065 (bvsge from!289 nBits!297))))

(declare-fun b!247430 () Bool)

(declare-fun res!207064 () Bool)

(assert (=> b!247430 (=> (not res!207064) (not e!171393))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247430 (= res!207064 (validate_offset_bits!1 ((_ sign_extend 32) (size!5912 (buf!6396 thiss!1005))) ((_ sign_extend 32) (currentByte!11809 thiss!1005)) ((_ sign_extend 32) (currentBit!11804 thiss!1005)) (bvsub nBits!297 from!289)))))

(assert (= (and start!53318 res!207063) b!247430))

(assert (= (and b!247430 res!207064) b!247429))

(assert (= (and b!247429 res!207065) b!247427))

(assert (= (and b!247427 (not res!207066)) b!247426))

(assert (= start!53318 b!247428))

(declare-fun m!373143 () Bool)

(assert (=> b!247430 m!373143))

(declare-fun m!373145 () Bool)

(assert (=> b!247428 m!373145))

(declare-fun m!373147 () Bool)

(assert (=> start!53318 m!373147))

(declare-fun m!373149 () Bool)

(assert (=> b!247427 m!373149))

(declare-fun m!373151 () Bool)

(assert (=> b!247427 m!373151))

(declare-fun m!373153 () Bool)

(assert (=> b!247426 m!373153))

(check-sat (not start!53318) (not b!247430) (not b!247426) (not b!247427) (not b!247428))
