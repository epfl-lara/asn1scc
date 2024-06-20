; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27358 () Bool)

(assert start!27358)

(declare-fun b!140473 () Bool)

(declare-fun e!93621 () Bool)

(declare-datatypes ((array!6424 0))(
  ( (array!6425 (arr!3614 (Array (_ BitVec 32) (_ BitVec 8))) (size!2907 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5072 0))(
  ( (BitStream!5073 (buf!3328 array!6424) (currentByte!6179 (_ BitVec 32)) (currentBit!6174 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5072)

(declare-fun array_inv!2696 (array!6424) Bool)

(assert (=> b!140473 (= e!93621 (array_inv!2696 (buf!3328 thiss!1634)))))

(declare-fun b!140474 () Bool)

(declare-fun res!117123 () Bool)

(declare-fun e!93620 () Bool)

(assert (=> b!140474 (=> (not res!117123) (not e!93620))))

(declare-datatypes ((Unit!8793 0))(
  ( (Unit!8794) )
))
(declare-datatypes ((tuple2!12316 0))(
  ( (tuple2!12317 (_1!6488 Unit!8793) (_2!6488 BitStream!5072)) )
))
(declare-fun lt!218742 () tuple2!12316)

(declare-fun isPrefixOf!0 (BitStream!5072 BitStream!5072) Bool)

(assert (=> b!140474 (= res!117123 (isPrefixOf!0 thiss!1634 (_2!6488 lt!218742)))))

(declare-fun b!140475 () Bool)

(declare-fun e!93622 () Bool)

(assert (=> b!140475 (= e!93622 (not true))))

(assert (=> b!140475 e!93620))

(declare-fun res!117121 () Bool)

(assert (=> b!140475 (=> (not res!117121) (not e!93620))))

(assert (=> b!140475 (= res!117121 (= (size!2907 (buf!3328 thiss!1634)) (size!2907 (buf!3328 (_2!6488 lt!218742)))))))

(declare-fun arr!237 () array!6424)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun appendByte!0 (BitStream!5072 (_ BitVec 8)) tuple2!12316)

(assert (=> b!140475 (= lt!218742 (appendByte!0 thiss!1634 (select (arr!3614 arr!237) from!447)))))

(declare-fun b!140476 () Bool)

(declare-fun res!117126 () Bool)

(assert (=> b!140476 (=> (not res!117126) (not e!93620))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!140476 (= res!117126 (= (bitIndex!0 (size!2907 (buf!3328 (_2!6488 lt!218742))) (currentByte!6179 (_2!6488 lt!218742)) (currentBit!6174 (_2!6488 lt!218742))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2907 (buf!3328 thiss!1634)) (currentByte!6179 thiss!1634) (currentBit!6174 thiss!1634)))))))

(declare-fun b!140477 () Bool)

(declare-fun res!117124 () Bool)

(assert (=> b!140477 (=> (not res!117124) (not e!93622))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140477 (= res!117124 (invariant!0 (currentBit!6174 thiss!1634) (currentByte!6179 thiss!1634) (size!2907 (buf!3328 thiss!1634))))))

(declare-fun b!140478 () Bool)

(declare-fun res!117125 () Bool)

(assert (=> b!140478 (=> (not res!117125) (not e!93622))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!140478 (= res!117125 (bvslt from!447 to!404))))

(declare-datatypes ((tuple2!12318 0))(
  ( (tuple2!12319 (_1!6489 BitStream!5072) (_2!6489 (_ BitVec 8))) )
))
(declare-fun lt!218744 () tuple2!12318)

(declare-fun b!140479 () Bool)

(declare-datatypes ((tuple2!12320 0))(
  ( (tuple2!12321 (_1!6490 BitStream!5072) (_2!6490 BitStream!5072)) )
))
(declare-fun lt!218743 () tuple2!12320)

(assert (=> b!140479 (= e!93620 (and (= (_2!6489 lt!218744) (select (arr!3614 arr!237) from!447)) (= (_1!6489 lt!218744) (_2!6490 lt!218743))))))

(declare-fun readBytePure!0 (BitStream!5072) tuple2!12318)

(assert (=> b!140479 (= lt!218744 (readBytePure!0 (_1!6490 lt!218743)))))

(declare-fun reader!0 (BitStream!5072 BitStream!5072) tuple2!12320)

(assert (=> b!140479 (= lt!218743 (reader!0 thiss!1634 (_2!6488 lt!218742)))))

(declare-fun res!117127 () Bool)

(assert (=> start!27358 (=> (not res!117127) (not e!93622))))

(assert (=> start!27358 (= res!117127 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2907 arr!237))))))

(assert (=> start!27358 e!93622))

(assert (=> start!27358 true))

(assert (=> start!27358 (array_inv!2696 arr!237)))

(declare-fun inv!12 (BitStream!5072) Bool)

(assert (=> start!27358 (and (inv!12 thiss!1634) e!93621)))

(declare-fun b!140480 () Bool)

(declare-fun res!117122 () Bool)

(assert (=> b!140480 (=> (not res!117122) (not e!93622))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140480 (= res!117122 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2907 (buf!3328 thiss!1634))) ((_ sign_extend 32) (currentByte!6179 thiss!1634)) ((_ sign_extend 32) (currentBit!6174 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!27358 res!117127) b!140480))

(assert (= (and b!140480 res!117122) b!140478))

(assert (= (and b!140478 res!117125) b!140477))

(assert (= (and b!140477 res!117124) b!140475))

(assert (= (and b!140475 res!117121) b!140476))

(assert (= (and b!140476 res!117126) b!140474))

(assert (= (and b!140474 res!117123) b!140479))

(assert (= start!27358 b!140473))

(declare-fun m!216257 () Bool)

(assert (=> start!27358 m!216257))

(declare-fun m!216259 () Bool)

(assert (=> start!27358 m!216259))

(declare-fun m!216261 () Bool)

(assert (=> b!140474 m!216261))

(declare-fun m!216263 () Bool)

(assert (=> b!140476 m!216263))

(declare-fun m!216265 () Bool)

(assert (=> b!140476 m!216265))

(declare-fun m!216267 () Bool)

(assert (=> b!140480 m!216267))

(declare-fun m!216269 () Bool)

(assert (=> b!140479 m!216269))

(declare-fun m!216271 () Bool)

(assert (=> b!140479 m!216271))

(declare-fun m!216273 () Bool)

(assert (=> b!140479 m!216273))

(assert (=> b!140475 m!216269))

(assert (=> b!140475 m!216269))

(declare-fun m!216275 () Bool)

(assert (=> b!140475 m!216275))

(declare-fun m!216277 () Bool)

(assert (=> b!140477 m!216277))

(declare-fun m!216279 () Bool)

(assert (=> b!140473 m!216279))

(push 1)

