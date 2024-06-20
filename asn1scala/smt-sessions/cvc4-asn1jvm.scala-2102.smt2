; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53338 () Bool)

(assert start!53338)

(declare-fun b!247602 () Bool)

(declare-fun e!171539 () Bool)

(declare-fun e!171542 () Bool)

(assert (=> b!247602 (= e!171539 (not e!171542))))

(declare-fun res!207212 () Bool)

(assert (=> b!247602 (=> res!207212 e!171542)))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!247602 (= res!207212 (not (= nBits!297 from!289)))))

(declare-datatypes ((array!13508 0))(
  ( (array!13509 (arr!6909 (Array (_ BitVec 32) (_ BitVec 8))) (size!5922 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10766 0))(
  ( (BitStream!10767 (buf!6406 array!13508) (currentByte!11819 (_ BitVec 32)) (currentBit!11814 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10766)

(declare-fun isPrefixOf!0 (BitStream!10766 BitStream!10766) Bool)

(assert (=> b!247602 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!17962 0))(
  ( (Unit!17963) )
))
(declare-fun lt!385931 () Unit!17962)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10766) Unit!17962)

(assert (=> b!247602 (= lt!385931 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!247603 () Bool)

(declare-fun e!171540 () Bool)

(assert (=> b!247603 (= e!171540 true)))

(declare-datatypes ((tuple2!21232 0))(
  ( (tuple2!21233 (_1!11538 BitStream!10766) (_2!11538 BitStream!10766)) )
))
(declare-fun lt!385930 () tuple2!21232)

(declare-fun reader!0 (BitStream!10766 BitStream!10766) tuple2!21232)

(assert (=> b!247603 (= lt!385930 (reader!0 thiss!1005 thiss!1005))))

(declare-fun b!247604 () Bool)

(declare-fun res!207211 () Bool)

(assert (=> b!247604 (=> (not res!207211) (not e!171539))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247604 (= res!207211 (validate_offset_bits!1 ((_ sign_extend 32) (size!5922 (buf!6406 thiss!1005))) ((_ sign_extend 32) (currentByte!11819 thiss!1005)) ((_ sign_extend 32) (currentBit!11814 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!247605 () Bool)

(assert (=> b!247605 (= e!171542 e!171540)))

(declare-fun res!207210 () Bool)

(assert (=> b!247605 (=> res!207210 e!171540)))

(declare-fun lt!385932 () (_ BitVec 64))

(assert (=> b!247605 (= res!207210 (not (= lt!385932 (bvadd lt!385932 (bvsub nBits!297 from!289)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247605 (= lt!385932 (bitIndex!0 (size!5922 (buf!6406 thiss!1005)) (currentByte!11819 thiss!1005) (currentBit!11814 thiss!1005)))))

(declare-fun b!247607 () Bool)

(declare-fun e!171541 () Bool)

(declare-fun array_inv!5663 (array!13508) Bool)

(assert (=> b!247607 (= e!171541 (array_inv!5663 (buf!6406 thiss!1005)))))

(declare-fun b!247606 () Bool)

(declare-fun res!207209 () Bool)

(assert (=> b!247606 (=> (not res!207209) (not e!171539))))

(assert (=> b!247606 (= res!207209 (bvsge from!289 nBits!297))))

(declare-fun res!207213 () Bool)

(assert (=> start!53338 (=> (not res!207213) (not e!171539))))

(assert (=> start!53338 (= res!207213 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53338 e!171539))

(assert (=> start!53338 true))

(declare-fun inv!12 (BitStream!10766) Bool)

(assert (=> start!53338 (and (inv!12 thiss!1005) e!171541)))

(assert (= (and start!53338 res!207213) b!247604))

(assert (= (and b!247604 res!207211) b!247606))

(assert (= (and b!247606 res!207209) b!247602))

(assert (= (and b!247602 (not res!207212)) b!247605))

(assert (= (and b!247605 (not res!207210)) b!247603))

(assert (= start!53338 b!247607))

(declare-fun m!373279 () Bool)

(assert (=> b!247602 m!373279))

(declare-fun m!373281 () Bool)

(assert (=> b!247602 m!373281))

(declare-fun m!373283 () Bool)

(assert (=> b!247603 m!373283))

(declare-fun m!373285 () Bool)

(assert (=> b!247604 m!373285))

(declare-fun m!373287 () Bool)

(assert (=> b!247607 m!373287))

(declare-fun m!373289 () Bool)

(assert (=> start!53338 m!373289))

(declare-fun m!373291 () Bool)

(assert (=> b!247605 m!373291))

(push 1)

(assert (not b!247605))

(assert (not start!53338))

(assert (not b!247604))

(assert (not b!247603))

(assert (not b!247607))

(assert (not b!247602))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

