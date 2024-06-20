; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21850 () Bool)

(assert start!21850)

(declare-fun b!110216 () Bool)

(declare-fun e!72244 () Bool)

(declare-datatypes ((array!5030 0))(
  ( (array!5031 (arr!2880 (Array (_ BitVec 32) (_ BitVec 8))) (size!2287 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4048 0))(
  ( (BitStream!4049 (buf!2681 array!5030) (currentByte!5235 (_ BitVec 32)) (currentBit!5230 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4048)

(declare-fun array_inv!2089 (array!5030) Bool)

(assert (=> b!110216 (= e!72244 (array_inv!2089 (buf!2681 thiss!1305)))))

(declare-fun b!110217 () Bool)

(declare-fun res!90981 () Bool)

(declare-fun e!72248 () Bool)

(assert (=> b!110217 (=> (not res!90981) (not e!72248))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!110217 (= res!90981 (bvsge i!615 nBits!396))))

(declare-fun b!110218 () Bool)

(declare-fun res!90985 () Bool)

(assert (=> b!110218 (=> (not res!90985) (not e!72248))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110218 (= res!90985 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun res!90983 () Bool)

(declare-fun e!72247 () Bool)

(assert (=> start!21850 (=> (not res!90983) (not e!72247))))

(assert (=> start!21850 (= res!90983 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21850 e!72247))

(assert (=> start!21850 true))

(declare-fun inv!12 (BitStream!4048) Bool)

(assert (=> start!21850 (and (inv!12 thiss!1305) e!72244)))

(declare-fun b!110219 () Bool)

(assert (=> b!110219 (= e!72247 e!72248)))

(declare-fun res!90984 () Bool)

(assert (=> b!110219 (=> (not res!90984) (not e!72248))))

(declare-fun lt!166981 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110219 (= res!90984 (validate_offset_bits!1 ((_ sign_extend 32) (size!2287 (buf!2681 thiss!1305))) ((_ sign_extend 32) (currentByte!5235 thiss!1305)) ((_ sign_extend 32) (currentBit!5230 thiss!1305)) lt!166981))))

(assert (=> b!110219 (= lt!166981 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!110220 () Bool)

(declare-fun e!72245 () Bool)

(assert (=> b!110220 (= e!72248 (not e!72245))))

(declare-fun res!90982 () Bool)

(assert (=> b!110220 (=> res!90982 e!72245)))

(declare-fun lt!166980 () (_ BitVec 64))

(assert (=> b!110220 (= res!90982 (not (= lt!166980 (bvadd lt!166980 lt!166981))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110220 (= lt!166980 (bitIndex!0 (size!2287 (buf!2681 thiss!1305)) (currentByte!5235 thiss!1305) (currentBit!5230 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4048 BitStream!4048) Bool)

(assert (=> b!110220 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!6739 0))(
  ( (Unit!6740) )
))
(declare-fun lt!166979 () Unit!6739)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4048) Unit!6739)

(assert (=> b!110220 (= lt!166979 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!110221 () Bool)

(assert (=> b!110221 (= e!72245 (bvsle (bvsub nBits!396 i!615) #b00000000000000000000000001000000))))

(declare-datatypes ((tuple2!9168 0))(
  ( (tuple2!9169 (_1!4841 BitStream!4048) (_2!4841 BitStream!4048)) )
))
(declare-fun lt!166982 () tuple2!9168)

(declare-fun reader!0 (BitStream!4048 BitStream!4048) tuple2!9168)

(assert (=> b!110221 (= lt!166982 (reader!0 thiss!1305 thiss!1305))))

(assert (= (and start!21850 res!90983) b!110219))

(assert (= (and b!110219 res!90984) b!110218))

(assert (= (and b!110218 res!90985) b!110217))

(assert (= (and b!110217 res!90981) b!110220))

(assert (= (and b!110220 (not res!90982)) b!110221))

(assert (= start!21850 b!110216))

(declare-fun m!163805 () Bool)

(assert (=> b!110219 m!163805))

(declare-fun m!163807 () Bool)

(assert (=> b!110220 m!163807))

(declare-fun m!163809 () Bool)

(assert (=> b!110220 m!163809))

(declare-fun m!163811 () Bool)

(assert (=> b!110220 m!163811))

(declare-fun m!163813 () Bool)

(assert (=> start!21850 m!163813))

(declare-fun m!163815 () Bool)

(assert (=> b!110218 m!163815))

(declare-fun m!163817 () Bool)

(assert (=> b!110221 m!163817))

(declare-fun m!163819 () Bool)

(assert (=> b!110216 m!163819))

(push 1)

(assert (not start!21850))

(assert (not b!110220))

(assert (not b!110216))

(assert (not b!110218))

(assert (not b!110219))

(assert (not b!110221))

(check-sat)

(pop 1)

(push 1)

(check-sat)

