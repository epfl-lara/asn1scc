; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54674 () Bool)

(assert start!54674)

(declare-fun b!256233 () Bool)

(declare-fun e!177531 () Bool)

(declare-fun e!177533 () Bool)

(assert (=> b!256233 (= e!177531 (not e!177533))))

(declare-fun res!214825 () Bool)

(assert (=> b!256233 (=> res!214825 e!177533)))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!256233 (= res!214825 (not (= nBits!297 from!289)))))

(declare-datatypes ((array!13821 0))(
  ( (array!13822 (arr!7052 (Array (_ BitVec 32) (_ BitVec 8))) (size!6065 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11052 0))(
  ( (BitStream!11053 (buf!6582 array!13821) (currentByte!12061 (_ BitVec 32)) (currentBit!12056 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!11052)

(declare-fun isPrefixOf!0 (BitStream!11052 BitStream!11052) Bool)

(assert (=> b!256233 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!18338 0))(
  ( (Unit!18339) )
))
(declare-fun lt!397664 () Unit!18338)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11052) Unit!18338)

(assert (=> b!256233 (= lt!397664 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!256234 () Bool)

(declare-fun e!177529 () Bool)

(assert (=> b!256234 (= e!177529 true)))

(declare-datatypes ((tuple2!21926 0))(
  ( (tuple2!21927 (_1!11897 BitStream!11052) (_2!11897 BitStream!11052)) )
))
(declare-fun lt!397663 () tuple2!21926)

(declare-fun reader!0 (BitStream!11052 BitStream!11052) tuple2!21926)

(assert (=> b!256234 (= lt!397663 (reader!0 thiss!1005 thiss!1005))))

(declare-fun b!256235 () Bool)

(assert (=> b!256235 (= e!177533 e!177529)))

(declare-fun res!214826 () Bool)

(assert (=> b!256235 (=> res!214826 e!177529)))

(declare-fun lt!397665 () (_ BitVec 64))

(assert (=> b!256235 (= res!214826 (not (= lt!397665 (bvadd lt!397665 (bvsub nBits!297 from!289)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256235 (= lt!397665 (bitIndex!0 (size!6065 (buf!6582 thiss!1005)) (currentByte!12061 thiss!1005) (currentBit!12056 thiss!1005)))))

(declare-fun b!256236 () Bool)

(declare-fun res!214827 () Bool)

(assert (=> b!256236 (=> (not res!214827) (not e!177531))))

(assert (=> b!256236 (= res!214827 (bvsge from!289 nBits!297))))

(declare-fun b!256237 () Bool)

(declare-fun e!177532 () Bool)

(declare-fun array_inv!5806 (array!13821) Bool)

(assert (=> b!256237 (= e!177532 (array_inv!5806 (buf!6582 thiss!1005)))))

(declare-fun b!256238 () Bool)

(declare-fun res!214823 () Bool)

(assert (=> b!256238 (=> (not res!214823) (not e!177531))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256238 (= res!214823 (validate_offset_bits!1 ((_ sign_extend 32) (size!6065 (buf!6582 thiss!1005))) ((_ sign_extend 32) (currentByte!12061 thiss!1005)) ((_ sign_extend 32) (currentBit!12056 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun res!214824 () Bool)

(assert (=> start!54674 (=> (not res!214824) (not e!177531))))

(assert (=> start!54674 (= res!214824 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54674 e!177531))

(assert (=> start!54674 true))

(declare-fun inv!12 (BitStream!11052) Bool)

(assert (=> start!54674 (and (inv!12 thiss!1005) e!177532)))

(assert (= (and start!54674 res!214824) b!256238))

(assert (= (and b!256238 res!214823) b!256236))

(assert (= (and b!256236 res!214827) b!256233))

(assert (= (and b!256233 (not res!214825)) b!256235))

(assert (= (and b!256235 (not res!214826)) b!256234))

(assert (= start!54674 b!256237))

(declare-fun m!385853 () Bool)

(assert (=> b!256237 m!385853))

(declare-fun m!385855 () Bool)

(assert (=> b!256235 m!385855))

(declare-fun m!385857 () Bool)

(assert (=> b!256234 m!385857))

(declare-fun m!385859 () Bool)

(assert (=> b!256238 m!385859))

(declare-fun m!385861 () Bool)

(assert (=> b!256233 m!385861))

(declare-fun m!385863 () Bool)

(assert (=> b!256233 m!385863))

(declare-fun m!385865 () Bool)

(assert (=> start!54674 m!385865))

(check-sat (not b!256233) (not start!54674) (not b!256238) (not b!256235) (not b!256237) (not b!256234))
