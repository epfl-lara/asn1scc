; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41838 () Bool)

(assert start!41838)

(declare-fun b!196830 () Bool)

(declare-fun res!164705 () Bool)

(declare-fun e!135239 () Bool)

(assert (=> b!196830 (=> (not res!164705) (not e!135239))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!10086 0))(
  ( (array!10087 (arr!5376 (Array (_ BitVec 32) (_ BitVec 8))) (size!4446 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8000 0))(
  ( (BitStream!8001 (buf!4932 array!10086) (currentByte!9261 (_ BitVec 32)) (currentBit!9256 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8000)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!196830 (= res!164705 (validate_offset_bits!1 ((_ sign_extend 32) (size!4446 (buf!4932 thiss!1204))) ((_ sign_extend 32) (currentByte!9261 thiss!1204)) ((_ sign_extend 32) (currentBit!9256 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!196831 () Bool)

(declare-fun res!164710 () Bool)

(declare-fun e!135237 () Bool)

(assert (=> b!196831 (=> (not res!164710) (not e!135237))))

(declare-datatypes ((Unit!13924 0))(
  ( (Unit!13925) )
))
(declare-datatypes ((tuple2!17026 0))(
  ( (tuple2!17027 (_1!9158 Unit!13924) (_2!9158 BitStream!8000)) )
))
(declare-fun lt!306310 () tuple2!17026)

(declare-fun isPrefixOf!0 (BitStream!8000 BitStream!8000) Bool)

(assert (=> b!196831 (= res!164710 (isPrefixOf!0 thiss!1204 (_2!9158 lt!306310)))))

(declare-fun b!196832 () Bool)

(declare-fun res!164709 () Bool)

(declare-fun e!135236 () Bool)

(assert (=> b!196832 (=> res!164709 e!135236)))

(declare-fun lt!306311 () tuple2!17026)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!196832 (= res!164709 (not (invariant!0 (currentBit!9256 (_2!9158 lt!306311)) (currentByte!9261 (_2!9158 lt!306311)) (size!4446 (buf!4932 (_2!9158 lt!306311))))))))

(declare-fun b!196833 () Bool)

(declare-fun e!135240 () Bool)

(assert (=> b!196833 (= e!135239 (not e!135240))))

(declare-fun res!164706 () Bool)

(assert (=> b!196833 (=> res!164706 e!135240)))

(declare-fun lt!306317 () (_ BitVec 64))

(declare-fun lt!306312 () (_ BitVec 64))

(assert (=> b!196833 (= res!164706 (not (= lt!306317 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!306312))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!196833 (= lt!306317 (bitIndex!0 (size!4446 (buf!4932 (_2!9158 lt!306310))) (currentByte!9261 (_2!9158 lt!306310)) (currentBit!9256 (_2!9158 lt!306310))))))

(assert (=> b!196833 (= lt!306312 (bitIndex!0 (size!4446 (buf!4932 thiss!1204)) (currentByte!9261 thiss!1204) (currentBit!9256 thiss!1204)))))

(declare-fun e!135238 () Bool)

(assert (=> b!196833 e!135238))

(declare-fun res!164713 () Bool)

(assert (=> b!196833 (=> (not res!164713) (not e!135238))))

(assert (=> b!196833 (= res!164713 (= (size!4446 (buf!4932 thiss!1204)) (size!4446 (buf!4932 (_2!9158 lt!306310)))))))

(declare-fun lt!306318 () Bool)

(declare-fun appendBit!0 (BitStream!8000 Bool) tuple2!17026)

(assert (=> b!196833 (= lt!306310 (appendBit!0 thiss!1204 lt!306318))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!196833 (= lt!306318 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!196834 () Bool)

(declare-fun lt!306313 () (_ BitVec 64))

(assert (=> b!196834 (= e!135236 (or (not (= (size!4446 (buf!4932 (_2!9158 lt!306311))) (size!4446 (buf!4932 thiss!1204)))) (= lt!306313 (bvsub (bvadd lt!306312 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)))))))

(declare-fun b!196835 () Bool)

(assert (=> b!196835 (= e!135240 e!135236)))

(declare-fun res!164707 () Bool)

(assert (=> b!196835 (=> res!164707 e!135236)))

(assert (=> b!196835 (= res!164707 (not (= lt!306313 (bvsub (bvsub (bvadd lt!306317 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!196835 (= lt!306313 (bitIndex!0 (size!4446 (buf!4932 (_2!9158 lt!306311))) (currentByte!9261 (_2!9158 lt!306311)) (currentBit!9256 (_2!9158 lt!306311))))))

(assert (=> b!196835 (isPrefixOf!0 thiss!1204 (_2!9158 lt!306311))))

(declare-fun lt!306319 () Unit!13924)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8000 BitStream!8000 BitStream!8000) Unit!13924)

(assert (=> b!196835 (= lt!306319 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9158 lt!306310) (_2!9158 lt!306311)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8000 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17026)

(assert (=> b!196835 (= lt!306311 (appendBitsLSBFirstLoopTR!0 (_2!9158 lt!306310) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!196836 () Bool)

(assert (=> b!196836 (= e!135238 e!135237)))

(declare-fun res!164711 () Bool)

(assert (=> b!196836 (=> (not res!164711) (not e!135237))))

(declare-fun lt!306314 () (_ BitVec 64))

(declare-fun lt!306315 () (_ BitVec 64))

(assert (=> b!196836 (= res!164711 (= lt!306314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!306315)))))

(assert (=> b!196836 (= lt!306314 (bitIndex!0 (size!4446 (buf!4932 (_2!9158 lt!306310))) (currentByte!9261 (_2!9158 lt!306310)) (currentBit!9256 (_2!9158 lt!306310))))))

(assert (=> b!196836 (= lt!306315 (bitIndex!0 (size!4446 (buf!4932 thiss!1204)) (currentByte!9261 thiss!1204) (currentBit!9256 thiss!1204)))))

(declare-fun res!164708 () Bool)

(assert (=> start!41838 (=> (not res!164708) (not e!135239))))

(assert (=> start!41838 (= res!164708 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41838 e!135239))

(assert (=> start!41838 true))

(declare-fun e!135241 () Bool)

(declare-fun inv!12 (BitStream!8000) Bool)

(assert (=> start!41838 (and (inv!12 thiss!1204) e!135241)))

(declare-fun b!196837 () Bool)

(declare-fun e!135235 () Bool)

(assert (=> b!196837 (= e!135237 e!135235)))

(declare-fun res!164715 () Bool)

(assert (=> b!196837 (=> (not res!164715) (not e!135235))))

(declare-datatypes ((tuple2!17028 0))(
  ( (tuple2!17029 (_1!9159 BitStream!8000) (_2!9159 Bool)) )
))
(declare-fun lt!306316 () tuple2!17028)

(assert (=> b!196837 (= res!164715 (and (= (_2!9159 lt!306316) lt!306318) (= (_1!9159 lt!306316) (_2!9158 lt!306310))))))

(declare-fun readBitPure!0 (BitStream!8000) tuple2!17028)

(declare-fun readerFrom!0 (BitStream!8000 (_ BitVec 32) (_ BitVec 32)) BitStream!8000)

(assert (=> b!196837 (= lt!306316 (readBitPure!0 (readerFrom!0 (_2!9158 lt!306310) (currentBit!9256 thiss!1204) (currentByte!9261 thiss!1204))))))

(declare-fun b!196838 () Bool)

(declare-fun res!164712 () Bool)

(assert (=> b!196838 (=> (not res!164712) (not e!135239))))

(assert (=> b!196838 (= res!164712 (not (= i!590 nBits!348)))))

(declare-fun b!196839 () Bool)

(declare-fun array_inv!4187 (array!10086) Bool)

(assert (=> b!196839 (= e!135241 (array_inv!4187 (buf!4932 thiss!1204)))))

(declare-fun b!196840 () Bool)

(declare-fun res!164714 () Bool)

(assert (=> b!196840 (=> (not res!164714) (not e!135239))))

(assert (=> b!196840 (= res!164714 (invariant!0 (currentBit!9256 thiss!1204) (currentByte!9261 thiss!1204) (size!4446 (buf!4932 thiss!1204))))))

(declare-fun b!196841 () Bool)

(assert (=> b!196841 (= e!135235 (= (bitIndex!0 (size!4446 (buf!4932 (_1!9159 lt!306316))) (currentByte!9261 (_1!9159 lt!306316)) (currentBit!9256 (_1!9159 lt!306316))) lt!306314))))

(assert (= (and start!41838 res!164708) b!196830))

(assert (= (and b!196830 res!164705) b!196840))

(assert (= (and b!196840 res!164714) b!196838))

(assert (= (and b!196838 res!164712) b!196833))

(assert (= (and b!196833 res!164713) b!196836))

(assert (= (and b!196836 res!164711) b!196831))

(assert (= (and b!196831 res!164710) b!196837))

(assert (= (and b!196837 res!164715) b!196841))

(assert (= (and b!196833 (not res!164706)) b!196835))

(assert (= (and b!196835 (not res!164707)) b!196832))

(assert (= (and b!196832 (not res!164709)) b!196834))

(assert (= start!41838 b!196839))

(declare-fun m!304347 () Bool)

(assert (=> b!196836 m!304347))

(declare-fun m!304349 () Bool)

(assert (=> b!196836 m!304349))

(declare-fun m!304351 () Bool)

(assert (=> b!196840 m!304351))

(declare-fun m!304353 () Bool)

(assert (=> b!196830 m!304353))

(declare-fun m!304355 () Bool)

(assert (=> b!196839 m!304355))

(declare-fun m!304357 () Bool)

(assert (=> b!196837 m!304357))

(assert (=> b!196837 m!304357))

(declare-fun m!304359 () Bool)

(assert (=> b!196837 m!304359))

(declare-fun m!304361 () Bool)

(assert (=> start!41838 m!304361))

(declare-fun m!304363 () Bool)

(assert (=> b!196841 m!304363))

(declare-fun m!304365 () Bool)

(assert (=> b!196831 m!304365))

(assert (=> b!196833 m!304347))

(assert (=> b!196833 m!304349))

(declare-fun m!304367 () Bool)

(assert (=> b!196833 m!304367))

(declare-fun m!304369 () Bool)

(assert (=> b!196832 m!304369))

(declare-fun m!304371 () Bool)

(assert (=> b!196835 m!304371))

(declare-fun m!304373 () Bool)

(assert (=> b!196835 m!304373))

(declare-fun m!304375 () Bool)

(assert (=> b!196835 m!304375))

(declare-fun m!304377 () Bool)

(assert (=> b!196835 m!304377))

(push 1)

(assert (not b!196832))

(assert (not b!196837))

(assert (not b!196836))

(assert (not b!196831))

(assert (not b!196841))

(assert (not b!196830))

(assert (not start!41838))

(assert (not b!196839))

(assert (not b!196840))

(assert (not b!196833))

(assert (not b!196835))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

