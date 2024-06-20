; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22382 () Bool)

(assert start!22382)

(declare-fun b!113159 () Bool)

(declare-fun res!93448 () Bool)

(declare-fun e!74253 () Bool)

(assert (=> b!113159 (=> (not res!93448) (not e!74253))))

(declare-datatypes ((array!5146 0))(
  ( (array!5147 (arr!2932 (Array (_ BitVec 32) (_ BitVec 8))) (size!2339 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4152 0))(
  ( (BitStream!4153 (buf!2747 array!5146) (currentByte!5327 (_ BitVec 32)) (currentBit!5322 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4152)

(declare-datatypes ((Unit!6945 0))(
  ( (Unit!6946) )
))
(declare-datatypes ((tuple2!9316 0))(
  ( (tuple2!9317 (_1!4920 Unit!6945) (_2!4920 BitStream!4152)) )
))
(declare-fun lt!171943 () tuple2!9316)

(declare-fun isPrefixOf!0 (BitStream!4152 BitStream!4152) Bool)

(assert (=> b!113159 (= res!93448 (isPrefixOf!0 thiss!1305 (_2!4920 lt!171943)))))

(declare-fun b!113160 () Bool)

(declare-fun e!74256 () Bool)

(declare-datatypes ((tuple2!9318 0))(
  ( (tuple2!9319 (_1!4921 BitStream!4152) (_2!4921 Bool)) )
))
(declare-fun lt!171946 () tuple2!9318)

(declare-fun lt!171942 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113160 (= e!74256 (= (bitIndex!0 (size!2339 (buf!2747 (_1!4921 lt!171946))) (currentByte!5327 (_1!4921 lt!171946)) (currentBit!5322 (_1!4921 lt!171946))) lt!171942))))

(declare-fun b!113161 () Bool)

(declare-fun res!93443 () Bool)

(declare-fun e!74252 () Bool)

(assert (=> b!113161 (=> (not res!93443) (not e!74252))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!113161 (= res!93443 (validate_offset_bits!1 ((_ sign_extend 32) (size!2339 (buf!2747 thiss!1305))) ((_ sign_extend 32) (currentByte!5327 thiss!1305)) ((_ sign_extend 32) (currentBit!5322 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!113162 () Bool)

(declare-fun res!93446 () Bool)

(assert (=> b!113162 (=> (not res!93446) (not e!74252))))

(assert (=> b!113162 (= res!93446 (bvslt i!615 nBits!396))))

(declare-fun res!93442 () Bool)

(assert (=> start!22382 (=> (not res!93442) (not e!74252))))

(assert (=> start!22382 (= res!93442 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22382 e!74252))

(assert (=> start!22382 true))

(declare-fun e!74255 () Bool)

(declare-fun inv!12 (BitStream!4152) Bool)

(assert (=> start!22382 (and (inv!12 thiss!1305) e!74255)))

(declare-fun b!113163 () Bool)

(declare-fun e!74251 () Bool)

(assert (=> b!113163 (= e!74251 e!74253)))

(declare-fun res!93445 () Bool)

(assert (=> b!113163 (=> (not res!93445) (not e!74253))))

(declare-fun lt!171944 () (_ BitVec 64))

(assert (=> b!113163 (= res!93445 (= lt!171942 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!171944)))))

(assert (=> b!113163 (= lt!171942 (bitIndex!0 (size!2339 (buf!2747 (_2!4920 lt!171943))) (currentByte!5327 (_2!4920 lt!171943)) (currentBit!5322 (_2!4920 lt!171943))))))

(assert (=> b!113163 (= lt!171944 (bitIndex!0 (size!2339 (buf!2747 thiss!1305)) (currentByte!5327 thiss!1305) (currentBit!5322 thiss!1305)))))

(declare-fun b!113164 () Bool)

(assert (=> b!113164 (= e!74252 (not (isPrefixOf!0 thiss!1305 (_2!4920 lt!171943))))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun lt!171947 () tuple2!9316)

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4152 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9316)

(assert (=> b!113164 (= lt!171947 (appendNLeastSignificantBitsLoop!0 (_2!4920 lt!171943) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!113164 e!74251))

(declare-fun res!93447 () Bool)

(assert (=> b!113164 (=> (not res!93447) (not e!74251))))

(assert (=> b!113164 (= res!93447 (= (size!2339 (buf!2747 thiss!1305)) (size!2339 (buf!2747 (_2!4920 lt!171943)))))))

(declare-fun lt!171945 () Bool)

(declare-fun appendBit!0 (BitStream!4152 Bool) tuple2!9316)

(assert (=> b!113164 (= lt!171943 (appendBit!0 thiss!1305 lt!171945))))

(assert (=> b!113164 (= lt!171945 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!113165 () Bool)

(assert (=> b!113165 (= e!74253 e!74256)))

(declare-fun res!93449 () Bool)

(assert (=> b!113165 (=> (not res!93449) (not e!74256))))

(assert (=> b!113165 (= res!93449 (and (= (_2!4921 lt!171946) lt!171945) (= (_1!4921 lt!171946) (_2!4920 lt!171943))))))

(declare-fun readBitPure!0 (BitStream!4152) tuple2!9318)

(declare-fun readerFrom!0 (BitStream!4152 (_ BitVec 32) (_ BitVec 32)) BitStream!4152)

(assert (=> b!113165 (= lt!171946 (readBitPure!0 (readerFrom!0 (_2!4920 lt!171943) (currentBit!5322 thiss!1305) (currentByte!5327 thiss!1305))))))

(declare-fun b!113166 () Bool)

(declare-fun res!93444 () Bool)

(assert (=> b!113166 (=> (not res!93444) (not e!74252))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113166 (= res!93444 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!113167 () Bool)

(declare-fun array_inv!2141 (array!5146) Bool)

(assert (=> b!113167 (= e!74255 (array_inv!2141 (buf!2747 thiss!1305)))))

(assert (= (and start!22382 res!93442) b!113161))

(assert (= (and b!113161 res!93443) b!113166))

(assert (= (and b!113166 res!93444) b!113162))

(assert (= (and b!113162 res!93446) b!113164))

(assert (= (and b!113164 res!93447) b!113163))

(assert (= (and b!113163 res!93445) b!113159))

(assert (= (and b!113159 res!93448) b!113165))

(assert (= (and b!113165 res!93449) b!113160))

(assert (= start!22382 b!113167))

(declare-fun m!169183 () Bool)

(assert (=> b!113159 m!169183))

(declare-fun m!169185 () Bool)

(assert (=> b!113163 m!169185))

(declare-fun m!169187 () Bool)

(assert (=> b!113163 m!169187))

(assert (=> b!113164 m!169183))

(declare-fun m!169189 () Bool)

(assert (=> b!113164 m!169189))

(declare-fun m!169191 () Bool)

(assert (=> b!113164 m!169191))

(declare-fun m!169193 () Bool)

(assert (=> b!113160 m!169193))

(declare-fun m!169195 () Bool)

(assert (=> start!22382 m!169195))

(declare-fun m!169197 () Bool)

(assert (=> b!113166 m!169197))

(declare-fun m!169199 () Bool)

(assert (=> b!113165 m!169199))

(assert (=> b!113165 m!169199))

(declare-fun m!169201 () Bool)

(assert (=> b!113165 m!169201))

(declare-fun m!169203 () Bool)

(assert (=> b!113167 m!169203))

(declare-fun m!169205 () Bool)

(assert (=> b!113161 m!169205))

(check-sat (not b!113167) (not b!113159) (not b!113165) (not b!113166) (not b!113164) (not start!22382) (not b!113163) (not b!113160) (not b!113161))
