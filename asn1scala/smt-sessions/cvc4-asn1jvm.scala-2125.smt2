; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53740 () Bool)

(assert start!53740)

(declare-fun b!250258 () Bool)

(declare-fun e!173464 () Bool)

(declare-fun e!173469 () Bool)

(assert (=> b!250258 (= e!173464 e!173469)))

(declare-fun res!209492 () Bool)

(assert (=> b!250258 (=> (not res!209492) (not e!173469))))

(declare-fun lt!388827 () (_ BitVec 64))

(declare-datatypes ((array!13649 0))(
  ( (array!13650 (arr!6975 (Array (_ BitVec 32) (_ BitVec 8))) (size!5988 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10898 0))(
  ( (BitStream!10899 (buf!6481 array!13649) (currentByte!11912 (_ BitVec 32)) (currentBit!11907 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18112 0))(
  ( (Unit!18113) )
))
(declare-datatypes ((tuple2!21480 0))(
  ( (tuple2!21481 (_1!11665 Unit!18112) (_2!11665 BitStream!10898)) )
))
(declare-fun lt!388829 () tuple2!21480)

(declare-fun lt!388836 () tuple2!21480)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!250258 (= res!209492 (= (bitIndex!0 (size!5988 (buf!6481 (_2!11665 lt!388829))) (currentByte!11912 (_2!11665 lt!388829)) (currentBit!11907 (_2!11665 lt!388829))) (bvadd (bitIndex!0 (size!5988 (buf!6481 (_2!11665 lt!388836))) (currentByte!11912 (_2!11665 lt!388836)) (currentBit!11907 (_2!11665 lt!388836))) lt!388827)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!250258 (= lt!388827 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!250259 () Bool)

(declare-fun e!173471 () Bool)

(declare-fun thiss!1005 () BitStream!10898)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!250259 (= e!173471 (invariant!0 (currentBit!11907 thiss!1005) (currentByte!11912 thiss!1005) (size!5988 (buf!6481 (_2!11665 lt!388836)))))))

(declare-fun b!250260 () Bool)

(declare-fun res!209494 () Bool)

(declare-fun e!173465 () Bool)

(assert (=> b!250260 (=> (not res!209494) (not e!173465))))

(assert (=> b!250260 (= res!209494 (bvslt from!289 nBits!297))))

(declare-fun b!250261 () Bool)

(declare-fun res!209498 () Bool)

(assert (=> b!250261 (=> (not res!209498) (not e!173465))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!250261 (= res!209498 (validate_offset_bits!1 ((_ sign_extend 32) (size!5988 (buf!6481 thiss!1005))) ((_ sign_extend 32) (currentByte!11912 thiss!1005)) ((_ sign_extend 32) (currentBit!11907 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!250262 () Bool)

(declare-fun res!209502 () Bool)

(assert (=> b!250262 (=> (not res!209502) (not e!173469))))

(declare-fun isPrefixOf!0 (BitStream!10898 BitStream!10898) Bool)

(assert (=> b!250262 (= res!209502 (isPrefixOf!0 (_2!11665 lt!388836) (_2!11665 lt!388829)))))

(declare-fun b!250263 () Bool)

(declare-fun e!173470 () Bool)

(declare-fun e!173463 () Bool)

(assert (=> b!250263 (= e!173470 e!173463)))

(declare-fun res!209493 () Bool)

(assert (=> b!250263 (=> (not res!209493) (not e!173463))))

(declare-datatypes ((tuple2!21482 0))(
  ( (tuple2!21483 (_1!11666 BitStream!10898) (_2!11666 Bool)) )
))
(declare-fun lt!388832 () tuple2!21482)

(declare-fun bit!26 () Bool)

(assert (=> b!250263 (= res!209493 (and (= (_2!11666 lt!388832) bit!26) (= (_1!11666 lt!388832) (_2!11665 lt!388836))))))

(declare-fun readBitPure!0 (BitStream!10898) tuple2!21482)

(declare-fun readerFrom!0 (BitStream!10898 (_ BitVec 32) (_ BitVec 32)) BitStream!10898)

(assert (=> b!250263 (= lt!388832 (readBitPure!0 (readerFrom!0 (_2!11665 lt!388836) (currentBit!11907 thiss!1005) (currentByte!11912 thiss!1005))))))

(declare-fun b!250264 () Bool)

(assert (=> b!250264 (= e!173465 (not true))))

(assert (=> b!250264 e!173471))

(declare-fun res!209497 () Bool)

(assert (=> b!250264 (=> (not res!209497) (not e!173471))))

(assert (=> b!250264 (= res!209497 (isPrefixOf!0 thiss!1005 (_2!11665 lt!388829)))))

(declare-fun lt!388833 () Unit!18112)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10898 BitStream!10898 BitStream!10898) Unit!18112)

(assert (=> b!250264 (= lt!388833 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11665 lt!388836) (_2!11665 lt!388829)))))

(assert (=> b!250264 e!173464))

(declare-fun res!209501 () Bool)

(assert (=> b!250264 (=> (not res!209501) (not e!173464))))

(assert (=> b!250264 (= res!209501 (= (size!5988 (buf!6481 (_2!11665 lt!388836))) (size!5988 (buf!6481 (_2!11665 lt!388829)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10898 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21480)

(assert (=> b!250264 (= lt!388829 (appendNBitsLoop!0 (_2!11665 lt!388836) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250264 (validate_offset_bits!1 ((_ sign_extend 32) (size!5988 (buf!6481 (_2!11665 lt!388836)))) ((_ sign_extend 32) (currentByte!11912 (_2!11665 lt!388836))) ((_ sign_extend 32) (currentBit!11907 (_2!11665 lt!388836))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388828 () Unit!18112)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10898 BitStream!10898 (_ BitVec 64) (_ BitVec 64)) Unit!18112)

(assert (=> b!250264 (= lt!388828 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11665 lt!388836) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!173466 () Bool)

(assert (=> b!250264 e!173466))

(declare-fun res!209495 () Bool)

(assert (=> b!250264 (=> (not res!209495) (not e!173466))))

(assert (=> b!250264 (= res!209495 (= (size!5988 (buf!6481 thiss!1005)) (size!5988 (buf!6481 (_2!11665 lt!388836)))))))

(declare-fun appendBit!0 (BitStream!10898 Bool) tuple2!21480)

(assert (=> b!250264 (= lt!388836 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!250265 () Bool)

(declare-fun res!209496 () Bool)

(assert (=> b!250265 (=> (not res!209496) (not e!173470))))

(assert (=> b!250265 (= res!209496 (isPrefixOf!0 thiss!1005 (_2!11665 lt!388836)))))

(declare-fun b!250266 () Bool)

(declare-fun e!173468 () Bool)

(declare-fun array_inv!5729 (array!13649) Bool)

(assert (=> b!250266 (= e!173468 (array_inv!5729 (buf!6481 thiss!1005)))))

(declare-fun res!209500 () Bool)

(assert (=> start!53740 (=> (not res!209500) (not e!173465))))

(assert (=> start!53740 (= res!209500 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53740 e!173465))

(assert (=> start!53740 true))

(declare-fun inv!12 (BitStream!10898) Bool)

(assert (=> start!53740 (and (inv!12 thiss!1005) e!173468)))

(declare-fun b!250257 () Bool)

(assert (=> b!250257 (= e!173466 e!173470)))

(declare-fun res!209499 () Bool)

(assert (=> b!250257 (=> (not res!209499) (not e!173470))))

(declare-fun lt!388830 () (_ BitVec 64))

(declare-fun lt!388831 () (_ BitVec 64))

(assert (=> b!250257 (= res!209499 (= lt!388830 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388831)))))

(assert (=> b!250257 (= lt!388830 (bitIndex!0 (size!5988 (buf!6481 (_2!11665 lt!388836))) (currentByte!11912 (_2!11665 lt!388836)) (currentBit!11907 (_2!11665 lt!388836))))))

(assert (=> b!250257 (= lt!388831 (bitIndex!0 (size!5988 (buf!6481 thiss!1005)) (currentByte!11912 thiss!1005) (currentBit!11907 thiss!1005)))))

(declare-fun b!250267 () Bool)

(assert (=> b!250267 (= e!173463 (= (bitIndex!0 (size!5988 (buf!6481 (_1!11666 lt!388832))) (currentByte!11912 (_1!11666 lt!388832)) (currentBit!11907 (_1!11666 lt!388832))) lt!388830))))

(declare-fun b!250268 () Bool)

(declare-fun lt!388834 () tuple2!21482)

(declare-datatypes ((tuple2!21484 0))(
  ( (tuple2!21485 (_1!11667 BitStream!10898) (_2!11667 BitStream!10898)) )
))
(declare-fun lt!388826 () tuple2!21484)

(assert (=> b!250268 (= e!173469 (not (or (not (_2!11666 lt!388834)) (not (= (_1!11666 lt!388834) (_2!11667 lt!388826))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10898 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21482)

(assert (=> b!250268 (= lt!388834 (checkBitsLoopPure!0 (_1!11667 lt!388826) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250268 (validate_offset_bits!1 ((_ sign_extend 32) (size!5988 (buf!6481 (_2!11665 lt!388829)))) ((_ sign_extend 32) (currentByte!11912 (_2!11665 lt!388836))) ((_ sign_extend 32) (currentBit!11907 (_2!11665 lt!388836))) lt!388827)))

(declare-fun lt!388835 () Unit!18112)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10898 array!13649 (_ BitVec 64)) Unit!18112)

(assert (=> b!250268 (= lt!388835 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11665 lt!388836) (buf!6481 (_2!11665 lt!388829)) lt!388827))))

(declare-fun reader!0 (BitStream!10898 BitStream!10898) tuple2!21484)

(assert (=> b!250268 (= lt!388826 (reader!0 (_2!11665 lt!388836) (_2!11665 lt!388829)))))

(assert (= (and start!53740 res!209500) b!250261))

(assert (= (and b!250261 res!209498) b!250260))

(assert (= (and b!250260 res!209494) b!250264))

(assert (= (and b!250264 res!209495) b!250257))

(assert (= (and b!250257 res!209499) b!250265))

(assert (= (and b!250265 res!209496) b!250263))

(assert (= (and b!250263 res!209493) b!250267))

(assert (= (and b!250264 res!209501) b!250258))

(assert (= (and b!250258 res!209492) b!250262))

(assert (= (and b!250262 res!209502) b!250268))

(assert (= (and b!250264 res!209497) b!250259))

(assert (= start!53740 b!250266))

(declare-fun m!376699 () Bool)

(assert (=> b!250266 m!376699))

(declare-fun m!376701 () Bool)

(assert (=> b!250268 m!376701))

(declare-fun m!376703 () Bool)

(assert (=> b!250268 m!376703))

(declare-fun m!376705 () Bool)

(assert (=> b!250268 m!376705))

(declare-fun m!376707 () Bool)

(assert (=> b!250268 m!376707))

(declare-fun m!376709 () Bool)

(assert (=> b!250263 m!376709))

(assert (=> b!250263 m!376709))

(declare-fun m!376711 () Bool)

(assert (=> b!250263 m!376711))

(declare-fun m!376713 () Bool)

(assert (=> b!250267 m!376713))

(declare-fun m!376715 () Bool)

(assert (=> start!53740 m!376715))

(declare-fun m!376717 () Bool)

(assert (=> b!250259 m!376717))

(declare-fun m!376719 () Bool)

(assert (=> b!250265 m!376719))

(declare-fun m!376721 () Bool)

(assert (=> b!250264 m!376721))

(declare-fun m!376723 () Bool)

(assert (=> b!250264 m!376723))

(declare-fun m!376725 () Bool)

(assert (=> b!250264 m!376725))

(declare-fun m!376727 () Bool)

(assert (=> b!250264 m!376727))

(declare-fun m!376729 () Bool)

(assert (=> b!250264 m!376729))

(declare-fun m!376731 () Bool)

(assert (=> b!250264 m!376731))

(declare-fun m!376733 () Bool)

(assert (=> b!250258 m!376733))

(declare-fun m!376735 () Bool)

(assert (=> b!250258 m!376735))

(declare-fun m!376737 () Bool)

(assert (=> b!250262 m!376737))

(declare-fun m!376739 () Bool)

(assert (=> b!250261 m!376739))

(assert (=> b!250257 m!376735))

(declare-fun m!376741 () Bool)

(assert (=> b!250257 m!376741))

(push 1)

(assert (not b!250266))

(assert (not b!250257))

(assert (not b!250264))

(assert (not start!53740))

(assert (not b!250258))

(assert (not b!250268))

(assert (not b!250262))

(assert (not b!250265))

(assert (not b!250263))

(assert (not b!250259))

(assert (not b!250267))

(assert (not b!250261))

(check-sat)

