; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22380 () Bool)

(assert start!22380)

(declare-fun b!113132 () Bool)

(declare-fun e!74235 () Bool)

(declare-fun e!74238 () Bool)

(assert (=> b!113132 (= e!74235 e!74238)))

(declare-fun res!93419 () Bool)

(assert (=> b!113132 (=> (not res!93419) (not e!74238))))

(declare-fun lt!171924 () (_ BitVec 64))

(declare-fun lt!171928 () (_ BitVec 64))

(assert (=> b!113132 (= res!93419 (= lt!171924 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!171928)))))

(declare-datatypes ((array!5144 0))(
  ( (array!5145 (arr!2931 (Array (_ BitVec 32) (_ BitVec 8))) (size!2338 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4150 0))(
  ( (BitStream!4151 (buf!2746 array!5144) (currentByte!5326 (_ BitVec 32)) (currentBit!5321 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6943 0))(
  ( (Unit!6944) )
))
(declare-datatypes ((tuple2!9312 0))(
  ( (tuple2!9313 (_1!4918 Unit!6943) (_2!4918 BitStream!4150)) )
))
(declare-fun lt!171926 () tuple2!9312)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113132 (= lt!171924 (bitIndex!0 (size!2338 (buf!2746 (_2!4918 lt!171926))) (currentByte!5326 (_2!4918 lt!171926)) (currentBit!5321 (_2!4918 lt!171926))))))

(declare-fun thiss!1305 () BitStream!4150)

(assert (=> b!113132 (= lt!171928 (bitIndex!0 (size!2338 (buf!2746 thiss!1305)) (currentByte!5326 thiss!1305) (currentBit!5321 thiss!1305)))))

(declare-fun b!113133 () Bool)

(declare-fun e!74234 () Bool)

(assert (=> b!113133 (= e!74238 e!74234)))

(declare-fun res!93421 () Bool)

(assert (=> b!113133 (=> (not res!93421) (not e!74234))))

(declare-datatypes ((tuple2!9314 0))(
  ( (tuple2!9315 (_1!4919 BitStream!4150) (_2!4919 Bool)) )
))
(declare-fun lt!171929 () tuple2!9314)

(declare-fun lt!171925 () Bool)

(assert (=> b!113133 (= res!93421 (and (= (_2!4919 lt!171929) lt!171925) (= (_1!4919 lt!171929) (_2!4918 lt!171926))))))

(declare-fun readBitPure!0 (BitStream!4150) tuple2!9314)

(declare-fun readerFrom!0 (BitStream!4150 (_ BitVec 32) (_ BitVec 32)) BitStream!4150)

(assert (=> b!113133 (= lt!171929 (readBitPure!0 (readerFrom!0 (_2!4918 lt!171926) (currentBit!5321 thiss!1305) (currentByte!5326 thiss!1305))))))

(declare-fun b!113135 () Bool)

(declare-fun e!74233 () Bool)

(declare-fun array_inv!2140 (array!5144) Bool)

(assert (=> b!113135 (= e!74233 (array_inv!2140 (buf!2746 thiss!1305)))))

(declare-fun b!113136 () Bool)

(declare-fun res!93420 () Bool)

(assert (=> b!113136 (=> (not res!93420) (not e!74238))))

(declare-fun isPrefixOf!0 (BitStream!4150 BitStream!4150) Bool)

(assert (=> b!113136 (= res!93420 (isPrefixOf!0 thiss!1305 (_2!4918 lt!171926)))))

(declare-fun b!113137 () Bool)

(declare-fun res!93418 () Bool)

(declare-fun e!74237 () Bool)

(assert (=> b!113137 (=> (not res!93418) (not e!74237))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!113137 (= res!93418 (validate_offset_bits!1 ((_ sign_extend 32) (size!2338 (buf!2746 thiss!1305))) ((_ sign_extend 32) (currentByte!5326 thiss!1305)) ((_ sign_extend 32) (currentBit!5321 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!113138 () Bool)

(assert (=> b!113138 (= e!74234 (= (bitIndex!0 (size!2338 (buf!2746 (_1!4919 lt!171929))) (currentByte!5326 (_1!4919 lt!171929)) (currentBit!5321 (_1!4919 lt!171929))) lt!171924))))

(declare-fun b!113139 () Bool)

(declare-fun res!93422 () Bool)

(assert (=> b!113139 (=> (not res!93422) (not e!74237))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113139 (= res!93422 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!113140 () Bool)

(declare-fun res!93423 () Bool)

(assert (=> b!113140 (=> (not res!93423) (not e!74237))))

(assert (=> b!113140 (= res!93423 (bvslt i!615 nBits!396))))

(declare-fun res!93425 () Bool)

(assert (=> start!22380 (=> (not res!93425) (not e!74237))))

(assert (=> start!22380 (= res!93425 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22380 e!74237))

(assert (=> start!22380 true))

(declare-fun inv!12 (BitStream!4150) Bool)

(assert (=> start!22380 (and (inv!12 thiss!1305) e!74233)))

(declare-fun b!113134 () Bool)

(assert (=> b!113134 (= e!74237 (not (isPrefixOf!0 thiss!1305 (_2!4918 lt!171926))))))

(declare-fun lt!171927 () tuple2!9312)

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4150 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9312)

(assert (=> b!113134 (= lt!171927 (appendNLeastSignificantBitsLoop!0 (_2!4918 lt!171926) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!113134 e!74235))

(declare-fun res!93424 () Bool)

(assert (=> b!113134 (=> (not res!93424) (not e!74235))))

(assert (=> b!113134 (= res!93424 (= (size!2338 (buf!2746 thiss!1305)) (size!2338 (buf!2746 (_2!4918 lt!171926)))))))

(declare-fun appendBit!0 (BitStream!4150 Bool) tuple2!9312)

(assert (=> b!113134 (= lt!171926 (appendBit!0 thiss!1305 lt!171925))))

(assert (=> b!113134 (= lt!171925 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!22380 res!93425) b!113137))

(assert (= (and b!113137 res!93418) b!113139))

(assert (= (and b!113139 res!93422) b!113140))

(assert (= (and b!113140 res!93423) b!113134))

(assert (= (and b!113134 res!93424) b!113132))

(assert (= (and b!113132 res!93419) b!113136))

(assert (= (and b!113136 res!93420) b!113133))

(assert (= (and b!113133 res!93421) b!113138))

(assert (= start!22380 b!113135))

(declare-fun m!169159 () Bool)

(assert (=> start!22380 m!169159))

(declare-fun m!169161 () Bool)

(assert (=> b!113135 m!169161))

(declare-fun m!169163 () Bool)

(assert (=> b!113136 m!169163))

(declare-fun m!169165 () Bool)

(assert (=> b!113138 m!169165))

(declare-fun m!169167 () Bool)

(assert (=> b!113137 m!169167))

(declare-fun m!169169 () Bool)

(assert (=> b!113139 m!169169))

(assert (=> b!113134 m!169163))

(declare-fun m!169171 () Bool)

(assert (=> b!113134 m!169171))

(declare-fun m!169173 () Bool)

(assert (=> b!113134 m!169173))

(declare-fun m!169175 () Bool)

(assert (=> b!113133 m!169175))

(assert (=> b!113133 m!169175))

(declare-fun m!169177 () Bool)

(assert (=> b!113133 m!169177))

(declare-fun m!169179 () Bool)

(assert (=> b!113132 m!169179))

(declare-fun m!169181 () Bool)

(assert (=> b!113132 m!169181))

(push 1)

(assert (not b!113132))

(assert (not b!113133))

(assert (not b!113138))

(assert (not b!113136))

(assert (not b!113135))

(assert (not b!113137))

(assert (not b!113134))

(assert (not b!113139))

(assert (not start!22380))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

