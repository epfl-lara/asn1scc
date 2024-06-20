; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53284 () Bool)

(assert start!53284)

(declare-fun b!247354 () Bool)

(declare-fun e!171338 () Bool)

(declare-datatypes ((array!13480 0))(
  ( (array!13481 (arr!6896 (Array (_ BitVec 32) (_ BitVec 8))) (size!5909 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10740 0))(
  ( (BitStream!10741 (buf!6393 array!13480) (currentByte!11801 (_ BitVec 32)) (currentBit!11796 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10740)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!247354 (= e!171338 (invariant!0 (currentBit!11796 thiss!1005) (currentByte!11801 thiss!1005) (size!5909 (buf!6393 thiss!1005))))))

(declare-fun b!247356 () Bool)

(declare-fun e!171341 () Bool)

(assert (=> b!247356 (= e!171341 (not e!171338))))

(declare-fun res!207002 () Bool)

(assert (=> b!247356 (=> res!207002 e!171338)))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!247356 (= res!207002 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!10740 BitStream!10740) Bool)

(assert (=> b!247356 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!17936 0))(
  ( (Unit!17937) )
))
(declare-fun lt!385824 () Unit!17936)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10740) Unit!17936)

(assert (=> b!247356 (= lt!385824 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!247357 () Bool)

(declare-fun res!207000 () Bool)

(assert (=> b!247357 (=> (not res!207000) (not e!171341))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247357 (= res!207000 (validate_offset_bits!1 ((_ sign_extend 32) (size!5909 (buf!6393 thiss!1005))) ((_ sign_extend 32) (currentByte!11801 thiss!1005)) ((_ sign_extend 32) (currentBit!11796 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!247358 () Bool)

(declare-fun e!171339 () Bool)

(declare-fun array_inv!5650 (array!13480) Bool)

(assert (=> b!247358 (= e!171339 (array_inv!5650 (buf!6393 thiss!1005)))))

(declare-fun b!247355 () Bool)

(declare-fun res!207003 () Bool)

(assert (=> b!247355 (=> (not res!207003) (not e!171341))))

(assert (=> b!247355 (= res!207003 (bvsge from!289 nBits!297))))

(declare-fun res!207001 () Bool)

(assert (=> start!53284 (=> (not res!207001) (not e!171341))))

(assert (=> start!53284 (= res!207001 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53284 e!171341))

(assert (=> start!53284 true))

(declare-fun inv!12 (BitStream!10740) Bool)

(assert (=> start!53284 (and (inv!12 thiss!1005) e!171339)))

(assert (= (and start!53284 res!207001) b!247357))

(assert (= (and b!247357 res!207000) b!247355))

(assert (= (and b!247355 res!207003) b!247356))

(assert (= (and b!247356 (not res!207002)) b!247354))

(assert (= start!53284 b!247358))

(declare-fun m!373091 () Bool)

(assert (=> b!247357 m!373091))

(declare-fun m!373093 () Bool)

(assert (=> start!53284 m!373093))

(declare-fun m!373095 () Bool)

(assert (=> b!247358 m!373095))

(declare-fun m!373097 () Bool)

(assert (=> b!247356 m!373097))

(declare-fun m!373099 () Bool)

(assert (=> b!247356 m!373099))

(declare-fun m!373101 () Bool)

(assert (=> b!247354 m!373101))

(check-sat (not b!247356) (not start!53284) (not b!247357) (not b!247358) (not b!247354))
(check-sat)
(get-model)

