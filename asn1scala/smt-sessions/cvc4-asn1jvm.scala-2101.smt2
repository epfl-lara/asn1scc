; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53332 () Bool)

(assert start!53332)

(declare-fun b!247548 () Bool)

(declare-fun e!171494 () Bool)

(declare-fun e!171497 () Bool)

(assert (=> b!247548 (= e!171494 (not e!171497))))

(declare-fun res!207167 () Bool)

(assert (=> b!247548 (=> res!207167 e!171497)))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!247548 (= res!207167 (not (= nBits!297 from!289)))))

(declare-datatypes ((array!13502 0))(
  ( (array!13503 (arr!6906 (Array (_ BitVec 32) (_ BitVec 8))) (size!5919 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10760 0))(
  ( (BitStream!10761 (buf!6403 array!13502) (currentByte!11816 (_ BitVec 32)) (currentBit!11811 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10760)

(declare-fun isPrefixOf!0 (BitStream!10760 BitStream!10760) Bool)

(assert (=> b!247548 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!17956 0))(
  ( (Unit!17957) )
))
(declare-fun lt!385904 () Unit!17956)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10760) Unit!17956)

(assert (=> b!247548 (= lt!385904 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun res!207164 () Bool)

(assert (=> start!53332 (=> (not res!207164) (not e!171494))))

(assert (=> start!53332 (= res!207164 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53332 e!171494))

(assert (=> start!53332 true))

(declare-fun e!171495 () Bool)

(declare-fun inv!12 (BitStream!10760) Bool)

(assert (=> start!53332 (and (inv!12 thiss!1005) e!171495)))

(declare-fun b!247549 () Bool)

(declare-fun res!207166 () Bool)

(assert (=> b!247549 (=> (not res!207166) (not e!171494))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247549 (= res!207166 (validate_offset_bits!1 ((_ sign_extend 32) (size!5919 (buf!6403 thiss!1005))) ((_ sign_extend 32) (currentByte!11816 thiss!1005)) ((_ sign_extend 32) (currentBit!11811 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!247550 () Bool)

(declare-fun e!171496 () Bool)

(assert (=> b!247550 (= e!171497 e!171496)))

(declare-fun res!207165 () Bool)

(assert (=> b!247550 (=> res!207165 e!171496)))

(declare-fun lt!385903 () (_ BitVec 64))

(assert (=> b!247550 (= res!207165 (not (= lt!385903 (bvadd lt!385903 (bvsub nBits!297 from!289)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247550 (= lt!385903 (bitIndex!0 (size!5919 (buf!6403 thiss!1005)) (currentByte!11816 thiss!1005) (currentBit!11811 thiss!1005)))))

(declare-fun b!247551 () Bool)

(assert (=> b!247551 (= e!171496 true)))

(declare-datatypes ((tuple2!21226 0))(
  ( (tuple2!21227 (_1!11535 BitStream!10760) (_2!11535 BitStream!10760)) )
))
(declare-fun lt!385905 () tuple2!21226)

(declare-fun reader!0 (BitStream!10760 BitStream!10760) tuple2!21226)

(assert (=> b!247551 (= lt!385905 (reader!0 thiss!1005 thiss!1005))))

(declare-fun b!247552 () Bool)

(declare-fun array_inv!5660 (array!13502) Bool)

(assert (=> b!247552 (= e!171495 (array_inv!5660 (buf!6403 thiss!1005)))))

(declare-fun b!247553 () Bool)

(declare-fun res!207168 () Bool)

(assert (=> b!247553 (=> (not res!207168) (not e!171494))))

(assert (=> b!247553 (= res!207168 (bvsge from!289 nBits!297))))

(assert (= (and start!53332 res!207164) b!247549))

(assert (= (and b!247549 res!207166) b!247553))

(assert (= (and b!247553 res!207168) b!247548))

(assert (= (and b!247548 (not res!207167)) b!247550))

(assert (= (and b!247550 (not res!207165)) b!247551))

(assert (= start!53332 b!247552))

(declare-fun m!373237 () Bool)

(assert (=> b!247549 m!373237))

(declare-fun m!373239 () Bool)

(assert (=> b!247551 m!373239))

(declare-fun m!373241 () Bool)

(assert (=> start!53332 m!373241))

(declare-fun m!373243 () Bool)

(assert (=> b!247548 m!373243))

(declare-fun m!373245 () Bool)

(assert (=> b!247548 m!373245))

(declare-fun m!373247 () Bool)

(assert (=> b!247552 m!373247))

(declare-fun m!373249 () Bool)

(assert (=> b!247550 m!373249))

(push 1)

(assert (not start!53332))

(assert (not b!247549))

(assert (not b!247548))

(assert (not b!247550))

(assert (not b!247552))

(assert (not b!247551))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

