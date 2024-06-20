; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52420 () Bool)

(assert start!52420)

(declare-fun b!241219 () Bool)

(declare-fun e!167181 () Bool)

(declare-datatypes ((array!13231 0))(
  ( (array!13232 (arr!6782 (Array (_ BitVec 32) (_ BitVec 8))) (size!5795 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10512 0))(
  ( (BitStream!10513 (buf!6261 array!13231) (currentByte!11624 (_ BitVec 32)) (currentBit!11619 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20560 0))(
  ( (tuple2!20561 (_1!11202 BitStream!10512) (_2!11202 Bool)) )
))
(declare-fun lt!376815 () tuple2!20560)

(declare-fun lt!376814 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241219 (= e!167181 (= (bitIndex!0 (size!5795 (buf!6261 (_1!11202 lt!376815))) (currentByte!11624 (_1!11202 lt!376815)) (currentBit!11619 (_1!11202 lt!376815))) lt!376814))))

(declare-fun res!201354 () Bool)

(declare-fun e!167185 () Bool)

(assert (=> start!52420 (=> (not res!201354) (not e!167185))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!52420 (= res!201354 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52420 e!167185))

(assert (=> start!52420 true))

(declare-fun thiss!1005 () BitStream!10512)

(declare-fun e!167183 () Bool)

(declare-fun inv!12 (BitStream!10512) Bool)

(assert (=> start!52420 (and (inv!12 thiss!1005) e!167183)))

(declare-fun b!241220 () Bool)

(declare-fun e!167186 () Bool)

(declare-fun e!167182 () Bool)

(assert (=> b!241220 (= e!167186 e!167182)))

(declare-fun res!201359 () Bool)

(assert (=> b!241220 (=> (not res!201359) (not e!167182))))

(declare-fun lt!376816 () (_ BitVec 64))

(assert (=> b!241220 (= res!201359 (= lt!376814 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!376816)))))

(declare-datatypes ((Unit!17673 0))(
  ( (Unit!17674) )
))
(declare-datatypes ((tuple2!20562 0))(
  ( (tuple2!20563 (_1!11203 Unit!17673) (_2!11203 BitStream!10512)) )
))
(declare-fun lt!376818 () tuple2!20562)

(assert (=> b!241220 (= lt!376814 (bitIndex!0 (size!5795 (buf!6261 (_2!11203 lt!376818))) (currentByte!11624 (_2!11203 lt!376818)) (currentBit!11619 (_2!11203 lt!376818))))))

(assert (=> b!241220 (= lt!376816 (bitIndex!0 (size!5795 (buf!6261 thiss!1005)) (currentByte!11624 thiss!1005) (currentBit!11619 thiss!1005)))))

(declare-fun b!241221 () Bool)

(declare-fun res!201358 () Bool)

(assert (=> b!241221 (=> (not res!201358) (not e!167185))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241221 (= res!201358 (validate_offset_bits!1 ((_ sign_extend 32) (size!5795 (buf!6261 thiss!1005))) ((_ sign_extend 32) (currentByte!11624 thiss!1005)) ((_ sign_extend 32) (currentBit!11619 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!241222 () Bool)

(assert (=> b!241222 (= e!167182 e!167181)))

(declare-fun res!201356 () Bool)

(assert (=> b!241222 (=> (not res!201356) (not e!167181))))

(declare-fun bit!26 () Bool)

(assert (=> b!241222 (= res!201356 (and (= (_2!11202 lt!376815) bit!26) (= (_1!11202 lt!376815) (_2!11203 lt!376818))))))

(declare-fun readBitPure!0 (BitStream!10512) tuple2!20560)

(declare-fun readerFrom!0 (BitStream!10512 (_ BitVec 32) (_ BitVec 32)) BitStream!10512)

(assert (=> b!241222 (= lt!376815 (readBitPure!0 (readerFrom!0 (_2!11203 lt!376818) (currentBit!11619 thiss!1005) (currentByte!11624 thiss!1005))))))

(declare-fun b!241223 () Bool)

(declare-fun res!201355 () Bool)

(assert (=> b!241223 (=> (not res!201355) (not e!167182))))

(declare-fun isPrefixOf!0 (BitStream!10512 BitStream!10512) Bool)

(assert (=> b!241223 (= res!201355 (isPrefixOf!0 thiss!1005 (_2!11203 lt!376818)))))

(declare-fun b!241224 () Bool)

(assert (=> b!241224 (= e!167185 (not true))))

(declare-fun lt!376813 () (_ BitVec 64))

(assert (=> b!241224 (= lt!376813 (bitIndex!0 (size!5795 (buf!6261 (_2!11203 lt!376818))) (currentByte!11624 (_2!11203 lt!376818)) (currentBit!11619 (_2!11203 lt!376818))))))

(declare-fun lt!376817 () (_ BitVec 64))

(assert (=> b!241224 (= lt!376817 (bitIndex!0 (size!5795 (buf!6261 thiss!1005)) (currentByte!11624 thiss!1005) (currentBit!11619 thiss!1005)))))

(assert (=> b!241224 e!167186))

(declare-fun res!201360 () Bool)

(assert (=> b!241224 (=> (not res!201360) (not e!167186))))

(assert (=> b!241224 (= res!201360 (= (size!5795 (buf!6261 thiss!1005)) (size!5795 (buf!6261 (_2!11203 lt!376818)))))))

(declare-fun appendBit!0 (BitStream!10512 Bool) tuple2!20562)

(assert (=> b!241224 (= lt!376818 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!241225 () Bool)

(declare-fun array_inv!5536 (array!13231) Bool)

(assert (=> b!241225 (= e!167183 (array_inv!5536 (buf!6261 thiss!1005)))))

(declare-fun b!241226 () Bool)

(declare-fun res!201357 () Bool)

(assert (=> b!241226 (=> (not res!201357) (not e!167185))))

(assert (=> b!241226 (= res!201357 (bvslt from!289 nBits!297))))

(assert (= (and start!52420 res!201354) b!241221))

(assert (= (and b!241221 res!201358) b!241226))

(assert (= (and b!241226 res!201357) b!241224))

(assert (= (and b!241224 res!201360) b!241220))

(assert (= (and b!241220 res!201359) b!241223))

(assert (= (and b!241223 res!201355) b!241222))

(assert (= (and b!241222 res!201356) b!241219))

(assert (= start!52420 b!241225))

(declare-fun m!363931 () Bool)

(assert (=> b!241224 m!363931))

(declare-fun m!363933 () Bool)

(assert (=> b!241224 m!363933))

(declare-fun m!363935 () Bool)

(assert (=> b!241224 m!363935))

(declare-fun m!363937 () Bool)

(assert (=> start!52420 m!363937))

(declare-fun m!363939 () Bool)

(assert (=> b!241225 m!363939))

(declare-fun m!363941 () Bool)

(assert (=> b!241222 m!363941))

(assert (=> b!241222 m!363941))

(declare-fun m!363943 () Bool)

(assert (=> b!241222 m!363943))

(declare-fun m!363945 () Bool)

(assert (=> b!241219 m!363945))

(declare-fun m!363947 () Bool)

(assert (=> b!241223 m!363947))

(declare-fun m!363949 () Bool)

(assert (=> b!241221 m!363949))

(assert (=> b!241220 m!363931))

(assert (=> b!241220 m!363933))

(check-sat (not start!52420) (not b!241220) (not b!241223) (not b!241221) (not b!241219) (not b!241224) (not b!241222) (not b!241225))
