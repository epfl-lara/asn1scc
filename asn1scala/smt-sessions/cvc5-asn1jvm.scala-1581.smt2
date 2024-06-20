; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44832 () Bool)

(assert start!44832)

(declare-fun b!215392 () Bool)

(declare-fun e!146557 () Bool)

(declare-datatypes ((array!10595 0))(
  ( (array!10596 (arr!5584 (Array (_ BitVec 32) (_ BitVec 8))) (size!4654 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8416 0))(
  ( (BitStream!8417 (buf!5189 array!10595) (currentByte!9767 (_ BitVec 32)) (currentBit!9762 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!18458 0))(
  ( (tuple2!18459 (_1!9884 BitStream!8416) (_2!9884 (_ BitVec 64))) )
))
(declare-fun lt!340127 () tuple2!18458)

(declare-datatypes ((tuple2!18460 0))(
  ( (tuple2!18461 (_1!9885 BitStream!8416) (_2!9885 BitStream!8416)) )
))
(declare-fun lt!340143 () tuple2!18460)

(assert (=> b!215392 (= e!146557 (= (_1!9884 lt!340127) (_2!9885 lt!340143)))))

(declare-fun b!215393 () Bool)

(declare-fun e!146564 () Bool)

(declare-fun e!146565 () Bool)

(assert (=> b!215393 (= e!146564 e!146565)))

(declare-fun res!181208 () Bool)

(assert (=> b!215393 (=> res!181208 e!146565)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!340148 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!340142 () (_ BitVec 64))

(assert (=> b!215393 (= res!181208 (not (= lt!340142 (bvsub (bvsub (bvadd lt!340148 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-datatypes ((Unit!15292 0))(
  ( (Unit!15293) )
))
(declare-datatypes ((tuple2!18462 0))(
  ( (tuple2!18463 (_1!9886 Unit!15292) (_2!9886 BitStream!8416)) )
))
(declare-fun lt!340151 () tuple2!18462)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!215393 (= lt!340142 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340151))) (currentByte!9767 (_2!9886 lt!340151)) (currentBit!9762 (_2!9886 lt!340151))))))

(declare-fun thiss!1204 () BitStream!8416)

(declare-fun isPrefixOf!0 (BitStream!8416 BitStream!8416) Bool)

(assert (=> b!215393 (isPrefixOf!0 thiss!1204 (_2!9886 lt!340151))))

(declare-fun lt!340128 () tuple2!18462)

(declare-fun lt!340133 () Unit!15292)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8416 BitStream!8416 BitStream!8416) Unit!15292)

(assert (=> b!215393 (= lt!340133 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9886 lt!340128) (_2!9886 lt!340151)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8416 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18462)

(assert (=> b!215393 (= lt!340151 (appendBitsLSBFirstLoopTR!0 (_2!9886 lt!340128) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!215394 () Bool)

(declare-fun e!146554 () Bool)

(declare-fun e!146555 () Bool)

(assert (=> b!215394 (= e!146554 e!146555)))

(declare-fun res!181206 () Bool)

(assert (=> b!215394 (=> (not res!181206) (not e!146555))))

(declare-fun lt!340140 () (_ BitVec 64))

(declare-fun lt!340139 () (_ BitVec 64))

(assert (=> b!215394 (= res!181206 (= lt!340140 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!340139)))))

(assert (=> b!215394 (= lt!340140 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))))))

(assert (=> b!215394 (= lt!340139 (bitIndex!0 (size!4654 (buf!5189 thiss!1204)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)))))

(declare-fun b!215395 () Bool)

(declare-fun res!181203 () Bool)

(assert (=> b!215395 (=> res!181203 e!146565)))

(assert (=> b!215395 (= res!181203 (not (isPrefixOf!0 (_2!9886 lt!340128) (_2!9886 lt!340151))))))

(declare-fun b!215396 () Bool)

(declare-fun res!181196 () Bool)

(assert (=> b!215396 (=> res!181196 e!146565)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!215396 (= res!181196 (not (invariant!0 (currentBit!9762 (_2!9886 lt!340151)) (currentByte!9767 (_2!9886 lt!340151)) (size!4654 (buf!5189 (_2!9886 lt!340151))))))))

(declare-fun b!215397 () Bool)

(declare-fun e!146568 () Bool)

(assert (=> b!215397 (= e!146568 e!146557)))

(declare-fun res!181195 () Bool)

(assert (=> b!215397 (=> (not res!181195) (not e!146557))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!215397 (= res!181195 (= (_2!9884 lt!340127) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!215397 (= (size!4654 (buf!5189 thiss!1204)) (size!4654 (buf!5189 (_2!9886 lt!340151))))))

(declare-fun b!215398 () Bool)

(declare-fun res!181202 () Bool)

(declare-fun e!146563 () Bool)

(assert (=> b!215398 (=> (not res!181202) (not e!146563))))

(assert (=> b!215398 (= res!181202 (invariant!0 (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204) (size!4654 (buf!5189 thiss!1204))))))

(declare-fun b!215399 () Bool)

(declare-fun e!146558 () Bool)

(assert (=> b!215399 (= e!146555 e!146558)))

(declare-fun res!181188 () Bool)

(assert (=> b!215399 (=> (not res!181188) (not e!146558))))

(declare-datatypes ((tuple2!18464 0))(
  ( (tuple2!18465 (_1!9887 BitStream!8416) (_2!9887 Bool)) )
))
(declare-fun lt!340146 () tuple2!18464)

(declare-fun lt!340152 () Bool)

(assert (=> b!215399 (= res!181188 (and (= (_2!9887 lt!340146) lt!340152) (= (_1!9887 lt!340146) (_2!9886 lt!340128))))))

(declare-fun readBitPure!0 (BitStream!8416) tuple2!18464)

(declare-fun readerFrom!0 (BitStream!8416 (_ BitVec 32) (_ BitVec 32)) BitStream!8416)

(assert (=> b!215399 (= lt!340146 (readBitPure!0 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204))))))

(declare-fun b!215400 () Bool)

(declare-fun e!146561 () Bool)

(assert (=> b!215400 (= e!146565 e!146561)))

(declare-fun res!181192 () Bool)

(assert (=> b!215400 (=> res!181192 e!146561)))

(declare-fun lt!340150 () tuple2!18458)

(declare-fun lt!340131 () tuple2!18460)

(assert (=> b!215400 (= res!181192 (not (= (_1!9884 lt!340150) (_2!9885 lt!340131))))))

(declare-fun lt!340153 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8416 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18458)

(assert (=> b!215400 (= lt!340150 (readNBitsLSBFirstsLoopPure!0 (_1!9885 lt!340131) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!340153))))

(declare-fun lt!340130 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!215400 (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340151)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340128))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340128))) lt!340130)))

(declare-fun lt!340144 () Unit!15292)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8416 array!10595 (_ BitVec 64)) Unit!15292)

(assert (=> b!215400 (= lt!340144 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9886 lt!340128) (buf!5189 (_2!9886 lt!340151)) lt!340130))))

(assert (=> b!215400 (= lt!340130 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!340126 () (_ BitVec 64))

(declare-fun lt!340145 () tuple2!18464)

(declare-fun lt!340147 () (_ BitVec 64))

(assert (=> b!215400 (= lt!340153 (bvor lt!340126 (ite (_2!9887 lt!340145) lt!340147 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215400 (= lt!340127 (readNBitsLSBFirstsLoopPure!0 (_1!9885 lt!340143) nBits!348 i!590 lt!340126))))

(declare-fun lt!340135 () (_ BitVec 64))

(assert (=> b!215400 (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340151)))) ((_ sign_extend 32) (currentByte!9767 thiss!1204)) ((_ sign_extend 32) (currentBit!9762 thiss!1204)) lt!340135)))

(declare-fun lt!340138 () Unit!15292)

(assert (=> b!215400 (= lt!340138 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5189 (_2!9886 lt!340151)) lt!340135))))

(assert (=> b!215400 (= lt!340126 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!215400 (= (_2!9887 lt!340145) lt!340152)))

(assert (=> b!215400 (= lt!340145 (readBitPure!0 (_1!9885 lt!340143)))))

(declare-fun reader!0 (BitStream!8416 BitStream!8416) tuple2!18460)

(assert (=> b!215400 (= lt!340131 (reader!0 (_2!9886 lt!340128) (_2!9886 lt!340151)))))

(assert (=> b!215400 (= lt!340143 (reader!0 thiss!1204 (_2!9886 lt!340151)))))

(declare-fun e!146560 () Bool)

(assert (=> b!215400 e!146560))

(declare-fun res!181198 () Bool)

(assert (=> b!215400 (=> (not res!181198) (not e!146560))))

(declare-fun lt!340137 () tuple2!18464)

(declare-fun lt!340149 () tuple2!18464)

(assert (=> b!215400 (= res!181198 (= (bitIndex!0 (size!4654 (buf!5189 (_1!9887 lt!340137))) (currentByte!9767 (_1!9887 lt!340137)) (currentBit!9762 (_1!9887 lt!340137))) (bitIndex!0 (size!4654 (buf!5189 (_1!9887 lt!340149))) (currentByte!9767 (_1!9887 lt!340149)) (currentBit!9762 (_1!9887 lt!340149)))))))

(declare-fun lt!340134 () Unit!15292)

(declare-fun lt!340129 () BitStream!8416)

(declare-fun readBitPrefixLemma!0 (BitStream!8416 BitStream!8416) Unit!15292)

(assert (=> b!215400 (= lt!340134 (readBitPrefixLemma!0 lt!340129 (_2!9886 lt!340151)))))

(assert (=> b!215400 (= lt!340149 (readBitPure!0 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))))))

(assert (=> b!215400 (= lt!340137 (readBitPure!0 lt!340129))))

(declare-fun e!146559 () Bool)

(assert (=> b!215400 e!146559))

(declare-fun res!181189 () Bool)

(assert (=> b!215400 (=> (not res!181189) (not e!146559))))

(assert (=> b!215400 (= res!181189 (invariant!0 (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204) (size!4654 (buf!5189 (_2!9886 lt!340128)))))))

(assert (=> b!215400 (= lt!340129 (BitStream!8417 (buf!5189 (_2!9886 lt!340128)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)))))

(declare-fun b!215401 () Bool)

(declare-fun res!181194 () Bool)

(declare-fun e!146567 () Bool)

(assert (=> b!215401 (=> (not res!181194) (not e!146567))))

(declare-fun withMovedBitIndex!0 (BitStream!8416 (_ BitVec 64)) BitStream!8416)

(assert (=> b!215401 (= res!181194 (= (_1!9885 lt!340131) (withMovedBitIndex!0 (_2!9885 lt!340131) (bvsub lt!340148 lt!340142))))))

(declare-fun lt!340154 () (_ BitVec 64))

(declare-fun b!215402 () Bool)

(declare-fun lt!340141 () BitStream!8416)

(assert (=> b!215402 (= e!146567 (and (= lt!340154 (bvsub lt!340148 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9885 lt!340131) lt!340141)) (= (_2!9884 lt!340127) (_2!9884 lt!340150)))))))

(declare-fun b!215403 () Bool)

(declare-fun e!146556 () Bool)

(assert (=> b!215403 (= e!146556 e!146563)))

(declare-fun res!181204 () Bool)

(assert (=> b!215403 (=> (not res!181204) (not e!146563))))

(assert (=> b!215403 (= res!181204 (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 thiss!1204))) ((_ sign_extend 32) (currentByte!9767 thiss!1204)) ((_ sign_extend 32) (currentBit!9762 thiss!1204)) lt!340135))))

(assert (=> b!215403 (= lt!340135 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!215404 () Bool)

(assert (=> b!215404 (= e!146561 e!146568)))

(declare-fun res!181190 () Bool)

(assert (=> b!215404 (=> res!181190 e!146568)))

(assert (=> b!215404 (= res!181190 (not (= (_1!9885 lt!340131) lt!340141)))))

(assert (=> b!215404 e!146567))

(declare-fun res!181200 () Bool)

(assert (=> b!215404 (=> (not res!181200) (not e!146567))))

(declare-fun lt!340132 () tuple2!18458)

(assert (=> b!215404 (= res!181200 (and (= (_2!9884 lt!340127) (_2!9884 lt!340132)) (= (_1!9884 lt!340127) (_1!9884 lt!340132))))))

(declare-fun lt!340136 () Unit!15292)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8416 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15292)

(assert (=> b!215404 (= lt!340136 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9885 lt!340143) nBits!348 i!590 lt!340126))))

(assert (=> b!215404 (= lt!340132 (readNBitsLSBFirstsLoopPure!0 lt!340141 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!340153))))

(assert (=> b!215404 (= lt!340141 (withMovedBitIndex!0 (_1!9885 lt!340143) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!215405 () Bool)

(assert (=> b!215405 (= e!146558 (= (bitIndex!0 (size!4654 (buf!5189 (_1!9887 lt!340146))) (currentByte!9767 (_1!9887 lt!340146)) (currentBit!9762 (_1!9887 lt!340146))) lt!340140))))

(declare-fun b!215406 () Bool)

(declare-fun res!181205 () Bool)

(assert (=> b!215406 (=> (not res!181205) (not e!146563))))

(assert (=> b!215406 (= res!181205 (not (= i!590 nBits!348)))))

(declare-fun b!215407 () Bool)

(declare-fun e!146566 () Bool)

(declare-fun array_inv!4395 (array!10595) Bool)

(assert (=> b!215407 (= e!146566 (array_inv!4395 (buf!5189 thiss!1204)))))

(declare-fun b!215408 () Bool)

(assert (=> b!215408 (= e!146563 (not e!146564))))

(declare-fun res!181193 () Bool)

(assert (=> b!215408 (=> res!181193 e!146564)))

(assert (=> b!215408 (= res!181193 (not (= lt!340148 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!340154))))))

(assert (=> b!215408 (= lt!340148 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))))))

(assert (=> b!215408 (= lt!340154 (bitIndex!0 (size!4654 (buf!5189 thiss!1204)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)))))

(assert (=> b!215408 e!146554))

(declare-fun res!181199 () Bool)

(assert (=> b!215408 (=> (not res!181199) (not e!146554))))

(assert (=> b!215408 (= res!181199 (= (size!4654 (buf!5189 thiss!1204)) (size!4654 (buf!5189 (_2!9886 lt!340128)))))))

(declare-fun appendBit!0 (BitStream!8416 Bool) tuple2!18462)

(assert (=> b!215408 (= lt!340128 (appendBit!0 thiss!1204 lt!340152))))

(assert (=> b!215408 (= lt!340152 (not (= (bvand v!189 lt!340147) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215408 (= lt!340147 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun res!181191 () Bool)

(assert (=> start!44832 (=> (not res!181191) (not e!146556))))

(assert (=> start!44832 (= res!181191 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44832 e!146556))

(assert (=> start!44832 true))

(declare-fun inv!12 (BitStream!8416) Bool)

(assert (=> start!44832 (and (inv!12 thiss!1204) e!146566)))

(declare-fun b!215409 () Bool)

(declare-fun res!181186 () Bool)

(assert (=> b!215409 (=> (not res!181186) (not e!146567))))

(assert (=> b!215409 (= res!181186 (= (_1!9885 lt!340143) (withMovedBitIndex!0 (_2!9885 lt!340143) (bvsub lt!340154 lt!340142))))))

(declare-fun b!215410 () Bool)

(declare-fun res!181201 () Bool)

(assert (=> b!215410 (=> res!181201 e!146565)))

(assert (=> b!215410 (= res!181201 (not (isPrefixOf!0 thiss!1204 (_2!9886 lt!340128))))))

(declare-fun b!215411 () Bool)

(declare-fun res!181197 () Bool)

(assert (=> b!215411 (=> (not res!181197) (not e!146555))))

(assert (=> b!215411 (= res!181197 (isPrefixOf!0 thiss!1204 (_2!9886 lt!340128)))))

(declare-fun b!215412 () Bool)

(assert (=> b!215412 (= e!146559 (invariant!0 (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204) (size!4654 (buf!5189 (_2!9886 lt!340151)))))))

(declare-fun b!215413 () Bool)

(declare-fun res!181187 () Bool)

(assert (=> b!215413 (=> res!181187 e!146565)))

(assert (=> b!215413 (= res!181187 (or (not (= (size!4654 (buf!5189 (_2!9886 lt!340151))) (size!4654 (buf!5189 thiss!1204)))) (not (= lt!340142 (bvsub (bvadd lt!340154 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!215414 () Bool)

(assert (=> b!215414 (= e!146560 (= (_2!9887 lt!340137) (_2!9887 lt!340149)))))

(declare-fun b!215415 () Bool)

(declare-fun res!181207 () Bool)

(assert (=> b!215415 (=> res!181207 e!146568)))

(assert (=> b!215415 (= res!181207 (not (= (bitIndex!0 (size!4654 (buf!5189 (_1!9884 lt!340127))) (currentByte!9767 (_1!9884 lt!340127)) (currentBit!9762 (_1!9884 lt!340127))) (bitIndex!0 (size!4654 (buf!5189 (_2!9885 lt!340143))) (currentByte!9767 (_2!9885 lt!340143)) (currentBit!9762 (_2!9885 lt!340143))))))))

(assert (= (and start!44832 res!181191) b!215403))

(assert (= (and b!215403 res!181204) b!215398))

(assert (= (and b!215398 res!181202) b!215406))

(assert (= (and b!215406 res!181205) b!215408))

(assert (= (and b!215408 res!181199) b!215394))

(assert (= (and b!215394 res!181206) b!215411))

(assert (= (and b!215411 res!181197) b!215399))

(assert (= (and b!215399 res!181188) b!215405))

(assert (= (and b!215408 (not res!181193)) b!215393))

(assert (= (and b!215393 (not res!181208)) b!215396))

(assert (= (and b!215396 (not res!181196)) b!215413))

(assert (= (and b!215413 (not res!181187)) b!215395))

(assert (= (and b!215395 (not res!181203)) b!215410))

(assert (= (and b!215410 (not res!181201)) b!215400))

(assert (= (and b!215400 res!181189) b!215412))

(assert (= (and b!215400 res!181198) b!215414))

(assert (= (and b!215400 (not res!181192)) b!215404))

(assert (= (and b!215404 res!181200) b!215409))

(assert (= (and b!215409 res!181186) b!215401))

(assert (= (and b!215401 res!181194) b!215402))

(assert (= (and b!215404 (not res!181190)) b!215415))

(assert (= (and b!215415 (not res!181207)) b!215397))

(assert (= (and b!215397 res!181195) b!215392))

(assert (= start!44832 b!215407))

(declare-fun m!331623 () Bool)

(assert (=> b!215408 m!331623))

(declare-fun m!331625 () Bool)

(assert (=> b!215408 m!331625))

(declare-fun m!331627 () Bool)

(assert (=> b!215408 m!331627))

(declare-fun m!331629 () Bool)

(assert (=> b!215395 m!331629))

(declare-fun m!331631 () Bool)

(assert (=> b!215404 m!331631))

(declare-fun m!331633 () Bool)

(assert (=> b!215404 m!331633))

(declare-fun m!331635 () Bool)

(assert (=> b!215404 m!331635))

(declare-fun m!331637 () Bool)

(assert (=> start!44832 m!331637))

(declare-fun m!331639 () Bool)

(assert (=> b!215410 m!331639))

(declare-fun m!331641 () Bool)

(assert (=> b!215399 m!331641))

(assert (=> b!215399 m!331641))

(declare-fun m!331643 () Bool)

(assert (=> b!215399 m!331643))

(declare-fun m!331645 () Bool)

(assert (=> b!215397 m!331645))

(declare-fun m!331647 () Bool)

(assert (=> b!215398 m!331647))

(assert (=> b!215411 m!331639))

(declare-fun m!331649 () Bool)

(assert (=> b!215401 m!331649))

(declare-fun m!331651 () Bool)

(assert (=> b!215405 m!331651))

(declare-fun m!331653 () Bool)

(assert (=> b!215409 m!331653))

(assert (=> b!215394 m!331623))

(assert (=> b!215394 m!331625))

(declare-fun m!331655 () Bool)

(assert (=> b!215415 m!331655))

(declare-fun m!331657 () Bool)

(assert (=> b!215415 m!331657))

(declare-fun m!331659 () Bool)

(assert (=> b!215396 m!331659))

(declare-fun m!331661 () Bool)

(assert (=> b!215393 m!331661))

(declare-fun m!331663 () Bool)

(assert (=> b!215393 m!331663))

(declare-fun m!331665 () Bool)

(assert (=> b!215393 m!331665))

(declare-fun m!331667 () Bool)

(assert (=> b!215393 m!331667))

(declare-fun m!331669 () Bool)

(assert (=> b!215403 m!331669))

(declare-fun m!331671 () Bool)

(assert (=> b!215407 m!331671))

(declare-fun m!331673 () Bool)

(assert (=> b!215412 m!331673))

(declare-fun m!331675 () Bool)

(assert (=> b!215400 m!331675))

(declare-fun m!331677 () Bool)

(assert (=> b!215400 m!331677))

(declare-fun m!331679 () Bool)

(assert (=> b!215400 m!331679))

(declare-fun m!331681 () Bool)

(assert (=> b!215400 m!331681))

(declare-fun m!331683 () Bool)

(assert (=> b!215400 m!331683))

(declare-fun m!331685 () Bool)

(assert (=> b!215400 m!331685))

(declare-fun m!331687 () Bool)

(assert (=> b!215400 m!331687))

(declare-fun m!331689 () Bool)

(assert (=> b!215400 m!331689))

(declare-fun m!331691 () Bool)

(assert (=> b!215400 m!331691))

(declare-fun m!331693 () Bool)

(assert (=> b!215400 m!331693))

(declare-fun m!331695 () Bool)

(assert (=> b!215400 m!331695))

(declare-fun m!331697 () Bool)

(assert (=> b!215400 m!331697))

(declare-fun m!331699 () Bool)

(assert (=> b!215400 m!331699))

(declare-fun m!331701 () Bool)

(assert (=> b!215400 m!331701))

(declare-fun m!331703 () Bool)

(assert (=> b!215400 m!331703))

(declare-fun m!331705 () Bool)

(assert (=> b!215400 m!331705))

(push 1)

(assert (not b!215394))

(assert (not b!215411))

(assert (not b!215393))

(assert (not b!215395))

(assert (not b!215403))

(assert (not b!215409))

(assert (not b!215404))

(assert (not start!44832))

(assert (not b!215405))

(assert (not b!215399))

(assert (not b!215398))

(assert (not b!215397))

(assert (not b!215400))

(assert (not b!215407))

(assert (not b!215401))

(assert (not b!215415))

(assert (not b!215408))

(assert (not b!215396))

(assert (not b!215412))

(assert (not b!215410))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!72553 () Bool)

(declare-fun lt!340528 () tuple2!18458)

(declare-fun lt!340527 () tuple2!18458)

(assert (=> d!72553 (and (= (_2!9884 lt!340528) (_2!9884 lt!340527)) (= (_1!9884 lt!340528) (_1!9884 lt!340527)))))

(declare-fun lt!340531 () Unit!15292)

(declare-fun lt!340530 () BitStream!8416)

(declare-fun lt!340529 () (_ BitVec 64))

(declare-fun lt!340532 () Bool)

(declare-fun choose!56 (BitStream!8416 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!18458 tuple2!18458 BitStream!8416 (_ BitVec 64) Bool BitStream!8416 (_ BitVec 64) tuple2!18458 tuple2!18458 BitStream!8416 (_ BitVec 64)) Unit!15292)

(assert (=> d!72553 (= lt!340531 (choose!56 (_1!9885 lt!340143) nBits!348 i!590 lt!340126 lt!340528 (tuple2!18459 (_1!9884 lt!340528) (_2!9884 lt!340528)) (_1!9884 lt!340528) (_2!9884 lt!340528) lt!340532 lt!340530 lt!340529 lt!340527 (tuple2!18459 (_1!9884 lt!340527) (_2!9884 lt!340527)) (_1!9884 lt!340527) (_2!9884 lt!340527)))))

(assert (=> d!72553 (= lt!340527 (readNBitsLSBFirstsLoopPure!0 lt!340530 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!340529))))

(assert (=> d!72553 (= lt!340529 (bvor lt!340126 (ite lt!340532 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72553 (= lt!340530 (withMovedBitIndex!0 (_1!9885 lt!340143) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!72553 (= lt!340532 (_2!9887 (readBitPure!0 (_1!9885 lt!340143))))))

(assert (=> d!72553 (= lt!340528 (readNBitsLSBFirstsLoopPure!0 (_1!9885 lt!340143) nBits!348 i!590 lt!340126))))

(assert (=> d!72553 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9885 lt!340143) nBits!348 i!590 lt!340126) lt!340531)))

(declare-fun bs!17801 () Bool)

(assert (= bs!17801 d!72553))

(assert (=> bs!17801 m!331635))

(assert (=> bs!17801 m!331679))

(declare-fun m!332017 () Bool)

(assert (=> bs!17801 m!332017))

(declare-fun m!332019 () Bool)

(assert (=> bs!17801 m!332019))

(assert (=> bs!17801 m!331685))

(assert (=> b!215404 d!72553))

(declare-datatypes ((tuple2!18490 0))(
  ( (tuple2!18491 (_1!9900 (_ BitVec 64)) (_2!9900 BitStream!8416)) )
))
(declare-fun lt!340535 () tuple2!18490)

(declare-fun d!72555 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8416 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18490)

(assert (=> d!72555 (= lt!340535 (readNBitsLSBFirstsLoop!0 lt!340141 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!340153))))

(assert (=> d!72555 (= (readNBitsLSBFirstsLoopPure!0 lt!340141 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!340153) (tuple2!18459 (_2!9900 lt!340535) (_1!9900 lt!340535)))))

(declare-fun bs!17802 () Bool)

(assert (= bs!17802 d!72555))

(declare-fun m!332021 () Bool)

(assert (=> bs!17802 m!332021))

(assert (=> b!215404 d!72555))

(declare-fun d!72557 () Bool)

(declare-fun e!146704 () Bool)

(assert (=> d!72557 e!146704))

(declare-fun res!181413 () Bool)

(assert (=> d!72557 (=> (not res!181413) (not e!146704))))

(declare-fun lt!340541 () (_ BitVec 64))

(declare-fun lt!340540 () BitStream!8416)

(assert (=> d!72557 (= res!181413 (= (bvadd lt!340541 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4654 (buf!5189 lt!340540)) (currentByte!9767 lt!340540) (currentBit!9762 lt!340540))))))

(assert (=> d!72557 (or (not (= (bvand lt!340541 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!340541 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!340541 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72557 (= lt!340541 (bitIndex!0 (size!4654 (buf!5189 (_1!9885 lt!340143))) (currentByte!9767 (_1!9885 lt!340143)) (currentBit!9762 (_1!9885 lt!340143))))))

(declare-fun moveBitIndex!0 (BitStream!8416 (_ BitVec 64)) tuple2!18462)

(assert (=> d!72557 (= lt!340540 (_2!9886 (moveBitIndex!0 (_1!9885 lt!340143) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8416 (_ BitVec 64)) Bool)

(assert (=> d!72557 (moveBitIndexPrecond!0 (_1!9885 lt!340143) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!72557 (= (withMovedBitIndex!0 (_1!9885 lt!340143) #b0000000000000000000000000000000000000000000000000000000000000001) lt!340540)))

(declare-fun b!215633 () Bool)

(assert (=> b!215633 (= e!146704 (= (size!4654 (buf!5189 (_1!9885 lt!340143))) (size!4654 (buf!5189 lt!340540))))))

(assert (= (and d!72557 res!181413) b!215633))

(declare-fun m!332025 () Bool)

(assert (=> d!72557 m!332025))

(declare-fun m!332027 () Bool)

(assert (=> d!72557 m!332027))

(declare-fun m!332029 () Bool)

(assert (=> d!72557 m!332029))

(declare-fun m!332031 () Bool)

(assert (=> d!72557 m!332031))

(assert (=> b!215404 d!72557))

(declare-fun d!72565 () Bool)

(declare-fun e!146707 () Bool)

(assert (=> d!72565 e!146707))

(declare-fun res!181419 () Bool)

(assert (=> d!72565 (=> (not res!181419) (not e!146707))))

(declare-fun lt!340554 () (_ BitVec 64))

(declare-fun lt!340559 () (_ BitVec 64))

(declare-fun lt!340555 () (_ BitVec 64))

(assert (=> d!72565 (= res!181419 (= lt!340559 (bvsub lt!340555 lt!340554)))))

(assert (=> d!72565 (or (= (bvand lt!340555 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340554 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340555 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340555 lt!340554) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!72565 (= lt!340554 (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9884 lt!340127)))) ((_ sign_extend 32) (currentByte!9767 (_1!9884 lt!340127))) ((_ sign_extend 32) (currentBit!9762 (_1!9884 lt!340127)))))))

(declare-fun lt!340556 () (_ BitVec 64))

(declare-fun lt!340558 () (_ BitVec 64))

(assert (=> d!72565 (= lt!340555 (bvmul lt!340556 lt!340558))))

(assert (=> d!72565 (or (= lt!340556 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!340558 (bvsdiv (bvmul lt!340556 lt!340558) lt!340556)))))

(assert (=> d!72565 (= lt!340558 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72565 (= lt!340556 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9884 lt!340127)))))))

(assert (=> d!72565 (= lt!340559 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_1!9884 lt!340127))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_1!9884 lt!340127)))))))

(assert (=> d!72565 (invariant!0 (currentBit!9762 (_1!9884 lt!340127)) (currentByte!9767 (_1!9884 lt!340127)) (size!4654 (buf!5189 (_1!9884 lt!340127))))))

(assert (=> d!72565 (= (bitIndex!0 (size!4654 (buf!5189 (_1!9884 lt!340127))) (currentByte!9767 (_1!9884 lt!340127)) (currentBit!9762 (_1!9884 lt!340127))) lt!340559)))

(declare-fun b!215638 () Bool)

(declare-fun res!181418 () Bool)

(assert (=> b!215638 (=> (not res!181418) (not e!146707))))

(assert (=> b!215638 (= res!181418 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340559))))

(declare-fun b!215639 () Bool)

(declare-fun lt!340557 () (_ BitVec 64))

(assert (=> b!215639 (= e!146707 (bvsle lt!340559 (bvmul lt!340557 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!215639 (or (= lt!340557 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!340557 #b0000000000000000000000000000000000000000000000000000000000001000) lt!340557)))))

(assert (=> b!215639 (= lt!340557 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9884 lt!340127)))))))

(assert (= (and d!72565 res!181419) b!215638))

(assert (= (and b!215638 res!181418) b!215639))

(declare-fun m!332033 () Bool)

(assert (=> d!72565 m!332033))

(declare-fun m!332035 () Bool)

(assert (=> d!72565 m!332035))

(assert (=> b!215415 d!72565))

(declare-fun d!72567 () Bool)

(declare-fun e!146708 () Bool)

(assert (=> d!72567 e!146708))

(declare-fun res!181421 () Bool)

(assert (=> d!72567 (=> (not res!181421) (not e!146708))))

(declare-fun lt!340560 () (_ BitVec 64))

(declare-fun lt!340561 () (_ BitVec 64))

(declare-fun lt!340565 () (_ BitVec 64))

(assert (=> d!72567 (= res!181421 (= lt!340565 (bvsub lt!340561 lt!340560)))))

(assert (=> d!72567 (or (= (bvand lt!340561 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340560 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340561 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340561 lt!340560) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72567 (= lt!340560 (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9885 lt!340143)))) ((_ sign_extend 32) (currentByte!9767 (_2!9885 lt!340143))) ((_ sign_extend 32) (currentBit!9762 (_2!9885 lt!340143)))))))

(declare-fun lt!340562 () (_ BitVec 64))

(declare-fun lt!340564 () (_ BitVec 64))

(assert (=> d!72567 (= lt!340561 (bvmul lt!340562 lt!340564))))

(assert (=> d!72567 (or (= lt!340562 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!340564 (bvsdiv (bvmul lt!340562 lt!340564) lt!340562)))))

(assert (=> d!72567 (= lt!340564 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72567 (= lt!340562 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9885 lt!340143)))))))

(assert (=> d!72567 (= lt!340565 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_2!9885 lt!340143))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_2!9885 lt!340143)))))))

(assert (=> d!72567 (invariant!0 (currentBit!9762 (_2!9885 lt!340143)) (currentByte!9767 (_2!9885 lt!340143)) (size!4654 (buf!5189 (_2!9885 lt!340143))))))

(assert (=> d!72567 (= (bitIndex!0 (size!4654 (buf!5189 (_2!9885 lt!340143))) (currentByte!9767 (_2!9885 lt!340143)) (currentBit!9762 (_2!9885 lt!340143))) lt!340565)))

(declare-fun b!215640 () Bool)

(declare-fun res!181420 () Bool)

(assert (=> b!215640 (=> (not res!181420) (not e!146708))))

(assert (=> b!215640 (= res!181420 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340565))))

(declare-fun b!215641 () Bool)

(declare-fun lt!340563 () (_ BitVec 64))

(assert (=> b!215641 (= e!146708 (bvsle lt!340565 (bvmul lt!340563 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!215641 (or (= lt!340563 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!340563 #b0000000000000000000000000000000000000000000000000000000000001000) lt!340563)))))

(assert (=> b!215641 (= lt!340563 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9885 lt!340143)))))))

(assert (= (and d!72567 res!181421) b!215640))

(assert (= (and b!215640 res!181420) b!215641))

(declare-fun m!332037 () Bool)

(assert (=> d!72567 m!332037))

(declare-fun m!332039 () Bool)

(assert (=> d!72567 m!332039))

(assert (=> b!215415 d!72567))

(declare-fun d!72569 () Bool)

(declare-fun e!146709 () Bool)

(assert (=> d!72569 e!146709))

(declare-fun res!181423 () Bool)

(assert (=> d!72569 (=> (not res!181423) (not e!146709))))

(declare-fun lt!340571 () (_ BitVec 64))

(declare-fun lt!340567 () (_ BitVec 64))

(declare-fun lt!340566 () (_ BitVec 64))

(assert (=> d!72569 (= res!181423 (= lt!340571 (bvsub lt!340567 lt!340566)))))

(assert (=> d!72569 (or (= (bvand lt!340567 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340566 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340567 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340567 lt!340566) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72569 (= lt!340566 (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340128)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340128))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340128)))))))

(declare-fun lt!340568 () (_ BitVec 64))

(declare-fun lt!340570 () (_ BitVec 64))

(assert (=> d!72569 (= lt!340567 (bvmul lt!340568 lt!340570))))

(assert (=> d!72569 (or (= lt!340568 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!340570 (bvsdiv (bvmul lt!340568 lt!340570) lt!340568)))))

(assert (=> d!72569 (= lt!340570 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72569 (= lt!340568 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340128)))))))

(assert (=> d!72569 (= lt!340571 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340128))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340128)))))))

(assert (=> d!72569 (invariant!0 (currentBit!9762 (_2!9886 lt!340128)) (currentByte!9767 (_2!9886 lt!340128)) (size!4654 (buf!5189 (_2!9886 lt!340128))))))

(assert (=> d!72569 (= (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))) lt!340571)))

(declare-fun b!215642 () Bool)

(declare-fun res!181422 () Bool)

(assert (=> b!215642 (=> (not res!181422) (not e!146709))))

(assert (=> b!215642 (= res!181422 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340571))))

(declare-fun b!215643 () Bool)

(declare-fun lt!340569 () (_ BitVec 64))

(assert (=> b!215643 (= e!146709 (bvsle lt!340571 (bvmul lt!340569 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!215643 (or (= lt!340569 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!340569 #b0000000000000000000000000000000000000000000000000000000000001000) lt!340569)))))

(assert (=> b!215643 (= lt!340569 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340128)))))))

(assert (= (and d!72569 res!181423) b!215642))

(assert (= (and b!215642 res!181422) b!215643))

(declare-fun m!332041 () Bool)

(assert (=> d!72569 m!332041))

(declare-fun m!332043 () Bool)

(assert (=> d!72569 m!332043))

(assert (=> b!215394 d!72569))

(declare-fun d!72571 () Bool)

(declare-fun e!146710 () Bool)

(assert (=> d!72571 e!146710))

(declare-fun res!181425 () Bool)

(assert (=> d!72571 (=> (not res!181425) (not e!146710))))

(declare-fun lt!340573 () (_ BitVec 64))

(declare-fun lt!340572 () (_ BitVec 64))

(declare-fun lt!340577 () (_ BitVec 64))

(assert (=> d!72571 (= res!181425 (= lt!340577 (bvsub lt!340573 lt!340572)))))

(assert (=> d!72571 (or (= (bvand lt!340573 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340572 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340573 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340573 lt!340572) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72571 (= lt!340572 (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 thiss!1204))) ((_ sign_extend 32) (currentByte!9767 thiss!1204)) ((_ sign_extend 32) (currentBit!9762 thiss!1204))))))

(declare-fun lt!340574 () (_ BitVec 64))

(declare-fun lt!340576 () (_ BitVec 64))

(assert (=> d!72571 (= lt!340573 (bvmul lt!340574 lt!340576))))

(assert (=> d!72571 (or (= lt!340574 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!340576 (bvsdiv (bvmul lt!340574 lt!340576) lt!340574)))))

(assert (=> d!72571 (= lt!340576 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72571 (= lt!340574 ((_ sign_extend 32) (size!4654 (buf!5189 thiss!1204))))))

(assert (=> d!72571 (= lt!340577 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 thiss!1204))))))

(assert (=> d!72571 (invariant!0 (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204) (size!4654 (buf!5189 thiss!1204)))))

(assert (=> d!72571 (= (bitIndex!0 (size!4654 (buf!5189 thiss!1204)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)) lt!340577)))

(declare-fun b!215644 () Bool)

(declare-fun res!181424 () Bool)

(assert (=> b!215644 (=> (not res!181424) (not e!146710))))

(assert (=> b!215644 (= res!181424 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340577))))

(declare-fun b!215645 () Bool)

(declare-fun lt!340575 () (_ BitVec 64))

(assert (=> b!215645 (= e!146710 (bvsle lt!340577 (bvmul lt!340575 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!215645 (or (= lt!340575 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!340575 #b0000000000000000000000000000000000000000000000000000000000001000) lt!340575)))))

(assert (=> b!215645 (= lt!340575 ((_ sign_extend 32) (size!4654 (buf!5189 thiss!1204))))))

(assert (= (and d!72571 res!181425) b!215644))

(assert (= (and b!215644 res!181424) b!215645))

(declare-fun m!332045 () Bool)

(assert (=> d!72571 m!332045))

(assert (=> d!72571 m!331647))

(assert (=> b!215394 d!72571))

(declare-fun d!72573 () Bool)

(declare-fun e!146711 () Bool)

(assert (=> d!72573 e!146711))

(declare-fun res!181427 () Bool)

(assert (=> d!72573 (=> (not res!181427) (not e!146711))))

(declare-fun lt!340583 () (_ BitVec 64))

(declare-fun lt!340578 () (_ BitVec 64))

(declare-fun lt!340579 () (_ BitVec 64))

(assert (=> d!72573 (= res!181427 (= lt!340583 (bvsub lt!340579 lt!340578)))))

(assert (=> d!72573 (or (= (bvand lt!340579 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340578 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340579 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340579 lt!340578) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72573 (= lt!340578 (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!340146)))) ((_ sign_extend 32) (currentByte!9767 (_1!9887 lt!340146))) ((_ sign_extend 32) (currentBit!9762 (_1!9887 lt!340146)))))))

(declare-fun lt!340580 () (_ BitVec 64))

(declare-fun lt!340582 () (_ BitVec 64))

(assert (=> d!72573 (= lt!340579 (bvmul lt!340580 lt!340582))))

(assert (=> d!72573 (or (= lt!340580 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!340582 (bvsdiv (bvmul lt!340580 lt!340582) lt!340580)))))

(assert (=> d!72573 (= lt!340582 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72573 (= lt!340580 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!340146)))))))

(assert (=> d!72573 (= lt!340583 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_1!9887 lt!340146))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_1!9887 lt!340146)))))))

(assert (=> d!72573 (invariant!0 (currentBit!9762 (_1!9887 lt!340146)) (currentByte!9767 (_1!9887 lt!340146)) (size!4654 (buf!5189 (_1!9887 lt!340146))))))

(assert (=> d!72573 (= (bitIndex!0 (size!4654 (buf!5189 (_1!9887 lt!340146))) (currentByte!9767 (_1!9887 lt!340146)) (currentBit!9762 (_1!9887 lt!340146))) lt!340583)))

(declare-fun b!215646 () Bool)

(declare-fun res!181426 () Bool)

(assert (=> b!215646 (=> (not res!181426) (not e!146711))))

(assert (=> b!215646 (= res!181426 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340583))))

(declare-fun b!215647 () Bool)

(declare-fun lt!340581 () (_ BitVec 64))

(assert (=> b!215647 (= e!146711 (bvsle lt!340583 (bvmul lt!340581 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!215647 (or (= lt!340581 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!340581 #b0000000000000000000000000000000000000000000000000000000000001000) lt!340581)))))

(assert (=> b!215647 (= lt!340581 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!340146)))))))

(assert (= (and d!72573 res!181427) b!215646))

(assert (= (and b!215646 res!181426) b!215647))

(declare-fun m!332047 () Bool)

(assert (=> d!72573 m!332047))

(declare-fun m!332049 () Bool)

(assert (=> d!72573 m!332049))

(assert (=> b!215405 d!72573))

(declare-fun d!72575 () Bool)

(declare-fun res!181436 () Bool)

(declare-fun e!146716 () Bool)

(assert (=> d!72575 (=> (not res!181436) (not e!146716))))

(assert (=> d!72575 (= res!181436 (= (size!4654 (buf!5189 (_2!9886 lt!340128))) (size!4654 (buf!5189 (_2!9886 lt!340151)))))))

(assert (=> d!72575 (= (isPrefixOf!0 (_2!9886 lt!340128) (_2!9886 lt!340151)) e!146716)))

(declare-fun b!215654 () Bool)

(declare-fun res!181434 () Bool)

(assert (=> b!215654 (=> (not res!181434) (not e!146716))))

(assert (=> b!215654 (= res!181434 (bvsle (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340151))) (currentByte!9767 (_2!9886 lt!340151)) (currentBit!9762 (_2!9886 lt!340151)))))))

(declare-fun b!215655 () Bool)

(declare-fun e!146717 () Bool)

(assert (=> b!215655 (= e!146716 e!146717)))

(declare-fun res!181435 () Bool)

(assert (=> b!215655 (=> res!181435 e!146717)))

(assert (=> b!215655 (= res!181435 (= (size!4654 (buf!5189 (_2!9886 lt!340128))) #b00000000000000000000000000000000))))

(declare-fun b!215656 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10595 array!10595 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!215656 (= e!146717 (arrayBitRangesEq!0 (buf!5189 (_2!9886 lt!340128)) (buf!5189 (_2!9886 lt!340151)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128)))))))

(assert (= (and d!72575 res!181436) b!215654))

(assert (= (and b!215654 res!181434) b!215655))

(assert (= (and b!215655 (not res!181435)) b!215656))

(assert (=> b!215654 m!331623))

(assert (=> b!215654 m!331661))

(assert (=> b!215656 m!331623))

(assert (=> b!215656 m!331623))

(declare-fun m!332051 () Bool)

(assert (=> b!215656 m!332051))

(assert (=> b!215395 d!72575))

(declare-fun d!72577 () Bool)

(assert (=> d!72577 (= (invariant!0 (currentBit!9762 (_2!9886 lt!340151)) (currentByte!9767 (_2!9886 lt!340151)) (size!4654 (buf!5189 (_2!9886 lt!340151)))) (and (bvsge (currentBit!9762 (_2!9886 lt!340151)) #b00000000000000000000000000000000) (bvslt (currentBit!9762 (_2!9886 lt!340151)) #b00000000000000000000000000001000) (bvsge (currentByte!9767 (_2!9886 lt!340151)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9767 (_2!9886 lt!340151)) (size!4654 (buf!5189 (_2!9886 lt!340151)))) (and (= (currentBit!9762 (_2!9886 lt!340151)) #b00000000000000000000000000000000) (= (currentByte!9767 (_2!9886 lt!340151)) (size!4654 (buf!5189 (_2!9886 lt!340151))))))))))

(assert (=> b!215396 d!72577))

(declare-fun d!72579 () Bool)

(assert (=> d!72579 (= (array_inv!4395 (buf!5189 thiss!1204)) (bvsge (size!4654 (buf!5189 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!215407 d!72579))

(declare-fun d!72581 () Bool)

(assert (=> d!72581 (= (onesLSBLong!0 nBits!348) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!348))))))

(assert (=> b!215397 d!72581))

(assert (=> b!215408 d!72569))

(assert (=> b!215408 d!72571))

(declare-fun b!215682 () Bool)

(declare-fun res!181459 () Bool)

(declare-fun e!146730 () Bool)

(assert (=> b!215682 (=> (not res!181459) (not e!146730))))

(declare-fun lt!340670 () tuple2!18462)

(assert (=> b!215682 (= res!181459 (isPrefixOf!0 thiss!1204 (_2!9886 lt!340670)))))

(declare-fun d!72583 () Bool)

(assert (=> d!72583 e!146730))

(declare-fun res!181457 () Bool)

(assert (=> d!72583 (=> (not res!181457) (not e!146730))))

(assert (=> d!72583 (= res!181457 (= (size!4654 (buf!5189 thiss!1204)) (size!4654 (buf!5189 (_2!9886 lt!340670)))))))

(declare-fun choose!16 (BitStream!8416 Bool) tuple2!18462)

(assert (=> d!72583 (= lt!340670 (choose!16 thiss!1204 lt!340152))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!72583 (validate_offset_bit!0 ((_ sign_extend 32) (size!4654 (buf!5189 thiss!1204))) ((_ sign_extend 32) (currentByte!9767 thiss!1204)) ((_ sign_extend 32) (currentBit!9762 thiss!1204)))))

(assert (=> d!72583 (= (appendBit!0 thiss!1204 lt!340152) lt!340670)))

(declare-fun b!215684 () Bool)

(declare-fun e!146731 () Bool)

(declare-fun lt!340671 () tuple2!18464)

(assert (=> b!215684 (= e!146731 (= (bitIndex!0 (size!4654 (buf!5189 (_1!9887 lt!340671))) (currentByte!9767 (_1!9887 lt!340671)) (currentBit!9762 (_1!9887 lt!340671))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340670))) (currentByte!9767 (_2!9886 lt!340670)) (currentBit!9762 (_2!9886 lt!340670)))))))

(declare-fun b!215681 () Bool)

(declare-fun res!181456 () Bool)

(assert (=> b!215681 (=> (not res!181456) (not e!146730))))

(declare-fun lt!340673 () (_ BitVec 64))

(declare-fun lt!340672 () (_ BitVec 64))

(assert (=> b!215681 (= res!181456 (= (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340670))) (currentByte!9767 (_2!9886 lt!340670)) (currentBit!9762 (_2!9886 lt!340670))) (bvadd lt!340672 lt!340673)))))

(assert (=> b!215681 (or (not (= (bvand lt!340672 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340673 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!340672 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!340672 lt!340673) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215681 (= lt!340673 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!215681 (= lt!340672 (bitIndex!0 (size!4654 (buf!5189 thiss!1204)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)))))

(declare-fun b!215683 () Bool)

(assert (=> b!215683 (= e!146730 e!146731)))

(declare-fun res!181458 () Bool)

(assert (=> b!215683 (=> (not res!181458) (not e!146731))))

(assert (=> b!215683 (= res!181458 (and (= (_2!9887 lt!340671) lt!340152) (= (_1!9887 lt!340671) (_2!9886 lt!340670))))))

(assert (=> b!215683 (= lt!340671 (readBitPure!0 (readerFrom!0 (_2!9886 lt!340670) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204))))))

(assert (= (and d!72583 res!181457) b!215681))

(assert (= (and b!215681 res!181456) b!215682))

(assert (= (and b!215682 res!181459) b!215683))

(assert (= (and b!215683 res!181458) b!215684))

(declare-fun m!332095 () Bool)

(assert (=> b!215681 m!332095))

(assert (=> b!215681 m!331625))

(declare-fun m!332097 () Bool)

(assert (=> b!215683 m!332097))

(assert (=> b!215683 m!332097))

(declare-fun m!332099 () Bool)

(assert (=> b!215683 m!332099))

(declare-fun m!332101 () Bool)

(assert (=> b!215682 m!332101))

(declare-fun m!332103 () Bool)

(assert (=> b!215684 m!332103))

(assert (=> b!215684 m!332095))

(declare-fun m!332105 () Bool)

(assert (=> d!72583 m!332105))

(declare-fun m!332107 () Bool)

(assert (=> d!72583 m!332107))

(assert (=> b!215408 d!72583))

(declare-fun d!72599 () Bool)

(assert (=> d!72599 (= (invariant!0 (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204) (size!4654 (buf!5189 thiss!1204))) (and (bvsge (currentBit!9762 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9762 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9767 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9767 thiss!1204) (size!4654 (buf!5189 thiss!1204))) (and (= (currentBit!9762 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9767 thiss!1204) (size!4654 (buf!5189 thiss!1204)))))))))

(assert (=> b!215398 d!72599))

(declare-fun d!72601 () Bool)

(assert (=> d!72601 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204) (size!4654 (buf!5189 thiss!1204))))))

(declare-fun bs!17811 () Bool)

(assert (= bs!17811 d!72601))

(assert (=> bs!17811 m!331647))

(assert (=> start!44832 d!72601))

(declare-fun d!72607 () Bool)

(declare-fun e!146734 () Bool)

(assert (=> d!72607 e!146734))

(declare-fun res!181466 () Bool)

(assert (=> d!72607 (=> (not res!181466) (not e!146734))))

(declare-fun lt!340691 () BitStream!8416)

(declare-fun lt!340692 () (_ BitVec 64))

(assert (=> d!72607 (= res!181466 (= (bvadd lt!340692 (bvsub lt!340154 lt!340142)) (bitIndex!0 (size!4654 (buf!5189 lt!340691)) (currentByte!9767 lt!340691) (currentBit!9762 lt!340691))))))

(assert (=> d!72607 (or (not (= (bvand lt!340692 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340154 lt!340142) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!340692 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!340692 (bvsub lt!340154 lt!340142)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72607 (= lt!340692 (bitIndex!0 (size!4654 (buf!5189 (_2!9885 lt!340143))) (currentByte!9767 (_2!9885 lt!340143)) (currentBit!9762 (_2!9885 lt!340143))))))

(assert (=> d!72607 (= lt!340691 (_2!9886 (moveBitIndex!0 (_2!9885 lt!340143) (bvsub lt!340154 lt!340142))))))

(assert (=> d!72607 (moveBitIndexPrecond!0 (_2!9885 lt!340143) (bvsub lt!340154 lt!340142))))

(assert (=> d!72607 (= (withMovedBitIndex!0 (_2!9885 lt!340143) (bvsub lt!340154 lt!340142)) lt!340691)))

(declare-fun b!215693 () Bool)

(assert (=> b!215693 (= e!146734 (= (size!4654 (buf!5189 (_2!9885 lt!340143))) (size!4654 (buf!5189 lt!340691))))))

(assert (= (and d!72607 res!181466) b!215693))

(declare-fun m!332119 () Bool)

(assert (=> d!72607 m!332119))

(assert (=> d!72607 m!331657))

(declare-fun m!332121 () Bool)

(assert (=> d!72607 m!332121))

(declare-fun m!332123 () Bool)

(assert (=> d!72607 m!332123))

(assert (=> b!215409 d!72607))

(declare-fun d!72611 () Bool)

(declare-datatypes ((tuple2!18492 0))(
  ( (tuple2!18493 (_1!9901 Bool) (_2!9901 BitStream!8416)) )
))
(declare-fun lt!340697 () tuple2!18492)

(declare-fun readBit!0 (BitStream!8416) tuple2!18492)

(assert (=> d!72611 (= lt!340697 (readBit!0 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204))))))

(assert (=> d!72611 (= (readBitPure!0 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204))) (tuple2!18465 (_2!9901 lt!340697) (_1!9901 lt!340697)))))

(declare-fun bs!17814 () Bool)

(assert (= bs!17814 d!72611))

(assert (=> bs!17814 m!331641))

(declare-fun m!332129 () Bool)

(assert (=> bs!17814 m!332129))

(assert (=> b!215399 d!72611))

(declare-fun d!72619 () Bool)

(declare-fun e!146737 () Bool)

(assert (=> d!72619 e!146737))

(declare-fun res!181470 () Bool)

(assert (=> d!72619 (=> (not res!181470) (not e!146737))))

(assert (=> d!72619 (= res!181470 (invariant!0 (currentBit!9762 (_2!9886 lt!340128)) (currentByte!9767 (_2!9886 lt!340128)) (size!4654 (buf!5189 (_2!9886 lt!340128)))))))

(assert (=> d!72619 (= (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204)) (BitStream!8417 (buf!5189 (_2!9886 lt!340128)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)))))

(declare-fun b!215696 () Bool)

(assert (=> b!215696 (= e!146737 (invariant!0 (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204) (size!4654 (buf!5189 (_2!9886 lt!340128)))))))

(assert (= (and d!72619 res!181470) b!215696))

(assert (=> d!72619 m!332043))

(assert (=> b!215696 m!331681))

(assert (=> b!215399 d!72619))

(declare-fun d!72621 () Bool)

(declare-fun res!181473 () Bool)

(declare-fun e!146738 () Bool)

(assert (=> d!72621 (=> (not res!181473) (not e!146738))))

(assert (=> d!72621 (= res!181473 (= (size!4654 (buf!5189 thiss!1204)) (size!4654 (buf!5189 (_2!9886 lt!340128)))))))

(assert (=> d!72621 (= (isPrefixOf!0 thiss!1204 (_2!9886 lt!340128)) e!146738)))

(declare-fun b!215697 () Bool)

(declare-fun res!181471 () Bool)

(assert (=> b!215697 (=> (not res!181471) (not e!146738))))

(assert (=> b!215697 (= res!181471 (bvsle (bitIndex!0 (size!4654 (buf!5189 thiss!1204)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128)))))))

(declare-fun b!215698 () Bool)

(declare-fun e!146739 () Bool)

(assert (=> b!215698 (= e!146738 e!146739)))

(declare-fun res!181472 () Bool)

(assert (=> b!215698 (=> res!181472 e!146739)))

(assert (=> b!215698 (= res!181472 (= (size!4654 (buf!5189 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!215699 () Bool)

(assert (=> b!215699 (= e!146739 (arrayBitRangesEq!0 (buf!5189 thiss!1204) (buf!5189 (_2!9886 lt!340128)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 thiss!1204)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))))))

(assert (= (and d!72621 res!181473) b!215697))

(assert (= (and b!215697 res!181471) b!215698))

(assert (= (and b!215698 (not res!181472)) b!215699))

(assert (=> b!215697 m!331625))

(assert (=> b!215697 m!331623))

(assert (=> b!215699 m!331625))

(assert (=> b!215699 m!331625))

(declare-fun m!332131 () Bool)

(assert (=> b!215699 m!332131))

(assert (=> b!215410 d!72621))

(declare-fun b!215750 () Bool)

(declare-fun res!181518 () Bool)

(declare-fun e!146768 () Bool)

(assert (=> b!215750 (=> (not res!181518) (not e!146768))))

(declare-fun lt!340837 () tuple2!18460)

(assert (=> b!215750 (= res!181518 (isPrefixOf!0 (_1!9885 lt!340837) thiss!1204))))

(declare-fun b!215751 () Bool)

(declare-fun e!146769 () Unit!15292)

(declare-fun Unit!15313 () Unit!15292)

(assert (=> b!215751 (= e!146769 Unit!15313)))

(declare-fun d!72623 () Bool)

(assert (=> d!72623 e!146768))

(declare-fun res!181519 () Bool)

(assert (=> d!72623 (=> (not res!181519) (not e!146768))))

(assert (=> d!72623 (= res!181519 (isPrefixOf!0 (_1!9885 lt!340837) (_2!9885 lt!340837)))))

(declare-fun lt!340838 () BitStream!8416)

(assert (=> d!72623 (= lt!340837 (tuple2!18461 lt!340838 (_2!9886 lt!340151)))))

(declare-fun lt!340829 () Unit!15292)

(declare-fun lt!340835 () Unit!15292)

(assert (=> d!72623 (= lt!340829 lt!340835)))

(assert (=> d!72623 (isPrefixOf!0 lt!340838 (_2!9886 lt!340151))))

(assert (=> d!72623 (= lt!340835 (lemmaIsPrefixTransitive!0 lt!340838 (_2!9886 lt!340151) (_2!9886 lt!340151)))))

(declare-fun lt!340827 () Unit!15292)

(declare-fun lt!340822 () Unit!15292)

(assert (=> d!72623 (= lt!340827 lt!340822)))

(assert (=> d!72623 (isPrefixOf!0 lt!340838 (_2!9886 lt!340151))))

(assert (=> d!72623 (= lt!340822 (lemmaIsPrefixTransitive!0 lt!340838 thiss!1204 (_2!9886 lt!340151)))))

(declare-fun lt!340836 () Unit!15292)

(assert (=> d!72623 (= lt!340836 e!146769)))

(declare-fun c!10519 () Bool)

(assert (=> d!72623 (= c!10519 (not (= (size!4654 (buf!5189 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!340819 () Unit!15292)

(declare-fun lt!340830 () Unit!15292)

(assert (=> d!72623 (= lt!340819 lt!340830)))

(assert (=> d!72623 (isPrefixOf!0 (_2!9886 lt!340151) (_2!9886 lt!340151))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8416) Unit!15292)

(assert (=> d!72623 (= lt!340830 (lemmaIsPrefixRefl!0 (_2!9886 lt!340151)))))

(declare-fun lt!340820 () Unit!15292)

(declare-fun lt!340824 () Unit!15292)

(assert (=> d!72623 (= lt!340820 lt!340824)))

(assert (=> d!72623 (= lt!340824 (lemmaIsPrefixRefl!0 (_2!9886 lt!340151)))))

(declare-fun lt!340828 () Unit!15292)

(declare-fun lt!340833 () Unit!15292)

(assert (=> d!72623 (= lt!340828 lt!340833)))

(assert (=> d!72623 (isPrefixOf!0 lt!340838 lt!340838)))

(assert (=> d!72623 (= lt!340833 (lemmaIsPrefixRefl!0 lt!340838))))

(declare-fun lt!340825 () Unit!15292)

(declare-fun lt!340823 () Unit!15292)

(assert (=> d!72623 (= lt!340825 lt!340823)))

(assert (=> d!72623 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!72623 (= lt!340823 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!72623 (= lt!340838 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)))))

(assert (=> d!72623 (isPrefixOf!0 thiss!1204 (_2!9886 lt!340151))))

(assert (=> d!72623 (= (reader!0 thiss!1204 (_2!9886 lt!340151)) lt!340837)))

(declare-fun b!215752 () Bool)

(declare-fun lt!340821 () Unit!15292)

(assert (=> b!215752 (= e!146769 lt!340821)))

(declare-fun lt!340832 () (_ BitVec 64))

(assert (=> b!215752 (= lt!340832 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!340834 () (_ BitVec 64))

(assert (=> b!215752 (= lt!340834 (bitIndex!0 (size!4654 (buf!5189 thiss!1204)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10595 array!10595 (_ BitVec 64) (_ BitVec 64)) Unit!15292)

(assert (=> b!215752 (= lt!340821 (arrayBitRangesEqSymmetric!0 (buf!5189 thiss!1204) (buf!5189 (_2!9886 lt!340151)) lt!340832 lt!340834))))

(assert (=> b!215752 (arrayBitRangesEq!0 (buf!5189 (_2!9886 lt!340151)) (buf!5189 thiss!1204) lt!340832 lt!340834)))

(declare-fun lt!340826 () (_ BitVec 64))

(declare-fun b!215753 () Bool)

(declare-fun lt!340831 () (_ BitVec 64))

(assert (=> b!215753 (= e!146768 (= (_1!9885 lt!340837) (withMovedBitIndex!0 (_2!9885 lt!340837) (bvsub lt!340826 lt!340831))))))

(assert (=> b!215753 (or (= (bvand lt!340826 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340831 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340826 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340826 lt!340831) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215753 (= lt!340831 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340151))) (currentByte!9767 (_2!9886 lt!340151)) (currentBit!9762 (_2!9886 lt!340151))))))

(assert (=> b!215753 (= lt!340826 (bitIndex!0 (size!4654 (buf!5189 thiss!1204)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)))))

(declare-fun b!215754 () Bool)

(declare-fun res!181520 () Bool)

(assert (=> b!215754 (=> (not res!181520) (not e!146768))))

(assert (=> b!215754 (= res!181520 (isPrefixOf!0 (_2!9885 lt!340837) (_2!9886 lt!340151)))))

(assert (= (and d!72623 c!10519) b!215752))

(assert (= (and d!72623 (not c!10519)) b!215751))

(assert (= (and d!72623 res!181519) b!215750))

(assert (= (and b!215750 res!181518) b!215754))

(assert (= (and b!215754 res!181520) b!215753))

(declare-fun m!332213 () Bool)

(assert (=> b!215754 m!332213))

(declare-fun m!332215 () Bool)

(assert (=> b!215750 m!332215))

(declare-fun m!332217 () Bool)

(assert (=> d!72623 m!332217))

(declare-fun m!332219 () Bool)

(assert (=> d!72623 m!332219))

(declare-fun m!332221 () Bool)

(assert (=> d!72623 m!332221))

(declare-fun m!332223 () Bool)

(assert (=> d!72623 m!332223))

(declare-fun m!332225 () Bool)

(assert (=> d!72623 m!332225))

(declare-fun m!332227 () Bool)

(assert (=> d!72623 m!332227))

(declare-fun m!332229 () Bool)

(assert (=> d!72623 m!332229))

(assert (=> d!72623 m!331663))

(declare-fun m!332231 () Bool)

(assert (=> d!72623 m!332231))

(declare-fun m!332233 () Bool)

(assert (=> d!72623 m!332233))

(declare-fun m!332235 () Bool)

(assert (=> d!72623 m!332235))

(assert (=> b!215752 m!331625))

(declare-fun m!332237 () Bool)

(assert (=> b!215752 m!332237))

(declare-fun m!332239 () Bool)

(assert (=> b!215752 m!332239))

(declare-fun m!332241 () Bool)

(assert (=> b!215753 m!332241))

(assert (=> b!215753 m!331661))

(assert (=> b!215753 m!331625))

(assert (=> b!215400 d!72623))

(declare-fun d!72657 () Bool)

(assert (=> d!72657 (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340151)))) ((_ sign_extend 32) (currentByte!9767 thiss!1204)) ((_ sign_extend 32) (currentBit!9762 thiss!1204)) lt!340135)))

(declare-fun lt!340841 () Unit!15292)

(declare-fun choose!9 (BitStream!8416 array!10595 (_ BitVec 64) BitStream!8416) Unit!15292)

(assert (=> d!72657 (= lt!340841 (choose!9 thiss!1204 (buf!5189 (_2!9886 lt!340151)) lt!340135 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))))))

(assert (=> d!72657 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5189 (_2!9886 lt!340151)) lt!340135) lt!340841)))

(declare-fun bs!17816 () Bool)

(assert (= bs!17816 d!72657))

(assert (=> bs!17816 m!331687))

(declare-fun m!332243 () Bool)

(assert (=> bs!17816 m!332243))

(assert (=> b!215400 d!72657))

(declare-fun d!72659 () Bool)

(declare-fun lt!340842 () tuple2!18490)

(assert (=> d!72659 (= lt!340842 (readNBitsLSBFirstsLoop!0 (_1!9885 lt!340143) nBits!348 i!590 lt!340126))))

(assert (=> d!72659 (= (readNBitsLSBFirstsLoopPure!0 (_1!9885 lt!340143) nBits!348 i!590 lt!340126) (tuple2!18459 (_2!9900 lt!340842) (_1!9900 lt!340842)))))

(declare-fun bs!17817 () Bool)

(assert (= bs!17817 d!72659))

(declare-fun m!332245 () Bool)

(assert (=> bs!17817 m!332245))

(assert (=> b!215400 d!72659))

(declare-fun d!72661 () Bool)

(assert (=> d!72661 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340151)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340128))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340128))) lt!340130) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340151)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340128))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340128)))) lt!340130))))

(declare-fun bs!17818 () Bool)

(assert (= bs!17818 d!72661))

(declare-fun m!332247 () Bool)

(assert (=> bs!17818 m!332247))

(assert (=> b!215400 d!72661))

(declare-fun d!72663 () Bool)

(declare-fun e!146776 () Bool)

(assert (=> d!72663 e!146776))

(declare-fun res!181529 () Bool)

(assert (=> d!72663 (=> (not res!181529) (not e!146776))))

(declare-fun lt!340883 () tuple2!18464)

(declare-fun lt!340882 () tuple2!18464)

(assert (=> d!72663 (= res!181529 (= (bitIndex!0 (size!4654 (buf!5189 (_1!9887 lt!340883))) (currentByte!9767 (_1!9887 lt!340883)) (currentBit!9762 (_1!9887 lt!340883))) (bitIndex!0 (size!4654 (buf!5189 (_1!9887 lt!340882))) (currentByte!9767 (_1!9887 lt!340882)) (currentBit!9762 (_1!9887 lt!340882)))))))

(declare-fun lt!340884 () Unit!15292)

(declare-fun lt!340881 () BitStream!8416)

(declare-fun choose!50 (BitStream!8416 BitStream!8416 BitStream!8416 tuple2!18464 tuple2!18464 BitStream!8416 Bool tuple2!18464 tuple2!18464 BitStream!8416 Bool) Unit!15292)

(assert (=> d!72663 (= lt!340884 (choose!50 lt!340129 (_2!9886 lt!340151) lt!340881 lt!340883 (tuple2!18465 (_1!9887 lt!340883) (_2!9887 lt!340883)) (_1!9887 lt!340883) (_2!9887 lt!340883) lt!340882 (tuple2!18465 (_1!9887 lt!340882) (_2!9887 lt!340882)) (_1!9887 lt!340882) (_2!9887 lt!340882)))))

(assert (=> d!72663 (= lt!340882 (readBitPure!0 lt!340881))))

(assert (=> d!72663 (= lt!340883 (readBitPure!0 lt!340129))))

(assert (=> d!72663 (= lt!340881 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 lt!340129) (currentBit!9762 lt!340129)))))

(assert (=> d!72663 (invariant!0 (currentBit!9762 lt!340129) (currentByte!9767 lt!340129) (size!4654 (buf!5189 (_2!9886 lt!340151))))))

(assert (=> d!72663 (= (readBitPrefixLemma!0 lt!340129 (_2!9886 lt!340151)) lt!340884)))

(declare-fun b!215763 () Bool)

(assert (=> b!215763 (= e!146776 (= (_2!9887 lt!340883) (_2!9887 lt!340882)))))

(assert (= (and d!72663 res!181529) b!215763))

(declare-fun m!332269 () Bool)

(assert (=> d!72663 m!332269))

(declare-fun m!332271 () Bool)

(assert (=> d!72663 m!332271))

(assert (=> d!72663 m!331683))

(declare-fun m!332273 () Bool)

(assert (=> d!72663 m!332273))

(declare-fun m!332275 () Bool)

(assert (=> d!72663 m!332275))

(declare-fun m!332277 () Bool)

(assert (=> d!72663 m!332277))

(assert (=> b!215400 d!72663))

(declare-fun d!72679 () Bool)

(assert (=> d!72679 (= (invariant!0 (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204) (size!4654 (buf!5189 (_2!9886 lt!340128)))) (and (bvsge (currentBit!9762 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9762 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9767 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9767 thiss!1204) (size!4654 (buf!5189 (_2!9886 lt!340128)))) (and (= (currentBit!9762 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9767 thiss!1204) (size!4654 (buf!5189 (_2!9886 lt!340128))))))))))

(assert (=> b!215400 d!72679))

(declare-fun d!72681 () Bool)

(declare-fun e!146777 () Bool)

(assert (=> d!72681 e!146777))

(declare-fun res!181531 () Bool)

(assert (=> d!72681 (=> (not res!181531) (not e!146777))))

(declare-fun lt!340890 () (_ BitVec 64))

(declare-fun lt!340886 () (_ BitVec 64))

(declare-fun lt!340885 () (_ BitVec 64))

(assert (=> d!72681 (= res!181531 (= lt!340890 (bvsub lt!340886 lt!340885)))))

(assert (=> d!72681 (or (= (bvand lt!340886 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340885 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340886 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340886 lt!340885) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72681 (= lt!340885 (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!340149)))) ((_ sign_extend 32) (currentByte!9767 (_1!9887 lt!340149))) ((_ sign_extend 32) (currentBit!9762 (_1!9887 lt!340149)))))))

(declare-fun lt!340887 () (_ BitVec 64))

(declare-fun lt!340889 () (_ BitVec 64))

(assert (=> d!72681 (= lt!340886 (bvmul lt!340887 lt!340889))))

(assert (=> d!72681 (or (= lt!340887 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!340889 (bvsdiv (bvmul lt!340887 lt!340889) lt!340887)))))

(assert (=> d!72681 (= lt!340889 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72681 (= lt!340887 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!340149)))))))

(assert (=> d!72681 (= lt!340890 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_1!9887 lt!340149))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_1!9887 lt!340149)))))))

(assert (=> d!72681 (invariant!0 (currentBit!9762 (_1!9887 lt!340149)) (currentByte!9767 (_1!9887 lt!340149)) (size!4654 (buf!5189 (_1!9887 lt!340149))))))

(assert (=> d!72681 (= (bitIndex!0 (size!4654 (buf!5189 (_1!9887 lt!340149))) (currentByte!9767 (_1!9887 lt!340149)) (currentBit!9762 (_1!9887 lt!340149))) lt!340890)))

(declare-fun b!215764 () Bool)

(declare-fun res!181530 () Bool)

(assert (=> b!215764 (=> (not res!181530) (not e!146777))))

(assert (=> b!215764 (= res!181530 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340890))))

(declare-fun b!215765 () Bool)

(declare-fun lt!340888 () (_ BitVec 64))

(assert (=> b!215765 (= e!146777 (bvsle lt!340890 (bvmul lt!340888 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!215765 (or (= lt!340888 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!340888 #b0000000000000000000000000000000000000000000000000000000000001000) lt!340888)))))

(assert (=> b!215765 (= lt!340888 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!340149)))))))

(assert (= (and d!72681 res!181531) b!215764))

(assert (= (and b!215764 res!181530) b!215765))

(declare-fun m!332279 () Bool)

(assert (=> d!72681 m!332279))

(declare-fun m!332281 () Bool)

(assert (=> d!72681 m!332281))

(assert (=> b!215400 d!72681))

(declare-fun b!215766 () Bool)

(declare-fun res!181532 () Bool)

(declare-fun e!146778 () Bool)

(assert (=> b!215766 (=> (not res!181532) (not e!146778))))

(declare-fun lt!340909 () tuple2!18460)

(assert (=> b!215766 (= res!181532 (isPrefixOf!0 (_1!9885 lt!340909) (_2!9886 lt!340128)))))

(declare-fun b!215767 () Bool)

(declare-fun e!146779 () Unit!15292)

(declare-fun Unit!15315 () Unit!15292)

(assert (=> b!215767 (= e!146779 Unit!15315)))

(declare-fun d!72683 () Bool)

(assert (=> d!72683 e!146778))

(declare-fun res!181533 () Bool)

(assert (=> d!72683 (=> (not res!181533) (not e!146778))))

(assert (=> d!72683 (= res!181533 (isPrefixOf!0 (_1!9885 lt!340909) (_2!9885 lt!340909)))))

(declare-fun lt!340910 () BitStream!8416)

(assert (=> d!72683 (= lt!340909 (tuple2!18461 lt!340910 (_2!9886 lt!340151)))))

(declare-fun lt!340901 () Unit!15292)

(declare-fun lt!340907 () Unit!15292)

(assert (=> d!72683 (= lt!340901 lt!340907)))

(assert (=> d!72683 (isPrefixOf!0 lt!340910 (_2!9886 lt!340151))))

(assert (=> d!72683 (= lt!340907 (lemmaIsPrefixTransitive!0 lt!340910 (_2!9886 lt!340151) (_2!9886 lt!340151)))))

(declare-fun lt!340899 () Unit!15292)

(declare-fun lt!340894 () Unit!15292)

(assert (=> d!72683 (= lt!340899 lt!340894)))

(assert (=> d!72683 (isPrefixOf!0 lt!340910 (_2!9886 lt!340151))))

(assert (=> d!72683 (= lt!340894 (lemmaIsPrefixTransitive!0 lt!340910 (_2!9886 lt!340128) (_2!9886 lt!340151)))))

(declare-fun lt!340908 () Unit!15292)

(assert (=> d!72683 (= lt!340908 e!146779)))

(declare-fun c!10520 () Bool)

(assert (=> d!72683 (= c!10520 (not (= (size!4654 (buf!5189 (_2!9886 lt!340128))) #b00000000000000000000000000000000)))))

(declare-fun lt!340891 () Unit!15292)

(declare-fun lt!340902 () Unit!15292)

(assert (=> d!72683 (= lt!340891 lt!340902)))

(assert (=> d!72683 (isPrefixOf!0 (_2!9886 lt!340151) (_2!9886 lt!340151))))

(assert (=> d!72683 (= lt!340902 (lemmaIsPrefixRefl!0 (_2!9886 lt!340151)))))

(declare-fun lt!340892 () Unit!15292)

(declare-fun lt!340896 () Unit!15292)

(assert (=> d!72683 (= lt!340892 lt!340896)))

(assert (=> d!72683 (= lt!340896 (lemmaIsPrefixRefl!0 (_2!9886 lt!340151)))))

(declare-fun lt!340900 () Unit!15292)

(declare-fun lt!340905 () Unit!15292)

(assert (=> d!72683 (= lt!340900 lt!340905)))

(assert (=> d!72683 (isPrefixOf!0 lt!340910 lt!340910)))

(assert (=> d!72683 (= lt!340905 (lemmaIsPrefixRefl!0 lt!340910))))

(declare-fun lt!340897 () Unit!15292)

(declare-fun lt!340895 () Unit!15292)

(assert (=> d!72683 (= lt!340897 lt!340895)))

(assert (=> d!72683 (isPrefixOf!0 (_2!9886 lt!340128) (_2!9886 lt!340128))))

(assert (=> d!72683 (= lt!340895 (lemmaIsPrefixRefl!0 (_2!9886 lt!340128)))))

(assert (=> d!72683 (= lt!340910 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))))))

(assert (=> d!72683 (isPrefixOf!0 (_2!9886 lt!340128) (_2!9886 lt!340151))))

(assert (=> d!72683 (= (reader!0 (_2!9886 lt!340128) (_2!9886 lt!340151)) lt!340909)))

(declare-fun b!215768 () Bool)

(declare-fun lt!340893 () Unit!15292)

(assert (=> b!215768 (= e!146779 lt!340893)))

(declare-fun lt!340904 () (_ BitVec 64))

(assert (=> b!215768 (= lt!340904 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!340906 () (_ BitVec 64))

(assert (=> b!215768 (= lt!340906 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))))))

(assert (=> b!215768 (= lt!340893 (arrayBitRangesEqSymmetric!0 (buf!5189 (_2!9886 lt!340128)) (buf!5189 (_2!9886 lt!340151)) lt!340904 lt!340906))))

(assert (=> b!215768 (arrayBitRangesEq!0 (buf!5189 (_2!9886 lt!340151)) (buf!5189 (_2!9886 lt!340128)) lt!340904 lt!340906)))

(declare-fun lt!340898 () (_ BitVec 64))

(declare-fun lt!340903 () (_ BitVec 64))

(declare-fun b!215769 () Bool)

(assert (=> b!215769 (= e!146778 (= (_1!9885 lt!340909) (withMovedBitIndex!0 (_2!9885 lt!340909) (bvsub lt!340898 lt!340903))))))

(assert (=> b!215769 (or (= (bvand lt!340898 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340903 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340898 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340898 lt!340903) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215769 (= lt!340903 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340151))) (currentByte!9767 (_2!9886 lt!340151)) (currentBit!9762 (_2!9886 lt!340151))))))

(assert (=> b!215769 (= lt!340898 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))))))

(declare-fun b!215770 () Bool)

(declare-fun res!181534 () Bool)

(assert (=> b!215770 (=> (not res!181534) (not e!146778))))

(assert (=> b!215770 (= res!181534 (isPrefixOf!0 (_2!9885 lt!340909) (_2!9886 lt!340151)))))

(assert (= (and d!72683 c!10520) b!215768))

(assert (= (and d!72683 (not c!10520)) b!215767))

(assert (= (and d!72683 res!181533) b!215766))

(assert (= (and b!215766 res!181532) b!215770))

(assert (= (and b!215770 res!181534) b!215769))

(declare-fun m!332283 () Bool)

(assert (=> b!215770 m!332283))

(declare-fun m!332285 () Bool)

(assert (=> b!215766 m!332285))

(declare-fun m!332287 () Bool)

(assert (=> d!72683 m!332287))

(declare-fun m!332289 () Bool)

(assert (=> d!72683 m!332289))

(declare-fun m!332291 () Bool)

(assert (=> d!72683 m!332291))

(assert (=> d!72683 m!332223))

(declare-fun m!332293 () Bool)

(assert (=> d!72683 m!332293))

(declare-fun m!332295 () Bool)

(assert (=> d!72683 m!332295))

(assert (=> d!72683 m!332229))

(assert (=> d!72683 m!331629))

(declare-fun m!332297 () Bool)

(assert (=> d!72683 m!332297))

(declare-fun m!332299 () Bool)

(assert (=> d!72683 m!332299))

(declare-fun m!332301 () Bool)

(assert (=> d!72683 m!332301))

(assert (=> b!215768 m!331623))

(declare-fun m!332303 () Bool)

(assert (=> b!215768 m!332303))

(declare-fun m!332305 () Bool)

(assert (=> b!215768 m!332305))

(declare-fun m!332307 () Bool)

(assert (=> b!215769 m!332307))

(assert (=> b!215769 m!331661))

(assert (=> b!215769 m!331623))

(assert (=> b!215400 d!72683))

(declare-fun d!72685 () Bool)

(declare-fun lt!340911 () tuple2!18492)

(assert (=> d!72685 (= lt!340911 (readBit!0 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))))))

(assert (=> d!72685 (= (readBitPure!0 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))) (tuple2!18465 (_2!9901 lt!340911) (_1!9901 lt!340911)))))

(declare-fun bs!17824 () Bool)

(assert (= bs!17824 d!72685))

(declare-fun m!332309 () Bool)

(assert (=> bs!17824 m!332309))

(assert (=> b!215400 d!72685))

(declare-fun lt!340912 () tuple2!18490)

(declare-fun d!72687 () Bool)

(assert (=> d!72687 (= lt!340912 (readNBitsLSBFirstsLoop!0 (_1!9885 lt!340131) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!340153))))

(assert (=> d!72687 (= (readNBitsLSBFirstsLoopPure!0 (_1!9885 lt!340131) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!340153) (tuple2!18459 (_2!9900 lt!340912) (_1!9900 lt!340912)))))

(declare-fun bs!17825 () Bool)

(assert (= bs!17825 d!72687))

(declare-fun m!332311 () Bool)

(assert (=> bs!17825 m!332311))

(assert (=> b!215400 d!72687))

(declare-fun d!72689 () Bool)

(declare-fun e!146780 () Bool)

(assert (=> d!72689 e!146780))

(declare-fun res!181536 () Bool)

(assert (=> d!72689 (=> (not res!181536) (not e!146780))))

(declare-fun lt!340914 () (_ BitVec 64))

(declare-fun lt!340913 () (_ BitVec 64))

(declare-fun lt!340918 () (_ BitVec 64))

(assert (=> d!72689 (= res!181536 (= lt!340918 (bvsub lt!340914 lt!340913)))))

(assert (=> d!72689 (or (= (bvand lt!340914 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340913 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340914 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340914 lt!340913) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72689 (= lt!340913 (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!340137)))) ((_ sign_extend 32) (currentByte!9767 (_1!9887 lt!340137))) ((_ sign_extend 32) (currentBit!9762 (_1!9887 lt!340137)))))))

(declare-fun lt!340915 () (_ BitVec 64))

(declare-fun lt!340917 () (_ BitVec 64))

(assert (=> d!72689 (= lt!340914 (bvmul lt!340915 lt!340917))))

(assert (=> d!72689 (or (= lt!340915 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!340917 (bvsdiv (bvmul lt!340915 lt!340917) lt!340915)))))

(assert (=> d!72689 (= lt!340917 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72689 (= lt!340915 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!340137)))))))

(assert (=> d!72689 (= lt!340918 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_1!9887 lt!340137))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_1!9887 lt!340137)))))))

(assert (=> d!72689 (invariant!0 (currentBit!9762 (_1!9887 lt!340137)) (currentByte!9767 (_1!9887 lt!340137)) (size!4654 (buf!5189 (_1!9887 lt!340137))))))

(assert (=> d!72689 (= (bitIndex!0 (size!4654 (buf!5189 (_1!9887 lt!340137))) (currentByte!9767 (_1!9887 lt!340137)) (currentBit!9762 (_1!9887 lt!340137))) lt!340918)))

(declare-fun b!215771 () Bool)

(declare-fun res!181535 () Bool)

(assert (=> b!215771 (=> (not res!181535) (not e!146780))))

(assert (=> b!215771 (= res!181535 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340918))))

(declare-fun b!215772 () Bool)

(declare-fun lt!340916 () (_ BitVec 64))

(assert (=> b!215772 (= e!146780 (bvsle lt!340918 (bvmul lt!340916 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!215772 (or (= lt!340916 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!340916 #b0000000000000000000000000000000000000000000000000000000000001000) lt!340916)))))

(assert (=> b!215772 (= lt!340916 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!340137)))))))

(assert (= (and d!72689 res!181536) b!215771))

(assert (= (and b!215771 res!181535) b!215772))

(declare-fun m!332313 () Bool)

(assert (=> d!72689 m!332313))

(declare-fun m!332315 () Bool)

(assert (=> d!72689 m!332315))

(assert (=> b!215400 d!72689))

(declare-fun d!72691 () Bool)

(declare-fun lt!340919 () tuple2!18492)

(assert (=> d!72691 (= lt!340919 (readBit!0 lt!340129))))

(assert (=> d!72691 (= (readBitPure!0 lt!340129) (tuple2!18465 (_2!9901 lt!340919) (_1!9901 lt!340919)))))

(declare-fun bs!17826 () Bool)

(assert (= bs!17826 d!72691))

(declare-fun m!332317 () Bool)

(assert (=> bs!17826 m!332317))

(assert (=> b!215400 d!72691))

(declare-fun d!72693 () Bool)

(assert (=> d!72693 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!215400 d!72693))

(declare-fun d!72695 () Bool)

(assert (=> d!72695 (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340151)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340128))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340128))) lt!340130)))

(declare-fun lt!340920 () Unit!15292)

(assert (=> d!72695 (= lt!340920 (choose!9 (_2!9886 lt!340128) (buf!5189 (_2!9886 lt!340151)) lt!340130 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128)))))))

(assert (=> d!72695 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9886 lt!340128) (buf!5189 (_2!9886 lt!340151)) lt!340130) lt!340920)))

(declare-fun bs!17827 () Bool)

(assert (= bs!17827 d!72695))

(assert (=> bs!17827 m!331703))

(declare-fun m!332319 () Bool)

(assert (=> bs!17827 m!332319))

(assert (=> b!215400 d!72695))

(declare-fun d!72697 () Bool)

(declare-fun lt!340921 () tuple2!18492)

(assert (=> d!72697 (= lt!340921 (readBit!0 (_1!9885 lt!340143)))))

(assert (=> d!72697 (= (readBitPure!0 (_1!9885 lt!340143)) (tuple2!18465 (_2!9901 lt!340921) (_1!9901 lt!340921)))))

(declare-fun bs!17828 () Bool)

(assert (= bs!17828 d!72697))

(declare-fun m!332321 () Bool)

(assert (=> bs!17828 m!332321))

(assert (=> b!215400 d!72697))

(declare-fun d!72699 () Bool)

(assert (=> d!72699 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340151)))) ((_ sign_extend 32) (currentByte!9767 thiss!1204)) ((_ sign_extend 32) (currentBit!9762 thiss!1204)) lt!340135) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340151)))) ((_ sign_extend 32) (currentByte!9767 thiss!1204)) ((_ sign_extend 32) (currentBit!9762 thiss!1204))) lt!340135))))

(declare-fun bs!17829 () Bool)

(assert (= bs!17829 d!72699))

(declare-fun m!332323 () Bool)

(assert (=> bs!17829 m!332323))

(assert (=> b!215400 d!72699))

(assert (=> b!215411 d!72621))

(declare-fun d!72701 () Bool)

(declare-fun e!146781 () Bool)

(assert (=> d!72701 e!146781))

(declare-fun res!181537 () Bool)

(assert (=> d!72701 (=> (not res!181537) (not e!146781))))

(declare-fun lt!340922 () BitStream!8416)

(declare-fun lt!340923 () (_ BitVec 64))

(assert (=> d!72701 (= res!181537 (= (bvadd lt!340923 (bvsub lt!340148 lt!340142)) (bitIndex!0 (size!4654 (buf!5189 lt!340922)) (currentByte!9767 lt!340922) (currentBit!9762 lt!340922))))))

(assert (=> d!72701 (or (not (= (bvand lt!340923 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340148 lt!340142) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!340923 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!340923 (bvsub lt!340148 lt!340142)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72701 (= lt!340923 (bitIndex!0 (size!4654 (buf!5189 (_2!9885 lt!340131))) (currentByte!9767 (_2!9885 lt!340131)) (currentBit!9762 (_2!9885 lt!340131))))))

(assert (=> d!72701 (= lt!340922 (_2!9886 (moveBitIndex!0 (_2!9885 lt!340131) (bvsub lt!340148 lt!340142))))))

(assert (=> d!72701 (moveBitIndexPrecond!0 (_2!9885 lt!340131) (bvsub lt!340148 lt!340142))))

(assert (=> d!72701 (= (withMovedBitIndex!0 (_2!9885 lt!340131) (bvsub lt!340148 lt!340142)) lt!340922)))

(declare-fun b!215773 () Bool)

(assert (=> b!215773 (= e!146781 (= (size!4654 (buf!5189 (_2!9885 lt!340131))) (size!4654 (buf!5189 lt!340922))))))

(assert (= (and d!72701 res!181537) b!215773))

(declare-fun m!332325 () Bool)

(assert (=> d!72701 m!332325))

(declare-fun m!332327 () Bool)

(assert (=> d!72701 m!332327))

(declare-fun m!332329 () Bool)

(assert (=> d!72701 m!332329))

(declare-fun m!332331 () Bool)

(assert (=> d!72701 m!332331))

(assert (=> b!215401 d!72701))

(declare-fun d!72703 () Bool)

(assert (=> d!72703 (= (invariant!0 (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204) (size!4654 (buf!5189 (_2!9886 lt!340151)))) (and (bvsge (currentBit!9762 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9762 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9767 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9767 thiss!1204) (size!4654 (buf!5189 (_2!9886 lt!340151)))) (and (= (currentBit!9762 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9767 thiss!1204) (size!4654 (buf!5189 (_2!9886 lt!340151))))))))))

(assert (=> b!215412 d!72703))

(declare-fun d!72705 () Bool)

(assert (=> d!72705 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 thiss!1204))) ((_ sign_extend 32) (currentByte!9767 thiss!1204)) ((_ sign_extend 32) (currentBit!9762 thiss!1204)) lt!340135) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 thiss!1204))) ((_ sign_extend 32) (currentByte!9767 thiss!1204)) ((_ sign_extend 32) (currentBit!9762 thiss!1204))) lt!340135))))

(declare-fun bs!17830 () Bool)

(assert (= bs!17830 d!72705))

(assert (=> bs!17830 m!332045))

(assert (=> b!215403 d!72705))

(declare-fun d!72707 () Bool)

(declare-fun e!146782 () Bool)

(assert (=> d!72707 e!146782))

(declare-fun res!181539 () Bool)

(assert (=> d!72707 (=> (not res!181539) (not e!146782))))

(declare-fun lt!340925 () (_ BitVec 64))

(declare-fun lt!340924 () (_ BitVec 64))

(declare-fun lt!340929 () (_ BitVec 64))

(assert (=> d!72707 (= res!181539 (= lt!340929 (bvsub lt!340925 lt!340924)))))

(assert (=> d!72707 (or (= (bvand lt!340925 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340924 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340925 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340925 lt!340924) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72707 (= lt!340924 (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340151)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340151))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340151)))))))

(declare-fun lt!340926 () (_ BitVec 64))

(declare-fun lt!340928 () (_ BitVec 64))

(assert (=> d!72707 (= lt!340925 (bvmul lt!340926 lt!340928))))

(assert (=> d!72707 (or (= lt!340926 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!340928 (bvsdiv (bvmul lt!340926 lt!340928) lt!340926)))))

(assert (=> d!72707 (= lt!340928 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72707 (= lt!340926 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340151)))))))

(assert (=> d!72707 (= lt!340929 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340151))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340151)))))))

(assert (=> d!72707 (invariant!0 (currentBit!9762 (_2!9886 lt!340151)) (currentByte!9767 (_2!9886 lt!340151)) (size!4654 (buf!5189 (_2!9886 lt!340151))))))

(assert (=> d!72707 (= (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340151))) (currentByte!9767 (_2!9886 lt!340151)) (currentBit!9762 (_2!9886 lt!340151))) lt!340929)))

(declare-fun b!215774 () Bool)

(declare-fun res!181538 () Bool)

(assert (=> b!215774 (=> (not res!181538) (not e!146782))))

(assert (=> b!215774 (= res!181538 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340929))))

(declare-fun b!215775 () Bool)

(declare-fun lt!340927 () (_ BitVec 64))

(assert (=> b!215775 (= e!146782 (bvsle lt!340929 (bvmul lt!340927 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!215775 (or (= lt!340927 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!340927 #b0000000000000000000000000000000000000000000000000000000000001000) lt!340927)))))

(assert (=> b!215775 (= lt!340927 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340151)))))))

(assert (= (and d!72707 res!181539) b!215774))

(assert (= (and b!215774 res!181538) b!215775))

(declare-fun m!332333 () Bool)

(assert (=> d!72707 m!332333))

(assert (=> d!72707 m!331659))

(assert (=> b!215393 d!72707))

(declare-fun d!72709 () Bool)

(declare-fun res!181542 () Bool)

(declare-fun e!146783 () Bool)

(assert (=> d!72709 (=> (not res!181542) (not e!146783))))

(assert (=> d!72709 (= res!181542 (= (size!4654 (buf!5189 thiss!1204)) (size!4654 (buf!5189 (_2!9886 lt!340151)))))))

(assert (=> d!72709 (= (isPrefixOf!0 thiss!1204 (_2!9886 lt!340151)) e!146783)))

(declare-fun b!215776 () Bool)

(declare-fun res!181540 () Bool)

(assert (=> b!215776 (=> (not res!181540) (not e!146783))))

(assert (=> b!215776 (= res!181540 (bvsle (bitIndex!0 (size!4654 (buf!5189 thiss!1204)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340151))) (currentByte!9767 (_2!9886 lt!340151)) (currentBit!9762 (_2!9886 lt!340151)))))))

(declare-fun b!215777 () Bool)

(declare-fun e!146784 () Bool)

(assert (=> b!215777 (= e!146783 e!146784)))

(declare-fun res!181541 () Bool)

(assert (=> b!215777 (=> res!181541 e!146784)))

(assert (=> b!215777 (= res!181541 (= (size!4654 (buf!5189 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!215778 () Bool)

(assert (=> b!215778 (= e!146784 (arrayBitRangesEq!0 (buf!5189 thiss!1204) (buf!5189 (_2!9886 lt!340151)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 thiss!1204)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))))))

(assert (= (and d!72709 res!181542) b!215776))

(assert (= (and b!215776 res!181540) b!215777))

(assert (= (and b!215777 (not res!181541)) b!215778))

(assert (=> b!215776 m!331625))

(assert (=> b!215776 m!331661))

(assert (=> b!215778 m!331625))

(assert (=> b!215778 m!331625))

(declare-fun m!332335 () Bool)

(assert (=> b!215778 m!332335))

(assert (=> b!215393 d!72709))

(declare-fun d!72711 () Bool)

(assert (=> d!72711 (isPrefixOf!0 thiss!1204 (_2!9886 lt!340151))))

(declare-fun lt!340932 () Unit!15292)

(declare-fun choose!30 (BitStream!8416 BitStream!8416 BitStream!8416) Unit!15292)

(assert (=> d!72711 (= lt!340932 (choose!30 thiss!1204 (_2!9886 lt!340128) (_2!9886 lt!340151)))))

(assert (=> d!72711 (isPrefixOf!0 thiss!1204 (_2!9886 lt!340128))))

(assert (=> d!72711 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9886 lt!340128) (_2!9886 lt!340151)) lt!340932)))

(declare-fun bs!17831 () Bool)

(assert (= bs!17831 d!72711))

(assert (=> bs!17831 m!331663))

(declare-fun m!332337 () Bool)

(assert (=> bs!17831 m!332337))

(assert (=> bs!17831 m!331639))

(assert (=> b!215393 d!72711))

(declare-fun b!215925 () Bool)

(declare-fun e!146873 () (_ BitVec 64))

(assert (=> b!215925 (= e!146873 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!215926 () Bool)

(declare-fun res!181658 () Bool)

(declare-fun lt!341445 () tuple2!18462)

(assert (=> b!215926 (= res!181658 (isPrefixOf!0 (_2!9886 lt!340128) (_2!9886 lt!341445)))))

(declare-fun e!146874 () Bool)

(assert (=> b!215926 (=> (not res!181658) (not e!146874))))

(declare-fun b!215927 () Bool)

(declare-fun res!181657 () Bool)

(assert (=> b!215927 (= res!181657 (= (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341445))) (currentByte!9767 (_2!9886 lt!341445)) (currentBit!9762 (_2!9886 lt!341445))) (bvadd (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!215927 (=> (not res!181657) (not e!146874))))

(declare-fun b!215928 () Bool)

(declare-fun e!146871 () Bool)

(declare-fun lt!341407 () tuple2!18458)

(declare-fun lt!341442 () tuple2!18460)

(assert (=> b!215928 (= e!146871 (= (_1!9884 lt!341407) (_2!9885 lt!341442)))))

(declare-fun b!215929 () Bool)

(assert (=> b!215929 (= e!146873 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!215930 () Bool)

(declare-fun e!146872 () Bool)

(declare-fun lt!341428 () tuple2!18458)

(declare-fun lt!341452 () tuple2!18460)

(assert (=> b!215930 (= e!146872 (= (_1!9884 lt!341428) (_2!9885 lt!341452)))))

(declare-fun b!215931 () Bool)

(declare-fun e!146870 () Bool)

(declare-fun lt!341447 () tuple2!18464)

(declare-fun lt!341462 () tuple2!18464)

(assert (=> b!215931 (= e!146870 (= (_2!9887 lt!341447) (_2!9887 lt!341462)))))

(declare-fun b!215932 () Bool)

(declare-fun e!146869 () Bool)

(declare-fun lt!341440 () tuple2!18464)

(assert (=> b!215932 (= e!146869 (= (bitIndex!0 (size!4654 (buf!5189 (_1!9887 lt!341440))) (currentByte!9767 (_1!9887 lt!341440)) (currentBit!9762 (_1!9887 lt!341440))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341445))) (currentByte!9767 (_2!9886 lt!341445)) (currentBit!9762 (_2!9886 lt!341445)))))))

(declare-fun b!215933 () Bool)

(declare-fun res!181660 () Bool)

(declare-fun e!146867 () Bool)

(assert (=> b!215933 (=> (not res!181660) (not e!146867))))

(declare-fun lt!341457 () (_ BitVec 64))

(declare-fun lt!341416 () (_ BitVec 64))

(declare-fun lt!341432 () tuple2!18462)

(assert (=> b!215933 (= res!181660 (= (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341432))) (currentByte!9767 (_2!9886 lt!341432)) (currentBit!9762 (_2!9886 lt!341432))) (bvsub lt!341457 lt!341416)))))

(assert (=> b!215933 (or (= (bvand lt!341457 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341416 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341457 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341457 lt!341416) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215933 (= lt!341416 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!341417 () (_ BitVec 64))

(declare-fun lt!341436 () (_ BitVec 64))

(assert (=> b!215933 (= lt!341457 (bvadd lt!341417 lt!341436))))

(assert (=> b!215933 (or (not (= (bvand lt!341417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341436 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!341417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!341417 lt!341436) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215933 (= lt!341436 ((_ sign_extend 32) nBits!348))))

(assert (=> b!215933 (= lt!341417 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))))))

(declare-fun b!215934 () Bool)

(declare-fun res!181659 () Bool)

(assert (=> b!215934 (=> (not res!181659) (not e!146867))))

(assert (=> b!215934 (= res!181659 (isPrefixOf!0 (_2!9886 lt!340128) (_2!9886 lt!341432)))))

(declare-fun d!72713 () Bool)

(assert (=> d!72713 e!146867))

(declare-fun res!181665 () Bool)

(assert (=> d!72713 (=> (not res!181665) (not e!146867))))

(assert (=> d!72713 (= res!181665 (invariant!0 (currentBit!9762 (_2!9886 lt!341432)) (currentByte!9767 (_2!9886 lt!341432)) (size!4654 (buf!5189 (_2!9886 lt!341432)))))))

(declare-fun e!146868 () tuple2!18462)

(assert (=> d!72713 (= lt!341432 e!146868)))

(declare-fun c!10537 () Bool)

(assert (=> d!72713 (= c!10537 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!72713 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!72713 (= (appendBitsLSBFirstLoopTR!0 (_2!9886 lt!340128) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!341432)))

(declare-fun b!215935 () Bool)

(declare-fun res!181661 () Bool)

(assert (=> b!215935 (=> (not res!181661) (not e!146867))))

(assert (=> b!215935 (= res!181661 (= (size!4654 (buf!5189 (_2!9886 lt!340128))) (size!4654 (buf!5189 (_2!9886 lt!341432)))))))

(declare-fun b!215936 () Bool)

(declare-fun lt!341443 () tuple2!18462)

(assert (=> b!215936 (= e!146868 (tuple2!18463 (_1!9886 lt!341443) (_2!9886 lt!341443)))))

(declare-fun lt!341434 () Bool)

(assert (=> b!215936 (= lt!341434 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215936 (= lt!341445 (appendBit!0 (_2!9886 lt!340128) lt!341434))))

(declare-fun res!181656 () Bool)

(assert (=> b!215936 (= res!181656 (= (size!4654 (buf!5189 (_2!9886 lt!340128))) (size!4654 (buf!5189 (_2!9886 lt!341445)))))))

(assert (=> b!215936 (=> (not res!181656) (not e!146874))))

(assert (=> b!215936 e!146874))

(declare-fun lt!341412 () tuple2!18462)

(assert (=> b!215936 (= lt!341412 lt!341445)))

(assert (=> b!215936 (= lt!341443 (appendBitsLSBFirstLoopTR!0 (_2!9886 lt!341412) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!341423 () Unit!15292)

(assert (=> b!215936 (= lt!341423 (lemmaIsPrefixTransitive!0 (_2!9886 lt!340128) (_2!9886 lt!341412) (_2!9886 lt!341443)))))

(declare-fun call!3369 () Bool)

(assert (=> b!215936 call!3369))

(declare-fun lt!341413 () Unit!15292)

(assert (=> b!215936 (= lt!341413 lt!341423)))

(assert (=> b!215936 (invariant!0 (currentBit!9762 (_2!9886 lt!340128)) (currentByte!9767 (_2!9886 lt!340128)) (size!4654 (buf!5189 (_2!9886 lt!341412))))))

(declare-fun lt!341446 () BitStream!8416)

(assert (=> b!215936 (= lt!341446 (BitStream!8417 (buf!5189 (_2!9886 lt!341412)) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))))))

(assert (=> b!215936 (invariant!0 (currentBit!9762 lt!341446) (currentByte!9767 lt!341446) (size!4654 (buf!5189 (_2!9886 lt!341443))))))

(declare-fun lt!341454 () BitStream!8416)

(assert (=> b!215936 (= lt!341454 (BitStream!8417 (buf!5189 (_2!9886 lt!341443)) (currentByte!9767 lt!341446) (currentBit!9762 lt!341446)))))

(assert (=> b!215936 (= lt!341447 (readBitPure!0 lt!341446))))

(assert (=> b!215936 (= lt!341462 (readBitPure!0 lt!341454))))

(declare-fun lt!341415 () Unit!15292)

(assert (=> b!215936 (= lt!341415 (readBitPrefixLemma!0 lt!341446 (_2!9886 lt!341443)))))

(declare-fun res!181662 () Bool)

(assert (=> b!215936 (= res!181662 (= (bitIndex!0 (size!4654 (buf!5189 (_1!9887 lt!341447))) (currentByte!9767 (_1!9887 lt!341447)) (currentBit!9762 (_1!9887 lt!341447))) (bitIndex!0 (size!4654 (buf!5189 (_1!9887 lt!341462))) (currentByte!9767 (_1!9887 lt!341462)) (currentBit!9762 (_1!9887 lt!341462)))))))

(assert (=> b!215936 (=> (not res!181662) (not e!146870))))

(assert (=> b!215936 e!146870))

(declare-fun lt!341438 () Unit!15292)

(assert (=> b!215936 (= lt!341438 lt!341415)))

(declare-fun lt!341458 () tuple2!18460)

(assert (=> b!215936 (= lt!341458 (reader!0 (_2!9886 lt!340128) (_2!9886 lt!341443)))))

(declare-fun lt!341453 () tuple2!18460)

(assert (=> b!215936 (= lt!341453 (reader!0 (_2!9886 lt!341412) (_2!9886 lt!341443)))))

(declare-fun lt!341437 () tuple2!18464)

(assert (=> b!215936 (= lt!341437 (readBitPure!0 (_1!9885 lt!341458)))))

(assert (=> b!215936 (= (_2!9887 lt!341437) lt!341434)))

(declare-fun lt!341422 () Unit!15292)

(declare-fun Unit!15326 () Unit!15292)

(assert (=> b!215936 (= lt!341422 Unit!15326)))

(declare-fun lt!341410 () (_ BitVec 64))

(assert (=> b!215936 (= lt!341410 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!341441 () (_ BitVec 64))

(assert (=> b!215936 (= lt!341441 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!341430 () Unit!15292)

(assert (=> b!215936 (= lt!341430 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9886 lt!340128) (buf!5189 (_2!9886 lt!341443)) lt!341441))))

(assert (=> b!215936 (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341443)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340128))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340128))) lt!341441)))

(declare-fun lt!341456 () Unit!15292)

(assert (=> b!215936 (= lt!341456 lt!341430)))

(declare-fun lt!341414 () tuple2!18458)

(assert (=> b!215936 (= lt!341414 (readNBitsLSBFirstsLoopPure!0 (_1!9885 lt!341458) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!341410))))

(declare-fun lt!341424 () (_ BitVec 64))

(assert (=> b!215936 (= lt!341424 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!341439 () Unit!15292)

(assert (=> b!215936 (= lt!341439 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9886 lt!341412) (buf!5189 (_2!9886 lt!341443)) lt!341424))))

(assert (=> b!215936 (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341443)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!341412))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!341412))) lt!341424)))

(declare-fun lt!341425 () Unit!15292)

(assert (=> b!215936 (= lt!341425 lt!341439)))

(declare-fun lt!341451 () tuple2!18458)

(assert (=> b!215936 (= lt!341451 (readNBitsLSBFirstsLoopPure!0 (_1!9885 lt!341453) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!341410 (ite (_2!9887 lt!341437) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!341461 () tuple2!18458)

(assert (=> b!215936 (= lt!341461 (readNBitsLSBFirstsLoopPure!0 (_1!9885 lt!341458) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!341410))))

(declare-fun c!10538 () Bool)

(assert (=> b!215936 (= c!10538 (_2!9887 (readBitPure!0 (_1!9885 lt!341458))))))

(declare-fun lt!341455 () tuple2!18458)

(assert (=> b!215936 (= lt!341455 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9885 lt!341458) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!341410 e!146873)))))

(declare-fun lt!341444 () Unit!15292)

(assert (=> b!215936 (= lt!341444 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9885 lt!341458) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!341410))))

(assert (=> b!215936 (and (= (_2!9884 lt!341461) (_2!9884 lt!341455)) (= (_1!9884 lt!341461) (_1!9884 lt!341455)))))

(declare-fun lt!341409 () Unit!15292)

(assert (=> b!215936 (= lt!341409 lt!341444)))

(assert (=> b!215936 (= (_1!9885 lt!341458) (withMovedBitIndex!0 (_2!9885 lt!341458) (bvsub (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341443))) (currentByte!9767 (_2!9886 lt!341443)) (currentBit!9762 (_2!9886 lt!341443))))))))

(declare-fun lt!341450 () Unit!15292)

(declare-fun Unit!15327 () Unit!15292)

(assert (=> b!215936 (= lt!341450 Unit!15327)))

(assert (=> b!215936 (= (_1!9885 lt!341453) (withMovedBitIndex!0 (_2!9885 lt!341453) (bvsub (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341412))) (currentByte!9767 (_2!9886 lt!341412)) (currentBit!9762 (_2!9886 lt!341412))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341443))) (currentByte!9767 (_2!9886 lt!341443)) (currentBit!9762 (_2!9886 lt!341443))))))))

(declare-fun lt!341427 () Unit!15292)

(declare-fun Unit!15328 () Unit!15292)

(assert (=> b!215936 (= lt!341427 Unit!15328)))

(assert (=> b!215936 (= (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))) (bvsub (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341412))) (currentByte!9767 (_2!9886 lt!341412)) (currentBit!9762 (_2!9886 lt!341412))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!341448 () Unit!15292)

(declare-fun Unit!15329 () Unit!15292)

(assert (=> b!215936 (= lt!341448 Unit!15329)))

(assert (=> b!215936 (= (_2!9884 lt!341414) (_2!9884 lt!341451))))

(declare-fun lt!341411 () Unit!15292)

(declare-fun Unit!15330 () Unit!15292)

(assert (=> b!215936 (= lt!341411 Unit!15330)))

(assert (=> b!215936 (invariant!0 (currentBit!9762 (_2!9886 lt!341443)) (currentByte!9767 (_2!9886 lt!341443)) (size!4654 (buf!5189 (_2!9886 lt!341443))))))

(declare-fun lt!341459 () Unit!15292)

(declare-fun Unit!15331 () Unit!15292)

(assert (=> b!215936 (= lt!341459 Unit!15331)))

(assert (=> b!215936 (= (size!4654 (buf!5189 (_2!9886 lt!340128))) (size!4654 (buf!5189 (_2!9886 lt!341443))))))

(declare-fun lt!341460 () Unit!15292)

(declare-fun Unit!15332 () Unit!15292)

(assert (=> b!215936 (= lt!341460 Unit!15332)))

(assert (=> b!215936 (= (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341443))) (currentByte!9767 (_2!9886 lt!341443)) (currentBit!9762 (_2!9886 lt!341443))) (bvsub (bvadd (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!341408 () Unit!15292)

(declare-fun Unit!15333 () Unit!15292)

(assert (=> b!215936 (= lt!341408 Unit!15333)))

(declare-fun lt!341420 () Unit!15292)

(declare-fun Unit!15334 () Unit!15292)

(assert (=> b!215936 (= lt!341420 Unit!15334)))

(assert (=> b!215936 (= lt!341442 (reader!0 (_2!9886 lt!340128) (_2!9886 lt!341443)))))

(declare-fun lt!341418 () (_ BitVec 64))

(assert (=> b!215936 (= lt!341418 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!341426 () Unit!15292)

(assert (=> b!215936 (= lt!341426 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9886 lt!340128) (buf!5189 (_2!9886 lt!341443)) lt!341418))))

(assert (=> b!215936 (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341443)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340128))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340128))) lt!341418)))

(declare-fun lt!341431 () Unit!15292)

(assert (=> b!215936 (= lt!341431 lt!341426)))

(assert (=> b!215936 (= lt!341407 (readNBitsLSBFirstsLoopPure!0 (_1!9885 lt!341442) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!181664 () Bool)

(assert (=> b!215936 (= res!181664 (= (_2!9884 lt!341407) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!215936 (=> (not res!181664) (not e!146871))))

(assert (=> b!215936 e!146871))

(declare-fun lt!341449 () Unit!15292)

(declare-fun Unit!15335 () Unit!15292)

(assert (=> b!215936 (= lt!341449 Unit!15335)))

(declare-fun bm!3366 () Bool)

(assert (=> bm!3366 (= call!3369 (isPrefixOf!0 (_2!9886 lt!340128) (ite c!10537 (_2!9886 lt!340128) (_2!9886 lt!341443))))))

(declare-fun b!215937 () Bool)

(declare-fun Unit!15336 () Unit!15292)

(assert (=> b!215937 (= e!146868 (tuple2!18463 Unit!15336 (_2!9886 lt!340128)))))

(declare-fun lt!341419 () Unit!15292)

(assert (=> b!215937 (= lt!341419 (lemmaIsPrefixRefl!0 (_2!9886 lt!340128)))))

(assert (=> b!215937 call!3369))

(declare-fun lt!341429 () Unit!15292)

(assert (=> b!215937 (= lt!341429 lt!341419)))

(declare-fun b!215938 () Bool)

(assert (=> b!215938 (= e!146867 e!146872)))

(declare-fun res!181663 () Bool)

(assert (=> b!215938 (=> (not res!181663) (not e!146872))))

(assert (=> b!215938 (= res!181663 (= (_2!9884 lt!341428) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!215938 (= lt!341428 (readNBitsLSBFirstsLoopPure!0 (_1!9885 lt!341452) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!341421 () Unit!15292)

(declare-fun lt!341435 () Unit!15292)

(assert (=> b!215938 (= lt!341421 lt!341435)))

(declare-fun lt!341433 () (_ BitVec 64))

(assert (=> b!215938 (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341432)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340128))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340128))) lt!341433)))

(assert (=> b!215938 (= lt!341435 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9886 lt!340128) (buf!5189 (_2!9886 lt!341432)) lt!341433))))

(declare-fun e!146866 () Bool)

(assert (=> b!215938 e!146866))

(declare-fun res!181666 () Bool)

(assert (=> b!215938 (=> (not res!181666) (not e!146866))))

(assert (=> b!215938 (= res!181666 (and (= (size!4654 (buf!5189 (_2!9886 lt!340128))) (size!4654 (buf!5189 (_2!9886 lt!341432)))) (bvsge lt!341433 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215938 (= lt!341433 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!215938 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!215938 (= lt!341452 (reader!0 (_2!9886 lt!340128) (_2!9886 lt!341432)))))

(declare-fun b!215939 () Bool)

(assert (=> b!215939 (= e!146866 (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340128)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340128))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340128))) lt!341433))))

(declare-fun b!215940 () Bool)

(assert (=> b!215940 (= lt!341440 (readBitPure!0 (readerFrom!0 (_2!9886 lt!341445) (currentBit!9762 (_2!9886 lt!340128)) (currentByte!9767 (_2!9886 lt!340128)))))))

(declare-fun res!181667 () Bool)

(assert (=> b!215940 (= res!181667 (and (= (_2!9887 lt!341440) lt!341434) (= (_1!9887 lt!341440) (_2!9886 lt!341445))))))

(assert (=> b!215940 (=> (not res!181667) (not e!146869))))

(assert (=> b!215940 (= e!146874 e!146869)))

(assert (= (and d!72713 c!10537) b!215937))

(assert (= (and d!72713 (not c!10537)) b!215936))

(assert (= (and b!215936 res!181656) b!215927))

(assert (= (and b!215927 res!181657) b!215926))

(assert (= (and b!215926 res!181658) b!215940))

(assert (= (and b!215940 res!181667) b!215932))

(assert (= (and b!215936 res!181662) b!215931))

(assert (= (and b!215936 c!10538) b!215929))

(assert (= (and b!215936 (not c!10538)) b!215925))

(assert (= (and b!215936 res!181664) b!215928))

(assert (= (or b!215937 b!215936) bm!3366))

(assert (= (and d!72713 res!181665) b!215935))

(assert (= (and b!215935 res!181661) b!215933))

(assert (= (and b!215933 res!181660) b!215934))

(assert (= (and b!215934 res!181659) b!215938))

(assert (= (and b!215938 res!181666) b!215939))

(assert (= (and b!215938 res!181663) b!215930))

(declare-fun m!332547 () Bool)

(assert (=> bm!3366 m!332547))

(declare-fun m!332549 () Bool)

(assert (=> b!215939 m!332549))

(declare-fun m!332551 () Bool)

(assert (=> b!215940 m!332551))

(assert (=> b!215940 m!332551))

(declare-fun m!332553 () Bool)

(assert (=> b!215940 m!332553))

(declare-fun m!332555 () Bool)

(assert (=> b!215936 m!332555))

(declare-fun m!332557 () Bool)

(assert (=> b!215936 m!332557))

(declare-fun m!332559 () Bool)

(assert (=> b!215936 m!332559))

(declare-fun m!332561 () Bool)

(assert (=> b!215936 m!332561))

(declare-fun m!332563 () Bool)

(assert (=> b!215936 m!332563))

(declare-fun m!332565 () Bool)

(assert (=> b!215936 m!332565))

(assert (=> b!215936 m!331645))

(declare-fun m!332567 () Bool)

(assert (=> b!215936 m!332567))

(declare-fun m!332569 () Bool)

(assert (=> b!215936 m!332569))

(declare-fun m!332571 () Bool)

(assert (=> b!215936 m!332571))

(declare-fun m!332573 () Bool)

(assert (=> b!215936 m!332573))

(declare-fun m!332575 () Bool)

(assert (=> b!215936 m!332575))

(declare-fun m!332577 () Bool)

(assert (=> b!215936 m!332577))

(assert (=> b!215936 m!332557))

(declare-fun m!332579 () Bool)

(assert (=> b!215936 m!332579))

(declare-fun m!332581 () Bool)

(assert (=> b!215936 m!332581))

(declare-fun m!332583 () Bool)

(assert (=> b!215936 m!332583))

(declare-fun m!332585 () Bool)

(assert (=> b!215936 m!332585))

(declare-fun m!332587 () Bool)

(assert (=> b!215936 m!332587))

(declare-fun m!332589 () Bool)

(assert (=> b!215936 m!332589))

(declare-fun m!332591 () Bool)

(assert (=> b!215936 m!332591))

(declare-fun m!332593 () Bool)

(assert (=> b!215936 m!332593))

(declare-fun m!332595 () Bool)

(assert (=> b!215936 m!332595))

(declare-fun m!332597 () Bool)

(assert (=> b!215936 m!332597))

(declare-fun m!332599 () Bool)

(assert (=> b!215936 m!332599))

(declare-fun m!332601 () Bool)

(assert (=> b!215936 m!332601))

(declare-fun m!332603 () Bool)

(assert (=> b!215936 m!332603))

(declare-fun m!332605 () Bool)

(assert (=> b!215936 m!332605))

(declare-fun m!332607 () Bool)

(assert (=> b!215936 m!332607))

(declare-fun m!332609 () Bool)

(assert (=> b!215936 m!332609))

(assert (=> b!215936 m!331623))

(declare-fun m!332611 () Bool)

(assert (=> b!215936 m!332611))

(declare-fun m!332613 () Bool)

(assert (=> b!215936 m!332613))

(declare-fun m!332615 () Bool)

(assert (=> b!215936 m!332615))

(assert (=> b!215937 m!332293))

(declare-fun m!332617 () Bool)

(assert (=> b!215927 m!332617))

(assert (=> b!215927 m!331623))

(assert (=> b!215938 m!331645))

(assert (=> b!215938 m!332567))

(declare-fun m!332619 () Bool)

(assert (=> b!215938 m!332619))

(declare-fun m!332621 () Bool)

(assert (=> b!215938 m!332621))

(declare-fun m!332623 () Bool)

(assert (=> b!215938 m!332623))

(declare-fun m!332625 () Bool)

(assert (=> b!215938 m!332625))

(declare-fun m!332627 () Bool)

(assert (=> b!215932 m!332627))

(assert (=> b!215932 m!332617))

(declare-fun m!332629 () Bool)

(assert (=> b!215933 m!332629))

(assert (=> b!215933 m!331623))

(declare-fun m!332631 () Bool)

(assert (=> d!72713 m!332631))

(declare-fun m!332633 () Bool)

(assert (=> b!215926 m!332633))

(declare-fun m!332635 () Bool)

(assert (=> b!215934 m!332635))

(assert (=> b!215393 d!72713))

(push 1)

(assert (not b!215768))

(assert (not d!72697))

(assert (not d!72659))

(assert (not b!215699))

(assert (not d!72611))

(assert (not b!215754))

(assert (not d!72583))

(assert (not b!215769))

(assert (not d!72691))

(assert (not b!215933))

(assert (not d!72557))

(assert (not d!72695))

(assert (not b!215927))

(assert (not b!215936))

(assert (not d!72685))

(assert (not d!72555))

(assert (not b!215766))

(assert (not d!72705))

(assert (not b!215932))

(assert (not d!72701))

(assert (not d!72571))

(assert (not b!215684))

(assert (not d!72657))

(assert (not b!215656))

(assert (not b!215696))

(assert (not d!72553))

(assert (not b!215926))

(assert (not d!72607))

(assert (not bm!3366))

(assert (not d!72687))

(assert (not d!72711))

(assert (not d!72623))

(assert (not d!72689))

(assert (not d!72569))

(assert (not d!72707))

(assert (not b!215682))

(assert (not b!215940))

(assert (not b!215778))

(assert (not b!215938))

(assert (not d!72699))

(assert (not b!215683))

(assert (not b!215681))

(assert (not d!72573))

(assert (not d!72567))

(assert (not b!215697))

(assert (not d!72601))

(assert (not d!72565))

(assert (not b!215750))

(assert (not b!215937))

(assert (not d!72713))

(assert (not d!72681))

(assert (not b!215753))

(assert (not b!215770))

(assert (not d!72661))

(assert (not b!215776))

(assert (not b!215752))

(assert (not b!215939))

(assert (not b!215654))

(assert (not d!72663))

(assert (not b!215934))

(assert (not d!72619))

(assert (not d!72683))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!73239 () Bool)

(assert (=> d!73239 (= (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!340137)))) ((_ sign_extend 32) (currentByte!9767 (_1!9887 lt!340137))) ((_ sign_extend 32) (currentBit!9762 (_1!9887 lt!340137)))) (bvsub (bvmul ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!340137)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_1!9887 lt!340137))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_1!9887 lt!340137))))))))

(assert (=> d!72689 d!73239))

(declare-fun d!73241 () Bool)

(assert (=> d!73241 (= (invariant!0 (currentBit!9762 (_1!9887 lt!340137)) (currentByte!9767 (_1!9887 lt!340137)) (size!4654 (buf!5189 (_1!9887 lt!340137)))) (and (bvsge (currentBit!9762 (_1!9887 lt!340137)) #b00000000000000000000000000000000) (bvslt (currentBit!9762 (_1!9887 lt!340137)) #b00000000000000000000000000001000) (bvsge (currentByte!9767 (_1!9887 lt!340137)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9767 (_1!9887 lt!340137)) (size!4654 (buf!5189 (_1!9887 lt!340137)))) (and (= (currentBit!9762 (_1!9887 lt!340137)) #b00000000000000000000000000000000) (= (currentByte!9767 (_1!9887 lt!340137)) (size!4654 (buf!5189 (_1!9887 lt!340137))))))))))

(assert (=> d!72689 d!73241))

(assert (=> b!215768 d!72569))

(declare-fun d!73243 () Bool)

(assert (=> d!73243 (arrayBitRangesEq!0 (buf!5189 (_2!9886 lt!340151)) (buf!5189 (_2!9886 lt!340128)) lt!340904 lt!340906)))

(declare-fun lt!342293 () Unit!15292)

(declare-fun choose!8 (array!10595 array!10595 (_ BitVec 64) (_ BitVec 64)) Unit!15292)

(assert (=> d!73243 (= lt!342293 (choose!8 (buf!5189 (_2!9886 lt!340128)) (buf!5189 (_2!9886 lt!340151)) lt!340904 lt!340906))))

(assert (=> d!73243 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340904) (bvsle lt!340904 lt!340906))))

(assert (=> d!73243 (= (arrayBitRangesEqSymmetric!0 (buf!5189 (_2!9886 lt!340128)) (buf!5189 (_2!9886 lt!340151)) lt!340904 lt!340906) lt!342293)))

(declare-fun bs!17912 () Bool)

(assert (= bs!17912 d!73243))

(assert (=> bs!17912 m!332305))

(declare-fun m!333817 () Bool)

(assert (=> bs!17912 m!333817))

(assert (=> b!215768 d!73243))

(declare-fun e!147238 () Bool)

(declare-datatypes ((tuple4!282 0))(
  ( (tuple4!283 (_1!9904 (_ BitVec 32)) (_2!9904 (_ BitVec 32)) (_3!657 (_ BitVec 32)) (_4!141 (_ BitVec 32))) )
))
(declare-fun lt!342302 () tuple4!282)

(declare-fun b!216469 () Bool)

(declare-fun arrayRangesEq!703 (array!10595 array!10595 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!216469 (= e!147238 (arrayRangesEq!703 (buf!5189 (_2!9886 lt!340151)) (buf!5189 (_2!9886 lt!340128)) (_1!9904 lt!342302) (_2!9904 lt!342302)))))

(declare-fun b!216470 () Bool)

(declare-fun lt!342300 () (_ BitVec 32))

(declare-fun e!147240 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!216470 (= e!147240 (byteRangesEq!0 (select (arr!5584 (buf!5189 (_2!9886 lt!340151))) (_4!141 lt!342302)) (select (arr!5584 (buf!5189 (_2!9886 lt!340128))) (_4!141 lt!342302)) #b00000000000000000000000000000000 lt!342300))))

(declare-fun b!216471 () Bool)

(declare-fun e!147241 () Bool)

(declare-fun call!3388 () Bool)

(assert (=> b!216471 (= e!147241 call!3388)))

(declare-fun b!216472 () Bool)

(declare-fun res!182104 () Bool)

(assert (=> b!216472 (= res!182104 (= lt!342300 #b00000000000000000000000000000000))))

(assert (=> b!216472 (=> res!182104 e!147240)))

(declare-fun e!147237 () Bool)

(assert (=> b!216472 (= e!147237 e!147240)))

(declare-fun b!216473 () Bool)

(assert (=> b!216473 (= e!147241 e!147237)))

(declare-fun res!182106 () Bool)

(assert (=> b!216473 (= res!182106 call!3388)))

(assert (=> b!216473 (=> (not res!182106) (not e!147237))))

(declare-fun bm!3385 () Bool)

(declare-fun c!10581 () Bool)

(declare-fun lt!342301 () (_ BitVec 32))

(assert (=> bm!3385 (= call!3388 (byteRangesEq!0 (select (arr!5584 (buf!5189 (_2!9886 lt!340151))) (_3!657 lt!342302)) (select (arr!5584 (buf!5189 (_2!9886 lt!340128))) (_3!657 lt!342302)) lt!342301 (ite c!10581 lt!342300 #b00000000000000000000000000001000)))))

(declare-fun d!73245 () Bool)

(declare-fun res!182102 () Bool)

(declare-fun e!147239 () Bool)

(assert (=> d!73245 (=> res!182102 e!147239)))

(assert (=> d!73245 (= res!182102 (bvsge lt!340904 lt!340906))))

(assert (=> d!73245 (= (arrayBitRangesEq!0 (buf!5189 (_2!9886 lt!340151)) (buf!5189 (_2!9886 lt!340128)) lt!340904 lt!340906) e!147239)))

(declare-fun b!216474 () Bool)

(declare-fun e!147242 () Bool)

(assert (=> b!216474 (= e!147239 e!147242)))

(declare-fun res!182103 () Bool)

(assert (=> b!216474 (=> (not res!182103) (not e!147242))))

(assert (=> b!216474 (= res!182103 e!147238)))

(declare-fun res!182105 () Bool)

(assert (=> b!216474 (=> res!182105 e!147238)))

(assert (=> b!216474 (= res!182105 (bvsge (_1!9904 lt!342302) (_2!9904 lt!342302)))))

(assert (=> b!216474 (= lt!342300 ((_ extract 31 0) (bvsrem lt!340906 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216474 (= lt!342301 ((_ extract 31 0) (bvsrem lt!340904 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!282)

(assert (=> b!216474 (= lt!342302 (arrayBitIndices!0 lt!340904 lt!340906))))

(declare-fun b!216475 () Bool)

(assert (=> b!216475 (= e!147242 e!147241)))

(assert (=> b!216475 (= c!10581 (= (_3!657 lt!342302) (_4!141 lt!342302)))))

(assert (= (and d!73245 (not res!182102)) b!216474))

(assert (= (and b!216474 (not res!182105)) b!216469))

(assert (= (and b!216474 res!182103) b!216475))

(assert (= (and b!216475 c!10581) b!216471))

(assert (= (and b!216475 (not c!10581)) b!216473))

(assert (= (and b!216473 res!182106) b!216472))

(assert (= (and b!216472 (not res!182104)) b!216470))

(assert (= (or b!216471 b!216473) bm!3385))

(declare-fun m!333819 () Bool)

(assert (=> b!216469 m!333819))

(declare-fun m!333821 () Bool)

(assert (=> b!216470 m!333821))

(declare-fun m!333823 () Bool)

(assert (=> b!216470 m!333823))

(assert (=> b!216470 m!333821))

(assert (=> b!216470 m!333823))

(declare-fun m!333825 () Bool)

(assert (=> b!216470 m!333825))

(declare-fun m!333827 () Bool)

(assert (=> bm!3385 m!333827))

(declare-fun m!333829 () Bool)

(assert (=> bm!3385 m!333829))

(assert (=> bm!3385 m!333827))

(assert (=> bm!3385 m!333829))

(declare-fun m!333831 () Bool)

(assert (=> bm!3385 m!333831))

(declare-fun m!333833 () Bool)

(assert (=> b!216474 m!333833))

(assert (=> b!215768 d!73245))

(declare-fun d!73247 () Bool)

(declare-fun res!182109 () Bool)

(declare-fun e!147243 () Bool)

(assert (=> d!73247 (=> (not res!182109) (not e!147243))))

(assert (=> d!73247 (= res!182109 (= (size!4654 (buf!5189 (_1!9885 lt!340909))) (size!4654 (buf!5189 (_2!9886 lt!340128)))))))

(assert (=> d!73247 (= (isPrefixOf!0 (_1!9885 lt!340909) (_2!9886 lt!340128)) e!147243)))

(declare-fun b!216476 () Bool)

(declare-fun res!182107 () Bool)

(assert (=> b!216476 (=> (not res!182107) (not e!147243))))

(assert (=> b!216476 (= res!182107 (bvsle (bitIndex!0 (size!4654 (buf!5189 (_1!9885 lt!340909))) (currentByte!9767 (_1!9885 lt!340909)) (currentBit!9762 (_1!9885 lt!340909))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128)))))))

(declare-fun b!216477 () Bool)

(declare-fun e!147244 () Bool)

(assert (=> b!216477 (= e!147243 e!147244)))

(declare-fun res!182108 () Bool)

(assert (=> b!216477 (=> res!182108 e!147244)))

(assert (=> b!216477 (= res!182108 (= (size!4654 (buf!5189 (_1!9885 lt!340909))) #b00000000000000000000000000000000))))

(declare-fun b!216478 () Bool)

(assert (=> b!216478 (= e!147244 (arrayBitRangesEq!0 (buf!5189 (_1!9885 lt!340909)) (buf!5189 (_2!9886 lt!340128)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 (_1!9885 lt!340909))) (currentByte!9767 (_1!9885 lt!340909)) (currentBit!9762 (_1!9885 lt!340909)))))))

(assert (= (and d!73247 res!182109) b!216476))

(assert (= (and b!216476 res!182107) b!216477))

(assert (= (and b!216477 (not res!182108)) b!216478))

(declare-fun m!333835 () Bool)

(assert (=> b!216476 m!333835))

(assert (=> b!216476 m!331623))

(assert (=> b!216478 m!333835))

(assert (=> b!216478 m!333835))

(declare-fun m!333837 () Bool)

(assert (=> b!216478 m!333837))

(assert (=> b!215766 d!73247))

(declare-fun d!73249 () Bool)

(assert (=> d!73249 (= (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340128)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340128))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340128)))) (bvsub (bvmul ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340128)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340128))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340128))))))))

(assert (=> d!72569 d!73249))

(declare-fun d!73251 () Bool)

(assert (=> d!73251 (= (invariant!0 (currentBit!9762 (_2!9886 lt!340128)) (currentByte!9767 (_2!9886 lt!340128)) (size!4654 (buf!5189 (_2!9886 lt!340128)))) (and (bvsge (currentBit!9762 (_2!9886 lt!340128)) #b00000000000000000000000000000000) (bvslt (currentBit!9762 (_2!9886 lt!340128)) #b00000000000000000000000000001000) (bvsge (currentByte!9767 (_2!9886 lt!340128)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9767 (_2!9886 lt!340128)) (size!4654 (buf!5189 (_2!9886 lt!340128)))) (and (= (currentBit!9762 (_2!9886 lt!340128)) #b00000000000000000000000000000000) (= (currentByte!9767 (_2!9886 lt!340128)) (size!4654 (buf!5189 (_2!9886 lt!340128))))))))))

(assert (=> d!72569 d!73251))

(declare-fun d!73253 () Bool)

(declare-fun e!147245 () Bool)

(assert (=> d!73253 e!147245))

(declare-fun res!182111 () Bool)

(assert (=> d!73253 (=> (not res!182111) (not e!147245))))

(declare-fun lt!342308 () (_ BitVec 64))

(declare-fun lt!342303 () (_ BitVec 64))

(declare-fun lt!342304 () (_ BitVec 64))

(assert (=> d!73253 (= res!182111 (= lt!342308 (bvsub lt!342304 lt!342303)))))

(assert (=> d!73253 (or (= (bvand lt!342304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342303 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342304 lt!342303) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73253 (= lt!342303 (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 lt!340922))) ((_ sign_extend 32) (currentByte!9767 lt!340922)) ((_ sign_extend 32) (currentBit!9762 lt!340922))))))

(declare-fun lt!342305 () (_ BitVec 64))

(declare-fun lt!342307 () (_ BitVec 64))

(assert (=> d!73253 (= lt!342304 (bvmul lt!342305 lt!342307))))

(assert (=> d!73253 (or (= lt!342305 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342307 (bvsdiv (bvmul lt!342305 lt!342307) lt!342305)))))

(assert (=> d!73253 (= lt!342307 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73253 (= lt!342305 ((_ sign_extend 32) (size!4654 (buf!5189 lt!340922))))))

(assert (=> d!73253 (= lt!342308 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 lt!340922)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 lt!340922))))))

(assert (=> d!73253 (invariant!0 (currentBit!9762 lt!340922) (currentByte!9767 lt!340922) (size!4654 (buf!5189 lt!340922)))))

(assert (=> d!73253 (= (bitIndex!0 (size!4654 (buf!5189 lt!340922)) (currentByte!9767 lt!340922) (currentBit!9762 lt!340922)) lt!342308)))

(declare-fun b!216479 () Bool)

(declare-fun res!182110 () Bool)

(assert (=> b!216479 (=> (not res!182110) (not e!147245))))

(assert (=> b!216479 (= res!182110 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342308))))

(declare-fun b!216480 () Bool)

(declare-fun lt!342306 () (_ BitVec 64))

(assert (=> b!216480 (= e!147245 (bvsle lt!342308 (bvmul lt!342306 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216480 (or (= lt!342306 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!342306 #b0000000000000000000000000000000000000000000000000000000000001000) lt!342306)))))

(assert (=> b!216480 (= lt!342306 ((_ sign_extend 32) (size!4654 (buf!5189 lt!340922))))))

(assert (= (and d!73253 res!182111) b!216479))

(assert (= (and b!216479 res!182110) b!216480))

(declare-fun m!333839 () Bool)

(assert (=> d!73253 m!333839))

(declare-fun m!333841 () Bool)

(assert (=> d!73253 m!333841))

(assert (=> d!72701 d!73253))

(declare-fun d!73255 () Bool)

(declare-fun e!147246 () Bool)

(assert (=> d!73255 e!147246))

(declare-fun res!182113 () Bool)

(assert (=> d!73255 (=> (not res!182113) (not e!147246))))

(declare-fun lt!342314 () (_ BitVec 64))

(declare-fun lt!342310 () (_ BitVec 64))

(declare-fun lt!342309 () (_ BitVec 64))

(assert (=> d!73255 (= res!182113 (= lt!342314 (bvsub lt!342310 lt!342309)))))

(assert (=> d!73255 (or (= (bvand lt!342310 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342309 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342310 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342310 lt!342309) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73255 (= lt!342309 (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9885 lt!340131)))) ((_ sign_extend 32) (currentByte!9767 (_2!9885 lt!340131))) ((_ sign_extend 32) (currentBit!9762 (_2!9885 lt!340131)))))))

(declare-fun lt!342311 () (_ BitVec 64))

(declare-fun lt!342313 () (_ BitVec 64))

(assert (=> d!73255 (= lt!342310 (bvmul lt!342311 lt!342313))))

(assert (=> d!73255 (or (= lt!342311 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342313 (bvsdiv (bvmul lt!342311 lt!342313) lt!342311)))))

(assert (=> d!73255 (= lt!342313 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73255 (= lt!342311 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9885 lt!340131)))))))

(assert (=> d!73255 (= lt!342314 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_2!9885 lt!340131))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_2!9885 lt!340131)))))))

(assert (=> d!73255 (invariant!0 (currentBit!9762 (_2!9885 lt!340131)) (currentByte!9767 (_2!9885 lt!340131)) (size!4654 (buf!5189 (_2!9885 lt!340131))))))

(assert (=> d!73255 (= (bitIndex!0 (size!4654 (buf!5189 (_2!9885 lt!340131))) (currentByte!9767 (_2!9885 lt!340131)) (currentBit!9762 (_2!9885 lt!340131))) lt!342314)))

(declare-fun b!216481 () Bool)

(declare-fun res!182112 () Bool)

(assert (=> b!216481 (=> (not res!182112) (not e!147246))))

(assert (=> b!216481 (= res!182112 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342314))))

(declare-fun b!216482 () Bool)

(declare-fun lt!342312 () (_ BitVec 64))

(assert (=> b!216482 (= e!147246 (bvsle lt!342314 (bvmul lt!342312 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216482 (or (= lt!342312 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!342312 #b0000000000000000000000000000000000000000000000000000000000001000) lt!342312)))))

(assert (=> b!216482 (= lt!342312 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9885 lt!340131)))))))

(assert (= (and d!73255 res!182113) b!216481))

(assert (= (and b!216481 res!182112) b!216482))

(declare-fun m!333843 () Bool)

(assert (=> d!73255 m!333843))

(declare-fun m!333845 () Bool)

(assert (=> d!73255 m!333845))

(assert (=> d!72701 d!73255))

(declare-fun d!73257 () Bool)

(declare-fun lt!342331 () (_ BitVec 32))

(assert (=> d!73257 (= lt!342331 ((_ extract 31 0) (bvsrem (bvsub lt!340148 lt!340142) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!342327 () (_ BitVec 32))

(assert (=> d!73257 (= lt!342327 ((_ extract 31 0) (bvsdiv (bvsub lt!340148 lt!340142) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!147252 () Bool)

(assert (=> d!73257 e!147252))

(declare-fun res!182118 () Bool)

(assert (=> d!73257 (=> (not res!182118) (not e!147252))))

(assert (=> d!73257 (= res!182118 (moveBitIndexPrecond!0 (_2!9885 lt!340131) (bvsub lt!340148 lt!340142)))))

(declare-fun Unit!15401 () Unit!15292)

(declare-fun Unit!15402 () Unit!15292)

(declare-fun Unit!15403 () Unit!15292)

(assert (=> d!73257 (= (moveBitIndex!0 (_2!9885 lt!340131) (bvsub lt!340148 lt!340142)) (ite (bvslt (bvadd (currentBit!9762 (_2!9885 lt!340131)) lt!342331) #b00000000000000000000000000000000) (tuple2!18463 Unit!15401 (BitStream!8417 (buf!5189 (_2!9885 lt!340131)) (bvsub (bvadd (currentByte!9767 (_2!9885 lt!340131)) lt!342327) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!342331 (currentBit!9762 (_2!9885 lt!340131))))) (ite (bvsge (bvadd (currentBit!9762 (_2!9885 lt!340131)) lt!342331) #b00000000000000000000000000001000) (tuple2!18463 Unit!15402 (BitStream!8417 (buf!5189 (_2!9885 lt!340131)) (bvadd (currentByte!9767 (_2!9885 lt!340131)) lt!342327 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9762 (_2!9885 lt!340131)) lt!342331) #b00000000000000000000000000001000))) (tuple2!18463 Unit!15403 (BitStream!8417 (buf!5189 (_2!9885 lt!340131)) (bvadd (currentByte!9767 (_2!9885 lt!340131)) lt!342327) (bvadd (currentBit!9762 (_2!9885 lt!340131)) lt!342331))))))))

(declare-fun b!216487 () Bool)

(declare-fun e!147251 () Bool)

(assert (=> b!216487 (= e!147252 e!147251)))

(declare-fun res!182119 () Bool)

(assert (=> b!216487 (=> (not res!182119) (not e!147251))))

(declare-fun lt!342332 () tuple2!18462)

(declare-fun lt!342328 () (_ BitVec 64))

(assert (=> b!216487 (= res!182119 (= (bvadd lt!342328 (bvsub lt!340148 lt!340142)) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!342332))) (currentByte!9767 (_2!9886 lt!342332)) (currentBit!9762 (_2!9886 lt!342332)))))))

(assert (=> b!216487 (or (not (= (bvand lt!342328 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340148 lt!340142) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342328 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342328 (bvsub lt!340148 lt!340142)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216487 (= lt!342328 (bitIndex!0 (size!4654 (buf!5189 (_2!9885 lt!340131))) (currentByte!9767 (_2!9885 lt!340131)) (currentBit!9762 (_2!9885 lt!340131))))))

(declare-fun lt!342329 () (_ BitVec 32))

(declare-fun lt!342330 () (_ BitVec 32))

(declare-fun Unit!15404 () Unit!15292)

(declare-fun Unit!15405 () Unit!15292)

(declare-fun Unit!15406 () Unit!15292)

(assert (=> b!216487 (= lt!342332 (ite (bvslt (bvadd (currentBit!9762 (_2!9885 lt!340131)) lt!342330) #b00000000000000000000000000000000) (tuple2!18463 Unit!15404 (BitStream!8417 (buf!5189 (_2!9885 lt!340131)) (bvsub (bvadd (currentByte!9767 (_2!9885 lt!340131)) lt!342329) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!342330 (currentBit!9762 (_2!9885 lt!340131))))) (ite (bvsge (bvadd (currentBit!9762 (_2!9885 lt!340131)) lt!342330) #b00000000000000000000000000001000) (tuple2!18463 Unit!15405 (BitStream!8417 (buf!5189 (_2!9885 lt!340131)) (bvadd (currentByte!9767 (_2!9885 lt!340131)) lt!342329 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9762 (_2!9885 lt!340131)) lt!342330) #b00000000000000000000000000001000))) (tuple2!18463 Unit!15406 (BitStream!8417 (buf!5189 (_2!9885 lt!340131)) (bvadd (currentByte!9767 (_2!9885 lt!340131)) lt!342329) (bvadd (currentBit!9762 (_2!9885 lt!340131)) lt!342330))))))))

(assert (=> b!216487 (= lt!342330 ((_ extract 31 0) (bvsrem (bvsub lt!340148 lt!340142) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216487 (= lt!342329 ((_ extract 31 0) (bvsdiv (bvsub lt!340148 lt!340142) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!216488 () Bool)

(assert (=> b!216488 (= e!147251 (and (= (size!4654 (buf!5189 (_2!9885 lt!340131))) (size!4654 (buf!5189 (_2!9886 lt!342332)))) (= (buf!5189 (_2!9885 lt!340131)) (buf!5189 (_2!9886 lt!342332)))))))

(assert (= (and d!73257 res!182118) b!216487))

(assert (= (and b!216487 res!182119) b!216488))

(assert (=> d!73257 m!332331))

(declare-fun m!333847 () Bool)

(assert (=> b!216487 m!333847))

(assert (=> b!216487 m!332327))

(assert (=> d!72701 d!73257))

(declare-fun d!73261 () Bool)

(declare-fun res!182122 () Bool)

(declare-fun e!147255 () Bool)

(assert (=> d!73261 (=> (not res!182122) (not e!147255))))

(assert (=> d!73261 (= res!182122 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9885 lt!340131))))) (bvsub lt!340148 lt!340142)) (bvsle (bvsub lt!340148 lt!340142) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9885 lt!340131))))))))))

(assert (=> d!73261 (= (moveBitIndexPrecond!0 (_2!9885 lt!340131) (bvsub lt!340148 lt!340142)) e!147255)))

(declare-fun b!216492 () Bool)

(declare-fun lt!342335 () (_ BitVec 64))

(assert (=> b!216492 (= e!147255 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342335) (bvsle lt!342335 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9885 lt!340131))))))))))

(assert (=> b!216492 (= lt!342335 (bvadd (bitIndex!0 (size!4654 (buf!5189 (_2!9885 lt!340131))) (currentByte!9767 (_2!9885 lt!340131)) (currentBit!9762 (_2!9885 lt!340131))) (bvsub lt!340148 lt!340142)))))

(assert (= (and d!73261 res!182122) b!216492))

(assert (=> b!216492 m!332327))

(assert (=> d!72701 d!73261))

(declare-fun d!73263 () Bool)

(assert (=> d!73263 (= (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!340149)))) ((_ sign_extend 32) (currentByte!9767 (_1!9887 lt!340149))) ((_ sign_extend 32) (currentBit!9762 (_1!9887 lt!340149)))) (bvsub (bvmul ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!340149)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_1!9887 lt!340149))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_1!9887 lt!340149))))))))

(assert (=> d!72681 d!73263))

(declare-fun d!73265 () Bool)

(assert (=> d!73265 (= (invariant!0 (currentBit!9762 (_1!9887 lt!340149)) (currentByte!9767 (_1!9887 lt!340149)) (size!4654 (buf!5189 (_1!9887 lt!340149)))) (and (bvsge (currentBit!9762 (_1!9887 lt!340149)) #b00000000000000000000000000000000) (bvslt (currentBit!9762 (_1!9887 lt!340149)) #b00000000000000000000000000001000) (bvsge (currentByte!9767 (_1!9887 lt!340149)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9767 (_1!9887 lt!340149)) (size!4654 (buf!5189 (_1!9887 lt!340149)))) (and (= (currentBit!9762 (_1!9887 lt!340149)) #b00000000000000000000000000000000) (= (currentByte!9767 (_1!9887 lt!340149)) (size!4654 (buf!5189 (_1!9887 lt!340149))))))))))

(assert (=> d!72681 d!73265))

(declare-fun d!73267 () Bool)

(declare-fun e!147256 () Bool)

(assert (=> d!73267 e!147256))

(declare-fun res!182124 () Bool)

(assert (=> d!73267 (=> (not res!182124) (not e!147256))))

(declare-fun lt!342341 () (_ BitVec 64))

(declare-fun lt!342337 () (_ BitVec 64))

(declare-fun lt!342336 () (_ BitVec 64))

(assert (=> d!73267 (= res!182124 (= lt!342341 (bvsub lt!342337 lt!342336)))))

(assert (=> d!73267 (or (= (bvand lt!342337 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342336 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342337 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342337 lt!342336) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73267 (= lt!342336 (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 lt!340540))) ((_ sign_extend 32) (currentByte!9767 lt!340540)) ((_ sign_extend 32) (currentBit!9762 lt!340540))))))

(declare-fun lt!342338 () (_ BitVec 64))

(declare-fun lt!342340 () (_ BitVec 64))

(assert (=> d!73267 (= lt!342337 (bvmul lt!342338 lt!342340))))

(assert (=> d!73267 (or (= lt!342338 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342340 (bvsdiv (bvmul lt!342338 lt!342340) lt!342338)))))

(assert (=> d!73267 (= lt!342340 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73267 (= lt!342338 ((_ sign_extend 32) (size!4654 (buf!5189 lt!340540))))))

(assert (=> d!73267 (= lt!342341 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 lt!340540)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 lt!340540))))))

(assert (=> d!73267 (invariant!0 (currentBit!9762 lt!340540) (currentByte!9767 lt!340540) (size!4654 (buf!5189 lt!340540)))))

(assert (=> d!73267 (= (bitIndex!0 (size!4654 (buf!5189 lt!340540)) (currentByte!9767 lt!340540) (currentBit!9762 lt!340540)) lt!342341)))

(declare-fun b!216493 () Bool)

(declare-fun res!182123 () Bool)

(assert (=> b!216493 (=> (not res!182123) (not e!147256))))

(assert (=> b!216493 (= res!182123 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342341))))

(declare-fun b!216494 () Bool)

(declare-fun lt!342339 () (_ BitVec 64))

(assert (=> b!216494 (= e!147256 (bvsle lt!342341 (bvmul lt!342339 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216494 (or (= lt!342339 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!342339 #b0000000000000000000000000000000000000000000000000000000000001000) lt!342339)))))

(assert (=> b!216494 (= lt!342339 ((_ sign_extend 32) (size!4654 (buf!5189 lt!340540))))))

(assert (= (and d!73267 res!182124) b!216493))

(assert (= (and b!216493 res!182123) b!216494))

(declare-fun m!333849 () Bool)

(assert (=> d!73267 m!333849))

(declare-fun m!333851 () Bool)

(assert (=> d!73267 m!333851))

(assert (=> d!72557 d!73267))

(declare-fun d!73269 () Bool)

(declare-fun e!147257 () Bool)

(assert (=> d!73269 e!147257))

(declare-fun res!182126 () Bool)

(assert (=> d!73269 (=> (not res!182126) (not e!147257))))

(declare-fun lt!342343 () (_ BitVec 64))

(declare-fun lt!342347 () (_ BitVec 64))

(declare-fun lt!342342 () (_ BitVec 64))

(assert (=> d!73269 (= res!182126 (= lt!342347 (bvsub lt!342343 lt!342342)))))

(assert (=> d!73269 (or (= (bvand lt!342343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342342 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342343 lt!342342) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73269 (= lt!342342 (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9885 lt!340143)))) ((_ sign_extend 32) (currentByte!9767 (_1!9885 lt!340143))) ((_ sign_extend 32) (currentBit!9762 (_1!9885 lt!340143)))))))

(declare-fun lt!342344 () (_ BitVec 64))

(declare-fun lt!342346 () (_ BitVec 64))

(assert (=> d!73269 (= lt!342343 (bvmul lt!342344 lt!342346))))

(assert (=> d!73269 (or (= lt!342344 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342346 (bvsdiv (bvmul lt!342344 lt!342346) lt!342344)))))

(assert (=> d!73269 (= lt!342346 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73269 (= lt!342344 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9885 lt!340143)))))))

(assert (=> d!73269 (= lt!342347 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_1!9885 lt!340143))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_1!9885 lt!340143)))))))

(assert (=> d!73269 (invariant!0 (currentBit!9762 (_1!9885 lt!340143)) (currentByte!9767 (_1!9885 lt!340143)) (size!4654 (buf!5189 (_1!9885 lt!340143))))))

(assert (=> d!73269 (= (bitIndex!0 (size!4654 (buf!5189 (_1!9885 lt!340143))) (currentByte!9767 (_1!9885 lt!340143)) (currentBit!9762 (_1!9885 lt!340143))) lt!342347)))

(declare-fun b!216495 () Bool)

(declare-fun res!182125 () Bool)

(assert (=> b!216495 (=> (not res!182125) (not e!147257))))

(assert (=> b!216495 (= res!182125 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342347))))

(declare-fun b!216496 () Bool)

(declare-fun lt!342345 () (_ BitVec 64))

(assert (=> b!216496 (= e!147257 (bvsle lt!342347 (bvmul lt!342345 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216496 (or (= lt!342345 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!342345 #b0000000000000000000000000000000000000000000000000000000000001000) lt!342345)))))

(assert (=> b!216496 (= lt!342345 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9885 lt!340143)))))))

(assert (= (and d!73269 res!182126) b!216495))

(assert (= (and b!216495 res!182125) b!216496))

(declare-fun m!333853 () Bool)

(assert (=> d!73269 m!333853))

(declare-fun m!333855 () Bool)

(assert (=> d!73269 m!333855))

(assert (=> d!72557 d!73269))

(declare-fun d!73271 () Bool)

(declare-fun lt!342352 () (_ BitVec 32))

(assert (=> d!73271 (= lt!342352 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!342348 () (_ BitVec 32))

(assert (=> d!73271 (= lt!342348 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!147259 () Bool)

(assert (=> d!73271 e!147259))

(declare-fun res!182127 () Bool)

(assert (=> d!73271 (=> (not res!182127) (not e!147259))))

(assert (=> d!73271 (= res!182127 (moveBitIndexPrecond!0 (_1!9885 lt!340143) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!15407 () Unit!15292)

(declare-fun Unit!15408 () Unit!15292)

(declare-fun Unit!15409 () Unit!15292)

(assert (=> d!73271 (= (moveBitIndex!0 (_1!9885 lt!340143) #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!9762 (_1!9885 lt!340143)) lt!342352) #b00000000000000000000000000000000) (tuple2!18463 Unit!15407 (BitStream!8417 (buf!5189 (_1!9885 lt!340143)) (bvsub (bvadd (currentByte!9767 (_1!9885 lt!340143)) lt!342348) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!342352 (currentBit!9762 (_1!9885 lt!340143))))) (ite (bvsge (bvadd (currentBit!9762 (_1!9885 lt!340143)) lt!342352) #b00000000000000000000000000001000) (tuple2!18463 Unit!15408 (BitStream!8417 (buf!5189 (_1!9885 lt!340143)) (bvadd (currentByte!9767 (_1!9885 lt!340143)) lt!342348 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9762 (_1!9885 lt!340143)) lt!342352) #b00000000000000000000000000001000))) (tuple2!18463 Unit!15409 (BitStream!8417 (buf!5189 (_1!9885 lt!340143)) (bvadd (currentByte!9767 (_1!9885 lt!340143)) lt!342348) (bvadd (currentBit!9762 (_1!9885 lt!340143)) lt!342352))))))))

(declare-fun b!216497 () Bool)

(declare-fun e!147258 () Bool)

(assert (=> b!216497 (= e!147259 e!147258)))

(declare-fun res!182128 () Bool)

(assert (=> b!216497 (=> (not res!182128) (not e!147258))))

(declare-fun lt!342349 () (_ BitVec 64))

(declare-fun lt!342353 () tuple2!18462)

(assert (=> b!216497 (= res!182128 (= (bvadd lt!342349 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!342353))) (currentByte!9767 (_2!9886 lt!342353)) (currentBit!9762 (_2!9886 lt!342353)))))))

(assert (=> b!216497 (or (not (= (bvand lt!342349 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342349 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342349 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216497 (= lt!342349 (bitIndex!0 (size!4654 (buf!5189 (_1!9885 lt!340143))) (currentByte!9767 (_1!9885 lt!340143)) (currentBit!9762 (_1!9885 lt!340143))))))

(declare-fun lt!342350 () (_ BitVec 32))

(declare-fun lt!342351 () (_ BitVec 32))

(declare-fun Unit!15410 () Unit!15292)

(declare-fun Unit!15411 () Unit!15292)

(declare-fun Unit!15412 () Unit!15292)

(assert (=> b!216497 (= lt!342353 (ite (bvslt (bvadd (currentBit!9762 (_1!9885 lt!340143)) lt!342351) #b00000000000000000000000000000000) (tuple2!18463 Unit!15410 (BitStream!8417 (buf!5189 (_1!9885 lt!340143)) (bvsub (bvadd (currentByte!9767 (_1!9885 lt!340143)) lt!342350) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!342351 (currentBit!9762 (_1!9885 lt!340143))))) (ite (bvsge (bvadd (currentBit!9762 (_1!9885 lt!340143)) lt!342351) #b00000000000000000000000000001000) (tuple2!18463 Unit!15411 (BitStream!8417 (buf!5189 (_1!9885 lt!340143)) (bvadd (currentByte!9767 (_1!9885 lt!340143)) lt!342350 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9762 (_1!9885 lt!340143)) lt!342351) #b00000000000000000000000000001000))) (tuple2!18463 Unit!15412 (BitStream!8417 (buf!5189 (_1!9885 lt!340143)) (bvadd (currentByte!9767 (_1!9885 lt!340143)) lt!342350) (bvadd (currentBit!9762 (_1!9885 lt!340143)) lt!342351))))))))

(assert (=> b!216497 (= lt!342351 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216497 (= lt!342350 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!216498 () Bool)

(assert (=> b!216498 (= e!147258 (and (= (size!4654 (buf!5189 (_1!9885 lt!340143))) (size!4654 (buf!5189 (_2!9886 lt!342353)))) (= (buf!5189 (_1!9885 lt!340143)) (buf!5189 (_2!9886 lt!342353)))))))

(assert (= (and d!73271 res!182127) b!216497))

(assert (= (and b!216497 res!182128) b!216498))

(assert (=> d!73271 m!332031))

(declare-fun m!333857 () Bool)

(assert (=> b!216497 m!333857))

(assert (=> b!216497 m!332027))

(assert (=> d!72557 d!73271))

(declare-fun d!73273 () Bool)

(declare-fun res!182129 () Bool)

(declare-fun e!147260 () Bool)

(assert (=> d!73273 (=> (not res!182129) (not e!147260))))

(assert (=> d!73273 (= res!182129 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9885 lt!340143))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9885 lt!340143))))))))))

(assert (=> d!73273 (= (moveBitIndexPrecond!0 (_1!9885 lt!340143) #b0000000000000000000000000000000000000000000000000000000000000001) e!147260)))

(declare-fun b!216499 () Bool)

(declare-fun lt!342354 () (_ BitVec 64))

(assert (=> b!216499 (= e!147260 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342354) (bvsle lt!342354 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9885 lt!340143))))))))))

(assert (=> b!216499 (= lt!342354 (bvadd (bitIndex!0 (size!4654 (buf!5189 (_1!9885 lt!340143))) (currentByte!9767 (_1!9885 lt!340143)) (currentBit!9762 (_1!9885 lt!340143))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!73273 res!182129) b!216499))

(assert (=> b!216499 m!332027))

(assert (=> d!72557 d!73273))

(declare-fun d!73275 () Bool)

(assert (=> d!73275 (= (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 thiss!1204))) ((_ sign_extend 32) (currentByte!9767 thiss!1204)) ((_ sign_extend 32) (currentBit!9762 thiss!1204))) (bvsub (bvmul ((_ sign_extend 32) (size!4654 (buf!5189 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 thiss!1204)))))))

(assert (=> d!72705 d!73275))

(declare-fun d!73277 () Bool)

(declare-fun e!147268 () Bool)

(assert (=> d!73277 e!147268))

(declare-fun res!182144 () Bool)

(assert (=> d!73277 (=> (not res!182144) (not e!147268))))

(declare-fun lt!342372 () tuple2!18490)

(assert (=> d!73277 (= res!182144 (= (buf!5189 (_2!9900 lt!342372)) (buf!5189 (_1!9885 lt!340143))))))

(declare-fun e!147267 () tuple2!18490)

(assert (=> d!73277 (= lt!342372 e!147267)))

(declare-fun c!10584 () Bool)

(assert (=> d!73277 (= c!10584 (= nBits!348 i!590))))

(assert (=> d!73277 (and (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!73277 (= (readNBitsLSBFirstsLoop!0 (_1!9885 lt!340143) nBits!348 i!590 lt!340126) lt!342372)))

(declare-fun b!216514 () Bool)

(declare-fun res!182142 () Bool)

(assert (=> b!216514 (=> (not res!182142) (not e!147268))))

(assert (=> b!216514 (= res!182142 (= (bvand (_1!9900 lt!342372) (onesLSBLong!0 nBits!348)) (_1!9900 lt!342372)))))

(declare-fun lt!342367 () (_ BitVec 64))

(declare-fun b!216515 () Bool)

(declare-fun e!147269 () Bool)

(assert (=> b!216515 (= e!147269 (= (= (bvand (bvlshr (_1!9900 lt!342372) lt!342367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!9887 (readBitPure!0 (_1!9885 lt!340143)))))))

(assert (=> b!216515 (and (bvsge lt!342367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!342367 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!216515 (= lt!342367 ((_ sign_extend 32) i!590))))

(declare-fun b!216516 () Bool)

(declare-fun lt!342368 () tuple2!18490)

(assert (=> b!216516 (= e!147267 (tuple2!18491 (_1!9900 lt!342368) (_2!9900 lt!342368)))))

(declare-fun lt!342369 () tuple2!18492)

(assert (=> b!216516 (= lt!342369 (readBit!0 (_1!9885 lt!340143)))))

(assert (=> b!216516 (= lt!342368 (readNBitsLSBFirstsLoop!0 (_2!9901 lt!342369) nBits!348 (bvadd i!590 #b00000000000000000000000000000001) (bvor lt!340126 (ite (_1!9901 lt!342369) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216517 () Bool)

(declare-fun res!182143 () Bool)

(assert (=> b!216517 (=> (not res!182143) (not e!147268))))

(assert (=> b!216517 (= res!182143 (= (bvand (_1!9900 lt!342372) (onesLSBLong!0 i!590)) (bvand lt!340126 (onesLSBLong!0 i!590))))))

(declare-fun b!216518 () Bool)

(assert (=> b!216518 (= e!147268 e!147269)))

(declare-fun res!182140 () Bool)

(assert (=> b!216518 (=> res!182140 e!147269)))

(assert (=> b!216518 (= res!182140 (not (bvslt i!590 nBits!348)))))

(declare-fun b!216519 () Bool)

(declare-fun res!182141 () Bool)

(assert (=> b!216519 (=> (not res!182141) (not e!147268))))

(declare-fun lt!342370 () (_ BitVec 64))

(declare-fun lt!342371 () (_ BitVec 64))

(assert (=> b!216519 (= res!182141 (= (bitIndex!0 (size!4654 (buf!5189 (_2!9900 lt!342372))) (currentByte!9767 (_2!9900 lt!342372)) (currentBit!9762 (_2!9900 lt!342372))) (bvadd lt!342370 lt!342371)))))

(assert (=> b!216519 (or (not (= (bvand lt!342370 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342371 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342370 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342370 lt!342371) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216519 (= lt!342371 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (=> b!216519 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand i!590 #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000)))))

(assert (=> b!216519 (= lt!342370 (bitIndex!0 (size!4654 (buf!5189 (_1!9885 lt!340143))) (currentByte!9767 (_1!9885 lt!340143)) (currentBit!9762 (_1!9885 lt!340143))))))

(declare-fun b!216520 () Bool)

(assert (=> b!216520 (= e!147267 (tuple2!18491 lt!340126 (_1!9885 lt!340143)))))

(assert (= (and d!73277 c!10584) b!216520))

(assert (= (and d!73277 (not c!10584)) b!216516))

(assert (= (and d!73277 res!182144) b!216519))

(assert (= (and b!216519 res!182141) b!216517))

(assert (= (and b!216517 res!182143) b!216514))

(assert (= (and b!216514 res!182142) b!216518))

(assert (= (and b!216518 (not res!182140)) b!216515))

(assert (=> b!216516 m!332321))

(declare-fun m!333859 () Bool)

(assert (=> b!216516 m!333859))

(assert (=> b!216517 m!331689))

(assert (=> b!216515 m!331679))

(declare-fun m!333861 () Bool)

(assert (=> b!216519 m!333861))

(assert (=> b!216519 m!332027))

(assert (=> b!216514 m!331645))

(assert (=> d!72659 d!73277))

(declare-fun d!73279 () Bool)

(declare-fun e!147276 () Bool)

(assert (=> d!73279 e!147276))

(declare-fun res!182147 () Bool)

(assert (=> d!73279 (=> (not res!182147) (not e!147276))))

(declare-fun increaseBitIndex!0 (BitStream!8416) tuple2!18462)

(assert (=> d!73279 (= res!182147 (= (buf!5189 (_2!9886 (increaseBitIndex!0 lt!340129))) (buf!5189 lt!340129)))))

(declare-fun lt!342388 () Bool)

(assert (=> d!73279 (= lt!342388 (not (= (bvand ((_ sign_extend 24) (select (arr!5584 (buf!5189 lt!340129)) (currentByte!9767 lt!340129))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9762 lt!340129)))) #b00000000000000000000000000000000)))))

(declare-fun lt!342391 () tuple2!18492)

(assert (=> d!73279 (= lt!342391 (tuple2!18493 (not (= (bvand ((_ sign_extend 24) (select (arr!5584 (buf!5189 lt!340129)) (currentByte!9767 lt!340129))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9762 lt!340129)))) #b00000000000000000000000000000000)) (_2!9886 (increaseBitIndex!0 lt!340129))))))

(assert (=> d!73279 (validate_offset_bit!0 ((_ sign_extend 32) (size!4654 (buf!5189 lt!340129))) ((_ sign_extend 32) (currentByte!9767 lt!340129)) ((_ sign_extend 32) (currentBit!9762 lt!340129)))))

(assert (=> d!73279 (= (readBit!0 lt!340129) lt!342391)))

(declare-fun lt!342392 () (_ BitVec 64))

(declare-fun lt!342389 () (_ BitVec 64))

(declare-fun b!216523 () Bool)

(assert (=> b!216523 (= e!147276 (= (bitIndex!0 (size!4654 (buf!5189 (_2!9886 (increaseBitIndex!0 lt!340129)))) (currentByte!9767 (_2!9886 (increaseBitIndex!0 lt!340129))) (currentBit!9762 (_2!9886 (increaseBitIndex!0 lt!340129)))) (bvadd lt!342392 lt!342389)))))

(assert (=> b!216523 (or (not (= (bvand lt!342392 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342389 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342392 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342392 lt!342389) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216523 (= lt!342389 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!216523 (= lt!342392 (bitIndex!0 (size!4654 (buf!5189 lt!340129)) (currentByte!9767 lt!340129) (currentBit!9762 lt!340129)))))

(declare-fun lt!342393 () Bool)

(assert (=> b!216523 (= lt!342393 (not (= (bvand ((_ sign_extend 24) (select (arr!5584 (buf!5189 lt!340129)) (currentByte!9767 lt!340129))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9762 lt!340129)))) #b00000000000000000000000000000000)))))

(declare-fun lt!342387 () Bool)

(assert (=> b!216523 (= lt!342387 (not (= (bvand ((_ sign_extend 24) (select (arr!5584 (buf!5189 lt!340129)) (currentByte!9767 lt!340129))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9762 lt!340129)))) #b00000000000000000000000000000000)))))

(declare-fun lt!342390 () Bool)

(assert (=> b!216523 (= lt!342390 (not (= (bvand ((_ sign_extend 24) (select (arr!5584 (buf!5189 lt!340129)) (currentByte!9767 lt!340129))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9762 lt!340129)))) #b00000000000000000000000000000000)))))

(assert (= (and d!73279 res!182147) b!216523))

(declare-fun m!333863 () Bool)

(assert (=> d!73279 m!333863))

(declare-fun m!333865 () Bool)

(assert (=> d!73279 m!333865))

(declare-fun m!333867 () Bool)

(assert (=> d!73279 m!333867))

(declare-fun m!333869 () Bool)

(assert (=> d!73279 m!333869))

(assert (=> b!216523 m!333867))

(declare-fun m!333871 () Bool)

(assert (=> b!216523 m!333871))

(assert (=> b!216523 m!333865))

(declare-fun m!333873 () Bool)

(assert (=> b!216523 m!333873))

(assert (=> b!216523 m!333863))

(assert (=> d!72691 d!73279))

(assert (=> d!72571 d!73275))

(assert (=> d!72571 d!72599))

(declare-fun d!73281 () Bool)

(assert (=> d!73281 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340128)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340128))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340128))) lt!341433) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340128)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340128))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340128)))) lt!341433))))

(declare-fun bs!17913 () Bool)

(assert (= bs!17913 d!73281))

(assert (=> bs!17913 m!332041))

(assert (=> b!215939 d!73281))

(declare-fun d!73283 () Bool)

(declare-fun e!147278 () Bool)

(assert (=> d!73283 e!147278))

(declare-fun res!182152 () Bool)

(assert (=> d!73283 (=> (not res!182152) (not e!147278))))

(declare-fun lt!342399 () tuple2!18490)

(assert (=> d!73283 (= res!182152 (= (buf!5189 (_2!9900 lt!342399)) (buf!5189 (_1!9885 lt!340131))))))

(declare-fun e!147277 () tuple2!18490)

(assert (=> d!73283 (= lt!342399 e!147277)))

(declare-fun c!10585 () Bool)

(assert (=> d!73283 (= c!10585 (= nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (=> d!73283 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsle (bvadd #b00000000000000000000000000000001 i!590) nBits!348) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!73283 (= (readNBitsLSBFirstsLoop!0 (_1!9885 lt!340131) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!340153) lt!342399)))

(declare-fun b!216524 () Bool)

(declare-fun res!182150 () Bool)

(assert (=> b!216524 (=> (not res!182150) (not e!147278))))

(assert (=> b!216524 (= res!182150 (= (bvand (_1!9900 lt!342399) (onesLSBLong!0 nBits!348)) (_1!9900 lt!342399)))))

(declare-fun e!147279 () Bool)

(declare-fun lt!342394 () (_ BitVec 64))

(declare-fun b!216525 () Bool)

(assert (=> b!216525 (= e!147279 (= (= (bvand (bvlshr (_1!9900 lt!342399) lt!342394) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!9887 (readBitPure!0 (_1!9885 lt!340131)))))))

(assert (=> b!216525 (and (bvsge lt!342394 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!342394 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!216525 (= lt!342394 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!216526 () Bool)

(declare-fun lt!342395 () tuple2!18490)

(assert (=> b!216526 (= e!147277 (tuple2!18491 (_1!9900 lt!342395) (_2!9900 lt!342395)))))

(declare-fun lt!342396 () tuple2!18492)

(assert (=> b!216526 (= lt!342396 (readBit!0 (_1!9885 lt!340131)))))

(assert (=> b!216526 (= lt!342395 (readNBitsLSBFirstsLoop!0 (_2!9901 lt!342396) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!340153 (ite (_1!9901 lt!342396) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216527 () Bool)

(declare-fun res!182151 () Bool)

(assert (=> b!216527 (=> (not res!182151) (not e!147278))))

(assert (=> b!216527 (= res!182151 (= (bvand (_1!9900 lt!342399) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))) (bvand lt!340153 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun b!216528 () Bool)

(assert (=> b!216528 (= e!147278 e!147279)))

(declare-fun res!182148 () Bool)

(assert (=> b!216528 (=> res!182148 e!147279)))

(assert (=> b!216528 (= res!182148 (not (bvslt (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun b!216529 () Bool)

(declare-fun res!182149 () Bool)

(assert (=> b!216529 (=> (not res!182149) (not e!147278))))

(declare-fun lt!342398 () (_ BitVec 64))

(declare-fun lt!342397 () (_ BitVec 64))

(assert (=> b!216529 (= res!182149 (= (bitIndex!0 (size!4654 (buf!5189 (_2!9900 lt!342399))) (currentByte!9767 (_2!9900 lt!342399)) (currentBit!9762 (_2!9900 lt!342399))) (bvadd lt!342397 lt!342398)))))

(assert (=> b!216529 (or (not (= (bvand lt!342397 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342398 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342397 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342397 lt!342398) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216529 (= lt!342398 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!216529 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!216529 (= lt!342397 (bitIndex!0 (size!4654 (buf!5189 (_1!9885 lt!340131))) (currentByte!9767 (_1!9885 lt!340131)) (currentBit!9762 (_1!9885 lt!340131))))))

(declare-fun b!216530 () Bool)

(assert (=> b!216530 (= e!147277 (tuple2!18491 lt!340153 (_1!9885 lt!340131)))))

(assert (= (and d!73283 c!10585) b!216530))

(assert (= (and d!73283 (not c!10585)) b!216526))

(assert (= (and d!73283 res!182152) b!216529))

(assert (= (and b!216529 res!182149) b!216527))

(assert (= (and b!216527 res!182151) b!216524))

(assert (= (and b!216524 res!182150) b!216528))

(assert (= (and b!216528 (not res!182148)) b!216525))

(declare-fun m!333875 () Bool)

(assert (=> b!216526 m!333875))

(declare-fun m!333877 () Bool)

(assert (=> b!216526 m!333877))

(assert (=> b!216527 m!332567))

(declare-fun m!333879 () Bool)

(assert (=> b!216525 m!333879))

(declare-fun m!333881 () Bool)

(assert (=> b!216529 m!333881))

(declare-fun m!333883 () Bool)

(assert (=> b!216529 m!333883))

(assert (=> b!216524 m!331645))

(assert (=> d!72687 d!73283))

(assert (=> d!72601 d!72599))

(declare-fun d!73285 () Bool)

(declare-fun res!182155 () Bool)

(declare-fun e!147280 () Bool)

(assert (=> d!73285 (=> (not res!182155) (not e!147280))))

(assert (=> d!73285 (= res!182155 (= (size!4654 (buf!5189 lt!340910)) (size!4654 (buf!5189 (_2!9886 lt!340151)))))))

(assert (=> d!73285 (= (isPrefixOf!0 lt!340910 (_2!9886 lt!340151)) e!147280)))

(declare-fun b!216531 () Bool)

(declare-fun res!182153 () Bool)

(assert (=> b!216531 (=> (not res!182153) (not e!147280))))

(assert (=> b!216531 (= res!182153 (bvsle (bitIndex!0 (size!4654 (buf!5189 lt!340910)) (currentByte!9767 lt!340910) (currentBit!9762 lt!340910)) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340151))) (currentByte!9767 (_2!9886 lt!340151)) (currentBit!9762 (_2!9886 lt!340151)))))))

(declare-fun b!216532 () Bool)

(declare-fun e!147281 () Bool)

(assert (=> b!216532 (= e!147280 e!147281)))

(declare-fun res!182154 () Bool)

(assert (=> b!216532 (=> res!182154 e!147281)))

(assert (=> b!216532 (= res!182154 (= (size!4654 (buf!5189 lt!340910)) #b00000000000000000000000000000000))))

(declare-fun b!216533 () Bool)

(assert (=> b!216533 (= e!147281 (arrayBitRangesEq!0 (buf!5189 lt!340910) (buf!5189 (_2!9886 lt!340151)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 lt!340910)) (currentByte!9767 lt!340910) (currentBit!9762 lt!340910))))))

(assert (= (and d!73285 res!182155) b!216531))

(assert (= (and b!216531 res!182153) b!216532))

(assert (= (and b!216532 (not res!182154)) b!216533))

(declare-fun m!333885 () Bool)

(assert (=> b!216531 m!333885))

(assert (=> b!216531 m!331661))

(assert (=> b!216533 m!333885))

(assert (=> b!216533 m!333885))

(declare-fun m!333887 () Bool)

(assert (=> b!216533 m!333887))

(assert (=> d!72683 d!73285))

(declare-fun d!73287 () Bool)

(declare-fun res!182158 () Bool)

(declare-fun e!147282 () Bool)

(assert (=> d!73287 (=> (not res!182158) (not e!147282))))

(assert (=> d!73287 (= res!182158 (= (size!4654 (buf!5189 (_1!9885 lt!340909))) (size!4654 (buf!5189 (_2!9885 lt!340909)))))))

(assert (=> d!73287 (= (isPrefixOf!0 (_1!9885 lt!340909) (_2!9885 lt!340909)) e!147282)))

(declare-fun b!216534 () Bool)

(declare-fun res!182156 () Bool)

(assert (=> b!216534 (=> (not res!182156) (not e!147282))))

(assert (=> b!216534 (= res!182156 (bvsle (bitIndex!0 (size!4654 (buf!5189 (_1!9885 lt!340909))) (currentByte!9767 (_1!9885 lt!340909)) (currentBit!9762 (_1!9885 lt!340909))) (bitIndex!0 (size!4654 (buf!5189 (_2!9885 lt!340909))) (currentByte!9767 (_2!9885 lt!340909)) (currentBit!9762 (_2!9885 lt!340909)))))))

(declare-fun b!216535 () Bool)

(declare-fun e!147283 () Bool)

(assert (=> b!216535 (= e!147282 e!147283)))

(declare-fun res!182157 () Bool)

(assert (=> b!216535 (=> res!182157 e!147283)))

(assert (=> b!216535 (= res!182157 (= (size!4654 (buf!5189 (_1!9885 lt!340909))) #b00000000000000000000000000000000))))

(declare-fun b!216536 () Bool)

(assert (=> b!216536 (= e!147283 (arrayBitRangesEq!0 (buf!5189 (_1!9885 lt!340909)) (buf!5189 (_2!9885 lt!340909)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 (_1!9885 lt!340909))) (currentByte!9767 (_1!9885 lt!340909)) (currentBit!9762 (_1!9885 lt!340909)))))))

(assert (= (and d!73287 res!182158) b!216534))

(assert (= (and b!216534 res!182156) b!216535))

(assert (= (and b!216535 (not res!182157)) b!216536))

(assert (=> b!216534 m!333835))

(declare-fun m!333889 () Bool)

(assert (=> b!216534 m!333889))

(assert (=> b!216536 m!333835))

(assert (=> b!216536 m!333835))

(declare-fun m!333891 () Bool)

(assert (=> b!216536 m!333891))

(assert (=> d!72683 d!73287))

(declare-fun d!73289 () Bool)

(assert (=> d!73289 (isPrefixOf!0 (_2!9886 lt!340128) (_2!9886 lt!340128))))

(declare-fun lt!342402 () Unit!15292)

(declare-fun choose!11 (BitStream!8416) Unit!15292)

(assert (=> d!73289 (= lt!342402 (choose!11 (_2!9886 lt!340128)))))

(assert (=> d!73289 (= (lemmaIsPrefixRefl!0 (_2!9886 lt!340128)) lt!342402)))

(declare-fun bs!17915 () Bool)

(assert (= bs!17915 d!73289))

(assert (=> bs!17915 m!332287))

(declare-fun m!333893 () Bool)

(assert (=> bs!17915 m!333893))

(assert (=> d!72683 d!73289))

(declare-fun d!73291 () Bool)

(assert (=> d!73291 (isPrefixOf!0 (_2!9886 lt!340151) (_2!9886 lt!340151))))

(declare-fun lt!342403 () Unit!15292)

(assert (=> d!73291 (= lt!342403 (choose!11 (_2!9886 lt!340151)))))

(assert (=> d!73291 (= (lemmaIsPrefixRefl!0 (_2!9886 lt!340151)) lt!342403)))

(declare-fun bs!17916 () Bool)

(assert (= bs!17916 d!73291))

(assert (=> bs!17916 m!332229))

(declare-fun m!333895 () Bool)

(assert (=> bs!17916 m!333895))

(assert (=> d!72683 d!73291))

(assert (=> d!72683 d!72575))

(declare-fun d!73293 () Bool)

(assert (=> d!73293 (isPrefixOf!0 lt!340910 lt!340910)))

(declare-fun lt!342404 () Unit!15292)

(assert (=> d!73293 (= lt!342404 (choose!11 lt!340910))))

(assert (=> d!73293 (= (lemmaIsPrefixRefl!0 lt!340910) lt!342404)))

(declare-fun bs!17917 () Bool)

(assert (= bs!17917 d!73293))

(assert (=> bs!17917 m!332301))

(declare-fun m!333897 () Bool)

(assert (=> bs!17917 m!333897))

(assert (=> d!72683 d!73293))

(declare-fun d!73295 () Bool)

(assert (=> d!73295 (isPrefixOf!0 lt!340910 (_2!9886 lt!340151))))

(declare-fun lt!342405 () Unit!15292)

(assert (=> d!73295 (= lt!342405 (choose!30 lt!340910 (_2!9886 lt!340128) (_2!9886 lt!340151)))))

(assert (=> d!73295 (isPrefixOf!0 lt!340910 (_2!9886 lt!340128))))

(assert (=> d!73295 (= (lemmaIsPrefixTransitive!0 lt!340910 (_2!9886 lt!340128) (_2!9886 lt!340151)) lt!342405)))

(declare-fun bs!17918 () Bool)

(assert (= bs!17918 d!73295))

(assert (=> bs!17918 m!332299))

(declare-fun m!333899 () Bool)

(assert (=> bs!17918 m!333899))

(declare-fun m!333901 () Bool)

(assert (=> bs!17918 m!333901))

(assert (=> d!72683 d!73295))

(declare-fun d!73297 () Bool)

(declare-fun res!182161 () Bool)

(declare-fun e!147284 () Bool)

(assert (=> d!73297 (=> (not res!182161) (not e!147284))))

(assert (=> d!73297 (= res!182161 (= (size!4654 (buf!5189 lt!340910)) (size!4654 (buf!5189 lt!340910))))))

(assert (=> d!73297 (= (isPrefixOf!0 lt!340910 lt!340910) e!147284)))

(declare-fun b!216537 () Bool)

(declare-fun res!182159 () Bool)

(assert (=> b!216537 (=> (not res!182159) (not e!147284))))

(assert (=> b!216537 (= res!182159 (bvsle (bitIndex!0 (size!4654 (buf!5189 lt!340910)) (currentByte!9767 lt!340910) (currentBit!9762 lt!340910)) (bitIndex!0 (size!4654 (buf!5189 lt!340910)) (currentByte!9767 lt!340910) (currentBit!9762 lt!340910))))))

(declare-fun b!216538 () Bool)

(declare-fun e!147285 () Bool)

(assert (=> b!216538 (= e!147284 e!147285)))

(declare-fun res!182160 () Bool)

(assert (=> b!216538 (=> res!182160 e!147285)))

(assert (=> b!216538 (= res!182160 (= (size!4654 (buf!5189 lt!340910)) #b00000000000000000000000000000000))))

(declare-fun b!216539 () Bool)

(assert (=> b!216539 (= e!147285 (arrayBitRangesEq!0 (buf!5189 lt!340910) (buf!5189 lt!340910) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 lt!340910)) (currentByte!9767 lt!340910) (currentBit!9762 lt!340910))))))

(assert (= (and d!73297 res!182161) b!216537))

(assert (= (and b!216537 res!182159) b!216538))

(assert (= (and b!216538 (not res!182160)) b!216539))

(assert (=> b!216537 m!333885))

(assert (=> b!216537 m!333885))

(assert (=> b!216539 m!333885))

(assert (=> b!216539 m!333885))

(declare-fun m!333903 () Bool)

(assert (=> b!216539 m!333903))

(assert (=> d!72683 d!73297))

(declare-fun d!73299 () Bool)

(assert (=> d!73299 (isPrefixOf!0 lt!340910 (_2!9886 lt!340151))))

(declare-fun lt!342406 () Unit!15292)

(assert (=> d!73299 (= lt!342406 (choose!30 lt!340910 (_2!9886 lt!340151) (_2!9886 lt!340151)))))

(assert (=> d!73299 (isPrefixOf!0 lt!340910 (_2!9886 lt!340151))))

(assert (=> d!73299 (= (lemmaIsPrefixTransitive!0 lt!340910 (_2!9886 lt!340151) (_2!9886 lt!340151)) lt!342406)))

(declare-fun bs!17919 () Bool)

(assert (= bs!17919 d!73299))

(assert (=> bs!17919 m!332299))

(declare-fun m!333905 () Bool)

(assert (=> bs!17919 m!333905))

(assert (=> bs!17919 m!332299))

(assert (=> d!72683 d!73299))

(declare-fun d!73301 () Bool)

(declare-fun res!182164 () Bool)

(declare-fun e!147286 () Bool)

(assert (=> d!73301 (=> (not res!182164) (not e!147286))))

(assert (=> d!73301 (= res!182164 (= (size!4654 (buf!5189 (_2!9886 lt!340151))) (size!4654 (buf!5189 (_2!9886 lt!340151)))))))

(assert (=> d!73301 (= (isPrefixOf!0 (_2!9886 lt!340151) (_2!9886 lt!340151)) e!147286)))

(declare-fun b!216540 () Bool)

(declare-fun res!182162 () Bool)

(assert (=> b!216540 (=> (not res!182162) (not e!147286))))

(assert (=> b!216540 (= res!182162 (bvsle (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340151))) (currentByte!9767 (_2!9886 lt!340151)) (currentBit!9762 (_2!9886 lt!340151))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340151))) (currentByte!9767 (_2!9886 lt!340151)) (currentBit!9762 (_2!9886 lt!340151)))))))

(declare-fun b!216541 () Bool)

(declare-fun e!147287 () Bool)

(assert (=> b!216541 (= e!147286 e!147287)))

(declare-fun res!182163 () Bool)

(assert (=> b!216541 (=> res!182163 e!147287)))

(assert (=> b!216541 (= res!182163 (= (size!4654 (buf!5189 (_2!9886 lt!340151))) #b00000000000000000000000000000000))))

(declare-fun b!216542 () Bool)

(assert (=> b!216542 (= e!147287 (arrayBitRangesEq!0 (buf!5189 (_2!9886 lt!340151)) (buf!5189 (_2!9886 lt!340151)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340151))) (currentByte!9767 (_2!9886 lt!340151)) (currentBit!9762 (_2!9886 lt!340151)))))))

(assert (= (and d!73301 res!182164) b!216540))

(assert (= (and b!216540 res!182162) b!216541))

(assert (= (and b!216541 (not res!182163)) b!216542))

(assert (=> b!216540 m!331661))

(assert (=> b!216540 m!331661))

(assert (=> b!216542 m!331661))

(assert (=> b!216542 m!331661))

(declare-fun m!333907 () Bool)

(assert (=> b!216542 m!333907))

(assert (=> d!72683 d!73301))

(declare-fun d!73303 () Bool)

(declare-fun res!182167 () Bool)

(declare-fun e!147288 () Bool)

(assert (=> d!73303 (=> (not res!182167) (not e!147288))))

(assert (=> d!73303 (= res!182167 (= (size!4654 (buf!5189 (_2!9886 lt!340128))) (size!4654 (buf!5189 (_2!9886 lt!340128)))))))

(assert (=> d!73303 (= (isPrefixOf!0 (_2!9886 lt!340128) (_2!9886 lt!340128)) e!147288)))

(declare-fun b!216543 () Bool)

(declare-fun res!182165 () Bool)

(assert (=> b!216543 (=> (not res!182165) (not e!147288))))

(assert (=> b!216543 (= res!182165 (bvsle (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128)))))))

(declare-fun b!216544 () Bool)

(declare-fun e!147289 () Bool)

(assert (=> b!216544 (= e!147288 e!147289)))

(declare-fun res!182166 () Bool)

(assert (=> b!216544 (=> res!182166 e!147289)))

(assert (=> b!216544 (= res!182166 (= (size!4654 (buf!5189 (_2!9886 lt!340128))) #b00000000000000000000000000000000))))

(declare-fun b!216545 () Bool)

(assert (=> b!216545 (= e!147289 (arrayBitRangesEq!0 (buf!5189 (_2!9886 lt!340128)) (buf!5189 (_2!9886 lt!340128)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128)))))))

(assert (= (and d!73303 res!182167) b!216543))

(assert (= (and b!216543 res!182165) b!216544))

(assert (= (and b!216544 (not res!182166)) b!216545))

(assert (=> b!216543 m!331623))

(assert (=> b!216543 m!331623))

(assert (=> b!216545 m!331623))

(assert (=> b!216545 m!331623))

(declare-fun m!333909 () Bool)

(assert (=> b!216545 m!333909))

(assert (=> d!72683 d!73303))

(declare-fun d!73305 () Bool)

(declare-fun e!147290 () Bool)

(assert (=> d!73305 e!147290))

(declare-fun res!182168 () Bool)

(assert (=> d!73305 (=> (not res!182168) (not e!147290))))

(declare-fun lt!342408 () (_ BitVec 64))

(declare-fun lt!342407 () BitStream!8416)

(assert (=> d!73305 (= res!182168 (= (bvadd lt!342408 (bvsub lt!340826 lt!340831)) (bitIndex!0 (size!4654 (buf!5189 lt!342407)) (currentByte!9767 lt!342407) (currentBit!9762 lt!342407))))))

(assert (=> d!73305 (or (not (= (bvand lt!342408 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340826 lt!340831) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342408 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342408 (bvsub lt!340826 lt!340831)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73305 (= lt!342408 (bitIndex!0 (size!4654 (buf!5189 (_2!9885 lt!340837))) (currentByte!9767 (_2!9885 lt!340837)) (currentBit!9762 (_2!9885 lt!340837))))))

(assert (=> d!73305 (= lt!342407 (_2!9886 (moveBitIndex!0 (_2!9885 lt!340837) (bvsub lt!340826 lt!340831))))))

(assert (=> d!73305 (moveBitIndexPrecond!0 (_2!9885 lt!340837) (bvsub lt!340826 lt!340831))))

(assert (=> d!73305 (= (withMovedBitIndex!0 (_2!9885 lt!340837) (bvsub lt!340826 lt!340831)) lt!342407)))

(declare-fun b!216546 () Bool)

(assert (=> b!216546 (= e!147290 (= (size!4654 (buf!5189 (_2!9885 lt!340837))) (size!4654 (buf!5189 lt!342407))))))

(assert (= (and d!73305 res!182168) b!216546))

(declare-fun m!333911 () Bool)

(assert (=> d!73305 m!333911))

(declare-fun m!333913 () Bool)

(assert (=> d!73305 m!333913))

(declare-fun m!333915 () Bool)

(assert (=> d!73305 m!333915))

(declare-fun m!333917 () Bool)

(assert (=> d!73305 m!333917))

(assert (=> b!215753 d!73305))

(assert (=> b!215753 d!72707))

(assert (=> b!215753 d!72571))

(declare-fun d!73307 () Bool)

(declare-fun e!147293 () Bool)

(assert (=> d!73307 e!147293))

(declare-fun res!182171 () Bool)

(assert (=> d!73307 (=> (not res!182171) (not e!147293))))

(declare-fun lt!342415 () tuple2!18464)

(declare-fun lt!342416 () tuple2!18464)

(assert (=> d!73307 (= res!182171 (= (bitIndex!0 (size!4654 (buf!5189 (_1!9887 lt!342415))) (currentByte!9767 (_1!9887 lt!342415)) (currentBit!9762 (_1!9887 lt!342415))) (bitIndex!0 (size!4654 (buf!5189 (_1!9887 lt!342416))) (currentByte!9767 (_1!9887 lt!342416)) (currentBit!9762 (_1!9887 lt!342416)))))))

(declare-fun lt!342417 () BitStream!8416)

(assert (=> d!73307 (= lt!342416 (readBitPure!0 lt!342417))))

(assert (=> d!73307 (= lt!342415 (readBitPure!0 lt!340129))))

(assert (=> d!73307 (= lt!342417 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 lt!340129) (currentBit!9762 lt!340129)))))

(assert (=> d!73307 (invariant!0 (currentBit!9762 lt!340129) (currentByte!9767 lt!340129) (size!4654 (buf!5189 (_2!9886 lt!340151))))))

(assert (=> d!73307 true))

(declare-fun _$9!93 () Unit!15292)

(assert (=> d!73307 (= (choose!50 lt!340129 (_2!9886 lt!340151) lt!340881 lt!340883 (tuple2!18465 (_1!9887 lt!340883) (_2!9887 lt!340883)) (_1!9887 lt!340883) (_2!9887 lt!340883) lt!340882 (tuple2!18465 (_1!9887 lt!340882) (_2!9887 lt!340882)) (_1!9887 lt!340882) (_2!9887 lt!340882)) _$9!93)))

(declare-fun b!216549 () Bool)

(assert (=> b!216549 (= e!147293 (= (_2!9887 lt!342415) (_2!9887 lt!342416)))))

(assert (= (and d!73307 res!182171) b!216549))

(assert (=> d!73307 m!331683))

(assert (=> d!73307 m!332271))

(declare-fun m!333919 () Bool)

(assert (=> d!73307 m!333919))

(declare-fun m!333921 () Bool)

(assert (=> d!73307 m!333921))

(declare-fun m!333923 () Bool)

(assert (=> d!73307 m!333923))

(assert (=> d!72663 d!73307))

(declare-fun d!73309 () Bool)

(declare-fun lt!342418 () tuple2!18492)

(assert (=> d!73309 (= lt!342418 (readBit!0 lt!340881))))

(assert (=> d!73309 (= (readBitPure!0 lt!340881) (tuple2!18465 (_2!9901 lt!342418) (_1!9901 lt!342418)))))

(declare-fun bs!17920 () Bool)

(assert (= bs!17920 d!73309))

(declare-fun m!333925 () Bool)

(assert (=> bs!17920 m!333925))

(assert (=> d!72663 d!73309))

(declare-fun d!73311 () Bool)

(declare-fun e!147294 () Bool)

(assert (=> d!73311 e!147294))

(declare-fun res!182173 () Bool)

(assert (=> d!73311 (=> (not res!182173) (not e!147294))))

(declare-fun lt!342419 () (_ BitVec 64))

(declare-fun lt!342420 () (_ BitVec 64))

(declare-fun lt!342424 () (_ BitVec 64))

(assert (=> d!73311 (= res!182173 (= lt!342424 (bvsub lt!342420 lt!342419)))))

(assert (=> d!73311 (or (= (bvand lt!342420 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342419 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342420 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342420 lt!342419) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73311 (= lt!342419 (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!340882)))) ((_ sign_extend 32) (currentByte!9767 (_1!9887 lt!340882))) ((_ sign_extend 32) (currentBit!9762 (_1!9887 lt!340882)))))))

(declare-fun lt!342421 () (_ BitVec 64))

(declare-fun lt!342423 () (_ BitVec 64))

(assert (=> d!73311 (= lt!342420 (bvmul lt!342421 lt!342423))))

(assert (=> d!73311 (or (= lt!342421 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342423 (bvsdiv (bvmul lt!342421 lt!342423) lt!342421)))))

(assert (=> d!73311 (= lt!342423 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73311 (= lt!342421 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!340882)))))))

(assert (=> d!73311 (= lt!342424 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_1!9887 lt!340882))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_1!9887 lt!340882)))))))

(assert (=> d!73311 (invariant!0 (currentBit!9762 (_1!9887 lt!340882)) (currentByte!9767 (_1!9887 lt!340882)) (size!4654 (buf!5189 (_1!9887 lt!340882))))))

(assert (=> d!73311 (= (bitIndex!0 (size!4654 (buf!5189 (_1!9887 lt!340882))) (currentByte!9767 (_1!9887 lt!340882)) (currentBit!9762 (_1!9887 lt!340882))) lt!342424)))

(declare-fun b!216550 () Bool)

(declare-fun res!182172 () Bool)

(assert (=> b!216550 (=> (not res!182172) (not e!147294))))

(assert (=> b!216550 (= res!182172 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342424))))

(declare-fun b!216551 () Bool)

(declare-fun lt!342422 () (_ BitVec 64))

(assert (=> b!216551 (= e!147294 (bvsle lt!342424 (bvmul lt!342422 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216551 (or (= lt!342422 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!342422 #b0000000000000000000000000000000000000000000000000000000000001000) lt!342422)))))

(assert (=> b!216551 (= lt!342422 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!340882)))))))

(assert (= (and d!73311 res!182173) b!216550))

(assert (= (and b!216550 res!182172) b!216551))

(declare-fun m!333927 () Bool)

(assert (=> d!73311 m!333927))

(declare-fun m!333929 () Bool)

(assert (=> d!73311 m!333929))

(assert (=> d!72663 d!73311))

(declare-fun d!73313 () Bool)

(assert (=> d!73313 (= (invariant!0 (currentBit!9762 lt!340129) (currentByte!9767 lt!340129) (size!4654 (buf!5189 (_2!9886 lt!340151)))) (and (bvsge (currentBit!9762 lt!340129) #b00000000000000000000000000000000) (bvslt (currentBit!9762 lt!340129) #b00000000000000000000000000001000) (bvsge (currentByte!9767 lt!340129) #b00000000000000000000000000000000) (or (bvslt (currentByte!9767 lt!340129) (size!4654 (buf!5189 (_2!9886 lt!340151)))) (and (= (currentBit!9762 lt!340129) #b00000000000000000000000000000000) (= (currentByte!9767 lt!340129) (size!4654 (buf!5189 (_2!9886 lt!340151))))))))))

(assert (=> d!72663 d!73313))

(declare-fun d!73315 () Bool)

(declare-fun e!147295 () Bool)

(assert (=> d!73315 e!147295))

(declare-fun res!182175 () Bool)

(assert (=> d!73315 (=> (not res!182175) (not e!147295))))

(declare-fun lt!342426 () (_ BitVec 64))

(declare-fun lt!342430 () (_ BitVec 64))

(declare-fun lt!342425 () (_ BitVec 64))

(assert (=> d!73315 (= res!182175 (= lt!342430 (bvsub lt!342426 lt!342425)))))

(assert (=> d!73315 (or (= (bvand lt!342426 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342425 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342426 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342426 lt!342425) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73315 (= lt!342425 (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!340883)))) ((_ sign_extend 32) (currentByte!9767 (_1!9887 lt!340883))) ((_ sign_extend 32) (currentBit!9762 (_1!9887 lt!340883)))))))

(declare-fun lt!342427 () (_ BitVec 64))

(declare-fun lt!342429 () (_ BitVec 64))

(assert (=> d!73315 (= lt!342426 (bvmul lt!342427 lt!342429))))

(assert (=> d!73315 (or (= lt!342427 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342429 (bvsdiv (bvmul lt!342427 lt!342429) lt!342427)))))

(assert (=> d!73315 (= lt!342429 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73315 (= lt!342427 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!340883)))))))

(assert (=> d!73315 (= lt!342430 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_1!9887 lt!340883))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_1!9887 lt!340883)))))))

(assert (=> d!73315 (invariant!0 (currentBit!9762 (_1!9887 lt!340883)) (currentByte!9767 (_1!9887 lt!340883)) (size!4654 (buf!5189 (_1!9887 lt!340883))))))

(assert (=> d!73315 (= (bitIndex!0 (size!4654 (buf!5189 (_1!9887 lt!340883))) (currentByte!9767 (_1!9887 lt!340883)) (currentBit!9762 (_1!9887 lt!340883))) lt!342430)))

(declare-fun b!216552 () Bool)

(declare-fun res!182174 () Bool)

(assert (=> b!216552 (=> (not res!182174) (not e!147295))))

(assert (=> b!216552 (= res!182174 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342430))))

(declare-fun b!216553 () Bool)

(declare-fun lt!342428 () (_ BitVec 64))

(assert (=> b!216553 (= e!147295 (bvsle lt!342430 (bvmul lt!342428 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216553 (or (= lt!342428 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!342428 #b0000000000000000000000000000000000000000000000000000000000001000) lt!342428)))))

(assert (=> b!216553 (= lt!342428 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!340883)))))))

(assert (= (and d!73315 res!182175) b!216552))

(assert (= (and b!216552 res!182174) b!216553))

(declare-fun m!333931 () Bool)

(assert (=> d!73315 m!333931))

(declare-fun m!333933 () Bool)

(assert (=> d!73315 m!333933))

(assert (=> d!72663 d!73315))

(assert (=> d!72663 d!72691))

(assert (=> b!215937 d!73289))

(declare-fun d!73317 () Bool)

(declare-fun e!147296 () Bool)

(assert (=> d!73317 e!147296))

(declare-fun res!182177 () Bool)

(assert (=> d!73317 (=> (not res!182177) (not e!147296))))

(declare-fun lt!342436 () (_ BitVec 64))

(declare-fun lt!342431 () (_ BitVec 64))

(declare-fun lt!342432 () (_ BitVec 64))

(assert (=> d!73317 (= res!182177 (= lt!342436 (bvsub lt!342432 lt!342431)))))

(assert (=> d!73317 (or (= (bvand lt!342432 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342431 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342432 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342432 lt!342431) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73317 (= lt!342431 (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 lt!340691))) ((_ sign_extend 32) (currentByte!9767 lt!340691)) ((_ sign_extend 32) (currentBit!9762 lt!340691))))))

(declare-fun lt!342433 () (_ BitVec 64))

(declare-fun lt!342435 () (_ BitVec 64))

(assert (=> d!73317 (= lt!342432 (bvmul lt!342433 lt!342435))))

(assert (=> d!73317 (or (= lt!342433 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342435 (bvsdiv (bvmul lt!342433 lt!342435) lt!342433)))))

(assert (=> d!73317 (= lt!342435 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73317 (= lt!342433 ((_ sign_extend 32) (size!4654 (buf!5189 lt!340691))))))

(assert (=> d!73317 (= lt!342436 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 lt!340691)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 lt!340691))))))

(assert (=> d!73317 (invariant!0 (currentBit!9762 lt!340691) (currentByte!9767 lt!340691) (size!4654 (buf!5189 lt!340691)))))

(assert (=> d!73317 (= (bitIndex!0 (size!4654 (buf!5189 lt!340691)) (currentByte!9767 lt!340691) (currentBit!9762 lt!340691)) lt!342436)))

(declare-fun b!216554 () Bool)

(declare-fun res!182176 () Bool)

(assert (=> b!216554 (=> (not res!182176) (not e!147296))))

(assert (=> b!216554 (= res!182176 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342436))))

(declare-fun b!216555 () Bool)

(declare-fun lt!342434 () (_ BitVec 64))

(assert (=> b!216555 (= e!147296 (bvsle lt!342436 (bvmul lt!342434 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216555 (or (= lt!342434 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!342434 #b0000000000000000000000000000000000000000000000000000000000001000) lt!342434)))))

(assert (=> b!216555 (= lt!342434 ((_ sign_extend 32) (size!4654 (buf!5189 lt!340691))))))

(assert (= (and d!73317 res!182177) b!216554))

(assert (= (and b!216554 res!182176) b!216555))

(declare-fun m!333935 () Bool)

(assert (=> d!73317 m!333935))

(declare-fun m!333937 () Bool)

(assert (=> d!73317 m!333937))

(assert (=> d!72607 d!73317))

(assert (=> d!72607 d!72567))

(declare-fun d!73319 () Bool)

(declare-fun lt!342441 () (_ BitVec 32))

(assert (=> d!73319 (= lt!342441 ((_ extract 31 0) (bvsrem (bvsub lt!340154 lt!340142) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!342437 () (_ BitVec 32))

(assert (=> d!73319 (= lt!342437 ((_ extract 31 0) (bvsdiv (bvsub lt!340154 lt!340142) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!147298 () Bool)

(assert (=> d!73319 e!147298))

(declare-fun res!182178 () Bool)

(assert (=> d!73319 (=> (not res!182178) (not e!147298))))

(assert (=> d!73319 (= res!182178 (moveBitIndexPrecond!0 (_2!9885 lt!340143) (bvsub lt!340154 lt!340142)))))

(declare-fun Unit!15413 () Unit!15292)

(declare-fun Unit!15414 () Unit!15292)

(declare-fun Unit!15415 () Unit!15292)

(assert (=> d!73319 (= (moveBitIndex!0 (_2!9885 lt!340143) (bvsub lt!340154 lt!340142)) (ite (bvslt (bvadd (currentBit!9762 (_2!9885 lt!340143)) lt!342441) #b00000000000000000000000000000000) (tuple2!18463 Unit!15413 (BitStream!8417 (buf!5189 (_2!9885 lt!340143)) (bvsub (bvadd (currentByte!9767 (_2!9885 lt!340143)) lt!342437) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!342441 (currentBit!9762 (_2!9885 lt!340143))))) (ite (bvsge (bvadd (currentBit!9762 (_2!9885 lt!340143)) lt!342441) #b00000000000000000000000000001000) (tuple2!18463 Unit!15414 (BitStream!8417 (buf!5189 (_2!9885 lt!340143)) (bvadd (currentByte!9767 (_2!9885 lt!340143)) lt!342437 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9762 (_2!9885 lt!340143)) lt!342441) #b00000000000000000000000000001000))) (tuple2!18463 Unit!15415 (BitStream!8417 (buf!5189 (_2!9885 lt!340143)) (bvadd (currentByte!9767 (_2!9885 lt!340143)) lt!342437) (bvadd (currentBit!9762 (_2!9885 lt!340143)) lt!342441))))))))

(declare-fun b!216556 () Bool)

(declare-fun e!147297 () Bool)

(assert (=> b!216556 (= e!147298 e!147297)))

(declare-fun res!182179 () Bool)

(assert (=> b!216556 (=> (not res!182179) (not e!147297))))

(declare-fun lt!342438 () (_ BitVec 64))

(declare-fun lt!342442 () tuple2!18462)

(assert (=> b!216556 (= res!182179 (= (bvadd lt!342438 (bvsub lt!340154 lt!340142)) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!342442))) (currentByte!9767 (_2!9886 lt!342442)) (currentBit!9762 (_2!9886 lt!342442)))))))

(assert (=> b!216556 (or (not (= (bvand lt!342438 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340154 lt!340142) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342438 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342438 (bvsub lt!340154 lt!340142)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216556 (= lt!342438 (bitIndex!0 (size!4654 (buf!5189 (_2!9885 lt!340143))) (currentByte!9767 (_2!9885 lt!340143)) (currentBit!9762 (_2!9885 lt!340143))))))

(declare-fun lt!342439 () (_ BitVec 32))

(declare-fun lt!342440 () (_ BitVec 32))

(declare-fun Unit!15416 () Unit!15292)

(declare-fun Unit!15417 () Unit!15292)

(declare-fun Unit!15418 () Unit!15292)

(assert (=> b!216556 (= lt!342442 (ite (bvslt (bvadd (currentBit!9762 (_2!9885 lt!340143)) lt!342440) #b00000000000000000000000000000000) (tuple2!18463 Unit!15416 (BitStream!8417 (buf!5189 (_2!9885 lt!340143)) (bvsub (bvadd (currentByte!9767 (_2!9885 lt!340143)) lt!342439) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!342440 (currentBit!9762 (_2!9885 lt!340143))))) (ite (bvsge (bvadd (currentBit!9762 (_2!9885 lt!340143)) lt!342440) #b00000000000000000000000000001000) (tuple2!18463 Unit!15417 (BitStream!8417 (buf!5189 (_2!9885 lt!340143)) (bvadd (currentByte!9767 (_2!9885 lt!340143)) lt!342439 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9762 (_2!9885 lt!340143)) lt!342440) #b00000000000000000000000000001000))) (tuple2!18463 Unit!15418 (BitStream!8417 (buf!5189 (_2!9885 lt!340143)) (bvadd (currentByte!9767 (_2!9885 lt!340143)) lt!342439) (bvadd (currentBit!9762 (_2!9885 lt!340143)) lt!342440))))))))

(assert (=> b!216556 (= lt!342440 ((_ extract 31 0) (bvsrem (bvsub lt!340154 lt!340142) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216556 (= lt!342439 ((_ extract 31 0) (bvsdiv (bvsub lt!340154 lt!340142) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!216557 () Bool)

(assert (=> b!216557 (= e!147297 (and (= (size!4654 (buf!5189 (_2!9885 lt!340143))) (size!4654 (buf!5189 (_2!9886 lt!342442)))) (= (buf!5189 (_2!9885 lt!340143)) (buf!5189 (_2!9886 lt!342442)))))))

(assert (= (and d!73319 res!182178) b!216556))

(assert (= (and b!216556 res!182179) b!216557))

(assert (=> d!73319 m!332123))

(declare-fun m!333939 () Bool)

(assert (=> b!216556 m!333939))

(assert (=> b!216556 m!331657))

(assert (=> d!72607 d!73319))

(declare-fun d!73321 () Bool)

(declare-fun res!182180 () Bool)

(declare-fun e!147299 () Bool)

(assert (=> d!73321 (=> (not res!182180) (not e!147299))))

(assert (=> d!73321 (= res!182180 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9885 lt!340143))))) (bvsub lt!340154 lt!340142)) (bvsle (bvsub lt!340154 lt!340142) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9885 lt!340143))))))))))

(assert (=> d!73321 (= (moveBitIndexPrecond!0 (_2!9885 lt!340143) (bvsub lt!340154 lt!340142)) e!147299)))

(declare-fun b!216558 () Bool)

(declare-fun lt!342443 () (_ BitVec 64))

(assert (=> b!216558 (= e!147299 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342443) (bvsle lt!342443 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9885 lt!340143))))))))))

(assert (=> b!216558 (= lt!342443 (bvadd (bitIndex!0 (size!4654 (buf!5189 (_2!9885 lt!340143))) (currentByte!9767 (_2!9885 lt!340143)) (currentBit!9762 (_2!9885 lt!340143))) (bvsub lt!340154 lt!340142)))))

(assert (= (and d!73321 res!182180) b!216558))

(assert (=> b!216558 m!331657))

(assert (=> d!72607 d!73321))

(declare-fun d!73323 () Bool)

(declare-fun lt!342445 () tuple2!18458)

(declare-fun lt!342444 () tuple2!18458)

(assert (=> d!73323 (and (= (_2!9884 lt!342445) (_2!9884 lt!342444)) (= (_1!9884 lt!342445) (_1!9884 lt!342444)))))

(declare-fun lt!342448 () Unit!15292)

(declare-fun lt!342449 () Bool)

(declare-fun lt!342446 () (_ BitVec 64))

(declare-fun lt!342447 () BitStream!8416)

(assert (=> d!73323 (= lt!342448 (choose!56 (_1!9885 lt!341458) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!341410 lt!342445 (tuple2!18459 (_1!9884 lt!342445) (_2!9884 lt!342445)) (_1!9884 lt!342445) (_2!9884 lt!342445) lt!342449 lt!342447 lt!342446 lt!342444 (tuple2!18459 (_1!9884 lt!342444) (_2!9884 lt!342444)) (_1!9884 lt!342444) (_2!9884 lt!342444)))))

(assert (=> d!73323 (= lt!342444 (readNBitsLSBFirstsLoopPure!0 lt!342447 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!342446))))

(assert (=> d!73323 (= lt!342446 (bvor lt!341410 (ite lt!342449 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73323 (= lt!342447 (withMovedBitIndex!0 (_1!9885 lt!341458) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!73323 (= lt!342449 (_2!9887 (readBitPure!0 (_1!9885 lt!341458))))))

(assert (=> d!73323 (= lt!342445 (readNBitsLSBFirstsLoopPure!0 (_1!9885 lt!341458) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!341410))))

(assert (=> d!73323 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9885 lt!341458) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!341410) lt!342448)))

(declare-fun bs!17921 () Bool)

(assert (= bs!17921 d!73323))

(assert (=> bs!17921 m!332557))

(assert (=> bs!17921 m!332613))

(declare-fun m!333941 () Bool)

(assert (=> bs!17921 m!333941))

(declare-fun m!333943 () Bool)

(assert (=> bs!17921 m!333943))

(assert (=> bs!17921 m!332585))

(assert (=> b!215936 d!73323))

(declare-fun d!73325 () Bool)

(assert (=> d!73325 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341443)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!341412))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!341412))) lt!341424) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341443)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!341412))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!341412)))) lt!341424))))

(declare-fun bs!17922 () Bool)

(assert (= bs!17922 d!73325))

(declare-fun m!333945 () Bool)

(assert (=> bs!17922 m!333945))

(assert (=> b!215936 d!73325))

(declare-fun d!73327 () Bool)

(assert (=> d!73327 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341443)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340128))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340128))) lt!341418) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341443)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340128))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340128)))) lt!341418))))

(declare-fun bs!17923 () Bool)

(assert (= bs!17923 d!73327))

(declare-fun m!333947 () Bool)

(assert (=> bs!17923 m!333947))

(assert (=> b!215936 d!73327))

(declare-fun d!73329 () Bool)

(declare-fun e!147300 () Bool)

(assert (=> d!73329 e!147300))

(declare-fun res!182182 () Bool)

(assert (=> d!73329 (=> (not res!182182) (not e!147300))))

(declare-fun lt!342450 () (_ BitVec 64))

(declare-fun lt!342451 () (_ BitVec 64))

(declare-fun lt!342455 () (_ BitVec 64))

(assert (=> d!73329 (= res!182182 (= lt!342455 (bvsub lt!342451 lt!342450)))))

(assert (=> d!73329 (or (= (bvand lt!342451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342450 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342451 lt!342450) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73329 (= lt!342450 (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341412)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!341412))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!341412)))))))

(declare-fun lt!342452 () (_ BitVec 64))

(declare-fun lt!342454 () (_ BitVec 64))

(assert (=> d!73329 (= lt!342451 (bvmul lt!342452 lt!342454))))

(assert (=> d!73329 (or (= lt!342452 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342454 (bvsdiv (bvmul lt!342452 lt!342454) lt!342452)))))

(assert (=> d!73329 (= lt!342454 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73329 (= lt!342452 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341412)))))))

(assert (=> d!73329 (= lt!342455 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!341412))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!341412)))))))

(assert (=> d!73329 (invariant!0 (currentBit!9762 (_2!9886 lt!341412)) (currentByte!9767 (_2!9886 lt!341412)) (size!4654 (buf!5189 (_2!9886 lt!341412))))))

(assert (=> d!73329 (= (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341412))) (currentByte!9767 (_2!9886 lt!341412)) (currentBit!9762 (_2!9886 lt!341412))) lt!342455)))

(declare-fun b!216559 () Bool)

(declare-fun res!182181 () Bool)

(assert (=> b!216559 (=> (not res!182181) (not e!147300))))

(assert (=> b!216559 (= res!182181 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342455))))

(declare-fun b!216560 () Bool)

(declare-fun lt!342453 () (_ BitVec 64))

(assert (=> b!216560 (= e!147300 (bvsle lt!342455 (bvmul lt!342453 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216560 (or (= lt!342453 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!342453 #b0000000000000000000000000000000000000000000000000000000000001000) lt!342453)))))

(assert (=> b!216560 (= lt!342453 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341412)))))))

(assert (= (and d!73329 res!182182) b!216559))

(assert (= (and b!216559 res!182181) b!216560))

(declare-fun m!333949 () Bool)

(assert (=> d!73329 m!333949))

(declare-fun m!333951 () Bool)

(assert (=> d!73329 m!333951))

(assert (=> b!215936 d!73329))

(declare-fun d!73331 () Bool)

(declare-fun e!147301 () Bool)

(assert (=> d!73331 e!147301))

(declare-fun res!182184 () Bool)

(assert (=> d!73331 (=> (not res!182184) (not e!147301))))

(declare-fun lt!342456 () (_ BitVec 64))

(declare-fun lt!342461 () (_ BitVec 64))

(declare-fun lt!342457 () (_ BitVec 64))

(assert (=> d!73331 (= res!182184 (= lt!342461 (bvsub lt!342457 lt!342456)))))

(assert (=> d!73331 (or (= (bvand lt!342457 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342456 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342457 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342457 lt!342456) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73331 (= lt!342456 (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341443)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!341443))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!341443)))))))

(declare-fun lt!342458 () (_ BitVec 64))

(declare-fun lt!342460 () (_ BitVec 64))

(assert (=> d!73331 (= lt!342457 (bvmul lt!342458 lt!342460))))

(assert (=> d!73331 (or (= lt!342458 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342460 (bvsdiv (bvmul lt!342458 lt!342460) lt!342458)))))

(assert (=> d!73331 (= lt!342460 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73331 (= lt!342458 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341443)))))))

(assert (=> d!73331 (= lt!342461 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!341443))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!341443)))))))

(assert (=> d!73331 (invariant!0 (currentBit!9762 (_2!9886 lt!341443)) (currentByte!9767 (_2!9886 lt!341443)) (size!4654 (buf!5189 (_2!9886 lt!341443))))))

(assert (=> d!73331 (= (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341443))) (currentByte!9767 (_2!9886 lt!341443)) (currentBit!9762 (_2!9886 lt!341443))) lt!342461)))

(declare-fun b!216561 () Bool)

(declare-fun res!182183 () Bool)

(assert (=> b!216561 (=> (not res!182183) (not e!147301))))

(assert (=> b!216561 (= res!182183 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342461))))

(declare-fun b!216562 () Bool)

(declare-fun lt!342459 () (_ BitVec 64))

(assert (=> b!216562 (= e!147301 (bvsle lt!342461 (bvmul lt!342459 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216562 (or (= lt!342459 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!342459 #b0000000000000000000000000000000000000000000000000000000000001000) lt!342459)))))

(assert (=> b!216562 (= lt!342459 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341443)))))))

(assert (= (and d!73331 res!182184) b!216561))

(assert (= (and b!216561 res!182183) b!216562))

(declare-fun m!333953 () Bool)

(assert (=> d!73331 m!333953))

(assert (=> d!73331 m!332615))

(assert (=> b!215936 d!73331))

(declare-fun d!73333 () Bool)

(assert (=> d!73333 (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341443)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340128))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340128))) lt!341441)))

(declare-fun lt!342462 () Unit!15292)

(assert (=> d!73333 (= lt!342462 (choose!9 (_2!9886 lt!340128) (buf!5189 (_2!9886 lt!341443)) lt!341441 (BitStream!8417 (buf!5189 (_2!9886 lt!341443)) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128)))))))

(assert (=> d!73333 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9886 lt!340128) (buf!5189 (_2!9886 lt!341443)) lt!341441) lt!342462)))

(declare-fun bs!17924 () Bool)

(assert (= bs!17924 d!73333))

(assert (=> bs!17924 m!332563))

(declare-fun m!333955 () Bool)

(assert (=> bs!17924 m!333955))

(assert (=> b!215936 d!73333))

(declare-fun d!73335 () Bool)

(declare-fun lt!342463 () tuple2!18492)

(assert (=> d!73335 (= lt!342463 (readBit!0 (_1!9885 lt!341458)))))

(assert (=> d!73335 (= (readBitPure!0 (_1!9885 lt!341458)) (tuple2!18465 (_2!9901 lt!342463) (_1!9901 lt!342463)))))

(declare-fun bs!17925 () Bool)

(assert (= bs!17925 d!73335))

(declare-fun m!333957 () Bool)

(assert (=> bs!17925 m!333957))

(assert (=> b!215936 d!73335))

(declare-fun d!73337 () Bool)

(declare-fun e!147302 () Bool)

(assert (=> d!73337 e!147302))

(declare-fun res!182185 () Bool)

(assert (=> d!73337 (=> (not res!182185) (not e!147302))))

(declare-fun lt!342465 () (_ BitVec 64))

(declare-fun lt!342464 () BitStream!8416)

(assert (=> d!73337 (= res!182185 (= (bvadd lt!342465 (bvsub (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341412))) (currentByte!9767 (_2!9886 lt!341412)) (currentBit!9762 (_2!9886 lt!341412))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341443))) (currentByte!9767 (_2!9886 lt!341443)) (currentBit!9762 (_2!9886 lt!341443))))) (bitIndex!0 (size!4654 (buf!5189 lt!342464)) (currentByte!9767 lt!342464) (currentBit!9762 lt!342464))))))

(assert (=> d!73337 (or (not (= (bvand lt!342465 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341412))) (currentByte!9767 (_2!9886 lt!341412)) (currentBit!9762 (_2!9886 lt!341412))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341443))) (currentByte!9767 (_2!9886 lt!341443)) (currentBit!9762 (_2!9886 lt!341443)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342465 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342465 (bvsub (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341412))) (currentByte!9767 (_2!9886 lt!341412)) (currentBit!9762 (_2!9886 lt!341412))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341443))) (currentByte!9767 (_2!9886 lt!341443)) (currentBit!9762 (_2!9886 lt!341443))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73337 (= lt!342465 (bitIndex!0 (size!4654 (buf!5189 (_2!9885 lt!341453))) (currentByte!9767 (_2!9885 lt!341453)) (currentBit!9762 (_2!9885 lt!341453))))))

(assert (=> d!73337 (= lt!342464 (_2!9886 (moveBitIndex!0 (_2!9885 lt!341453) (bvsub (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341412))) (currentByte!9767 (_2!9886 lt!341412)) (currentBit!9762 (_2!9886 lt!341412))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341443))) (currentByte!9767 (_2!9886 lt!341443)) (currentBit!9762 (_2!9886 lt!341443)))))))))

(assert (=> d!73337 (moveBitIndexPrecond!0 (_2!9885 lt!341453) (bvsub (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341412))) (currentByte!9767 (_2!9886 lt!341412)) (currentBit!9762 (_2!9886 lt!341412))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341443))) (currentByte!9767 (_2!9886 lt!341443)) (currentBit!9762 (_2!9886 lt!341443)))))))

(assert (=> d!73337 (= (withMovedBitIndex!0 (_2!9885 lt!341453) (bvsub (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341412))) (currentByte!9767 (_2!9886 lt!341412)) (currentBit!9762 (_2!9886 lt!341412))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341443))) (currentByte!9767 (_2!9886 lt!341443)) (currentBit!9762 (_2!9886 lt!341443))))) lt!342464)))

(declare-fun b!216563 () Bool)

(assert (=> b!216563 (= e!147302 (= (size!4654 (buf!5189 (_2!9885 lt!341453))) (size!4654 (buf!5189 lt!342464))))))

(assert (= (and d!73337 res!182185) b!216563))

(declare-fun m!333959 () Bool)

(assert (=> d!73337 m!333959))

(declare-fun m!333961 () Bool)

(assert (=> d!73337 m!333961))

(declare-fun m!333963 () Bool)

(assert (=> d!73337 m!333963))

(declare-fun m!333965 () Bool)

(assert (=> d!73337 m!333965))

(assert (=> b!215936 d!73337))

(declare-fun d!73339 () Bool)

(assert (=> d!73339 (= (invariant!0 (currentBit!9762 (_2!9886 lt!341443)) (currentByte!9767 (_2!9886 lt!341443)) (size!4654 (buf!5189 (_2!9886 lt!341443)))) (and (bvsge (currentBit!9762 (_2!9886 lt!341443)) #b00000000000000000000000000000000) (bvslt (currentBit!9762 (_2!9886 lt!341443)) #b00000000000000000000000000001000) (bvsge (currentByte!9767 (_2!9886 lt!341443)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9767 (_2!9886 lt!341443)) (size!4654 (buf!5189 (_2!9886 lt!341443)))) (and (= (currentBit!9762 (_2!9886 lt!341443)) #b00000000000000000000000000000000) (= (currentByte!9767 (_2!9886 lt!341443)) (size!4654 (buf!5189 (_2!9886 lt!341443))))))))))

(assert (=> b!215936 d!73339))

(declare-fun d!73341 () Bool)

(declare-fun lt!342466 () tuple2!18490)

(assert (=> d!73341 (= lt!342466 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!9885 lt!341458) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!341410 e!146873)))))

(assert (=> d!73341 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9885 lt!341458) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!341410 e!146873)) (tuple2!18459 (_2!9900 lt!342466) (_1!9900 lt!342466)))))

(declare-fun bs!17926 () Bool)

(assert (= bs!17926 d!73341))

(assert (=> bs!17926 m!332557))

(declare-fun m!333967 () Bool)

(assert (=> bs!17926 m!333967))

(assert (=> b!215936 d!73341))

(declare-fun b!216564 () Bool)

(declare-fun e!147310 () (_ BitVec 64))

(assert (=> b!216564 (= e!147310 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!216565 () Bool)

(declare-fun res!182188 () Bool)

(declare-fun lt!342505 () tuple2!18462)

(assert (=> b!216565 (= res!182188 (isPrefixOf!0 (_2!9886 lt!341412) (_2!9886 lt!342505)))))

(declare-fun e!147311 () Bool)

(assert (=> b!216565 (=> (not res!182188) (not e!147311))))

(declare-fun b!216566 () Bool)

(declare-fun res!182187 () Bool)

(assert (=> b!216566 (= res!182187 (= (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!342505))) (currentByte!9767 (_2!9886 lt!342505)) (currentBit!9762 (_2!9886 lt!342505))) (bvadd (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341412))) (currentByte!9767 (_2!9886 lt!341412)) (currentBit!9762 (_2!9886 lt!341412))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!216566 (=> (not res!182187) (not e!147311))))

(declare-fun b!216567 () Bool)

(declare-fun e!147308 () Bool)

(declare-fun lt!342467 () tuple2!18458)

(declare-fun lt!342502 () tuple2!18460)

(assert (=> b!216567 (= e!147308 (= (_1!9884 lt!342467) (_2!9885 lt!342502)))))

(declare-fun b!216568 () Bool)

(assert (=> b!216568 (= e!147310 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun b!216569 () Bool)

(declare-fun e!147309 () Bool)

(declare-fun lt!342488 () tuple2!18458)

(declare-fun lt!342512 () tuple2!18460)

(assert (=> b!216569 (= e!147309 (= (_1!9884 lt!342488) (_2!9885 lt!342512)))))

(declare-fun b!216570 () Bool)

(declare-fun e!147307 () Bool)

(declare-fun lt!342507 () tuple2!18464)

(declare-fun lt!342522 () tuple2!18464)

(assert (=> b!216570 (= e!147307 (= (_2!9887 lt!342507) (_2!9887 lt!342522)))))

(declare-fun b!216571 () Bool)

(declare-fun e!147306 () Bool)

(declare-fun lt!342500 () tuple2!18464)

(assert (=> b!216571 (= e!147306 (= (bitIndex!0 (size!4654 (buf!5189 (_1!9887 lt!342500))) (currentByte!9767 (_1!9887 lt!342500)) (currentBit!9762 (_1!9887 lt!342500))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!342505))) (currentByte!9767 (_2!9886 lt!342505)) (currentBit!9762 (_2!9886 lt!342505)))))))

(declare-fun b!216572 () Bool)

(declare-fun res!182190 () Bool)

(declare-fun e!147304 () Bool)

(assert (=> b!216572 (=> (not res!182190) (not e!147304))))

(declare-fun lt!342476 () (_ BitVec 64))

(declare-fun lt!342517 () (_ BitVec 64))

(declare-fun lt!342492 () tuple2!18462)

(assert (=> b!216572 (= res!182190 (= (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!342492))) (currentByte!9767 (_2!9886 lt!342492)) (currentBit!9762 (_2!9886 lt!342492))) (bvsub lt!342517 lt!342476)))))

(assert (=> b!216572 (or (= (bvand lt!342517 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342476 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342517 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342517 lt!342476) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216572 (= lt!342476 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!342477 () (_ BitVec 64))

(declare-fun lt!342496 () (_ BitVec 64))

(assert (=> b!216572 (= lt!342517 (bvadd lt!342477 lt!342496))))

(assert (=> b!216572 (or (not (= (bvand lt!342477 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342496 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342477 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342477 lt!342496) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216572 (= lt!342496 ((_ sign_extend 32) nBits!348))))

(assert (=> b!216572 (= lt!342477 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341412))) (currentByte!9767 (_2!9886 lt!341412)) (currentBit!9762 (_2!9886 lt!341412))))))

(declare-fun b!216573 () Bool)

(declare-fun res!182189 () Bool)

(assert (=> b!216573 (=> (not res!182189) (not e!147304))))

(assert (=> b!216573 (= res!182189 (isPrefixOf!0 (_2!9886 lt!341412) (_2!9886 lt!342492)))))

(declare-fun d!73343 () Bool)

(assert (=> d!73343 e!147304))

(declare-fun res!182195 () Bool)

(assert (=> d!73343 (=> (not res!182195) (not e!147304))))

(assert (=> d!73343 (= res!182195 (invariant!0 (currentBit!9762 (_2!9886 lt!342492)) (currentByte!9767 (_2!9886 lt!342492)) (size!4654 (buf!5189 (_2!9886 lt!342492)))))))

(declare-fun e!147305 () tuple2!18462)

(assert (=> d!73343 (= lt!342492 e!147305)))

(declare-fun c!10586 () Bool)

(assert (=> d!73343 (= c!10586 (= (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) nBits!348))))

(assert (=> d!73343 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!73343 (= (appendBitsLSBFirstLoopTR!0 (_2!9886 lt!341412) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)) lt!342492)))

(declare-fun b!216574 () Bool)

(declare-fun res!182191 () Bool)

(assert (=> b!216574 (=> (not res!182191) (not e!147304))))

(assert (=> b!216574 (= res!182191 (= (size!4654 (buf!5189 (_2!9886 lt!341412))) (size!4654 (buf!5189 (_2!9886 lt!342492)))))))

(declare-fun b!216575 () Bool)

(declare-fun lt!342503 () tuple2!18462)

(assert (=> b!216575 (= e!147305 (tuple2!18463 (_1!9886 lt!342503) (_2!9886 lt!342503)))))

(declare-fun lt!342494 () Bool)

(assert (=> b!216575 (= lt!342494 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216575 (= lt!342505 (appendBit!0 (_2!9886 lt!341412) lt!342494))))

(declare-fun res!182186 () Bool)

(assert (=> b!216575 (= res!182186 (= (size!4654 (buf!5189 (_2!9886 lt!341412))) (size!4654 (buf!5189 (_2!9886 lt!342505)))))))

(assert (=> b!216575 (=> (not res!182186) (not e!147311))))

(assert (=> b!216575 e!147311))

(declare-fun lt!342472 () tuple2!18462)

(assert (=> b!216575 (= lt!342472 lt!342505)))

(assert (=> b!216575 (= lt!342503 (appendBitsLSBFirstLoopTR!0 (_2!9886 lt!342472) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!342483 () Unit!15292)

(assert (=> b!216575 (= lt!342483 (lemmaIsPrefixTransitive!0 (_2!9886 lt!341412) (_2!9886 lt!342472) (_2!9886 lt!342503)))))

(declare-fun call!3389 () Bool)

(assert (=> b!216575 call!3389))

(declare-fun lt!342473 () Unit!15292)

(assert (=> b!216575 (= lt!342473 lt!342483)))

(assert (=> b!216575 (invariant!0 (currentBit!9762 (_2!9886 lt!341412)) (currentByte!9767 (_2!9886 lt!341412)) (size!4654 (buf!5189 (_2!9886 lt!342472))))))

(declare-fun lt!342506 () BitStream!8416)

(assert (=> b!216575 (= lt!342506 (BitStream!8417 (buf!5189 (_2!9886 lt!342472)) (currentByte!9767 (_2!9886 lt!341412)) (currentBit!9762 (_2!9886 lt!341412))))))

(assert (=> b!216575 (invariant!0 (currentBit!9762 lt!342506) (currentByte!9767 lt!342506) (size!4654 (buf!5189 (_2!9886 lt!342503))))))

(declare-fun lt!342514 () BitStream!8416)

(assert (=> b!216575 (= lt!342514 (BitStream!8417 (buf!5189 (_2!9886 lt!342503)) (currentByte!9767 lt!342506) (currentBit!9762 lt!342506)))))

(assert (=> b!216575 (= lt!342507 (readBitPure!0 lt!342506))))

(assert (=> b!216575 (= lt!342522 (readBitPure!0 lt!342514))))

(declare-fun lt!342475 () Unit!15292)

(assert (=> b!216575 (= lt!342475 (readBitPrefixLemma!0 lt!342506 (_2!9886 lt!342503)))))

(declare-fun res!182192 () Bool)

(assert (=> b!216575 (= res!182192 (= (bitIndex!0 (size!4654 (buf!5189 (_1!9887 lt!342507))) (currentByte!9767 (_1!9887 lt!342507)) (currentBit!9762 (_1!9887 lt!342507))) (bitIndex!0 (size!4654 (buf!5189 (_1!9887 lt!342522))) (currentByte!9767 (_1!9887 lt!342522)) (currentBit!9762 (_1!9887 lt!342522)))))))

(assert (=> b!216575 (=> (not res!182192) (not e!147307))))

(assert (=> b!216575 e!147307))

(declare-fun lt!342498 () Unit!15292)

(assert (=> b!216575 (= lt!342498 lt!342475)))

(declare-fun lt!342518 () tuple2!18460)

(assert (=> b!216575 (= lt!342518 (reader!0 (_2!9886 lt!341412) (_2!9886 lt!342503)))))

(declare-fun lt!342513 () tuple2!18460)

(assert (=> b!216575 (= lt!342513 (reader!0 (_2!9886 lt!342472) (_2!9886 lt!342503)))))

(declare-fun lt!342497 () tuple2!18464)

(assert (=> b!216575 (= lt!342497 (readBitPure!0 (_1!9885 lt!342518)))))

(assert (=> b!216575 (= (_2!9887 lt!342497) lt!342494)))

(declare-fun lt!342482 () Unit!15292)

(declare-fun Unit!15419 () Unit!15292)

(assert (=> b!216575 (= lt!342482 Unit!15419)))

(declare-fun lt!342470 () (_ BitVec 64))

(assert (=> b!216575 (= lt!342470 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!342501 () (_ BitVec 64))

(assert (=> b!216575 (= lt!342501 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!342490 () Unit!15292)

(assert (=> b!216575 (= lt!342490 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9886 lt!341412) (buf!5189 (_2!9886 lt!342503)) lt!342501))))

(assert (=> b!216575 (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!342503)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!341412))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!341412))) lt!342501)))

(declare-fun lt!342516 () Unit!15292)

(assert (=> b!216575 (= lt!342516 lt!342490)))

(declare-fun lt!342474 () tuple2!18458)

(assert (=> b!216575 (= lt!342474 (readNBitsLSBFirstsLoopPure!0 (_1!9885 lt!342518) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!342470))))

(declare-fun lt!342484 () (_ BitVec 64))

(assert (=> b!216575 (= lt!342484 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!342499 () Unit!15292)

(assert (=> b!216575 (= lt!342499 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9886 lt!342472) (buf!5189 (_2!9886 lt!342503)) lt!342484))))

(assert (=> b!216575 (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!342503)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!342472))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!342472))) lt!342484)))

(declare-fun lt!342485 () Unit!15292)

(assert (=> b!216575 (= lt!342485 lt!342499)))

(declare-fun lt!342511 () tuple2!18458)

(assert (=> b!216575 (= lt!342511 (readNBitsLSBFirstsLoopPure!0 (_1!9885 lt!342513) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!342470 (ite (_2!9887 lt!342497) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!342521 () tuple2!18458)

(assert (=> b!216575 (= lt!342521 (readNBitsLSBFirstsLoopPure!0 (_1!9885 lt!342518) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!342470))))

(declare-fun c!10587 () Bool)

(assert (=> b!216575 (= c!10587 (_2!9887 (readBitPure!0 (_1!9885 lt!342518))))))

(declare-fun lt!342515 () tuple2!18458)

(assert (=> b!216575 (= lt!342515 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9885 lt!342518) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!342470 e!147310)))))

(declare-fun lt!342504 () Unit!15292)

(assert (=> b!216575 (= lt!342504 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9885 lt!342518) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!342470))))

(assert (=> b!216575 (and (= (_2!9884 lt!342521) (_2!9884 lt!342515)) (= (_1!9884 lt!342521) (_1!9884 lt!342515)))))

(declare-fun lt!342469 () Unit!15292)

(assert (=> b!216575 (= lt!342469 lt!342504)))

(assert (=> b!216575 (= (_1!9885 lt!342518) (withMovedBitIndex!0 (_2!9885 lt!342518) (bvsub (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341412))) (currentByte!9767 (_2!9886 lt!341412)) (currentBit!9762 (_2!9886 lt!341412))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!342503))) (currentByte!9767 (_2!9886 lt!342503)) (currentBit!9762 (_2!9886 lt!342503))))))))

(declare-fun lt!342510 () Unit!15292)

(declare-fun Unit!15420 () Unit!15292)

(assert (=> b!216575 (= lt!342510 Unit!15420)))

(assert (=> b!216575 (= (_1!9885 lt!342513) (withMovedBitIndex!0 (_2!9885 lt!342513) (bvsub (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!342472))) (currentByte!9767 (_2!9886 lt!342472)) (currentBit!9762 (_2!9886 lt!342472))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!342503))) (currentByte!9767 (_2!9886 lt!342503)) (currentBit!9762 (_2!9886 lt!342503))))))))

(declare-fun lt!342487 () Unit!15292)

(declare-fun Unit!15421 () Unit!15292)

(assert (=> b!216575 (= lt!342487 Unit!15421)))

(assert (=> b!216575 (= (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341412))) (currentByte!9767 (_2!9886 lt!341412)) (currentBit!9762 (_2!9886 lt!341412))) (bvsub (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!342472))) (currentByte!9767 (_2!9886 lt!342472)) (currentBit!9762 (_2!9886 lt!342472))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!342508 () Unit!15292)

(declare-fun Unit!15422 () Unit!15292)

(assert (=> b!216575 (= lt!342508 Unit!15422)))

(assert (=> b!216575 (= (_2!9884 lt!342474) (_2!9884 lt!342511))))

(declare-fun lt!342471 () Unit!15292)

(declare-fun Unit!15423 () Unit!15292)

(assert (=> b!216575 (= lt!342471 Unit!15423)))

(assert (=> b!216575 (invariant!0 (currentBit!9762 (_2!9886 lt!342503)) (currentByte!9767 (_2!9886 lt!342503)) (size!4654 (buf!5189 (_2!9886 lt!342503))))))

(declare-fun lt!342519 () Unit!15292)

(declare-fun Unit!15424 () Unit!15292)

(assert (=> b!216575 (= lt!342519 Unit!15424)))

(assert (=> b!216575 (= (size!4654 (buf!5189 (_2!9886 lt!341412))) (size!4654 (buf!5189 (_2!9886 lt!342503))))))

(declare-fun lt!342520 () Unit!15292)

(declare-fun Unit!15425 () Unit!15292)

(assert (=> b!216575 (= lt!342520 Unit!15425)))

(assert (=> b!216575 (= (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!342503))) (currentByte!9767 (_2!9886 lt!342503)) (currentBit!9762 (_2!9886 lt!342503))) (bvsub (bvadd (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341412))) (currentByte!9767 (_2!9886 lt!341412)) (currentBit!9762 (_2!9886 lt!341412))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!342468 () Unit!15292)

(declare-fun Unit!15426 () Unit!15292)

(assert (=> b!216575 (= lt!342468 Unit!15426)))

(declare-fun lt!342480 () Unit!15292)

(declare-fun Unit!15427 () Unit!15292)

(assert (=> b!216575 (= lt!342480 Unit!15427)))

(assert (=> b!216575 (= lt!342502 (reader!0 (_2!9886 lt!341412) (_2!9886 lt!342503)))))

(declare-fun lt!342478 () (_ BitVec 64))

(assert (=> b!216575 (= lt!342478 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!342486 () Unit!15292)

(assert (=> b!216575 (= lt!342486 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9886 lt!341412) (buf!5189 (_2!9886 lt!342503)) lt!342478))))

(assert (=> b!216575 (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!342503)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!341412))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!341412))) lt!342478)))

(declare-fun lt!342491 () Unit!15292)

(assert (=> b!216575 (= lt!342491 lt!342486)))

(assert (=> b!216575 (= lt!342467 (readNBitsLSBFirstsLoopPure!0 (_1!9885 lt!342502) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))))

(declare-fun res!182194 () Bool)

(assert (=> b!216575 (= res!182194 (= (_2!9884 lt!342467) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!216575 (=> (not res!182194) (not e!147308))))

(assert (=> b!216575 e!147308))

(declare-fun lt!342509 () Unit!15292)

(declare-fun Unit!15428 () Unit!15292)

(assert (=> b!216575 (= lt!342509 Unit!15428)))

(declare-fun bm!3386 () Bool)

(assert (=> bm!3386 (= call!3389 (isPrefixOf!0 (_2!9886 lt!341412) (ite c!10586 (_2!9886 lt!341412) (_2!9886 lt!342503))))))

(declare-fun b!216576 () Bool)

(declare-fun Unit!15429 () Unit!15292)

(assert (=> b!216576 (= e!147305 (tuple2!18463 Unit!15429 (_2!9886 lt!341412)))))

(declare-fun lt!342479 () Unit!15292)

(assert (=> b!216576 (= lt!342479 (lemmaIsPrefixRefl!0 (_2!9886 lt!341412)))))

(assert (=> b!216576 call!3389))

(declare-fun lt!342489 () Unit!15292)

(assert (=> b!216576 (= lt!342489 lt!342479)))

(declare-fun b!216577 () Bool)

(assert (=> b!216577 (= e!147304 e!147309)))

(declare-fun res!182193 () Bool)

(assert (=> b!216577 (=> (not res!182193) (not e!147309))))

(assert (=> b!216577 (= res!182193 (= (_2!9884 lt!342488) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!216577 (= lt!342488 (readNBitsLSBFirstsLoopPure!0 (_1!9885 lt!342512) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))))

(declare-fun lt!342481 () Unit!15292)

(declare-fun lt!342495 () Unit!15292)

(assert (=> b!216577 (= lt!342481 lt!342495)))

(declare-fun lt!342493 () (_ BitVec 64))

(assert (=> b!216577 (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!342492)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!341412))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!341412))) lt!342493)))

(assert (=> b!216577 (= lt!342495 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9886 lt!341412) (buf!5189 (_2!9886 lt!342492)) lt!342493))))

(declare-fun e!147303 () Bool)

(assert (=> b!216577 e!147303))

(declare-fun res!182196 () Bool)

(assert (=> b!216577 (=> (not res!182196) (not e!147303))))

(assert (=> b!216577 (= res!182196 (and (= (size!4654 (buf!5189 (_2!9886 lt!341412))) (size!4654 (buf!5189 (_2!9886 lt!342492)))) (bvsge lt!342493 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216577 (= lt!342493 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(assert (=> b!216577 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!216577 (= lt!342512 (reader!0 (_2!9886 lt!341412) (_2!9886 lt!342492)))))

(declare-fun b!216578 () Bool)

(assert (=> b!216578 (= e!147303 (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341412)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!341412))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!341412))) lt!342493))))

(declare-fun b!216579 () Bool)

(assert (=> b!216579 (= lt!342500 (readBitPure!0 (readerFrom!0 (_2!9886 lt!342505) (currentBit!9762 (_2!9886 lt!341412)) (currentByte!9767 (_2!9886 lt!341412)))))))

(declare-fun res!182197 () Bool)

(assert (=> b!216579 (= res!182197 (and (= (_2!9887 lt!342500) lt!342494) (= (_1!9887 lt!342500) (_2!9886 lt!342505))))))

(assert (=> b!216579 (=> (not res!182197) (not e!147306))))

(assert (=> b!216579 (= e!147311 e!147306)))

(assert (= (and d!73343 c!10586) b!216576))

(assert (= (and d!73343 (not c!10586)) b!216575))

(assert (= (and b!216575 res!182186) b!216566))

(assert (= (and b!216566 res!182187) b!216565))

(assert (= (and b!216565 res!182188) b!216579))

(assert (= (and b!216579 res!182197) b!216571))

(assert (= (and b!216575 res!182192) b!216570))

(assert (= (and b!216575 c!10587) b!216568))

(assert (= (and b!216575 (not c!10587)) b!216564))

(assert (= (and b!216575 res!182194) b!216567))

(assert (= (or b!216576 b!216575) bm!3386))

(assert (= (and d!73343 res!182195) b!216574))

(assert (= (and b!216574 res!182191) b!216572))

(assert (= (and b!216572 res!182190) b!216573))

(assert (= (and b!216573 res!182189) b!216577))

(assert (= (and b!216577 res!182196) b!216578))

(assert (= (and b!216577 res!182193) b!216569))

(declare-fun m!333969 () Bool)

(assert (=> bm!3386 m!333969))

(declare-fun m!333971 () Bool)

(assert (=> b!216578 m!333971))

(declare-fun m!333973 () Bool)

(assert (=> b!216579 m!333973))

(assert (=> b!216579 m!333973))

(declare-fun m!333975 () Bool)

(assert (=> b!216579 m!333975))

(declare-fun m!333977 () Bool)

(assert (=> b!216575 m!333977))

(declare-fun m!333979 () Bool)

(assert (=> b!216575 m!333979))

(declare-fun m!333981 () Bool)

(assert (=> b!216575 m!333981))

(declare-fun m!333983 () Bool)

(assert (=> b!216575 m!333983))

(declare-fun m!333985 () Bool)

(assert (=> b!216575 m!333985))

(declare-fun m!333987 () Bool)

(assert (=> b!216575 m!333987))

(assert (=> b!216575 m!331645))

(declare-fun m!333989 () Bool)

(assert (=> b!216575 m!333989))

(declare-fun m!333991 () Bool)

(assert (=> b!216575 m!333991))

(declare-fun m!333993 () Bool)

(assert (=> b!216575 m!333993))

(declare-fun m!333995 () Bool)

(assert (=> b!216575 m!333995))

(declare-fun m!333997 () Bool)

(assert (=> b!216575 m!333997))

(declare-fun m!333999 () Bool)

(assert (=> b!216575 m!333999))

(assert (=> b!216575 m!333979))

(declare-fun m!334001 () Bool)

(assert (=> b!216575 m!334001))

(declare-fun m!334003 () Bool)

(assert (=> b!216575 m!334003))

(declare-fun m!334005 () Bool)

(assert (=> b!216575 m!334005))

(declare-fun m!334007 () Bool)

(assert (=> b!216575 m!334007))

(declare-fun m!334009 () Bool)

(assert (=> b!216575 m!334009))

(declare-fun m!334011 () Bool)

(assert (=> b!216575 m!334011))

(declare-fun m!334013 () Bool)

(assert (=> b!216575 m!334013))

(declare-fun m!334015 () Bool)

(assert (=> b!216575 m!334015))

(declare-fun m!334017 () Bool)

(assert (=> b!216575 m!334017))

(declare-fun m!334019 () Bool)

(assert (=> b!216575 m!334019))

(declare-fun m!334021 () Bool)

(assert (=> b!216575 m!334021))

(declare-fun m!334023 () Bool)

(assert (=> b!216575 m!334023))

(declare-fun m!334025 () Bool)

(assert (=> b!216575 m!334025))

(declare-fun m!334027 () Bool)

(assert (=> b!216575 m!334027))

(declare-fun m!334029 () Bool)

(assert (=> b!216575 m!334029))

(declare-fun m!334031 () Bool)

(assert (=> b!216575 m!334031))

(assert (=> b!216575 m!332589))

(declare-fun m!334033 () Bool)

(assert (=> b!216575 m!334033))

(declare-fun m!334035 () Bool)

(assert (=> b!216575 m!334035))

(declare-fun m!334037 () Bool)

(assert (=> b!216575 m!334037))

(declare-fun m!334039 () Bool)

(assert (=> b!216576 m!334039))

(declare-fun m!334041 () Bool)

(assert (=> b!216566 m!334041))

(assert (=> b!216566 m!332589))

(assert (=> b!216577 m!331645))

(assert (=> b!216577 m!333989))

(declare-fun m!334043 () Bool)

(assert (=> b!216577 m!334043))

(declare-fun m!334045 () Bool)

(assert (=> b!216577 m!334045))

(declare-fun m!334047 () Bool)

(assert (=> b!216577 m!334047))

(declare-fun m!334049 () Bool)

(assert (=> b!216577 m!334049))

(declare-fun m!334051 () Bool)

(assert (=> b!216571 m!334051))

(assert (=> b!216571 m!334041))

(declare-fun m!334053 () Bool)

(assert (=> b!216572 m!334053))

(assert (=> b!216572 m!332589))

(declare-fun m!334055 () Bool)

(assert (=> d!73343 m!334055))

(declare-fun m!334057 () Bool)

(assert (=> b!216565 m!334057))

(declare-fun m!334059 () Bool)

(assert (=> b!216573 m!334059))

(assert (=> b!215936 d!73343))

(declare-fun d!73345 () Bool)

(declare-fun lt!342523 () tuple2!18492)

(assert (=> d!73345 (= lt!342523 (readBit!0 lt!341454))))

(assert (=> d!73345 (= (readBitPure!0 lt!341454) (tuple2!18465 (_2!9901 lt!342523) (_1!9901 lt!342523)))))

(declare-fun bs!17927 () Bool)

(assert (= bs!17927 d!73345))

(declare-fun m!334061 () Bool)

(assert (=> bs!17927 m!334061))

(assert (=> b!215936 d!73345))

(declare-fun d!73347 () Bool)

(declare-fun e!147312 () Bool)

(assert (=> d!73347 e!147312))

(declare-fun res!182199 () Bool)

(assert (=> d!73347 (=> (not res!182199) (not e!147312))))

(declare-fun lt!342524 () (_ BitVec 64))

(declare-fun lt!342529 () (_ BitVec 64))

(declare-fun lt!342525 () (_ BitVec 64))

(assert (=> d!73347 (= res!182199 (= lt!342529 (bvsub lt!342525 lt!342524)))))

(assert (=> d!73347 (or (= (bvand lt!342525 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342524 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342525 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342525 lt!342524) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73347 (= lt!342524 (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!341447)))) ((_ sign_extend 32) (currentByte!9767 (_1!9887 lt!341447))) ((_ sign_extend 32) (currentBit!9762 (_1!9887 lt!341447)))))))

(declare-fun lt!342526 () (_ BitVec 64))

(declare-fun lt!342528 () (_ BitVec 64))

(assert (=> d!73347 (= lt!342525 (bvmul lt!342526 lt!342528))))

(assert (=> d!73347 (or (= lt!342526 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342528 (bvsdiv (bvmul lt!342526 lt!342528) lt!342526)))))

(assert (=> d!73347 (= lt!342528 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73347 (= lt!342526 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!341447)))))))

(assert (=> d!73347 (= lt!342529 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_1!9887 lt!341447))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_1!9887 lt!341447)))))))

(assert (=> d!73347 (invariant!0 (currentBit!9762 (_1!9887 lt!341447)) (currentByte!9767 (_1!9887 lt!341447)) (size!4654 (buf!5189 (_1!9887 lt!341447))))))

(assert (=> d!73347 (= (bitIndex!0 (size!4654 (buf!5189 (_1!9887 lt!341447))) (currentByte!9767 (_1!9887 lt!341447)) (currentBit!9762 (_1!9887 lt!341447))) lt!342529)))

(declare-fun b!216580 () Bool)

(declare-fun res!182198 () Bool)

(assert (=> b!216580 (=> (not res!182198) (not e!147312))))

(assert (=> b!216580 (= res!182198 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342529))))

(declare-fun b!216581 () Bool)

(declare-fun lt!342527 () (_ BitVec 64))

(assert (=> b!216581 (= e!147312 (bvsle lt!342529 (bvmul lt!342527 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216581 (or (= lt!342527 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!342527 #b0000000000000000000000000000000000000000000000000000000000001000) lt!342527)))))

(assert (=> b!216581 (= lt!342527 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!341447)))))))

(assert (= (and d!73347 res!182199) b!216580))

(assert (= (and b!216580 res!182198) b!216581))

(declare-fun m!334063 () Bool)

(assert (=> d!73347 m!334063))

(declare-fun m!334065 () Bool)

(assert (=> d!73347 m!334065))

(assert (=> b!215936 d!73347))

(declare-fun d!73349 () Bool)

(declare-fun e!147313 () Bool)

(assert (=> d!73349 e!147313))

(declare-fun res!182200 () Bool)

(assert (=> d!73349 (=> (not res!182200) (not e!147313))))

(declare-fun lt!342531 () (_ BitVec 64))

(declare-fun lt!342530 () BitStream!8416)

(assert (=> d!73349 (= res!182200 (= (bvadd lt!342531 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4654 (buf!5189 lt!342530)) (currentByte!9767 lt!342530) (currentBit!9762 lt!342530))))))

(assert (=> d!73349 (or (not (= (bvand lt!342531 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342531 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342531 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73349 (= lt!342531 (bitIndex!0 (size!4654 (buf!5189 (_1!9885 lt!341458))) (currentByte!9767 (_1!9885 lt!341458)) (currentBit!9762 (_1!9885 lt!341458))))))

(assert (=> d!73349 (= lt!342530 (_2!9886 (moveBitIndex!0 (_1!9885 lt!341458) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!73349 (moveBitIndexPrecond!0 (_1!9885 lt!341458) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!73349 (= (withMovedBitIndex!0 (_1!9885 lt!341458) #b0000000000000000000000000000000000000000000000000000000000000001) lt!342530)))

(declare-fun b!216582 () Bool)

(assert (=> b!216582 (= e!147313 (= (size!4654 (buf!5189 (_1!9885 lt!341458))) (size!4654 (buf!5189 lt!342530))))))

(assert (= (and d!73349 res!182200) b!216582))

(declare-fun m!334067 () Bool)

(assert (=> d!73349 m!334067))

(declare-fun m!334069 () Bool)

(assert (=> d!73349 m!334069))

(declare-fun m!334071 () Bool)

(assert (=> d!73349 m!334071))

(declare-fun m!334073 () Bool)

(assert (=> d!73349 m!334073))

(assert (=> b!215936 d!73349))

(declare-fun lt!342532 () tuple2!18490)

(declare-fun d!73351 () Bool)

(assert (=> d!73351 (= lt!342532 (readNBitsLSBFirstsLoop!0 (_1!9885 lt!341453) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!341410 (ite (_2!9887 lt!341437) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!73351 (= (readNBitsLSBFirstsLoopPure!0 (_1!9885 lt!341453) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!341410 (ite (_2!9887 lt!341437) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!18459 (_2!9900 lt!342532) (_1!9900 lt!342532)))))

(declare-fun bs!17928 () Bool)

(assert (= bs!17928 d!73351))

(declare-fun m!334075 () Bool)

(assert (=> bs!17928 m!334075))

(assert (=> b!215936 d!73351))

(declare-fun d!73353 () Bool)

(assert (=> d!73353 (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341443)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!341412))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!341412))) lt!341424)))

(declare-fun lt!342533 () Unit!15292)

(assert (=> d!73353 (= lt!342533 (choose!9 (_2!9886 lt!341412) (buf!5189 (_2!9886 lt!341443)) lt!341424 (BitStream!8417 (buf!5189 (_2!9886 lt!341443)) (currentByte!9767 (_2!9886 lt!341412)) (currentBit!9762 (_2!9886 lt!341412)))))))

(assert (=> d!73353 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9886 lt!341412) (buf!5189 (_2!9886 lt!341443)) lt!341424) lt!342533)))

(declare-fun bs!17929 () Bool)

(assert (= bs!17929 d!73353))

(assert (=> bs!17929 m!332609))

(declare-fun m!334077 () Bool)

(assert (=> bs!17929 m!334077))

(assert (=> b!215936 d!73353))

(declare-fun b!216583 () Bool)

(declare-fun res!182201 () Bool)

(declare-fun e!147314 () Bool)

(assert (=> b!216583 (=> (not res!182201) (not e!147314))))

(declare-fun lt!342552 () tuple2!18460)

(assert (=> b!216583 (= res!182201 (isPrefixOf!0 (_1!9885 lt!342552) (_2!9886 lt!340128)))))

(declare-fun b!216584 () Bool)

(declare-fun e!147315 () Unit!15292)

(declare-fun Unit!15430 () Unit!15292)

(assert (=> b!216584 (= e!147315 Unit!15430)))

(declare-fun d!73355 () Bool)

(assert (=> d!73355 e!147314))

(declare-fun res!182202 () Bool)

(assert (=> d!73355 (=> (not res!182202) (not e!147314))))

(assert (=> d!73355 (= res!182202 (isPrefixOf!0 (_1!9885 lt!342552) (_2!9885 lt!342552)))))

(declare-fun lt!342553 () BitStream!8416)

(assert (=> d!73355 (= lt!342552 (tuple2!18461 lt!342553 (_2!9886 lt!341443)))))

(declare-fun lt!342544 () Unit!15292)

(declare-fun lt!342550 () Unit!15292)

(assert (=> d!73355 (= lt!342544 lt!342550)))

(assert (=> d!73355 (isPrefixOf!0 lt!342553 (_2!9886 lt!341443))))

(assert (=> d!73355 (= lt!342550 (lemmaIsPrefixTransitive!0 lt!342553 (_2!9886 lt!341443) (_2!9886 lt!341443)))))

(declare-fun lt!342542 () Unit!15292)

(declare-fun lt!342537 () Unit!15292)

(assert (=> d!73355 (= lt!342542 lt!342537)))

(assert (=> d!73355 (isPrefixOf!0 lt!342553 (_2!9886 lt!341443))))

(assert (=> d!73355 (= lt!342537 (lemmaIsPrefixTransitive!0 lt!342553 (_2!9886 lt!340128) (_2!9886 lt!341443)))))

(declare-fun lt!342551 () Unit!15292)

(assert (=> d!73355 (= lt!342551 e!147315)))

(declare-fun c!10588 () Bool)

(assert (=> d!73355 (= c!10588 (not (= (size!4654 (buf!5189 (_2!9886 lt!340128))) #b00000000000000000000000000000000)))))

(declare-fun lt!342534 () Unit!15292)

(declare-fun lt!342545 () Unit!15292)

(assert (=> d!73355 (= lt!342534 lt!342545)))

(assert (=> d!73355 (isPrefixOf!0 (_2!9886 lt!341443) (_2!9886 lt!341443))))

(assert (=> d!73355 (= lt!342545 (lemmaIsPrefixRefl!0 (_2!9886 lt!341443)))))

(declare-fun lt!342535 () Unit!15292)

(declare-fun lt!342539 () Unit!15292)

(assert (=> d!73355 (= lt!342535 lt!342539)))

(assert (=> d!73355 (= lt!342539 (lemmaIsPrefixRefl!0 (_2!9886 lt!341443)))))

(declare-fun lt!342543 () Unit!15292)

(declare-fun lt!342548 () Unit!15292)

(assert (=> d!73355 (= lt!342543 lt!342548)))

(assert (=> d!73355 (isPrefixOf!0 lt!342553 lt!342553)))

(assert (=> d!73355 (= lt!342548 (lemmaIsPrefixRefl!0 lt!342553))))

(declare-fun lt!342540 () Unit!15292)

(declare-fun lt!342538 () Unit!15292)

(assert (=> d!73355 (= lt!342540 lt!342538)))

(assert (=> d!73355 (isPrefixOf!0 (_2!9886 lt!340128) (_2!9886 lt!340128))))

(assert (=> d!73355 (= lt!342538 (lemmaIsPrefixRefl!0 (_2!9886 lt!340128)))))

(assert (=> d!73355 (= lt!342553 (BitStream!8417 (buf!5189 (_2!9886 lt!341443)) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))))))

(assert (=> d!73355 (isPrefixOf!0 (_2!9886 lt!340128) (_2!9886 lt!341443))))

(assert (=> d!73355 (= (reader!0 (_2!9886 lt!340128) (_2!9886 lt!341443)) lt!342552)))

(declare-fun b!216585 () Bool)

(declare-fun lt!342536 () Unit!15292)

(assert (=> b!216585 (= e!147315 lt!342536)))

(declare-fun lt!342547 () (_ BitVec 64))

(assert (=> b!216585 (= lt!342547 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!342549 () (_ BitVec 64))

(assert (=> b!216585 (= lt!342549 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))))))

(assert (=> b!216585 (= lt!342536 (arrayBitRangesEqSymmetric!0 (buf!5189 (_2!9886 lt!340128)) (buf!5189 (_2!9886 lt!341443)) lt!342547 lt!342549))))

(assert (=> b!216585 (arrayBitRangesEq!0 (buf!5189 (_2!9886 lt!341443)) (buf!5189 (_2!9886 lt!340128)) lt!342547 lt!342549)))

(declare-fun lt!342541 () (_ BitVec 64))

(declare-fun lt!342546 () (_ BitVec 64))

(declare-fun b!216586 () Bool)

(assert (=> b!216586 (= e!147314 (= (_1!9885 lt!342552) (withMovedBitIndex!0 (_2!9885 lt!342552) (bvsub lt!342541 lt!342546))))))

(assert (=> b!216586 (or (= (bvand lt!342541 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342546 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342541 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342541 lt!342546) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216586 (= lt!342546 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341443))) (currentByte!9767 (_2!9886 lt!341443)) (currentBit!9762 (_2!9886 lt!341443))))))

(assert (=> b!216586 (= lt!342541 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))))))

(declare-fun b!216587 () Bool)

(declare-fun res!182203 () Bool)

(assert (=> b!216587 (=> (not res!182203) (not e!147314))))

(assert (=> b!216587 (= res!182203 (isPrefixOf!0 (_2!9885 lt!342552) (_2!9886 lt!341443)))))

(assert (= (and d!73355 c!10588) b!216585))

(assert (= (and d!73355 (not c!10588)) b!216584))

(assert (= (and d!73355 res!182202) b!216583))

(assert (= (and b!216583 res!182201) b!216587))

(assert (= (and b!216587 res!182203) b!216586))

(declare-fun m!334079 () Bool)

(assert (=> b!216587 m!334079))

(declare-fun m!334081 () Bool)

(assert (=> b!216583 m!334081))

(assert (=> d!73355 m!332287))

(declare-fun m!334083 () Bool)

(assert (=> d!73355 m!334083))

(declare-fun m!334085 () Bool)

(assert (=> d!73355 m!334085))

(declare-fun m!334087 () Bool)

(assert (=> d!73355 m!334087))

(assert (=> d!73355 m!332293))

(declare-fun m!334089 () Bool)

(assert (=> d!73355 m!334089))

(declare-fun m!334091 () Bool)

(assert (=> d!73355 m!334091))

(declare-fun m!334093 () Bool)

(assert (=> d!73355 m!334093))

(declare-fun m!334095 () Bool)

(assert (=> d!73355 m!334095))

(declare-fun m!334097 () Bool)

(assert (=> d!73355 m!334097))

(declare-fun m!334099 () Bool)

(assert (=> d!73355 m!334099))

(assert (=> b!216585 m!331623))

(declare-fun m!334101 () Bool)

(assert (=> b!216585 m!334101))

(declare-fun m!334103 () Bool)

(assert (=> b!216585 m!334103))

(declare-fun m!334105 () Bool)

(assert (=> b!216586 m!334105))

(assert (=> b!216586 m!332597))

(assert (=> b!216586 m!331623))

(assert (=> b!215936 d!73355))

(declare-fun d!73357 () Bool)

(assert (=> d!73357 (= (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (=> b!215936 d!73357))

(declare-fun b!216588 () Bool)

(declare-fun res!182204 () Bool)

(declare-fun e!147316 () Bool)

(assert (=> b!216588 (=> (not res!182204) (not e!147316))))

(declare-fun lt!342572 () tuple2!18460)

(assert (=> b!216588 (= res!182204 (isPrefixOf!0 (_1!9885 lt!342572) (_2!9886 lt!341412)))))

(declare-fun b!216589 () Bool)

(declare-fun e!147317 () Unit!15292)

(declare-fun Unit!15431 () Unit!15292)

(assert (=> b!216589 (= e!147317 Unit!15431)))

(declare-fun d!73359 () Bool)

(assert (=> d!73359 e!147316))

(declare-fun res!182205 () Bool)

(assert (=> d!73359 (=> (not res!182205) (not e!147316))))

(assert (=> d!73359 (= res!182205 (isPrefixOf!0 (_1!9885 lt!342572) (_2!9885 lt!342572)))))

(declare-fun lt!342573 () BitStream!8416)

(assert (=> d!73359 (= lt!342572 (tuple2!18461 lt!342573 (_2!9886 lt!341443)))))

(declare-fun lt!342564 () Unit!15292)

(declare-fun lt!342570 () Unit!15292)

(assert (=> d!73359 (= lt!342564 lt!342570)))

(assert (=> d!73359 (isPrefixOf!0 lt!342573 (_2!9886 lt!341443))))

(assert (=> d!73359 (= lt!342570 (lemmaIsPrefixTransitive!0 lt!342573 (_2!9886 lt!341443) (_2!9886 lt!341443)))))

(declare-fun lt!342562 () Unit!15292)

(declare-fun lt!342557 () Unit!15292)

(assert (=> d!73359 (= lt!342562 lt!342557)))

(assert (=> d!73359 (isPrefixOf!0 lt!342573 (_2!9886 lt!341443))))

(assert (=> d!73359 (= lt!342557 (lemmaIsPrefixTransitive!0 lt!342573 (_2!9886 lt!341412) (_2!9886 lt!341443)))))

(declare-fun lt!342571 () Unit!15292)

(assert (=> d!73359 (= lt!342571 e!147317)))

(declare-fun c!10589 () Bool)

(assert (=> d!73359 (= c!10589 (not (= (size!4654 (buf!5189 (_2!9886 lt!341412))) #b00000000000000000000000000000000)))))

(declare-fun lt!342554 () Unit!15292)

(declare-fun lt!342565 () Unit!15292)

(assert (=> d!73359 (= lt!342554 lt!342565)))

(assert (=> d!73359 (isPrefixOf!0 (_2!9886 lt!341443) (_2!9886 lt!341443))))

(assert (=> d!73359 (= lt!342565 (lemmaIsPrefixRefl!0 (_2!9886 lt!341443)))))

(declare-fun lt!342555 () Unit!15292)

(declare-fun lt!342559 () Unit!15292)

(assert (=> d!73359 (= lt!342555 lt!342559)))

(assert (=> d!73359 (= lt!342559 (lemmaIsPrefixRefl!0 (_2!9886 lt!341443)))))

(declare-fun lt!342563 () Unit!15292)

(declare-fun lt!342568 () Unit!15292)

(assert (=> d!73359 (= lt!342563 lt!342568)))

(assert (=> d!73359 (isPrefixOf!0 lt!342573 lt!342573)))

(assert (=> d!73359 (= lt!342568 (lemmaIsPrefixRefl!0 lt!342573))))

(declare-fun lt!342560 () Unit!15292)

(declare-fun lt!342558 () Unit!15292)

(assert (=> d!73359 (= lt!342560 lt!342558)))

(assert (=> d!73359 (isPrefixOf!0 (_2!9886 lt!341412) (_2!9886 lt!341412))))

(assert (=> d!73359 (= lt!342558 (lemmaIsPrefixRefl!0 (_2!9886 lt!341412)))))

(assert (=> d!73359 (= lt!342573 (BitStream!8417 (buf!5189 (_2!9886 lt!341443)) (currentByte!9767 (_2!9886 lt!341412)) (currentBit!9762 (_2!9886 lt!341412))))))

(assert (=> d!73359 (isPrefixOf!0 (_2!9886 lt!341412) (_2!9886 lt!341443))))

(assert (=> d!73359 (= (reader!0 (_2!9886 lt!341412) (_2!9886 lt!341443)) lt!342572)))

(declare-fun b!216590 () Bool)

(declare-fun lt!342556 () Unit!15292)

(assert (=> b!216590 (= e!147317 lt!342556)))

(declare-fun lt!342567 () (_ BitVec 64))

(assert (=> b!216590 (= lt!342567 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!342569 () (_ BitVec 64))

(assert (=> b!216590 (= lt!342569 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341412))) (currentByte!9767 (_2!9886 lt!341412)) (currentBit!9762 (_2!9886 lt!341412))))))

(assert (=> b!216590 (= lt!342556 (arrayBitRangesEqSymmetric!0 (buf!5189 (_2!9886 lt!341412)) (buf!5189 (_2!9886 lt!341443)) lt!342567 lt!342569))))

(assert (=> b!216590 (arrayBitRangesEq!0 (buf!5189 (_2!9886 lt!341443)) (buf!5189 (_2!9886 lt!341412)) lt!342567 lt!342569)))

(declare-fun b!216591 () Bool)

(declare-fun lt!342566 () (_ BitVec 64))

(declare-fun lt!342561 () (_ BitVec 64))

(assert (=> b!216591 (= e!147316 (= (_1!9885 lt!342572) (withMovedBitIndex!0 (_2!9885 lt!342572) (bvsub lt!342561 lt!342566))))))

(assert (=> b!216591 (or (= (bvand lt!342561 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342566 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342561 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342561 lt!342566) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216591 (= lt!342566 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341443))) (currentByte!9767 (_2!9886 lt!341443)) (currentBit!9762 (_2!9886 lt!341443))))))

(assert (=> b!216591 (= lt!342561 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341412))) (currentByte!9767 (_2!9886 lt!341412)) (currentBit!9762 (_2!9886 lt!341412))))))

(declare-fun b!216592 () Bool)

(declare-fun res!182206 () Bool)

(assert (=> b!216592 (=> (not res!182206) (not e!147316))))

(assert (=> b!216592 (= res!182206 (isPrefixOf!0 (_2!9885 lt!342572) (_2!9886 lt!341443)))))

(assert (= (and d!73359 c!10589) b!216590))

(assert (= (and d!73359 (not c!10589)) b!216589))

(assert (= (and d!73359 res!182205) b!216588))

(assert (= (and b!216588 res!182204) b!216592))

(assert (= (and b!216592 res!182206) b!216591))

(declare-fun m!334107 () Bool)

(assert (=> b!216592 m!334107))

(declare-fun m!334109 () Bool)

(assert (=> b!216588 m!334109))

(declare-fun m!334111 () Bool)

(assert (=> d!73359 m!334111))

(declare-fun m!334113 () Bool)

(assert (=> d!73359 m!334113))

(declare-fun m!334115 () Bool)

(assert (=> d!73359 m!334115))

(assert (=> d!73359 m!334087))

(assert (=> d!73359 m!334039))

(declare-fun m!334117 () Bool)

(assert (=> d!73359 m!334117))

(assert (=> d!73359 m!334091))

(declare-fun m!334119 () Bool)

(assert (=> d!73359 m!334119))

(declare-fun m!334121 () Bool)

(assert (=> d!73359 m!334121))

(declare-fun m!334123 () Bool)

(assert (=> d!73359 m!334123))

(declare-fun m!334125 () Bool)

(assert (=> d!73359 m!334125))

(assert (=> b!216590 m!332589))

(declare-fun m!334127 () Bool)

(assert (=> b!216590 m!334127))

(declare-fun m!334129 () Bool)

(assert (=> b!216590 m!334129))

(declare-fun m!334131 () Bool)

(assert (=> b!216591 m!334131))

(assert (=> b!216591 m!332597))

(assert (=> b!216591 m!332589))

(assert (=> b!215936 d!73359))

(declare-fun d!73361 () Bool)

(declare-fun e!147318 () Bool)

(assert (=> d!73361 e!147318))

(declare-fun res!182207 () Bool)

(assert (=> d!73361 (=> (not res!182207) (not e!147318))))

(declare-fun lt!342575 () (_ BitVec 64))

(declare-fun lt!342574 () BitStream!8416)

(assert (=> d!73361 (= res!182207 (= (bvadd lt!342575 (bvsub (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341443))) (currentByte!9767 (_2!9886 lt!341443)) (currentBit!9762 (_2!9886 lt!341443))))) (bitIndex!0 (size!4654 (buf!5189 lt!342574)) (currentByte!9767 lt!342574) (currentBit!9762 lt!342574))))))

(assert (=> d!73361 (or (not (= (bvand lt!342575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341443))) (currentByte!9767 (_2!9886 lt!341443)) (currentBit!9762 (_2!9886 lt!341443)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342575 (bvsub (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341443))) (currentByte!9767 (_2!9886 lt!341443)) (currentBit!9762 (_2!9886 lt!341443))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73361 (= lt!342575 (bitIndex!0 (size!4654 (buf!5189 (_2!9885 lt!341458))) (currentByte!9767 (_2!9885 lt!341458)) (currentBit!9762 (_2!9885 lt!341458))))))

(assert (=> d!73361 (= lt!342574 (_2!9886 (moveBitIndex!0 (_2!9885 lt!341458) (bvsub (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341443))) (currentByte!9767 (_2!9886 lt!341443)) (currentBit!9762 (_2!9886 lt!341443)))))))))

(assert (=> d!73361 (moveBitIndexPrecond!0 (_2!9885 lt!341458) (bvsub (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341443))) (currentByte!9767 (_2!9886 lt!341443)) (currentBit!9762 (_2!9886 lt!341443)))))))

(assert (=> d!73361 (= (withMovedBitIndex!0 (_2!9885 lt!341458) (bvsub (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341443))) (currentByte!9767 (_2!9886 lt!341443)) (currentBit!9762 (_2!9886 lt!341443))))) lt!342574)))

(declare-fun b!216593 () Bool)

(assert (=> b!216593 (= e!147318 (= (size!4654 (buf!5189 (_2!9885 lt!341458))) (size!4654 (buf!5189 lt!342574))))))

(assert (= (and d!73361 res!182207) b!216593))

(declare-fun m!334133 () Bool)

(assert (=> d!73361 m!334133))

(declare-fun m!334135 () Bool)

(assert (=> d!73361 m!334135))

(declare-fun m!334137 () Bool)

(assert (=> d!73361 m!334137))

(declare-fun m!334139 () Bool)

(assert (=> d!73361 m!334139))

(assert (=> b!215936 d!73361))

(declare-fun d!73363 () Bool)

(declare-fun e!147319 () Bool)

(assert (=> d!73363 e!147319))

(declare-fun res!182208 () Bool)

(assert (=> d!73363 (=> (not res!182208) (not e!147319))))

(declare-fun lt!342578 () tuple2!18464)

(declare-fun lt!342577 () tuple2!18464)

(assert (=> d!73363 (= res!182208 (= (bitIndex!0 (size!4654 (buf!5189 (_1!9887 lt!342578))) (currentByte!9767 (_1!9887 lt!342578)) (currentBit!9762 (_1!9887 lt!342578))) (bitIndex!0 (size!4654 (buf!5189 (_1!9887 lt!342577))) (currentByte!9767 (_1!9887 lt!342577)) (currentBit!9762 (_1!9887 lt!342577)))))))

(declare-fun lt!342579 () Unit!15292)

(declare-fun lt!342576 () BitStream!8416)

(assert (=> d!73363 (= lt!342579 (choose!50 lt!341446 (_2!9886 lt!341443) lt!342576 lt!342578 (tuple2!18465 (_1!9887 lt!342578) (_2!9887 lt!342578)) (_1!9887 lt!342578) (_2!9887 lt!342578) lt!342577 (tuple2!18465 (_1!9887 lt!342577) (_2!9887 lt!342577)) (_1!9887 lt!342577) (_2!9887 lt!342577)))))

(assert (=> d!73363 (= lt!342577 (readBitPure!0 lt!342576))))

(assert (=> d!73363 (= lt!342578 (readBitPure!0 lt!341446))))

(assert (=> d!73363 (= lt!342576 (BitStream!8417 (buf!5189 (_2!9886 lt!341443)) (currentByte!9767 lt!341446) (currentBit!9762 lt!341446)))))

(assert (=> d!73363 (invariant!0 (currentBit!9762 lt!341446) (currentByte!9767 lt!341446) (size!4654 (buf!5189 (_2!9886 lt!341443))))))

(assert (=> d!73363 (= (readBitPrefixLemma!0 lt!341446 (_2!9886 lt!341443)) lt!342579)))

(declare-fun b!216594 () Bool)

(assert (=> b!216594 (= e!147319 (= (_2!9887 lt!342578) (_2!9887 lt!342577)))))

(assert (= (and d!73363 res!182208) b!216594))

(declare-fun m!334141 () Bool)

(assert (=> d!73363 m!334141))

(assert (=> d!73363 m!332583))

(assert (=> d!73363 m!332595))

(declare-fun m!334143 () Bool)

(assert (=> d!73363 m!334143))

(declare-fun m!334145 () Bool)

(assert (=> d!73363 m!334145))

(declare-fun m!334147 () Bool)

(assert (=> d!73363 m!334147))

(assert (=> b!215936 d!73363))

(declare-fun lt!342580 () tuple2!18490)

(declare-fun d!73365 () Bool)

(assert (=> d!73365 (= lt!342580 (readNBitsLSBFirstsLoop!0 (_1!9885 lt!341442) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (=> d!73365 (= (readNBitsLSBFirstsLoopPure!0 (_1!9885 lt!341442) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))) (tuple2!18459 (_2!9900 lt!342580) (_1!9900 lt!342580)))))

(declare-fun bs!17930 () Bool)

(assert (= bs!17930 d!73365))

(declare-fun m!334149 () Bool)

(assert (=> bs!17930 m!334149))

(assert (=> b!215936 d!73365))

(declare-fun d!73367 () Bool)

(assert (=> d!73367 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341443)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340128))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340128))) lt!341441) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341443)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340128))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340128)))) lt!341441))))

(declare-fun bs!17931 () Bool)

(assert (= bs!17931 d!73367))

(assert (=> bs!17931 m!333947))

(assert (=> b!215936 d!73367))

(declare-fun lt!342581 () tuple2!18490)

(declare-fun d!73369 () Bool)

(assert (=> d!73369 (= lt!342581 (readNBitsLSBFirstsLoop!0 (_1!9885 lt!341458) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!341410))))

(assert (=> d!73369 (= (readNBitsLSBFirstsLoopPure!0 (_1!9885 lt!341458) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!341410) (tuple2!18459 (_2!9900 lt!342581) (_1!9900 lt!342581)))))

(declare-fun bs!17932 () Bool)

(assert (= bs!17932 d!73369))

(declare-fun m!334151 () Bool)

(assert (=> bs!17932 m!334151))

(assert (=> b!215936 d!73369))

(declare-fun d!73371 () Bool)

(assert (=> d!73371 (= (invariant!0 (currentBit!9762 lt!341446) (currentByte!9767 lt!341446) (size!4654 (buf!5189 (_2!9886 lt!341443)))) (and (bvsge (currentBit!9762 lt!341446) #b00000000000000000000000000000000) (bvslt (currentBit!9762 lt!341446) #b00000000000000000000000000001000) (bvsge (currentByte!9767 lt!341446) #b00000000000000000000000000000000) (or (bvslt (currentByte!9767 lt!341446) (size!4654 (buf!5189 (_2!9886 lt!341443)))) (and (= (currentBit!9762 lt!341446) #b00000000000000000000000000000000) (= (currentByte!9767 lt!341446) (size!4654 (buf!5189 (_2!9886 lt!341443))))))))))

(assert (=> b!215936 d!73371))

(declare-fun d!73373 () Bool)

(declare-fun e!147320 () Bool)

(assert (=> d!73373 e!147320))

(declare-fun res!182210 () Bool)

(assert (=> d!73373 (=> (not res!182210) (not e!147320))))

(declare-fun lt!342587 () (_ BitVec 64))

(declare-fun lt!342582 () (_ BitVec 64))

(declare-fun lt!342583 () (_ BitVec 64))

(assert (=> d!73373 (= res!182210 (= lt!342587 (bvsub lt!342583 lt!342582)))))

(assert (=> d!73373 (or (= (bvand lt!342583 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342582 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342583 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342583 lt!342582) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73373 (= lt!342582 (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!341462)))) ((_ sign_extend 32) (currentByte!9767 (_1!9887 lt!341462))) ((_ sign_extend 32) (currentBit!9762 (_1!9887 lt!341462)))))))

(declare-fun lt!342584 () (_ BitVec 64))

(declare-fun lt!342586 () (_ BitVec 64))

(assert (=> d!73373 (= lt!342583 (bvmul lt!342584 lt!342586))))

(assert (=> d!73373 (or (= lt!342584 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342586 (bvsdiv (bvmul lt!342584 lt!342586) lt!342584)))))

(assert (=> d!73373 (= lt!342586 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73373 (= lt!342584 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!341462)))))))

(assert (=> d!73373 (= lt!342587 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_1!9887 lt!341462))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_1!9887 lt!341462)))))))

(assert (=> d!73373 (invariant!0 (currentBit!9762 (_1!9887 lt!341462)) (currentByte!9767 (_1!9887 lt!341462)) (size!4654 (buf!5189 (_1!9887 lt!341462))))))

(assert (=> d!73373 (= (bitIndex!0 (size!4654 (buf!5189 (_1!9887 lt!341462))) (currentByte!9767 (_1!9887 lt!341462)) (currentBit!9762 (_1!9887 lt!341462))) lt!342587)))

(declare-fun b!216595 () Bool)

(declare-fun res!182209 () Bool)

(assert (=> b!216595 (=> (not res!182209) (not e!147320))))

(assert (=> b!216595 (= res!182209 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342587))))

(declare-fun b!216596 () Bool)

(declare-fun lt!342585 () (_ BitVec 64))

(assert (=> b!216596 (= e!147320 (bvsle lt!342587 (bvmul lt!342585 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216596 (or (= lt!342585 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!342585 #b0000000000000000000000000000000000000000000000000000000000001000) lt!342585)))))

(assert (=> b!216596 (= lt!342585 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!341462)))))))

(assert (= (and d!73373 res!182210) b!216595))

(assert (= (and b!216595 res!182209) b!216596))

(declare-fun m!334153 () Bool)

(assert (=> d!73373 m!334153))

(declare-fun m!334155 () Bool)

(assert (=> d!73373 m!334155))

(assert (=> b!215936 d!73373))

(assert (=> b!215936 d!72581))

(declare-fun d!73375 () Bool)

(assert (=> d!73375 (= (invariant!0 (currentBit!9762 (_2!9886 lt!340128)) (currentByte!9767 (_2!9886 lt!340128)) (size!4654 (buf!5189 (_2!9886 lt!341412)))) (and (bvsge (currentBit!9762 (_2!9886 lt!340128)) #b00000000000000000000000000000000) (bvslt (currentBit!9762 (_2!9886 lt!340128)) #b00000000000000000000000000001000) (bvsge (currentByte!9767 (_2!9886 lt!340128)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9767 (_2!9886 lt!340128)) (size!4654 (buf!5189 (_2!9886 lt!341412)))) (and (= (currentBit!9762 (_2!9886 lt!340128)) #b00000000000000000000000000000000) (= (currentByte!9767 (_2!9886 lt!340128)) (size!4654 (buf!5189 (_2!9886 lt!341412))))))))))

(assert (=> b!215936 d!73375))

(declare-fun d!73377 () Bool)

(assert (=> d!73377 (isPrefixOf!0 (_2!9886 lt!340128) (_2!9886 lt!341443))))

(declare-fun lt!342588 () Unit!15292)

(assert (=> d!73377 (= lt!342588 (choose!30 (_2!9886 lt!340128) (_2!9886 lt!341412) (_2!9886 lt!341443)))))

(assert (=> d!73377 (isPrefixOf!0 (_2!9886 lt!340128) (_2!9886 lt!341412))))

(assert (=> d!73377 (= (lemmaIsPrefixTransitive!0 (_2!9886 lt!340128) (_2!9886 lt!341412) (_2!9886 lt!341443)) lt!342588)))

(declare-fun bs!17933 () Bool)

(assert (= bs!17933 d!73377))

(assert (=> bs!17933 m!334093))

(declare-fun m!334157 () Bool)

(assert (=> bs!17933 m!334157))

(declare-fun m!334159 () Bool)

(assert (=> bs!17933 m!334159))

(assert (=> b!215936 d!73377))

(declare-fun d!73379 () Bool)

(declare-fun lt!342589 () tuple2!18492)

(assert (=> d!73379 (= lt!342589 (readBit!0 lt!341446))))

(assert (=> d!73379 (= (readBitPure!0 lt!341446) (tuple2!18465 (_2!9901 lt!342589) (_1!9901 lt!342589)))))

(declare-fun bs!17934 () Bool)

(assert (= bs!17934 d!73379))

(declare-fun m!334161 () Bool)

(assert (=> bs!17934 m!334161))

(assert (=> b!215936 d!73379))

(declare-fun d!73381 () Bool)

(assert (=> d!73381 (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341443)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340128))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340128))) lt!341418)))

(declare-fun lt!342590 () Unit!15292)

(assert (=> d!73381 (= lt!342590 (choose!9 (_2!9886 lt!340128) (buf!5189 (_2!9886 lt!341443)) lt!341418 (BitStream!8417 (buf!5189 (_2!9886 lt!341443)) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128)))))))

(assert (=> d!73381 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9886 lt!340128) (buf!5189 (_2!9886 lt!341443)) lt!341418) lt!342590)))

(declare-fun bs!17935 () Bool)

(assert (= bs!17935 d!73381))

(assert (=> bs!17935 m!332577))

(declare-fun m!334163 () Bool)

(assert (=> bs!17935 m!334163))

(assert (=> b!215936 d!73381))

(declare-fun b!216598 () Bool)

(declare-fun res!182214 () Bool)

(declare-fun e!147321 () Bool)

(assert (=> b!216598 (=> (not res!182214) (not e!147321))))

(declare-fun lt!342591 () tuple2!18462)

(assert (=> b!216598 (= res!182214 (isPrefixOf!0 (_2!9886 lt!340128) (_2!9886 lt!342591)))))

(declare-fun d!73383 () Bool)

(assert (=> d!73383 e!147321))

(declare-fun res!182212 () Bool)

(assert (=> d!73383 (=> (not res!182212) (not e!147321))))

(assert (=> d!73383 (= res!182212 (= (size!4654 (buf!5189 (_2!9886 lt!340128))) (size!4654 (buf!5189 (_2!9886 lt!342591)))))))

(assert (=> d!73383 (= lt!342591 (choose!16 (_2!9886 lt!340128) lt!341434))))

(assert (=> d!73383 (validate_offset_bit!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340128)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340128))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340128))))))

(assert (=> d!73383 (= (appendBit!0 (_2!9886 lt!340128) lt!341434) lt!342591)))

(declare-fun b!216600 () Bool)

(declare-fun e!147322 () Bool)

(declare-fun lt!342592 () tuple2!18464)

(assert (=> b!216600 (= e!147322 (= (bitIndex!0 (size!4654 (buf!5189 (_1!9887 lt!342592))) (currentByte!9767 (_1!9887 lt!342592)) (currentBit!9762 (_1!9887 lt!342592))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!342591))) (currentByte!9767 (_2!9886 lt!342591)) (currentBit!9762 (_2!9886 lt!342591)))))))

(declare-fun b!216597 () Bool)

(declare-fun res!182211 () Bool)

(assert (=> b!216597 (=> (not res!182211) (not e!147321))))

(declare-fun lt!342594 () (_ BitVec 64))

(declare-fun lt!342593 () (_ BitVec 64))

(assert (=> b!216597 (= res!182211 (= (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!342591))) (currentByte!9767 (_2!9886 lt!342591)) (currentBit!9762 (_2!9886 lt!342591))) (bvadd lt!342593 lt!342594)))))

(assert (=> b!216597 (or (not (= (bvand lt!342593 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342594 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342593 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342593 lt!342594) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216597 (= lt!342594 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!216597 (= lt!342593 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))))))

(declare-fun b!216599 () Bool)

(assert (=> b!216599 (= e!147321 e!147322)))

(declare-fun res!182213 () Bool)

(assert (=> b!216599 (=> (not res!182213) (not e!147322))))

(assert (=> b!216599 (= res!182213 (and (= (_2!9887 lt!342592) lt!341434) (= (_1!9887 lt!342592) (_2!9886 lt!342591))))))

(assert (=> b!216599 (= lt!342592 (readBitPure!0 (readerFrom!0 (_2!9886 lt!342591) (currentBit!9762 (_2!9886 lt!340128)) (currentByte!9767 (_2!9886 lt!340128)))))))

(assert (= (and d!73383 res!182212) b!216597))

(assert (= (and b!216597 res!182211) b!216598))

(assert (= (and b!216598 res!182214) b!216599))

(assert (= (and b!216599 res!182213) b!216600))

(declare-fun m!334165 () Bool)

(assert (=> b!216597 m!334165))

(assert (=> b!216597 m!331623))

(declare-fun m!334167 () Bool)

(assert (=> b!216599 m!334167))

(assert (=> b!216599 m!334167))

(declare-fun m!334169 () Bool)

(assert (=> b!216599 m!334169))

(declare-fun m!334171 () Bool)

(assert (=> b!216598 m!334171))

(declare-fun m!334173 () Bool)

(assert (=> b!216600 m!334173))

(assert (=> b!216600 m!334165))

(declare-fun m!334175 () Bool)

(assert (=> d!73383 m!334175))

(declare-fun m!334177 () Bool)

(assert (=> d!73383 m!334177))

(assert (=> b!215936 d!73383))

(assert (=> b!215936 d!72569))

(declare-fun d!73385 () Bool)

(declare-fun e!147323 () Bool)

(assert (=> d!73385 e!147323))

(declare-fun res!182215 () Bool)

(assert (=> d!73385 (=> (not res!182215) (not e!147323))))

(assert (=> d!73385 (= res!182215 (= (buf!5189 (_2!9886 (increaseBitIndex!0 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))))) (buf!5189 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)))))))

(declare-fun lt!342596 () Bool)

(assert (=> d!73385 (= lt!342596 (not (= (bvand ((_ sign_extend 24) (select (arr!5584 (buf!5189 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)))) (currentByte!9767 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9762 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!342599 () tuple2!18492)

(assert (=> d!73385 (= lt!342599 (tuple2!18493 (not (= (bvand ((_ sign_extend 24) (select (arr!5584 (buf!5189 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)))) (currentByte!9767 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9762 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)))))) #b00000000000000000000000000000000)) (_2!9886 (increaseBitIndex!0 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))))))))

(assert (=> d!73385 (validate_offset_bit!0 ((_ sign_extend 32) (size!4654 (buf!5189 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))))) ((_ sign_extend 32) (currentByte!9767 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)))) ((_ sign_extend 32) (currentBit!9762 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)))))))

(assert (=> d!73385 (= (readBit!0 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))) lt!342599)))

(declare-fun lt!342597 () (_ BitVec 64))

(declare-fun lt!342600 () (_ BitVec 64))

(declare-fun b!216601 () Bool)

(assert (=> b!216601 (= e!147323 (= (bitIndex!0 (size!4654 (buf!5189 (_2!9886 (increaseBitIndex!0 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)))))) (currentByte!9767 (_2!9886 (increaseBitIndex!0 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))))) (currentBit!9762 (_2!9886 (increaseBitIndex!0 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)))))) (bvadd lt!342600 lt!342597)))))

(assert (=> b!216601 (or (not (= (bvand lt!342600 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342597 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342600 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342600 lt!342597) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216601 (= lt!342597 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!216601 (= lt!342600 (bitIndex!0 (size!4654 (buf!5189 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)))) (currentByte!9767 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))) (currentBit!9762 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)))))))

(declare-fun lt!342601 () Bool)

(assert (=> b!216601 (= lt!342601 (not (= (bvand ((_ sign_extend 24) (select (arr!5584 (buf!5189 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)))) (currentByte!9767 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9762 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!342595 () Bool)

(assert (=> b!216601 (= lt!342595 (not (= (bvand ((_ sign_extend 24) (select (arr!5584 (buf!5189 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)))) (currentByte!9767 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9762 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!342598 () Bool)

(assert (=> b!216601 (= lt!342598 (not (= (bvand ((_ sign_extend 24) (select (arr!5584 (buf!5189 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)))) (currentByte!9767 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9762 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!73385 res!182215) b!216601))

(declare-fun m!334179 () Bool)

(assert (=> d!73385 m!334179))

(declare-fun m!334181 () Bool)

(assert (=> d!73385 m!334181))

(declare-fun m!334183 () Bool)

(assert (=> d!73385 m!334183))

(declare-fun m!334185 () Bool)

(assert (=> d!73385 m!334185))

(assert (=> b!216601 m!334183))

(declare-fun m!334187 () Bool)

(assert (=> b!216601 m!334187))

(assert (=> b!216601 m!334181))

(declare-fun m!334189 () Bool)

(assert (=> b!216601 m!334189))

(assert (=> b!216601 m!334179))

(assert (=> d!72685 d!73385))

(declare-fun d!73387 () Bool)

(assert (=> d!73387 (= (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!340146)))) ((_ sign_extend 32) (currentByte!9767 (_1!9887 lt!340146))) ((_ sign_extend 32) (currentBit!9762 (_1!9887 lt!340146)))) (bvsub (bvmul ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!340146)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_1!9887 lt!340146))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_1!9887 lt!340146))))))))

(assert (=> d!72573 d!73387))

(declare-fun d!73389 () Bool)

(assert (=> d!73389 (= (invariant!0 (currentBit!9762 (_1!9887 lt!340146)) (currentByte!9767 (_1!9887 lt!340146)) (size!4654 (buf!5189 (_1!9887 lt!340146)))) (and (bvsge (currentBit!9762 (_1!9887 lt!340146)) #b00000000000000000000000000000000) (bvslt (currentBit!9762 (_1!9887 lt!340146)) #b00000000000000000000000000001000) (bvsge (currentByte!9767 (_1!9887 lt!340146)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9767 (_1!9887 lt!340146)) (size!4654 (buf!5189 (_1!9887 lt!340146)))) (and (= (currentBit!9762 (_1!9887 lt!340146)) #b00000000000000000000000000000000) (= (currentByte!9767 (_1!9887 lt!340146)) (size!4654 (buf!5189 (_1!9887 lt!340146))))))))))

(assert (=> d!72573 d!73389))

(declare-fun d!73391 () Bool)

(declare-fun res!182218 () Bool)

(declare-fun e!147324 () Bool)

(assert (=> d!73391 (=> (not res!182218) (not e!147324))))

(assert (=> d!73391 (= res!182218 (= (size!4654 (buf!5189 (_2!9886 lt!340128))) (size!4654 (buf!5189 (_2!9886 lt!341432)))))))

(assert (=> d!73391 (= (isPrefixOf!0 (_2!9886 lt!340128) (_2!9886 lt!341432)) e!147324)))

(declare-fun b!216602 () Bool)

(declare-fun res!182216 () Bool)

(assert (=> b!216602 (=> (not res!182216) (not e!147324))))

(assert (=> b!216602 (= res!182216 (bvsle (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341432))) (currentByte!9767 (_2!9886 lt!341432)) (currentBit!9762 (_2!9886 lt!341432)))))))

(declare-fun b!216603 () Bool)

(declare-fun e!147325 () Bool)

(assert (=> b!216603 (= e!147324 e!147325)))

(declare-fun res!182217 () Bool)

(assert (=> b!216603 (=> res!182217 e!147325)))

(assert (=> b!216603 (= res!182217 (= (size!4654 (buf!5189 (_2!9886 lt!340128))) #b00000000000000000000000000000000))))

(declare-fun b!216604 () Bool)

(assert (=> b!216604 (= e!147325 (arrayBitRangesEq!0 (buf!5189 (_2!9886 lt!340128)) (buf!5189 (_2!9886 lt!341432)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128)))))))

(assert (= (and d!73391 res!182218) b!216602))

(assert (= (and b!216602 res!182216) b!216603))

(assert (= (and b!216603 (not res!182217)) b!216604))

(assert (=> b!216602 m!331623))

(assert (=> b!216602 m!332629))

(assert (=> b!216604 m!331623))

(assert (=> b!216604 m!331623))

(declare-fun m!334191 () Bool)

(assert (=> b!216604 m!334191))

(assert (=> b!215934 d!73391))

(declare-fun d!73393 () Bool)

(declare-fun e!147326 () Bool)

(assert (=> d!73393 e!147326))

(declare-fun res!182220 () Bool)

(assert (=> d!73393 (=> (not res!182220) (not e!147326))))

(declare-fun lt!342603 () (_ BitVec 64))

(declare-fun lt!342607 () (_ BitVec 64))

(declare-fun lt!342602 () (_ BitVec 64))

(assert (=> d!73393 (= res!182220 (= lt!342607 (bvsub lt!342603 lt!342602)))))

(assert (=> d!73393 (or (= (bvand lt!342603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342602 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342603 lt!342602) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73393 (= lt!342602 (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!341440)))) ((_ sign_extend 32) (currentByte!9767 (_1!9887 lt!341440))) ((_ sign_extend 32) (currentBit!9762 (_1!9887 lt!341440)))))))

(declare-fun lt!342604 () (_ BitVec 64))

(declare-fun lt!342606 () (_ BitVec 64))

(assert (=> d!73393 (= lt!342603 (bvmul lt!342604 lt!342606))))

(assert (=> d!73393 (or (= lt!342604 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342606 (bvsdiv (bvmul lt!342604 lt!342606) lt!342604)))))

(assert (=> d!73393 (= lt!342606 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73393 (= lt!342604 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!341440)))))))

(assert (=> d!73393 (= lt!342607 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_1!9887 lt!341440))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_1!9887 lt!341440)))))))

(assert (=> d!73393 (invariant!0 (currentBit!9762 (_1!9887 lt!341440)) (currentByte!9767 (_1!9887 lt!341440)) (size!4654 (buf!5189 (_1!9887 lt!341440))))))

(assert (=> d!73393 (= (bitIndex!0 (size!4654 (buf!5189 (_1!9887 lt!341440))) (currentByte!9767 (_1!9887 lt!341440)) (currentBit!9762 (_1!9887 lt!341440))) lt!342607)))

(declare-fun b!216605 () Bool)

(declare-fun res!182219 () Bool)

(assert (=> b!216605 (=> (not res!182219) (not e!147326))))

(assert (=> b!216605 (= res!182219 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342607))))

(declare-fun b!216606 () Bool)

(declare-fun lt!342605 () (_ BitVec 64))

(assert (=> b!216606 (= e!147326 (bvsle lt!342607 (bvmul lt!342605 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216606 (or (= lt!342605 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!342605 #b0000000000000000000000000000000000000000000000000000000000001000) lt!342605)))))

(assert (=> b!216606 (= lt!342605 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!341440)))))))

(assert (= (and d!73393 res!182220) b!216605))

(assert (= (and b!216605 res!182219) b!216606))

(declare-fun m!334193 () Bool)

(assert (=> d!73393 m!334193))

(declare-fun m!334195 () Bool)

(assert (=> d!73393 m!334195))

(assert (=> b!215932 d!73393))

(declare-fun d!73395 () Bool)

(declare-fun e!147327 () Bool)

(assert (=> d!73395 e!147327))

(declare-fun res!182222 () Bool)

(assert (=> d!73395 (=> (not res!182222) (not e!147327))))

(declare-fun lt!342609 () (_ BitVec 64))

(declare-fun lt!342608 () (_ BitVec 64))

(declare-fun lt!342613 () (_ BitVec 64))

(assert (=> d!73395 (= res!182222 (= lt!342613 (bvsub lt!342609 lt!342608)))))

(assert (=> d!73395 (or (= (bvand lt!342609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342608 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342609 lt!342608) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73395 (= lt!342608 (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341445)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!341445))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!341445)))))))

(declare-fun lt!342610 () (_ BitVec 64))

(declare-fun lt!342612 () (_ BitVec 64))

(assert (=> d!73395 (= lt!342609 (bvmul lt!342610 lt!342612))))

(assert (=> d!73395 (or (= lt!342610 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342612 (bvsdiv (bvmul lt!342610 lt!342612) lt!342610)))))

(assert (=> d!73395 (= lt!342612 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73395 (= lt!342610 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341445)))))))

(assert (=> d!73395 (= lt!342613 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!341445))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!341445)))))))

(assert (=> d!73395 (invariant!0 (currentBit!9762 (_2!9886 lt!341445)) (currentByte!9767 (_2!9886 lt!341445)) (size!4654 (buf!5189 (_2!9886 lt!341445))))))

(assert (=> d!73395 (= (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341445))) (currentByte!9767 (_2!9886 lt!341445)) (currentBit!9762 (_2!9886 lt!341445))) lt!342613)))

(declare-fun b!216607 () Bool)

(declare-fun res!182221 () Bool)

(assert (=> b!216607 (=> (not res!182221) (not e!147327))))

(assert (=> b!216607 (= res!182221 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342613))))

(declare-fun b!216608 () Bool)

(declare-fun lt!342611 () (_ BitVec 64))

(assert (=> b!216608 (= e!147327 (bvsle lt!342613 (bvmul lt!342611 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216608 (or (= lt!342611 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!342611 #b0000000000000000000000000000000000000000000000000000000000001000) lt!342611)))))

(assert (=> b!216608 (= lt!342611 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341445)))))))

(assert (= (and d!73395 res!182222) b!216607))

(assert (= (and b!216607 res!182221) b!216608))

(declare-fun m!334197 () Bool)

(assert (=> d!73395 m!334197))

(declare-fun m!334199 () Bool)

(assert (=> d!73395 m!334199))

(assert (=> b!215932 d!73395))

(declare-fun d!73397 () Bool)

(declare-fun lt!342614 () tuple2!18492)

(assert (=> d!73397 (= lt!342614 (readBit!0 (readerFrom!0 (_2!9886 lt!340670) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204))))))

(assert (=> d!73397 (= (readBitPure!0 (readerFrom!0 (_2!9886 lt!340670) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204))) (tuple2!18465 (_2!9901 lt!342614) (_1!9901 lt!342614)))))

(declare-fun bs!17936 () Bool)

(assert (= bs!17936 d!73397))

(assert (=> bs!17936 m!332097))

(declare-fun m!334201 () Bool)

(assert (=> bs!17936 m!334201))

(assert (=> b!215683 d!73397))

(declare-fun d!73399 () Bool)

(declare-fun e!147328 () Bool)

(assert (=> d!73399 e!147328))

(declare-fun res!182223 () Bool)

(assert (=> d!73399 (=> (not res!182223) (not e!147328))))

(assert (=> d!73399 (= res!182223 (invariant!0 (currentBit!9762 (_2!9886 lt!340670)) (currentByte!9767 (_2!9886 lt!340670)) (size!4654 (buf!5189 (_2!9886 lt!340670)))))))

(assert (=> d!73399 (= (readerFrom!0 (_2!9886 lt!340670) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204)) (BitStream!8417 (buf!5189 (_2!9886 lt!340670)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)))))

(declare-fun b!216609 () Bool)

(assert (=> b!216609 (= e!147328 (invariant!0 (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204) (size!4654 (buf!5189 (_2!9886 lt!340670)))))))

(assert (= (and d!73399 res!182223) b!216609))

(declare-fun m!334203 () Bool)

(assert (=> d!73399 m!334203))

(declare-fun m!334205 () Bool)

(assert (=> b!216609 m!334205))

(assert (=> b!215683 d!73399))

(declare-fun d!73401 () Bool)

(declare-fun e!147330 () Bool)

(assert (=> d!73401 e!147330))

(declare-fun res!182228 () Bool)

(assert (=> d!73401 (=> (not res!182228) (not e!147330))))

(declare-fun lt!342620 () tuple2!18490)

(assert (=> d!73401 (= res!182228 (= (buf!5189 (_2!9900 lt!342620)) (buf!5189 lt!340141)))))

(declare-fun e!147329 () tuple2!18490)

(assert (=> d!73401 (= lt!342620 e!147329)))

(declare-fun c!10590 () Bool)

(assert (=> d!73401 (= c!10590 (= nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (=> d!73401 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsle (bvadd #b00000000000000000000000000000001 i!590) nBits!348) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!73401 (= (readNBitsLSBFirstsLoop!0 lt!340141 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!340153) lt!342620)))

(declare-fun b!216610 () Bool)

(declare-fun res!182226 () Bool)

(assert (=> b!216610 (=> (not res!182226) (not e!147330))))

(assert (=> b!216610 (= res!182226 (= (bvand (_1!9900 lt!342620) (onesLSBLong!0 nBits!348)) (_1!9900 lt!342620)))))

(declare-fun e!147331 () Bool)

(declare-fun b!216611 () Bool)

(declare-fun lt!342615 () (_ BitVec 64))

(assert (=> b!216611 (= e!147331 (= (= (bvand (bvlshr (_1!9900 lt!342620) lt!342615) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!9887 (readBitPure!0 lt!340141))))))

(assert (=> b!216611 (and (bvsge lt!342615 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!342615 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!216611 (= lt!342615 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!216612 () Bool)

(declare-fun lt!342616 () tuple2!18490)

(assert (=> b!216612 (= e!147329 (tuple2!18491 (_1!9900 lt!342616) (_2!9900 lt!342616)))))

(declare-fun lt!342617 () tuple2!18492)

(assert (=> b!216612 (= lt!342617 (readBit!0 lt!340141))))

(assert (=> b!216612 (= lt!342616 (readNBitsLSBFirstsLoop!0 (_2!9901 lt!342617) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!340153 (ite (_1!9901 lt!342617) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216613 () Bool)

(declare-fun res!182227 () Bool)

(assert (=> b!216613 (=> (not res!182227) (not e!147330))))

(assert (=> b!216613 (= res!182227 (= (bvand (_1!9900 lt!342620) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))) (bvand lt!340153 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun b!216614 () Bool)

(assert (=> b!216614 (= e!147330 e!147331)))

(declare-fun res!182224 () Bool)

(assert (=> b!216614 (=> res!182224 e!147331)))

(assert (=> b!216614 (= res!182224 (not (bvslt (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun b!216615 () Bool)

(declare-fun res!182225 () Bool)

(assert (=> b!216615 (=> (not res!182225) (not e!147330))))

(declare-fun lt!342618 () (_ BitVec 64))

(declare-fun lt!342619 () (_ BitVec 64))

(assert (=> b!216615 (= res!182225 (= (bitIndex!0 (size!4654 (buf!5189 (_2!9900 lt!342620))) (currentByte!9767 (_2!9900 lt!342620)) (currentBit!9762 (_2!9900 lt!342620))) (bvadd lt!342618 lt!342619)))))

(assert (=> b!216615 (or (not (= (bvand lt!342618 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342619 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342618 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342618 lt!342619) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216615 (= lt!342619 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!216615 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!216615 (= lt!342618 (bitIndex!0 (size!4654 (buf!5189 lt!340141)) (currentByte!9767 lt!340141) (currentBit!9762 lt!340141)))))

(declare-fun b!216616 () Bool)

(assert (=> b!216616 (= e!147329 (tuple2!18491 lt!340153 lt!340141))))

(assert (= (and d!73401 c!10590) b!216616))

(assert (= (and d!73401 (not c!10590)) b!216612))

(assert (= (and d!73401 res!182228) b!216615))

(assert (= (and b!216615 res!182225) b!216613))

(assert (= (and b!216613 res!182227) b!216610))

(assert (= (and b!216610 res!182226) b!216614))

(assert (= (and b!216614 (not res!182224)) b!216611))

(declare-fun m!334207 () Bool)

(assert (=> b!216612 m!334207))

(declare-fun m!334209 () Bool)

(assert (=> b!216612 m!334209))

(assert (=> b!216613 m!332567))

(declare-fun m!334211 () Bool)

(assert (=> b!216611 m!334211))

(declare-fun m!334213 () Bool)

(assert (=> b!216615 m!334213))

(declare-fun m!334215 () Bool)

(assert (=> b!216615 m!334215))

(assert (=> b!216610 m!331645))

(assert (=> d!72555 d!73401))

(declare-fun d!73403 () Bool)

(declare-fun e!147332 () Bool)

(assert (=> d!73403 e!147332))

(declare-fun res!182230 () Bool)

(assert (=> d!73403 (=> (not res!182230) (not e!147332))))

(declare-fun lt!342626 () (_ BitVec 64))

(declare-fun lt!342621 () (_ BitVec 64))

(declare-fun lt!342622 () (_ BitVec 64))

(assert (=> d!73403 (= res!182230 (= lt!342626 (bvsub lt!342622 lt!342621)))))

(assert (=> d!73403 (or (= (bvand lt!342622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342621 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342622 lt!342621) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73403 (= lt!342621 (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340670)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340670))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340670)))))))

(declare-fun lt!342623 () (_ BitVec 64))

(declare-fun lt!342625 () (_ BitVec 64))

(assert (=> d!73403 (= lt!342622 (bvmul lt!342623 lt!342625))))

(assert (=> d!73403 (or (= lt!342623 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342625 (bvsdiv (bvmul lt!342623 lt!342625) lt!342623)))))

(assert (=> d!73403 (= lt!342625 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73403 (= lt!342623 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340670)))))))

(assert (=> d!73403 (= lt!342626 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340670))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340670)))))))

(assert (=> d!73403 (invariant!0 (currentBit!9762 (_2!9886 lt!340670)) (currentByte!9767 (_2!9886 lt!340670)) (size!4654 (buf!5189 (_2!9886 lt!340670))))))

(assert (=> d!73403 (= (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340670))) (currentByte!9767 (_2!9886 lt!340670)) (currentBit!9762 (_2!9886 lt!340670))) lt!342626)))

(declare-fun b!216617 () Bool)

(declare-fun res!182229 () Bool)

(assert (=> b!216617 (=> (not res!182229) (not e!147332))))

(assert (=> b!216617 (= res!182229 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342626))))

(declare-fun b!216618 () Bool)

(declare-fun lt!342624 () (_ BitVec 64))

(assert (=> b!216618 (= e!147332 (bvsle lt!342626 (bvmul lt!342624 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216618 (or (= lt!342624 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!342624 #b0000000000000000000000000000000000000000000000000000000000001000) lt!342624)))))

(assert (=> b!216618 (= lt!342624 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340670)))))))

(assert (= (and d!73403 res!182230) b!216617))

(assert (= (and b!216617 res!182229) b!216618))

(declare-fun m!334217 () Bool)

(assert (=> d!73403 m!334217))

(assert (=> d!73403 m!334203))

(assert (=> b!215681 d!73403))

(assert (=> b!215681 d!72571))

(assert (=> d!72711 d!72709))

(declare-fun d!73405 () Bool)

(assert (=> d!73405 (isPrefixOf!0 thiss!1204 (_2!9886 lt!340151))))

(assert (=> d!73405 true))

(declare-fun _$15!312 () Unit!15292)

(assert (=> d!73405 (= (choose!30 thiss!1204 (_2!9886 lt!340128) (_2!9886 lt!340151)) _$15!312)))

(declare-fun bs!17937 () Bool)

(assert (= bs!17937 d!73405))

(assert (=> bs!17937 m!331663))

(assert (=> d!72711 d!73405))

(assert (=> d!72711 d!72621))

(declare-fun d!73407 () Bool)

(assert (=> d!73407 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!342627 () Unit!15292)

(assert (=> d!73407 (= lt!342627 (choose!11 thiss!1204))))

(assert (=> d!73407 (= (lemmaIsPrefixRefl!0 thiss!1204) lt!342627)))

(declare-fun bs!17938 () Bool)

(assert (= bs!17938 d!73407))

(assert (=> bs!17938 m!332217))

(declare-fun m!334219 () Bool)

(assert (=> bs!17938 m!334219))

(assert (=> d!72623 d!73407))

(declare-fun d!73409 () Bool)

(assert (=> d!73409 (isPrefixOf!0 lt!340838 (_2!9886 lt!340151))))

(declare-fun lt!342628 () Unit!15292)

(assert (=> d!73409 (= lt!342628 (choose!30 lt!340838 thiss!1204 (_2!9886 lt!340151)))))

(assert (=> d!73409 (isPrefixOf!0 lt!340838 thiss!1204)))

(assert (=> d!73409 (= (lemmaIsPrefixTransitive!0 lt!340838 thiss!1204 (_2!9886 lt!340151)) lt!342628)))

(declare-fun bs!17939 () Bool)

(assert (= bs!17939 d!73409))

(assert (=> bs!17939 m!332233))

(declare-fun m!334221 () Bool)

(assert (=> bs!17939 m!334221))

(declare-fun m!334223 () Bool)

(assert (=> bs!17939 m!334223))

(assert (=> d!72623 d!73409))

(declare-fun d!73411 () Bool)

(declare-fun res!182233 () Bool)

(declare-fun e!147333 () Bool)

(assert (=> d!73411 (=> (not res!182233) (not e!147333))))

(assert (=> d!73411 (= res!182233 (= (size!4654 (buf!5189 thiss!1204)) (size!4654 (buf!5189 thiss!1204))))))

(assert (=> d!73411 (= (isPrefixOf!0 thiss!1204 thiss!1204) e!147333)))

(declare-fun b!216619 () Bool)

(declare-fun res!182231 () Bool)

(assert (=> b!216619 (=> (not res!182231) (not e!147333))))

(assert (=> b!216619 (= res!182231 (bvsle (bitIndex!0 (size!4654 (buf!5189 thiss!1204)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)) (bitIndex!0 (size!4654 (buf!5189 thiss!1204)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))))))

(declare-fun b!216620 () Bool)

(declare-fun e!147334 () Bool)

(assert (=> b!216620 (= e!147333 e!147334)))

(declare-fun res!182232 () Bool)

(assert (=> b!216620 (=> res!182232 e!147334)))

(assert (=> b!216620 (= res!182232 (= (size!4654 (buf!5189 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!216621 () Bool)

(assert (=> b!216621 (= e!147334 (arrayBitRangesEq!0 (buf!5189 thiss!1204) (buf!5189 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 thiss!1204)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))))))

(assert (= (and d!73411 res!182233) b!216619))

(assert (= (and b!216619 res!182231) b!216620))

(assert (= (and b!216620 (not res!182232)) b!216621))

(assert (=> b!216619 m!331625))

(assert (=> b!216619 m!331625))

(assert (=> b!216621 m!331625))

(assert (=> b!216621 m!331625))

(declare-fun m!334225 () Bool)

(assert (=> b!216621 m!334225))

(assert (=> d!72623 d!73411))

(assert (=> d!72623 d!73301))

(assert (=> d!72623 d!73291))

(declare-fun d!73413 () Bool)

(assert (=> d!73413 (isPrefixOf!0 lt!340838 (_2!9886 lt!340151))))

(declare-fun lt!342629 () Unit!15292)

(assert (=> d!73413 (= lt!342629 (choose!30 lt!340838 (_2!9886 lt!340151) (_2!9886 lt!340151)))))

(assert (=> d!73413 (isPrefixOf!0 lt!340838 (_2!9886 lt!340151))))

(assert (=> d!73413 (= (lemmaIsPrefixTransitive!0 lt!340838 (_2!9886 lt!340151) (_2!9886 lt!340151)) lt!342629)))

(declare-fun bs!17940 () Bool)

(assert (= bs!17940 d!73413))

(assert (=> bs!17940 m!332233))

(declare-fun m!334227 () Bool)

(assert (=> bs!17940 m!334227))

(assert (=> bs!17940 m!332233))

(assert (=> d!72623 d!73413))

(declare-fun d!73415 () Bool)

(declare-fun res!182236 () Bool)

(declare-fun e!147335 () Bool)

(assert (=> d!73415 (=> (not res!182236) (not e!147335))))

(assert (=> d!73415 (= res!182236 (= (size!4654 (buf!5189 lt!340838)) (size!4654 (buf!5189 lt!340838))))))

(assert (=> d!73415 (= (isPrefixOf!0 lt!340838 lt!340838) e!147335)))

(declare-fun b!216622 () Bool)

(declare-fun res!182234 () Bool)

(assert (=> b!216622 (=> (not res!182234) (not e!147335))))

(assert (=> b!216622 (= res!182234 (bvsle (bitIndex!0 (size!4654 (buf!5189 lt!340838)) (currentByte!9767 lt!340838) (currentBit!9762 lt!340838)) (bitIndex!0 (size!4654 (buf!5189 lt!340838)) (currentByte!9767 lt!340838) (currentBit!9762 lt!340838))))))

(declare-fun b!216623 () Bool)

(declare-fun e!147336 () Bool)

(assert (=> b!216623 (= e!147335 e!147336)))

(declare-fun res!182235 () Bool)

(assert (=> b!216623 (=> res!182235 e!147336)))

(assert (=> b!216623 (= res!182235 (= (size!4654 (buf!5189 lt!340838)) #b00000000000000000000000000000000))))

(declare-fun b!216624 () Bool)

(assert (=> b!216624 (= e!147336 (arrayBitRangesEq!0 (buf!5189 lt!340838) (buf!5189 lt!340838) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 lt!340838)) (currentByte!9767 lt!340838) (currentBit!9762 lt!340838))))))

(assert (= (and d!73415 res!182236) b!216622))

(assert (= (and b!216622 res!182234) b!216623))

(assert (= (and b!216623 (not res!182235)) b!216624))

(declare-fun m!334229 () Bool)

(assert (=> b!216622 m!334229))

(assert (=> b!216622 m!334229))

(assert (=> b!216624 m!334229))

(assert (=> b!216624 m!334229))

(declare-fun m!334231 () Bool)

(assert (=> b!216624 m!334231))

(assert (=> d!72623 d!73415))

(declare-fun d!73417 () Bool)

(declare-fun res!182239 () Bool)

(declare-fun e!147337 () Bool)

(assert (=> d!73417 (=> (not res!182239) (not e!147337))))

(assert (=> d!73417 (= res!182239 (= (size!4654 (buf!5189 (_1!9885 lt!340837))) (size!4654 (buf!5189 (_2!9885 lt!340837)))))))

(assert (=> d!73417 (= (isPrefixOf!0 (_1!9885 lt!340837) (_2!9885 lt!340837)) e!147337)))

(declare-fun b!216625 () Bool)

(declare-fun res!182237 () Bool)

(assert (=> b!216625 (=> (not res!182237) (not e!147337))))

(assert (=> b!216625 (= res!182237 (bvsle (bitIndex!0 (size!4654 (buf!5189 (_1!9885 lt!340837))) (currentByte!9767 (_1!9885 lt!340837)) (currentBit!9762 (_1!9885 lt!340837))) (bitIndex!0 (size!4654 (buf!5189 (_2!9885 lt!340837))) (currentByte!9767 (_2!9885 lt!340837)) (currentBit!9762 (_2!9885 lt!340837)))))))

(declare-fun b!216626 () Bool)

(declare-fun e!147338 () Bool)

(assert (=> b!216626 (= e!147337 e!147338)))

(declare-fun res!182238 () Bool)

(assert (=> b!216626 (=> res!182238 e!147338)))

(assert (=> b!216626 (= res!182238 (= (size!4654 (buf!5189 (_1!9885 lt!340837))) #b00000000000000000000000000000000))))

(declare-fun b!216627 () Bool)

(assert (=> b!216627 (= e!147338 (arrayBitRangesEq!0 (buf!5189 (_1!9885 lt!340837)) (buf!5189 (_2!9885 lt!340837)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 (_1!9885 lt!340837))) (currentByte!9767 (_1!9885 lt!340837)) (currentBit!9762 (_1!9885 lt!340837)))))))

(assert (= (and d!73417 res!182239) b!216625))

(assert (= (and b!216625 res!182237) b!216626))

(assert (= (and b!216626 (not res!182238)) b!216627))

(declare-fun m!334233 () Bool)

(assert (=> b!216625 m!334233))

(assert (=> b!216625 m!333913))

(assert (=> b!216627 m!334233))

(assert (=> b!216627 m!334233))

(declare-fun m!334235 () Bool)

(assert (=> b!216627 m!334235))

(assert (=> d!72623 d!73417))

(assert (=> d!72623 d!72709))

(declare-fun d!73419 () Bool)

(assert (=> d!73419 (isPrefixOf!0 lt!340838 lt!340838)))

(declare-fun lt!342630 () Unit!15292)

(assert (=> d!73419 (= lt!342630 (choose!11 lt!340838))))

(assert (=> d!73419 (= (lemmaIsPrefixRefl!0 lt!340838) lt!342630)))

(declare-fun bs!17941 () Bool)

(assert (= bs!17941 d!73419))

(assert (=> bs!17941 m!332235))

(declare-fun m!334237 () Bool)

(assert (=> bs!17941 m!334237))

(assert (=> d!72623 d!73419))

(declare-fun d!73421 () Bool)

(declare-fun res!182242 () Bool)

(declare-fun e!147339 () Bool)

(assert (=> d!73421 (=> (not res!182242) (not e!147339))))

(assert (=> d!73421 (= res!182242 (= (size!4654 (buf!5189 lt!340838)) (size!4654 (buf!5189 (_2!9886 lt!340151)))))))

(assert (=> d!73421 (= (isPrefixOf!0 lt!340838 (_2!9886 lt!340151)) e!147339)))

(declare-fun b!216628 () Bool)

(declare-fun res!182240 () Bool)

(assert (=> b!216628 (=> (not res!182240) (not e!147339))))

(assert (=> b!216628 (= res!182240 (bvsle (bitIndex!0 (size!4654 (buf!5189 lt!340838)) (currentByte!9767 lt!340838) (currentBit!9762 lt!340838)) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340151))) (currentByte!9767 (_2!9886 lt!340151)) (currentBit!9762 (_2!9886 lt!340151)))))))

(declare-fun b!216629 () Bool)

(declare-fun e!147340 () Bool)

(assert (=> b!216629 (= e!147339 e!147340)))

(declare-fun res!182241 () Bool)

(assert (=> b!216629 (=> res!182241 e!147340)))

(assert (=> b!216629 (= res!182241 (= (size!4654 (buf!5189 lt!340838)) #b00000000000000000000000000000000))))

(declare-fun b!216630 () Bool)

(assert (=> b!216630 (= e!147340 (arrayBitRangesEq!0 (buf!5189 lt!340838) (buf!5189 (_2!9886 lt!340151)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 lt!340838)) (currentByte!9767 lt!340838) (currentBit!9762 lt!340838))))))

(assert (= (and d!73421 res!182242) b!216628))

(assert (= (and b!216628 res!182240) b!216629))

(assert (= (and b!216629 (not res!182241)) b!216630))

(assert (=> b!216628 m!334229))

(assert (=> b!216628 m!331661))

(assert (=> b!216630 m!334229))

(assert (=> b!216630 m!334229))

(declare-fun m!334239 () Bool)

(assert (=> b!216630 m!334239))

(assert (=> d!72623 d!73421))

(declare-fun d!73423 () Bool)

(declare-fun e!147341 () Bool)

(assert (=> d!73423 e!147341))

(declare-fun res!182243 () Bool)

(assert (=> d!73423 (=> (not res!182243) (not e!147341))))

(declare-fun lt!342632 () (_ BitVec 64))

(declare-fun lt!342631 () BitStream!8416)

(assert (=> d!73423 (= res!182243 (= (bvadd lt!342632 (bvsub lt!340898 lt!340903)) (bitIndex!0 (size!4654 (buf!5189 lt!342631)) (currentByte!9767 lt!342631) (currentBit!9762 lt!342631))))))

(assert (=> d!73423 (or (not (= (bvand lt!342632 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340898 lt!340903) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342632 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342632 (bvsub lt!340898 lt!340903)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73423 (= lt!342632 (bitIndex!0 (size!4654 (buf!5189 (_2!9885 lt!340909))) (currentByte!9767 (_2!9885 lt!340909)) (currentBit!9762 (_2!9885 lt!340909))))))

(assert (=> d!73423 (= lt!342631 (_2!9886 (moveBitIndex!0 (_2!9885 lt!340909) (bvsub lt!340898 lt!340903))))))

(assert (=> d!73423 (moveBitIndexPrecond!0 (_2!9885 lt!340909) (bvsub lt!340898 lt!340903))))

(assert (=> d!73423 (= (withMovedBitIndex!0 (_2!9885 lt!340909) (bvsub lt!340898 lt!340903)) lt!342631)))

(declare-fun b!216631 () Bool)

(assert (=> b!216631 (= e!147341 (= (size!4654 (buf!5189 (_2!9885 lt!340909))) (size!4654 (buf!5189 lt!342631))))))

(assert (= (and d!73423 res!182243) b!216631))

(declare-fun m!334241 () Bool)

(assert (=> d!73423 m!334241))

(assert (=> d!73423 m!333889))

(declare-fun m!334243 () Bool)

(assert (=> d!73423 m!334243))

(declare-fun m!334245 () Bool)

(assert (=> d!73423 m!334245))

(assert (=> b!215769 d!73423))

(assert (=> b!215769 d!72707))

(assert (=> b!215769 d!72569))

(declare-fun d!73425 () Bool)

(declare-fun res!182246 () Bool)

(declare-fun e!147342 () Bool)

(assert (=> d!73425 (=> (not res!182246) (not e!147342))))

(assert (=> d!73425 (= res!182246 (= (size!4654 (buf!5189 (_2!9886 lt!340128))) (size!4654 (buf!5189 (_2!9886 lt!341445)))))))

(assert (=> d!73425 (= (isPrefixOf!0 (_2!9886 lt!340128) (_2!9886 lt!341445)) e!147342)))

(declare-fun b!216632 () Bool)

(declare-fun res!182244 () Bool)

(assert (=> b!216632 (=> (not res!182244) (not e!147342))))

(assert (=> b!216632 (= res!182244 (bvsle (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341445))) (currentByte!9767 (_2!9886 lt!341445)) (currentBit!9762 (_2!9886 lt!341445)))))))

(declare-fun b!216633 () Bool)

(declare-fun e!147343 () Bool)

(assert (=> b!216633 (= e!147342 e!147343)))

(declare-fun res!182245 () Bool)

(assert (=> b!216633 (=> res!182245 e!147343)))

(assert (=> b!216633 (= res!182245 (= (size!4654 (buf!5189 (_2!9886 lt!340128))) #b00000000000000000000000000000000))))

(declare-fun b!216634 () Bool)

(assert (=> b!216634 (= e!147343 (arrayBitRangesEq!0 (buf!5189 (_2!9886 lt!340128)) (buf!5189 (_2!9886 lt!341445)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128)))))))

(assert (= (and d!73425 res!182246) b!216632))

(assert (= (and b!216632 res!182244) b!216633))

(assert (= (and b!216633 (not res!182245)) b!216634))

(assert (=> b!216632 m!331623))

(assert (=> b!216632 m!332617))

(assert (=> b!216634 m!331623))

(assert (=> b!216634 m!331623))

(declare-fun m!334247 () Bool)

(assert (=> b!216634 m!334247))

(assert (=> b!215926 d!73425))

(declare-fun e!147345 () Bool)

(declare-fun lt!342635 () tuple4!282)

(declare-fun b!216635 () Bool)

(assert (=> b!216635 (= e!147345 (arrayRangesEq!703 (buf!5189 thiss!1204) (buf!5189 (_2!9886 lt!340151)) (_1!9904 lt!342635) (_2!9904 lt!342635)))))

(declare-fun e!147347 () Bool)

(declare-fun b!216636 () Bool)

(declare-fun lt!342633 () (_ BitVec 32))

(assert (=> b!216636 (= e!147347 (byteRangesEq!0 (select (arr!5584 (buf!5189 thiss!1204)) (_4!141 lt!342635)) (select (arr!5584 (buf!5189 (_2!9886 lt!340151))) (_4!141 lt!342635)) #b00000000000000000000000000000000 lt!342633))))

(declare-fun b!216637 () Bool)

(declare-fun e!147348 () Bool)

(declare-fun call!3390 () Bool)

(assert (=> b!216637 (= e!147348 call!3390)))

(declare-fun b!216638 () Bool)

(declare-fun res!182249 () Bool)

(assert (=> b!216638 (= res!182249 (= lt!342633 #b00000000000000000000000000000000))))

(assert (=> b!216638 (=> res!182249 e!147347)))

(declare-fun e!147344 () Bool)

(assert (=> b!216638 (= e!147344 e!147347)))

(declare-fun b!216639 () Bool)

(assert (=> b!216639 (= e!147348 e!147344)))

(declare-fun res!182251 () Bool)

(assert (=> b!216639 (= res!182251 call!3390)))

(assert (=> b!216639 (=> (not res!182251) (not e!147344))))

(declare-fun bm!3387 () Bool)

(declare-fun lt!342634 () (_ BitVec 32))

(declare-fun c!10591 () Bool)

(assert (=> bm!3387 (= call!3390 (byteRangesEq!0 (select (arr!5584 (buf!5189 thiss!1204)) (_3!657 lt!342635)) (select (arr!5584 (buf!5189 (_2!9886 lt!340151))) (_3!657 lt!342635)) lt!342634 (ite c!10591 lt!342633 #b00000000000000000000000000001000)))))

(declare-fun d!73427 () Bool)

(declare-fun res!182247 () Bool)

(declare-fun e!147346 () Bool)

(assert (=> d!73427 (=> res!182247 e!147346)))

(assert (=> d!73427 (= res!182247 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 thiss!1204)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))))))

(assert (=> d!73427 (= (arrayBitRangesEq!0 (buf!5189 thiss!1204) (buf!5189 (_2!9886 lt!340151)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 thiss!1204)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))) e!147346)))

(declare-fun b!216640 () Bool)

(declare-fun e!147349 () Bool)

(assert (=> b!216640 (= e!147346 e!147349)))

(declare-fun res!182248 () Bool)

(assert (=> b!216640 (=> (not res!182248) (not e!147349))))

(assert (=> b!216640 (= res!182248 e!147345)))

(declare-fun res!182250 () Bool)

(assert (=> b!216640 (=> res!182250 e!147345)))

(assert (=> b!216640 (= res!182250 (bvsge (_1!9904 lt!342635) (_2!9904 lt!342635)))))

(assert (=> b!216640 (= lt!342633 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4654 (buf!5189 thiss!1204)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216640 (= lt!342634 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216640 (= lt!342635 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 thiss!1204)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))))))

(declare-fun b!216641 () Bool)

(assert (=> b!216641 (= e!147349 e!147348)))

(assert (=> b!216641 (= c!10591 (= (_3!657 lt!342635) (_4!141 lt!342635)))))

(assert (= (and d!73427 (not res!182247)) b!216640))

(assert (= (and b!216640 (not res!182250)) b!216635))

(assert (= (and b!216640 res!182248) b!216641))

(assert (= (and b!216641 c!10591) b!216637))

(assert (= (and b!216641 (not c!10591)) b!216639))

(assert (= (and b!216639 res!182251) b!216638))

(assert (= (and b!216638 (not res!182249)) b!216636))

(assert (= (or b!216637 b!216639) bm!3387))

(declare-fun m!334249 () Bool)

(assert (=> b!216635 m!334249))

(declare-fun m!334251 () Bool)

(assert (=> b!216636 m!334251))

(declare-fun m!334253 () Bool)

(assert (=> b!216636 m!334253))

(assert (=> b!216636 m!334251))

(assert (=> b!216636 m!334253))

(declare-fun m!334255 () Bool)

(assert (=> b!216636 m!334255))

(declare-fun m!334257 () Bool)

(assert (=> bm!3387 m!334257))

(declare-fun m!334259 () Bool)

(assert (=> bm!3387 m!334259))

(assert (=> bm!3387 m!334257))

(assert (=> bm!3387 m!334259))

(declare-fun m!334261 () Bool)

(assert (=> bm!3387 m!334261))

(assert (=> b!216640 m!331625))

(declare-fun m!334263 () Bool)

(assert (=> b!216640 m!334263))

(assert (=> b!215778 d!73427))

(assert (=> b!215778 d!72571))

(declare-fun lt!342638 () tuple4!282)

(declare-fun e!147351 () Bool)

(declare-fun b!216642 () Bool)

(assert (=> b!216642 (= e!147351 (arrayRangesEq!703 (buf!5189 thiss!1204) (buf!5189 (_2!9886 lt!340128)) (_1!9904 lt!342638) (_2!9904 lt!342638)))))

(declare-fun b!216643 () Bool)

(declare-fun lt!342636 () (_ BitVec 32))

(declare-fun e!147353 () Bool)

(assert (=> b!216643 (= e!147353 (byteRangesEq!0 (select (arr!5584 (buf!5189 thiss!1204)) (_4!141 lt!342638)) (select (arr!5584 (buf!5189 (_2!9886 lt!340128))) (_4!141 lt!342638)) #b00000000000000000000000000000000 lt!342636))))

(declare-fun b!216644 () Bool)

(declare-fun e!147354 () Bool)

(declare-fun call!3391 () Bool)

(assert (=> b!216644 (= e!147354 call!3391)))

(declare-fun b!216645 () Bool)

(declare-fun res!182254 () Bool)

(assert (=> b!216645 (= res!182254 (= lt!342636 #b00000000000000000000000000000000))))

(assert (=> b!216645 (=> res!182254 e!147353)))

(declare-fun e!147350 () Bool)

(assert (=> b!216645 (= e!147350 e!147353)))

(declare-fun b!216646 () Bool)

(assert (=> b!216646 (= e!147354 e!147350)))

(declare-fun res!182256 () Bool)

(assert (=> b!216646 (= res!182256 call!3391)))

(assert (=> b!216646 (=> (not res!182256) (not e!147350))))

(declare-fun bm!3388 () Bool)

(declare-fun c!10592 () Bool)

(declare-fun lt!342637 () (_ BitVec 32))

(assert (=> bm!3388 (= call!3391 (byteRangesEq!0 (select (arr!5584 (buf!5189 thiss!1204)) (_3!657 lt!342638)) (select (arr!5584 (buf!5189 (_2!9886 lt!340128))) (_3!657 lt!342638)) lt!342637 (ite c!10592 lt!342636 #b00000000000000000000000000001000)))))

(declare-fun d!73429 () Bool)

(declare-fun res!182252 () Bool)

(declare-fun e!147352 () Bool)

(assert (=> d!73429 (=> res!182252 e!147352)))

(assert (=> d!73429 (= res!182252 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 thiss!1204)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))))))

(assert (=> d!73429 (= (arrayBitRangesEq!0 (buf!5189 thiss!1204) (buf!5189 (_2!9886 lt!340128)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 thiss!1204)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))) e!147352)))

(declare-fun b!216647 () Bool)

(declare-fun e!147355 () Bool)

(assert (=> b!216647 (= e!147352 e!147355)))

(declare-fun res!182253 () Bool)

(assert (=> b!216647 (=> (not res!182253) (not e!147355))))

(assert (=> b!216647 (= res!182253 e!147351)))

(declare-fun res!182255 () Bool)

(assert (=> b!216647 (=> res!182255 e!147351)))

(assert (=> b!216647 (= res!182255 (bvsge (_1!9904 lt!342638) (_2!9904 lt!342638)))))

(assert (=> b!216647 (= lt!342636 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4654 (buf!5189 thiss!1204)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216647 (= lt!342637 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216647 (= lt!342638 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 thiss!1204)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))))))

(declare-fun b!216648 () Bool)

(assert (=> b!216648 (= e!147355 e!147354)))

(assert (=> b!216648 (= c!10592 (= (_3!657 lt!342638) (_4!141 lt!342638)))))

(assert (= (and d!73429 (not res!182252)) b!216647))

(assert (= (and b!216647 (not res!182255)) b!216642))

(assert (= (and b!216647 res!182253) b!216648))

(assert (= (and b!216648 c!10592) b!216644))

(assert (= (and b!216648 (not c!10592)) b!216646))

(assert (= (and b!216646 res!182256) b!216645))

(assert (= (and b!216645 (not res!182254)) b!216643))

(assert (= (or b!216644 b!216646) bm!3388))

(declare-fun m!334265 () Bool)

(assert (=> b!216642 m!334265))

(declare-fun m!334267 () Bool)

(assert (=> b!216643 m!334267))

(declare-fun m!334269 () Bool)

(assert (=> b!216643 m!334269))

(assert (=> b!216643 m!334267))

(assert (=> b!216643 m!334269))

(declare-fun m!334271 () Bool)

(assert (=> b!216643 m!334271))

(declare-fun m!334273 () Bool)

(assert (=> bm!3388 m!334273))

(declare-fun m!334275 () Bool)

(assert (=> bm!3388 m!334275))

(assert (=> bm!3388 m!334273))

(assert (=> bm!3388 m!334275))

(declare-fun m!334277 () Bool)

(assert (=> bm!3388 m!334277))

(assert (=> b!216647 m!331625))

(assert (=> b!216647 m!334263))

(assert (=> b!215699 d!73429))

(assert (=> b!215699 d!72571))

(assert (=> b!215776 d!72571))

(assert (=> b!215776 d!72707))

(declare-fun d!73431 () Bool)

(assert (=> d!73431 (= (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340151)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340151))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340151)))) (bvsub (bvmul ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340151)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340151))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340151))))))))

(assert (=> d!72707 d!73431))

(assert (=> d!72707 d!72577))

(assert (=> b!215697 d!72571))

(assert (=> b!215697 d!72569))

(declare-fun d!73433 () Bool)

(assert (=> d!73433 (= (invariant!0 (currentBit!9762 (_2!9886 lt!341432)) (currentByte!9767 (_2!9886 lt!341432)) (size!4654 (buf!5189 (_2!9886 lt!341432)))) (and (bvsge (currentBit!9762 (_2!9886 lt!341432)) #b00000000000000000000000000000000) (bvslt (currentBit!9762 (_2!9886 lt!341432)) #b00000000000000000000000000001000) (bvsge (currentByte!9767 (_2!9886 lt!341432)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9767 (_2!9886 lt!341432)) (size!4654 (buf!5189 (_2!9886 lt!341432)))) (and (= (currentBit!9762 (_2!9886 lt!341432)) #b00000000000000000000000000000000) (= (currentByte!9767 (_2!9886 lt!341432)) (size!4654 (buf!5189 (_2!9886 lt!341432))))))))))

(assert (=> d!72713 d!73433))

(declare-fun d!73435 () Bool)

(declare-fun lt!342639 () tuple2!18490)

(assert (=> d!73435 (= lt!342639 (readNBitsLSBFirstsLoop!0 lt!340530 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!340529))))

(assert (=> d!73435 (= (readNBitsLSBFirstsLoopPure!0 lt!340530 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!340529) (tuple2!18459 (_2!9900 lt!342639) (_1!9900 lt!342639)))))

(declare-fun bs!17942 () Bool)

(assert (= bs!17942 d!73435))

(declare-fun m!334279 () Bool)

(assert (=> bs!17942 m!334279))

(assert (=> d!72553 d!73435))

(assert (=> d!72553 d!72697))

(assert (=> d!72553 d!72659))

(assert (=> d!72553 d!72557))

(declare-fun d!73437 () Bool)

(declare-fun lt!342645 () tuple2!18458)

(declare-fun lt!342644 () tuple2!18458)

(assert (=> d!73437 (and (= (_2!9884 lt!342645) (_2!9884 lt!342644)) (= (_1!9884 lt!342645) (_1!9884 lt!342644)))))

(declare-fun e!147358 () (_ BitVec 64))

(assert (=> d!73437 (= lt!342644 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9885 lt!340143) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd i!590 #b00000000000000000000000000000001) (bvor lt!340126 e!147358)))))

(declare-fun c!10595 () Bool)

(assert (=> d!73437 (= c!10595 (_2!9887 (readBitPure!0 (_1!9885 lt!340143))))))

(assert (=> d!73437 (= lt!342645 (readNBitsLSBFirstsLoopPure!0 (_1!9885 lt!340143) nBits!348 i!590 lt!340126))))

(assert (=> d!73437 true))

(declare-fun _$10!43 () Unit!15292)

(assert (=> d!73437 (= (choose!56 (_1!9885 lt!340143) nBits!348 i!590 lt!340126 lt!340528 (tuple2!18459 (_1!9884 lt!340528) (_2!9884 lt!340528)) (_1!9884 lt!340528) (_2!9884 lt!340528) lt!340532 lt!340530 lt!340529 lt!340527 (tuple2!18459 (_1!9884 lt!340527) (_2!9884 lt!340527)) (_1!9884 lt!340527) (_2!9884 lt!340527)) _$10!43)))

(declare-fun b!216653 () Bool)

(assert (=> b!216653 (= e!147358 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!216654 () Bool)

(assert (=> b!216654 (= e!147358 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!73437 c!10595) b!216653))

(assert (= (and d!73437 (not c!10595)) b!216654))

(assert (=> d!73437 m!331635))

(assert (=> d!73437 m!331635))

(declare-fun m!334281 () Bool)

(assert (=> d!73437 m!334281))

(assert (=> d!73437 m!331679))

(assert (=> d!73437 m!331685))

(assert (=> d!72553 d!73437))

(assert (=> d!72619 d!73251))

(declare-fun d!73439 () Bool)

(declare-fun res!182259 () Bool)

(declare-fun e!147359 () Bool)

(assert (=> d!73439 (=> (not res!182259) (not e!147359))))

(assert (=> d!73439 (= res!182259 (= (size!4654 (buf!5189 (_2!9885 lt!340837))) (size!4654 (buf!5189 (_2!9886 lt!340151)))))))

(assert (=> d!73439 (= (isPrefixOf!0 (_2!9885 lt!340837) (_2!9886 lt!340151)) e!147359)))

(declare-fun b!216655 () Bool)

(declare-fun res!182257 () Bool)

(assert (=> b!216655 (=> (not res!182257) (not e!147359))))

(assert (=> b!216655 (= res!182257 (bvsle (bitIndex!0 (size!4654 (buf!5189 (_2!9885 lt!340837))) (currentByte!9767 (_2!9885 lt!340837)) (currentBit!9762 (_2!9885 lt!340837))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340151))) (currentByte!9767 (_2!9886 lt!340151)) (currentBit!9762 (_2!9886 lt!340151)))))))

(declare-fun b!216656 () Bool)

(declare-fun e!147360 () Bool)

(assert (=> b!216656 (= e!147359 e!147360)))

(declare-fun res!182258 () Bool)

(assert (=> b!216656 (=> res!182258 e!147360)))

(assert (=> b!216656 (= res!182258 (= (size!4654 (buf!5189 (_2!9885 lt!340837))) #b00000000000000000000000000000000))))

(declare-fun b!216657 () Bool)

(assert (=> b!216657 (= e!147360 (arrayBitRangesEq!0 (buf!5189 (_2!9885 lt!340837)) (buf!5189 (_2!9886 lt!340151)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 (_2!9885 lt!340837))) (currentByte!9767 (_2!9885 lt!340837)) (currentBit!9762 (_2!9885 lt!340837)))))))

(assert (= (and d!73439 res!182259) b!216655))

(assert (= (and b!216655 res!182257) b!216656))

(assert (= (and b!216656 (not res!182258)) b!216657))

(assert (=> b!216655 m!333913))

(assert (=> b!216655 m!331661))

(assert (=> b!216657 m!333913))

(assert (=> b!216657 m!333913))

(declare-fun m!334283 () Bool)

(assert (=> b!216657 m!334283))

(assert (=> b!215754 d!73439))

(declare-fun d!73441 () Bool)

(assert (=> d!73441 (= (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340151)))) ((_ sign_extend 32) (currentByte!9767 thiss!1204)) ((_ sign_extend 32) (currentBit!9762 thiss!1204))) (bvsub (bvmul ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340151)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 thiss!1204)))))))

(assert (=> d!72699 d!73441))

(declare-fun d!73443 () Bool)

(declare-fun lt!342646 () tuple2!18492)

(assert (=> d!73443 (= lt!342646 (readBit!0 (readerFrom!0 (_2!9886 lt!341445) (currentBit!9762 (_2!9886 lt!340128)) (currentByte!9767 (_2!9886 lt!340128)))))))

(assert (=> d!73443 (= (readBitPure!0 (readerFrom!0 (_2!9886 lt!341445) (currentBit!9762 (_2!9886 lt!340128)) (currentByte!9767 (_2!9886 lt!340128)))) (tuple2!18465 (_2!9901 lt!342646) (_1!9901 lt!342646)))))

(declare-fun bs!17944 () Bool)

(assert (= bs!17944 d!73443))

(assert (=> bs!17944 m!332551))

(declare-fun m!334285 () Bool)

(assert (=> bs!17944 m!334285))

(assert (=> b!215940 d!73443))

(declare-fun d!73445 () Bool)

(declare-fun e!147361 () Bool)

(assert (=> d!73445 e!147361))

(declare-fun res!182260 () Bool)

(assert (=> d!73445 (=> (not res!182260) (not e!147361))))

(assert (=> d!73445 (= res!182260 (invariant!0 (currentBit!9762 (_2!9886 lt!341445)) (currentByte!9767 (_2!9886 lt!341445)) (size!4654 (buf!5189 (_2!9886 lt!341445)))))))

(assert (=> d!73445 (= (readerFrom!0 (_2!9886 lt!341445) (currentBit!9762 (_2!9886 lt!340128)) (currentByte!9767 (_2!9886 lt!340128))) (BitStream!8417 (buf!5189 (_2!9886 lt!341445)) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))))))

(declare-fun b!216658 () Bool)

(assert (=> b!216658 (= e!147361 (invariant!0 (currentBit!9762 (_2!9886 lt!340128)) (currentByte!9767 (_2!9886 lt!340128)) (size!4654 (buf!5189 (_2!9886 lt!341445)))))))

(assert (= (and d!73445 res!182260) b!216658))

(assert (=> d!73445 m!334199))

(declare-fun m!334287 () Bool)

(assert (=> b!216658 m!334287))

(assert (=> b!215940 d!73445))

(declare-fun b!216659 () Bool)

(declare-fun res!182261 () Bool)

(declare-fun e!147362 () Bool)

(assert (=> b!216659 (=> (not res!182261) (not e!147362))))

(declare-fun lt!342665 () tuple2!18460)

(assert (=> b!216659 (= res!182261 (isPrefixOf!0 (_1!9885 lt!342665) (_2!9886 lt!340128)))))

(declare-fun b!216660 () Bool)

(declare-fun e!147363 () Unit!15292)

(declare-fun Unit!15432 () Unit!15292)

(assert (=> b!216660 (= e!147363 Unit!15432)))

(declare-fun d!73447 () Bool)

(assert (=> d!73447 e!147362))

(declare-fun res!182262 () Bool)

(assert (=> d!73447 (=> (not res!182262) (not e!147362))))

(assert (=> d!73447 (= res!182262 (isPrefixOf!0 (_1!9885 lt!342665) (_2!9885 lt!342665)))))

(declare-fun lt!342666 () BitStream!8416)

(assert (=> d!73447 (= lt!342665 (tuple2!18461 lt!342666 (_2!9886 lt!341432)))))

(declare-fun lt!342657 () Unit!15292)

(declare-fun lt!342663 () Unit!15292)

(assert (=> d!73447 (= lt!342657 lt!342663)))

(assert (=> d!73447 (isPrefixOf!0 lt!342666 (_2!9886 lt!341432))))

(assert (=> d!73447 (= lt!342663 (lemmaIsPrefixTransitive!0 lt!342666 (_2!9886 lt!341432) (_2!9886 lt!341432)))))

(declare-fun lt!342655 () Unit!15292)

(declare-fun lt!342650 () Unit!15292)

(assert (=> d!73447 (= lt!342655 lt!342650)))

(assert (=> d!73447 (isPrefixOf!0 lt!342666 (_2!9886 lt!341432))))

(assert (=> d!73447 (= lt!342650 (lemmaIsPrefixTransitive!0 lt!342666 (_2!9886 lt!340128) (_2!9886 lt!341432)))))

(declare-fun lt!342664 () Unit!15292)

(assert (=> d!73447 (= lt!342664 e!147363)))

(declare-fun c!10596 () Bool)

(assert (=> d!73447 (= c!10596 (not (= (size!4654 (buf!5189 (_2!9886 lt!340128))) #b00000000000000000000000000000000)))))

(declare-fun lt!342647 () Unit!15292)

(declare-fun lt!342658 () Unit!15292)

(assert (=> d!73447 (= lt!342647 lt!342658)))

(assert (=> d!73447 (isPrefixOf!0 (_2!9886 lt!341432) (_2!9886 lt!341432))))

(assert (=> d!73447 (= lt!342658 (lemmaIsPrefixRefl!0 (_2!9886 lt!341432)))))

(declare-fun lt!342648 () Unit!15292)

(declare-fun lt!342652 () Unit!15292)

(assert (=> d!73447 (= lt!342648 lt!342652)))

(assert (=> d!73447 (= lt!342652 (lemmaIsPrefixRefl!0 (_2!9886 lt!341432)))))

(declare-fun lt!342656 () Unit!15292)

(declare-fun lt!342661 () Unit!15292)

(assert (=> d!73447 (= lt!342656 lt!342661)))

(assert (=> d!73447 (isPrefixOf!0 lt!342666 lt!342666)))

(assert (=> d!73447 (= lt!342661 (lemmaIsPrefixRefl!0 lt!342666))))

(declare-fun lt!342653 () Unit!15292)

(declare-fun lt!342651 () Unit!15292)

(assert (=> d!73447 (= lt!342653 lt!342651)))

(assert (=> d!73447 (isPrefixOf!0 (_2!9886 lt!340128) (_2!9886 lt!340128))))

(assert (=> d!73447 (= lt!342651 (lemmaIsPrefixRefl!0 (_2!9886 lt!340128)))))

(assert (=> d!73447 (= lt!342666 (BitStream!8417 (buf!5189 (_2!9886 lt!341432)) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))))))

(assert (=> d!73447 (isPrefixOf!0 (_2!9886 lt!340128) (_2!9886 lt!341432))))

(assert (=> d!73447 (= (reader!0 (_2!9886 lt!340128) (_2!9886 lt!341432)) lt!342665)))

(declare-fun b!216661 () Bool)

(declare-fun lt!342649 () Unit!15292)

(assert (=> b!216661 (= e!147363 lt!342649)))

(declare-fun lt!342660 () (_ BitVec 64))

(assert (=> b!216661 (= lt!342660 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!342662 () (_ BitVec 64))

(assert (=> b!216661 (= lt!342662 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))))))

(assert (=> b!216661 (= lt!342649 (arrayBitRangesEqSymmetric!0 (buf!5189 (_2!9886 lt!340128)) (buf!5189 (_2!9886 lt!341432)) lt!342660 lt!342662))))

(assert (=> b!216661 (arrayBitRangesEq!0 (buf!5189 (_2!9886 lt!341432)) (buf!5189 (_2!9886 lt!340128)) lt!342660 lt!342662)))

(declare-fun lt!342654 () (_ BitVec 64))

(declare-fun b!216662 () Bool)

(declare-fun lt!342659 () (_ BitVec 64))

(assert (=> b!216662 (= e!147362 (= (_1!9885 lt!342665) (withMovedBitIndex!0 (_2!9885 lt!342665) (bvsub lt!342654 lt!342659))))))

(assert (=> b!216662 (or (= (bvand lt!342654 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342659 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342654 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342654 lt!342659) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216662 (= lt!342659 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341432))) (currentByte!9767 (_2!9886 lt!341432)) (currentBit!9762 (_2!9886 lt!341432))))))

(assert (=> b!216662 (= lt!342654 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))))))

(declare-fun b!216663 () Bool)

(declare-fun res!182263 () Bool)

(assert (=> b!216663 (=> (not res!182263) (not e!147362))))

(assert (=> b!216663 (= res!182263 (isPrefixOf!0 (_2!9885 lt!342665) (_2!9886 lt!341432)))))

(assert (= (and d!73447 c!10596) b!216661))

(assert (= (and d!73447 (not c!10596)) b!216660))

(assert (= (and d!73447 res!182262) b!216659))

(assert (= (and b!216659 res!182261) b!216663))

(assert (= (and b!216663 res!182263) b!216662))

(declare-fun m!334289 () Bool)

(assert (=> b!216663 m!334289))

(declare-fun m!334291 () Bool)

(assert (=> b!216659 m!334291))

(assert (=> d!73447 m!332287))

(declare-fun m!334293 () Bool)

(assert (=> d!73447 m!334293))

(declare-fun m!334295 () Bool)

(assert (=> d!73447 m!334295))

(declare-fun m!334297 () Bool)

(assert (=> d!73447 m!334297))

(assert (=> d!73447 m!332293))

(declare-fun m!334299 () Bool)

(assert (=> d!73447 m!334299))

(declare-fun m!334301 () Bool)

(assert (=> d!73447 m!334301))

(assert (=> d!73447 m!332635))

(declare-fun m!334303 () Bool)

(assert (=> d!73447 m!334303))

(declare-fun m!334305 () Bool)

(assert (=> d!73447 m!334305))

(declare-fun m!334307 () Bool)

(assert (=> d!73447 m!334307))

(assert (=> b!216661 m!331623))

(declare-fun m!334309 () Bool)

(assert (=> b!216661 m!334309))

(declare-fun m!334311 () Bool)

(assert (=> b!216661 m!334311))

(declare-fun m!334313 () Bool)

(assert (=> b!216662 m!334313))

(assert (=> b!216662 m!332629))

(assert (=> b!216662 m!331623))

(assert (=> b!215938 d!73447))

(declare-fun d!73449 () Bool)

(declare-fun lt!342667 () tuple2!18490)

(assert (=> d!73449 (= lt!342667 (readNBitsLSBFirstsLoop!0 (_1!9885 lt!341452) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (=> d!73449 (= (readNBitsLSBFirstsLoopPure!0 (_1!9885 lt!341452) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))) (tuple2!18459 (_2!9900 lt!342667) (_1!9900 lt!342667)))))

(declare-fun bs!17945 () Bool)

(assert (= bs!17945 d!73449))

(declare-fun m!334315 () Bool)

(assert (=> bs!17945 m!334315))

(assert (=> b!215938 d!73449))

(declare-fun d!73451 () Bool)

(assert (=> d!73451 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341432)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340128))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340128))) lt!341433) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341432)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340128))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340128)))) lt!341433))))

(declare-fun bs!17946 () Bool)

(assert (= bs!17946 d!73451))

(declare-fun m!334317 () Bool)

(assert (=> bs!17946 m!334317))

(assert (=> b!215938 d!73451))

(assert (=> b!215938 d!72581))

(declare-fun d!73453 () Bool)

(assert (=> d!73453 (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341432)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340128))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340128))) lt!341433)))

(declare-fun lt!342668 () Unit!15292)

(assert (=> d!73453 (= lt!342668 (choose!9 (_2!9886 lt!340128) (buf!5189 (_2!9886 lt!341432)) lt!341433 (BitStream!8417 (buf!5189 (_2!9886 lt!341432)) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128)))))))

(assert (=> d!73453 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9886 lt!340128) (buf!5189 (_2!9886 lt!341432)) lt!341433) lt!342668)))

(declare-fun bs!17947 () Bool)

(assert (= bs!17947 d!73453))

(assert (=> bs!17947 m!332621))

(declare-fun m!334319 () Bool)

(assert (=> bs!17947 m!334319))

(assert (=> b!215938 d!73453))

(assert (=> b!215938 d!73357))

(assert (=> b!215752 d!72571))

(declare-fun d!73455 () Bool)

(assert (=> d!73455 (arrayBitRangesEq!0 (buf!5189 (_2!9886 lt!340151)) (buf!5189 thiss!1204) lt!340832 lt!340834)))

(declare-fun lt!342669 () Unit!15292)

(assert (=> d!73455 (= lt!342669 (choose!8 (buf!5189 thiss!1204) (buf!5189 (_2!9886 lt!340151)) lt!340832 lt!340834))))

(assert (=> d!73455 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340832) (bvsle lt!340832 lt!340834))))

(assert (=> d!73455 (= (arrayBitRangesEqSymmetric!0 (buf!5189 thiss!1204) (buf!5189 (_2!9886 lt!340151)) lt!340832 lt!340834) lt!342669)))

(declare-fun bs!17948 () Bool)

(assert (= bs!17948 d!73455))

(assert (=> bs!17948 m!332239))

(declare-fun m!334321 () Bool)

(assert (=> bs!17948 m!334321))

(assert (=> b!215752 d!73455))

(declare-fun e!147365 () Bool)

(declare-fun lt!342672 () tuple4!282)

(declare-fun b!216664 () Bool)

(assert (=> b!216664 (= e!147365 (arrayRangesEq!703 (buf!5189 (_2!9886 lt!340151)) (buf!5189 thiss!1204) (_1!9904 lt!342672) (_2!9904 lt!342672)))))

(declare-fun lt!342670 () (_ BitVec 32))

(declare-fun b!216665 () Bool)

(declare-fun e!147367 () Bool)

(assert (=> b!216665 (= e!147367 (byteRangesEq!0 (select (arr!5584 (buf!5189 (_2!9886 lt!340151))) (_4!141 lt!342672)) (select (arr!5584 (buf!5189 thiss!1204)) (_4!141 lt!342672)) #b00000000000000000000000000000000 lt!342670))))

(declare-fun b!216666 () Bool)

(declare-fun e!147368 () Bool)

(declare-fun call!3392 () Bool)

(assert (=> b!216666 (= e!147368 call!3392)))

(declare-fun b!216667 () Bool)

(declare-fun res!182266 () Bool)

(assert (=> b!216667 (= res!182266 (= lt!342670 #b00000000000000000000000000000000))))

(assert (=> b!216667 (=> res!182266 e!147367)))

(declare-fun e!147364 () Bool)

(assert (=> b!216667 (= e!147364 e!147367)))

(declare-fun b!216668 () Bool)

(assert (=> b!216668 (= e!147368 e!147364)))

(declare-fun res!182268 () Bool)

(assert (=> b!216668 (= res!182268 call!3392)))

(assert (=> b!216668 (=> (not res!182268) (not e!147364))))

(declare-fun bm!3389 () Bool)

(declare-fun lt!342671 () (_ BitVec 32))

(declare-fun c!10597 () Bool)

(assert (=> bm!3389 (= call!3392 (byteRangesEq!0 (select (arr!5584 (buf!5189 (_2!9886 lt!340151))) (_3!657 lt!342672)) (select (arr!5584 (buf!5189 thiss!1204)) (_3!657 lt!342672)) lt!342671 (ite c!10597 lt!342670 #b00000000000000000000000000001000)))))

(declare-fun d!73457 () Bool)

(declare-fun res!182264 () Bool)

(declare-fun e!147366 () Bool)

(assert (=> d!73457 (=> res!182264 e!147366)))

(assert (=> d!73457 (= res!182264 (bvsge lt!340832 lt!340834))))

(assert (=> d!73457 (= (arrayBitRangesEq!0 (buf!5189 (_2!9886 lt!340151)) (buf!5189 thiss!1204) lt!340832 lt!340834) e!147366)))

(declare-fun b!216669 () Bool)

(declare-fun e!147369 () Bool)

(assert (=> b!216669 (= e!147366 e!147369)))

(declare-fun res!182265 () Bool)

(assert (=> b!216669 (=> (not res!182265) (not e!147369))))

(assert (=> b!216669 (= res!182265 e!147365)))

(declare-fun res!182267 () Bool)

(assert (=> b!216669 (=> res!182267 e!147365)))

(assert (=> b!216669 (= res!182267 (bvsge (_1!9904 lt!342672) (_2!9904 lt!342672)))))

(assert (=> b!216669 (= lt!342670 ((_ extract 31 0) (bvsrem lt!340834 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216669 (= lt!342671 ((_ extract 31 0) (bvsrem lt!340832 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216669 (= lt!342672 (arrayBitIndices!0 lt!340832 lt!340834))))

(declare-fun b!216670 () Bool)

(assert (=> b!216670 (= e!147369 e!147368)))

(assert (=> b!216670 (= c!10597 (= (_3!657 lt!342672) (_4!141 lt!342672)))))

(assert (= (and d!73457 (not res!182264)) b!216669))

(assert (= (and b!216669 (not res!182267)) b!216664))

(assert (= (and b!216669 res!182265) b!216670))

(assert (= (and b!216670 c!10597) b!216666))

(assert (= (and b!216670 (not c!10597)) b!216668))

(assert (= (and b!216668 res!182268) b!216667))

(assert (= (and b!216667 (not res!182266)) b!216665))

(assert (= (or b!216666 b!216668) bm!3389))

(declare-fun m!334323 () Bool)

(assert (=> b!216664 m!334323))

(declare-fun m!334325 () Bool)

(assert (=> b!216665 m!334325))

(declare-fun m!334327 () Bool)

(assert (=> b!216665 m!334327))

(assert (=> b!216665 m!334325))

(assert (=> b!216665 m!334327))

(declare-fun m!334329 () Bool)

(assert (=> b!216665 m!334329))

(declare-fun m!334331 () Bool)

(assert (=> bm!3389 m!334331))

(declare-fun m!334333 () Bool)

(assert (=> bm!3389 m!334333))

(assert (=> bm!3389 m!334331))

(assert (=> bm!3389 m!334333))

(declare-fun m!334335 () Bool)

(assert (=> bm!3389 m!334335))

(declare-fun m!334337 () Bool)

(assert (=> b!216669 m!334337))

(assert (=> b!215752 d!73457))

(declare-fun d!73459 () Bool)

(declare-fun e!147370 () Bool)

(assert (=> d!73459 e!147370))

(declare-fun res!182269 () Bool)

(assert (=> d!73459 (=> (not res!182269) (not e!147370))))

(assert (=> d!73459 (= res!182269 (= (buf!5189 (_2!9886 (increaseBitIndex!0 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204))))) (buf!5189 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204)))))))

(declare-fun lt!342674 () Bool)

(assert (=> d!73459 (= lt!342674 (not (= (bvand ((_ sign_extend 24) (select (arr!5584 (buf!5189 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204)))) (currentByte!9767 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9762 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!342677 () tuple2!18492)

(assert (=> d!73459 (= lt!342677 (tuple2!18493 (not (= (bvand ((_ sign_extend 24) (select (arr!5584 (buf!5189 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204)))) (currentByte!9767 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9762 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204)))))) #b00000000000000000000000000000000)) (_2!9886 (increaseBitIndex!0 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204))))))))

(assert (=> d!73459 (validate_offset_bit!0 ((_ sign_extend 32) (size!4654 (buf!5189 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204))))) ((_ sign_extend 32) (currentByte!9767 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204)))) ((_ sign_extend 32) (currentBit!9762 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204)))))))

(assert (=> d!73459 (= (readBit!0 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204))) lt!342677)))

(declare-fun b!216671 () Bool)

(declare-fun lt!342678 () (_ BitVec 64))

(declare-fun lt!342675 () (_ BitVec 64))

(assert (=> b!216671 (= e!147370 (= (bitIndex!0 (size!4654 (buf!5189 (_2!9886 (increaseBitIndex!0 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204)))))) (currentByte!9767 (_2!9886 (increaseBitIndex!0 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204))))) (currentBit!9762 (_2!9886 (increaseBitIndex!0 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204)))))) (bvadd lt!342678 lt!342675)))))

(assert (=> b!216671 (or (not (= (bvand lt!342678 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342675 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342678 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342678 lt!342675) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216671 (= lt!342675 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!216671 (= lt!342678 (bitIndex!0 (size!4654 (buf!5189 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204)))) (currentByte!9767 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204))) (currentBit!9762 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204)))))))

(declare-fun lt!342679 () Bool)

(assert (=> b!216671 (= lt!342679 (not (= (bvand ((_ sign_extend 24) (select (arr!5584 (buf!5189 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204)))) (currentByte!9767 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9762 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!342673 () Bool)

(assert (=> b!216671 (= lt!342673 (not (= (bvand ((_ sign_extend 24) (select (arr!5584 (buf!5189 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204)))) (currentByte!9767 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9762 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!342676 () Bool)

(assert (=> b!216671 (= lt!342676 (not (= (bvand ((_ sign_extend 24) (select (arr!5584 (buf!5189 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204)))) (currentByte!9767 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9762 (readerFrom!0 (_2!9886 lt!340128) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!73459 res!182269) b!216671))

(assert (=> d!73459 m!331641))

(declare-fun m!334339 () Bool)

(assert (=> d!73459 m!334339))

(declare-fun m!334341 () Bool)

(assert (=> d!73459 m!334341))

(declare-fun m!334343 () Bool)

(assert (=> d!73459 m!334343))

(declare-fun m!334345 () Bool)

(assert (=> d!73459 m!334345))

(assert (=> b!216671 m!334343))

(declare-fun m!334347 () Bool)

(assert (=> b!216671 m!334347))

(assert (=> b!216671 m!334341))

(declare-fun m!334349 () Bool)

(assert (=> b!216671 m!334349))

(assert (=> b!216671 m!331641))

(assert (=> b!216671 m!334339))

(assert (=> d!72611 d!73459))

(declare-fun e!147372 () Bool)

(declare-fun lt!342682 () tuple4!282)

(declare-fun b!216672 () Bool)

(assert (=> b!216672 (= e!147372 (arrayRangesEq!703 (buf!5189 (_2!9886 lt!340128)) (buf!5189 (_2!9886 lt!340151)) (_1!9904 lt!342682) (_2!9904 lt!342682)))))

(declare-fun e!147374 () Bool)

(declare-fun b!216673 () Bool)

(declare-fun lt!342680 () (_ BitVec 32))

(assert (=> b!216673 (= e!147374 (byteRangesEq!0 (select (arr!5584 (buf!5189 (_2!9886 lt!340128))) (_4!141 lt!342682)) (select (arr!5584 (buf!5189 (_2!9886 lt!340151))) (_4!141 lt!342682)) #b00000000000000000000000000000000 lt!342680))))

(declare-fun b!216674 () Bool)

(declare-fun e!147375 () Bool)

(declare-fun call!3393 () Bool)

(assert (=> b!216674 (= e!147375 call!3393)))

(declare-fun b!216675 () Bool)

(declare-fun res!182272 () Bool)

(assert (=> b!216675 (= res!182272 (= lt!342680 #b00000000000000000000000000000000))))

(assert (=> b!216675 (=> res!182272 e!147374)))

(declare-fun e!147371 () Bool)

(assert (=> b!216675 (= e!147371 e!147374)))

(declare-fun b!216676 () Bool)

(assert (=> b!216676 (= e!147375 e!147371)))

(declare-fun res!182274 () Bool)

(assert (=> b!216676 (= res!182274 call!3393)))

(assert (=> b!216676 (=> (not res!182274) (not e!147371))))

(declare-fun c!10598 () Bool)

(declare-fun bm!3390 () Bool)

(declare-fun lt!342681 () (_ BitVec 32))

(assert (=> bm!3390 (= call!3393 (byteRangesEq!0 (select (arr!5584 (buf!5189 (_2!9886 lt!340128))) (_3!657 lt!342682)) (select (arr!5584 (buf!5189 (_2!9886 lt!340151))) (_3!657 lt!342682)) lt!342681 (ite c!10598 lt!342680 #b00000000000000000000000000001000)))))

(declare-fun d!73461 () Bool)

(declare-fun res!182270 () Bool)

(declare-fun e!147373 () Bool)

(assert (=> d!73461 (=> res!182270 e!147373)))

(assert (=> d!73461 (= res!182270 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128)))))))

(assert (=> d!73461 (= (arrayBitRangesEq!0 (buf!5189 (_2!9886 lt!340128)) (buf!5189 (_2!9886 lt!340151)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128)))) e!147373)))

(declare-fun b!216677 () Bool)

(declare-fun e!147376 () Bool)

(assert (=> b!216677 (= e!147373 e!147376)))

(declare-fun res!182271 () Bool)

(assert (=> b!216677 (=> (not res!182271) (not e!147376))))

(assert (=> b!216677 (= res!182271 e!147372)))

(declare-fun res!182273 () Bool)

(assert (=> b!216677 (=> res!182273 e!147372)))

(assert (=> b!216677 (= res!182273 (bvsge (_1!9904 lt!342682) (_2!9904 lt!342682)))))

(assert (=> b!216677 (= lt!342680 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216677 (= lt!342681 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216677 (= lt!342682 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128)))))))

(declare-fun b!216678 () Bool)

(assert (=> b!216678 (= e!147376 e!147375)))

(assert (=> b!216678 (= c!10598 (= (_3!657 lt!342682) (_4!141 lt!342682)))))

(assert (= (and d!73461 (not res!182270)) b!216677))

(assert (= (and b!216677 (not res!182273)) b!216672))

(assert (= (and b!216677 res!182271) b!216678))

(assert (= (and b!216678 c!10598) b!216674))

(assert (= (and b!216678 (not c!10598)) b!216676))

(assert (= (and b!216676 res!182274) b!216675))

(assert (= (and b!216675 (not res!182272)) b!216673))

(assert (= (or b!216674 b!216676) bm!3390))

(declare-fun m!334351 () Bool)

(assert (=> b!216672 m!334351))

(declare-fun m!334353 () Bool)

(assert (=> b!216673 m!334353))

(declare-fun m!334355 () Bool)

(assert (=> b!216673 m!334355))

(assert (=> b!216673 m!334353))

(assert (=> b!216673 m!334355))

(declare-fun m!334357 () Bool)

(assert (=> b!216673 m!334357))

(declare-fun m!334359 () Bool)

(assert (=> bm!3390 m!334359))

(declare-fun m!334361 () Bool)

(assert (=> bm!3390 m!334361))

(assert (=> bm!3390 m!334359))

(assert (=> bm!3390 m!334361))

(declare-fun m!334363 () Bool)

(assert (=> bm!3390 m!334363))

(assert (=> b!216677 m!331623))

(declare-fun m!334365 () Bool)

(assert (=> b!216677 m!334365))

(assert (=> b!215656 d!73461))

(assert (=> b!215656 d!72569))

(declare-fun d!73463 () Bool)

(declare-fun res!182277 () Bool)

(declare-fun e!147377 () Bool)

(assert (=> d!73463 (=> (not res!182277) (not e!147377))))

(assert (=> d!73463 (= res!182277 (= (size!4654 (buf!5189 (_1!9885 lt!340837))) (size!4654 (buf!5189 thiss!1204))))))

(assert (=> d!73463 (= (isPrefixOf!0 (_1!9885 lt!340837) thiss!1204) e!147377)))

(declare-fun b!216679 () Bool)

(declare-fun res!182275 () Bool)

(assert (=> b!216679 (=> (not res!182275) (not e!147377))))

(assert (=> b!216679 (= res!182275 (bvsle (bitIndex!0 (size!4654 (buf!5189 (_1!9885 lt!340837))) (currentByte!9767 (_1!9885 lt!340837)) (currentBit!9762 (_1!9885 lt!340837))) (bitIndex!0 (size!4654 (buf!5189 thiss!1204)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))))))

(declare-fun b!216680 () Bool)

(declare-fun e!147378 () Bool)

(assert (=> b!216680 (= e!147377 e!147378)))

(declare-fun res!182276 () Bool)

(assert (=> b!216680 (=> res!182276 e!147378)))

(assert (=> b!216680 (= res!182276 (= (size!4654 (buf!5189 (_1!9885 lt!340837))) #b00000000000000000000000000000000))))

(declare-fun b!216681 () Bool)

(assert (=> b!216681 (= e!147378 (arrayBitRangesEq!0 (buf!5189 (_1!9885 lt!340837)) (buf!5189 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 (_1!9885 lt!340837))) (currentByte!9767 (_1!9885 lt!340837)) (currentBit!9762 (_1!9885 lt!340837)))))))

(assert (= (and d!73463 res!182277) b!216679))

(assert (= (and b!216679 res!182275) b!216680))

(assert (= (and b!216680 (not res!182276)) b!216681))

(assert (=> b!216679 m!334233))

(assert (=> b!216679 m!331625))

(assert (=> b!216681 m!334233))

(assert (=> b!216681 m!334233))

(declare-fun m!334367 () Bool)

(assert (=> b!216681 m!334367))

(assert (=> b!215750 d!73463))

(declare-fun d!73465 () Bool)

(declare-fun res!182280 () Bool)

(declare-fun e!147379 () Bool)

(assert (=> d!73465 (=> (not res!182280) (not e!147379))))

(assert (=> d!73465 (= res!182280 (= (size!4654 (buf!5189 (_2!9886 lt!340128))) (size!4654 (buf!5189 (ite c!10537 (_2!9886 lt!340128) (_2!9886 lt!341443))))))))

(assert (=> d!73465 (= (isPrefixOf!0 (_2!9886 lt!340128) (ite c!10537 (_2!9886 lt!340128) (_2!9886 lt!341443))) e!147379)))

(declare-fun b!216682 () Bool)

(declare-fun res!182278 () Bool)

(assert (=> b!216682 (=> (not res!182278) (not e!147379))))

(assert (=> b!216682 (= res!182278 (bvsle (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128))) (bitIndex!0 (size!4654 (buf!5189 (ite c!10537 (_2!9886 lt!340128) (_2!9886 lt!341443)))) (currentByte!9767 (ite c!10537 (_2!9886 lt!340128) (_2!9886 lt!341443))) (currentBit!9762 (ite c!10537 (_2!9886 lt!340128) (_2!9886 lt!341443))))))))

(declare-fun b!216683 () Bool)

(declare-fun e!147380 () Bool)

(assert (=> b!216683 (= e!147379 e!147380)))

(declare-fun res!182279 () Bool)

(assert (=> b!216683 (=> res!182279 e!147380)))

(assert (=> b!216683 (= res!182279 (= (size!4654 (buf!5189 (_2!9886 lt!340128))) #b00000000000000000000000000000000))))

(declare-fun b!216684 () Bool)

(assert (=> b!216684 (= e!147380 (arrayBitRangesEq!0 (buf!5189 (_2!9886 lt!340128)) (buf!5189 (ite c!10537 (_2!9886 lt!340128) (_2!9886 lt!341443))) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340128))) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128)))))))

(assert (= (and d!73465 res!182280) b!216682))

(assert (= (and b!216682 res!182278) b!216683))

(assert (= (and b!216683 (not res!182279)) b!216684))

(assert (=> b!216682 m!331623))

(declare-fun m!334369 () Bool)

(assert (=> b!216682 m!334369))

(assert (=> b!216684 m!331623))

(assert (=> b!216684 m!331623))

(declare-fun m!334371 () Bool)

(assert (=> b!216684 m!334371))

(assert (=> bm!3366 d!73465))

(declare-fun d!73467 () Bool)

(declare-fun e!147381 () Bool)

(assert (=> d!73467 e!147381))

(declare-fun res!182281 () Bool)

(assert (=> d!73467 (=> (not res!182281) (not e!147381))))

(assert (=> d!73467 (= res!182281 (= (buf!5189 (_2!9886 (increaseBitIndex!0 (_1!9885 lt!340143)))) (buf!5189 (_1!9885 lt!340143))))))

(declare-fun lt!342684 () Bool)

(assert (=> d!73467 (= lt!342684 (not (= (bvand ((_ sign_extend 24) (select (arr!5584 (buf!5189 (_1!9885 lt!340143))) (currentByte!9767 (_1!9885 lt!340143)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9762 (_1!9885 lt!340143))))) #b00000000000000000000000000000000)))))

(declare-fun lt!342687 () tuple2!18492)

(assert (=> d!73467 (= lt!342687 (tuple2!18493 (not (= (bvand ((_ sign_extend 24) (select (arr!5584 (buf!5189 (_1!9885 lt!340143))) (currentByte!9767 (_1!9885 lt!340143)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9762 (_1!9885 lt!340143))))) #b00000000000000000000000000000000)) (_2!9886 (increaseBitIndex!0 (_1!9885 lt!340143)))))))

(assert (=> d!73467 (validate_offset_bit!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9885 lt!340143)))) ((_ sign_extend 32) (currentByte!9767 (_1!9885 lt!340143))) ((_ sign_extend 32) (currentBit!9762 (_1!9885 lt!340143))))))

(assert (=> d!73467 (= (readBit!0 (_1!9885 lt!340143)) lt!342687)))

(declare-fun lt!342685 () (_ BitVec 64))

(declare-fun b!216685 () Bool)

(declare-fun lt!342688 () (_ BitVec 64))

(assert (=> b!216685 (= e!147381 (= (bitIndex!0 (size!4654 (buf!5189 (_2!9886 (increaseBitIndex!0 (_1!9885 lt!340143))))) (currentByte!9767 (_2!9886 (increaseBitIndex!0 (_1!9885 lt!340143)))) (currentBit!9762 (_2!9886 (increaseBitIndex!0 (_1!9885 lt!340143))))) (bvadd lt!342688 lt!342685)))))

(assert (=> b!216685 (or (not (= (bvand lt!342688 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342685 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342688 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342688 lt!342685) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216685 (= lt!342685 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!216685 (= lt!342688 (bitIndex!0 (size!4654 (buf!5189 (_1!9885 lt!340143))) (currentByte!9767 (_1!9885 lt!340143)) (currentBit!9762 (_1!9885 lt!340143))))))

(declare-fun lt!342689 () Bool)

(assert (=> b!216685 (= lt!342689 (not (= (bvand ((_ sign_extend 24) (select (arr!5584 (buf!5189 (_1!9885 lt!340143))) (currentByte!9767 (_1!9885 lt!340143)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9762 (_1!9885 lt!340143))))) #b00000000000000000000000000000000)))))

(declare-fun lt!342683 () Bool)

(assert (=> b!216685 (= lt!342683 (not (= (bvand ((_ sign_extend 24) (select (arr!5584 (buf!5189 (_1!9885 lt!340143))) (currentByte!9767 (_1!9885 lt!340143)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9762 (_1!9885 lt!340143))))) #b00000000000000000000000000000000)))))

(declare-fun lt!342686 () Bool)

(assert (=> b!216685 (= lt!342686 (not (= (bvand ((_ sign_extend 24) (select (arr!5584 (buf!5189 (_1!9885 lt!340143))) (currentByte!9767 (_1!9885 lt!340143)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9762 (_1!9885 lt!340143))))) #b00000000000000000000000000000000)))))

(assert (= (and d!73467 res!182281) b!216685))

(declare-fun m!334373 () Bool)

(assert (=> d!73467 m!334373))

(declare-fun m!334375 () Bool)

(assert (=> d!73467 m!334375))

(declare-fun m!334377 () Bool)

(assert (=> d!73467 m!334377))

(declare-fun m!334379 () Bool)

(assert (=> d!73467 m!334379))

(assert (=> b!216685 m!334377))

(declare-fun m!334381 () Bool)

(assert (=> b!216685 m!334381))

(assert (=> b!216685 m!334375))

(assert (=> b!216685 m!332027))

(assert (=> b!216685 m!334373))

(assert (=> d!72697 d!73467))

(assert (=> b!215696 d!72679))

(assert (=> b!215654 d!72569))

(assert (=> b!215654 d!72707))

(declare-fun b!216697 () Bool)

(declare-fun e!147392 () Bool)

(declare-fun e!147391 () Bool)

(assert (=> b!216697 (= e!147392 e!147391)))

(declare-fun res!182291 () Bool)

(assert (=> b!216697 (=> (not res!182291) (not e!147391))))

(declare-fun lt!342692 () tuple2!18464)

(declare-fun _$19!177 () tuple2!18462)

(assert (=> b!216697 (= res!182291 (and (= (_2!9887 lt!342692) lt!340152) (= (_1!9887 lt!342692) (_2!9886 _$19!177))))))

(assert (=> b!216697 (= lt!342692 (readBitPure!0 (readerFrom!0 (_2!9886 _$19!177) (currentBit!9762 thiss!1204) (currentByte!9767 thiss!1204))))))

(declare-fun b!216698 () Bool)

(assert (=> b!216698 (= e!147391 (= (bitIndex!0 (size!4654 (buf!5189 (_1!9887 lt!342692))) (currentByte!9767 (_1!9887 lt!342692)) (currentBit!9762 (_1!9887 lt!342692))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 _$19!177))) (currentByte!9767 (_2!9886 _$19!177)) (currentBit!9762 (_2!9886 _$19!177)))))))

(declare-fun d!73469 () Bool)

(assert (=> d!73469 e!147392))

(declare-fun res!182290 () Bool)

(assert (=> d!73469 (=> (not res!182290) (not e!147392))))

(assert (=> d!73469 (= res!182290 (= (size!4654 (buf!5189 thiss!1204)) (size!4654 (buf!5189 (_2!9886 _$19!177)))))))

(declare-fun e!147393 () Bool)

(assert (=> d!73469 (and (inv!12 (_2!9886 _$19!177)) e!147393)))

(assert (=> d!73469 (= (choose!16 thiss!1204 lt!340152) _$19!177)))

(declare-fun b!216699 () Bool)

(assert (=> b!216699 (= e!147393 (array_inv!4395 (buf!5189 (_2!9886 _$19!177))))))

(declare-fun b!216700 () Bool)

(declare-fun res!182292 () Bool)

(assert (=> b!216700 (=> (not res!182292) (not e!147392))))

(assert (=> b!216700 (= res!182292 (isPrefixOf!0 thiss!1204 (_2!9886 _$19!177)))))

(declare-fun b!216701 () Bool)

(declare-fun res!182293 () Bool)

(assert (=> b!216701 (=> (not res!182293) (not e!147392))))

(assert (=> b!216701 (= res!182293 (= (bitIndex!0 (size!4654 (buf!5189 (_2!9886 _$19!177))) (currentByte!9767 (_2!9886 _$19!177)) (currentBit!9762 (_2!9886 _$19!177))) (bvadd (bitIndex!0 (size!4654 (buf!5189 thiss!1204)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= d!73469 b!216699))

(assert (= (and d!73469 res!182290) b!216701))

(assert (= (and b!216701 res!182293) b!216700))

(assert (= (and b!216700 res!182292) b!216697))

(assert (= (and b!216697 res!182291) b!216698))

(declare-fun m!334383 () Bool)

(assert (=> b!216697 m!334383))

(assert (=> b!216697 m!334383))

(declare-fun m!334385 () Bool)

(assert (=> b!216697 m!334385))

(declare-fun m!334387 () Bool)

(assert (=> b!216698 m!334387))

(declare-fun m!334389 () Bool)

(assert (=> b!216698 m!334389))

(assert (=> b!216701 m!334389))

(assert (=> b!216701 m!331625))

(declare-fun m!334391 () Bool)

(assert (=> d!73469 m!334391))

(declare-fun m!334393 () Bool)

(assert (=> b!216700 m!334393))

(declare-fun m!334395 () Bool)

(assert (=> b!216699 m!334395))

(assert (=> d!72583 d!73469))

(declare-fun d!73471 () Bool)

(assert (=> d!73471 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4654 (buf!5189 thiss!1204))) ((_ sign_extend 32) (currentByte!9767 thiss!1204)) ((_ sign_extend 32) (currentBit!9762 thiss!1204))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 thiss!1204))) ((_ sign_extend 32) (currentByte!9767 thiss!1204)) ((_ sign_extend 32) (currentBit!9762 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!17949 () Bool)

(assert (= bs!17949 d!73471))

(assert (=> bs!17949 m!332045))

(assert (=> d!72583 d!73471))

(declare-fun d!73473 () Bool)

(declare-fun e!147394 () Bool)

(assert (=> d!73473 e!147394))

(declare-fun res!182295 () Bool)

(assert (=> d!73473 (=> (not res!182295) (not e!147394))))

(declare-fun lt!342698 () (_ BitVec 64))

(declare-fun lt!342694 () (_ BitVec 64))

(declare-fun lt!342693 () (_ BitVec 64))

(assert (=> d!73473 (= res!182295 (= lt!342698 (bvsub lt!342694 lt!342693)))))

(assert (=> d!73473 (or (= (bvand lt!342694 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342693 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342694 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342694 lt!342693) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73473 (= lt!342693 (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!340671)))) ((_ sign_extend 32) (currentByte!9767 (_1!9887 lt!340671))) ((_ sign_extend 32) (currentBit!9762 (_1!9887 lt!340671)))))))

(declare-fun lt!342695 () (_ BitVec 64))

(declare-fun lt!342697 () (_ BitVec 64))

(assert (=> d!73473 (= lt!342694 (bvmul lt!342695 lt!342697))))

(assert (=> d!73473 (or (= lt!342695 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342697 (bvsdiv (bvmul lt!342695 lt!342697) lt!342695)))))

(assert (=> d!73473 (= lt!342697 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73473 (= lt!342695 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!340671)))))))

(assert (=> d!73473 (= lt!342698 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_1!9887 lt!340671))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_1!9887 lt!340671)))))))

(assert (=> d!73473 (invariant!0 (currentBit!9762 (_1!9887 lt!340671)) (currentByte!9767 (_1!9887 lt!340671)) (size!4654 (buf!5189 (_1!9887 lt!340671))))))

(assert (=> d!73473 (= (bitIndex!0 (size!4654 (buf!5189 (_1!9887 lt!340671))) (currentByte!9767 (_1!9887 lt!340671)) (currentBit!9762 (_1!9887 lt!340671))) lt!342698)))

(declare-fun b!216702 () Bool)

(declare-fun res!182294 () Bool)

(assert (=> b!216702 (=> (not res!182294) (not e!147394))))

(assert (=> b!216702 (= res!182294 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342698))))

(declare-fun b!216703 () Bool)

(declare-fun lt!342696 () (_ BitVec 64))

(assert (=> b!216703 (= e!147394 (bvsle lt!342698 (bvmul lt!342696 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216703 (or (= lt!342696 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!342696 #b0000000000000000000000000000000000000000000000000000000000001000) lt!342696)))))

(assert (=> b!216703 (= lt!342696 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9887 lt!340671)))))))

(assert (= (and d!73473 res!182295) b!216702))

(assert (= (and b!216702 res!182294) b!216703))

(declare-fun m!334397 () Bool)

(assert (=> d!73473 m!334397))

(declare-fun m!334399 () Bool)

(assert (=> d!73473 m!334399))

(assert (=> b!215684 d!73473))

(assert (=> b!215684 d!73403))

(declare-fun d!73475 () Bool)

(declare-fun e!147395 () Bool)

(assert (=> d!73475 e!147395))

(declare-fun res!182297 () Bool)

(assert (=> d!73475 (=> (not res!182297) (not e!147395))))

(declare-fun lt!342704 () (_ BitVec 64))

(declare-fun lt!342700 () (_ BitVec 64))

(declare-fun lt!342699 () (_ BitVec 64))

(assert (=> d!73475 (= res!182297 (= lt!342704 (bvsub lt!342700 lt!342699)))))

(assert (=> d!73475 (or (= (bvand lt!342700 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342699 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342700 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342700 lt!342699) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73475 (= lt!342699 (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341432)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!341432))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!341432)))))))

(declare-fun lt!342701 () (_ BitVec 64))

(declare-fun lt!342703 () (_ BitVec 64))

(assert (=> d!73475 (= lt!342700 (bvmul lt!342701 lt!342703))))

(assert (=> d!73475 (or (= lt!342701 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342703 (bvsdiv (bvmul lt!342701 lt!342703) lt!342701)))))

(assert (=> d!73475 (= lt!342703 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73475 (= lt!342701 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341432)))))))

(assert (=> d!73475 (= lt!342704 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!341432))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!341432)))))))

(assert (=> d!73475 (invariant!0 (currentBit!9762 (_2!9886 lt!341432)) (currentByte!9767 (_2!9886 lt!341432)) (size!4654 (buf!5189 (_2!9886 lt!341432))))))

(assert (=> d!73475 (= (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!341432))) (currentByte!9767 (_2!9886 lt!341432)) (currentBit!9762 (_2!9886 lt!341432))) lt!342704)))

(declare-fun b!216704 () Bool)

(declare-fun res!182296 () Bool)

(assert (=> b!216704 (=> (not res!182296) (not e!147395))))

(assert (=> b!216704 (= res!182296 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342704))))

(declare-fun b!216705 () Bool)

(declare-fun lt!342702 () (_ BitVec 64))

(assert (=> b!216705 (= e!147395 (bvsle lt!342704 (bvmul lt!342702 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216705 (or (= lt!342702 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!342702 #b0000000000000000000000000000000000000000000000000000000000001000) lt!342702)))))

(assert (=> b!216705 (= lt!342702 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!341432)))))))

(assert (= (and d!73475 res!182297) b!216704))

(assert (= (and b!216704 res!182296) b!216705))

(declare-fun m!334401 () Bool)

(assert (=> d!73475 m!334401))

(assert (=> d!73475 m!332631))

(assert (=> b!215933 d!73475))

(assert (=> b!215933 d!72569))

(declare-fun d!73477 () Bool)

(declare-fun res!182300 () Bool)

(declare-fun e!147396 () Bool)

(assert (=> d!73477 (=> (not res!182300) (not e!147396))))

(assert (=> d!73477 (= res!182300 (= (size!4654 (buf!5189 thiss!1204)) (size!4654 (buf!5189 (_2!9886 lt!340670)))))))

(assert (=> d!73477 (= (isPrefixOf!0 thiss!1204 (_2!9886 lt!340670)) e!147396)))

(declare-fun b!216706 () Bool)

(declare-fun res!182298 () Bool)

(assert (=> b!216706 (=> (not res!182298) (not e!147396))))

(assert (=> b!216706 (= res!182298 (bvsle (bitIndex!0 (size!4654 (buf!5189 thiss!1204)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204)) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340670))) (currentByte!9767 (_2!9886 lt!340670)) (currentBit!9762 (_2!9886 lt!340670)))))))

(declare-fun b!216707 () Bool)

(declare-fun e!147397 () Bool)

(assert (=> b!216707 (= e!147396 e!147397)))

(declare-fun res!182299 () Bool)

(assert (=> b!216707 (=> res!182299 e!147397)))

(assert (=> b!216707 (= res!182299 (= (size!4654 (buf!5189 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!216708 () Bool)

(assert (=> b!216708 (= e!147397 (arrayBitRangesEq!0 (buf!5189 thiss!1204) (buf!5189 (_2!9886 lt!340670)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 thiss!1204)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))))))

(assert (= (and d!73477 res!182300) b!216706))

(assert (= (and b!216706 res!182298) b!216707))

(assert (= (and b!216707 (not res!182299)) b!216708))

(assert (=> b!216706 m!331625))

(assert (=> b!216706 m!332095))

(assert (=> b!216708 m!331625))

(assert (=> b!216708 m!331625))

(declare-fun m!334403 () Bool)

(assert (=> b!216708 m!334403))

(assert (=> b!215682 d!73477))

(assert (=> d!72657 d!72699))

(declare-fun d!73479 () Bool)

(assert (=> d!73479 (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340151)))) ((_ sign_extend 32) (currentByte!9767 thiss!1204)) ((_ sign_extend 32) (currentBit!9762 thiss!1204)) lt!340135)))

(assert (=> d!73479 true))

(declare-fun _$6!398 () Unit!15292)

(assert (=> d!73479 (= (choose!9 thiss!1204 (buf!5189 (_2!9886 lt!340151)) lt!340135 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 thiss!1204) (currentBit!9762 thiss!1204))) _$6!398)))

(declare-fun bs!17950 () Bool)

(assert (= bs!17950 d!73479))

(assert (=> bs!17950 m!331687))

(assert (=> d!72657 d!73479))

(declare-fun d!73481 () Bool)

(declare-fun res!182303 () Bool)

(declare-fun e!147398 () Bool)

(assert (=> d!73481 (=> (not res!182303) (not e!147398))))

(assert (=> d!73481 (= res!182303 (= (size!4654 (buf!5189 (_2!9885 lt!340909))) (size!4654 (buf!5189 (_2!9886 lt!340151)))))))

(assert (=> d!73481 (= (isPrefixOf!0 (_2!9885 lt!340909) (_2!9886 lt!340151)) e!147398)))

(declare-fun b!216709 () Bool)

(declare-fun res!182301 () Bool)

(assert (=> b!216709 (=> (not res!182301) (not e!147398))))

(assert (=> b!216709 (= res!182301 (bvsle (bitIndex!0 (size!4654 (buf!5189 (_2!9885 lt!340909))) (currentByte!9767 (_2!9885 lt!340909)) (currentBit!9762 (_2!9885 lt!340909))) (bitIndex!0 (size!4654 (buf!5189 (_2!9886 lt!340151))) (currentByte!9767 (_2!9886 lt!340151)) (currentBit!9762 (_2!9886 lt!340151)))))))

(declare-fun b!216710 () Bool)

(declare-fun e!147399 () Bool)

(assert (=> b!216710 (= e!147398 e!147399)))

(declare-fun res!182302 () Bool)

(assert (=> b!216710 (=> res!182302 e!147399)))

(assert (=> b!216710 (= res!182302 (= (size!4654 (buf!5189 (_2!9885 lt!340909))) #b00000000000000000000000000000000))))

(declare-fun b!216711 () Bool)

(assert (=> b!216711 (= e!147399 (arrayBitRangesEq!0 (buf!5189 (_2!9885 lt!340909)) (buf!5189 (_2!9886 lt!340151)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4654 (buf!5189 (_2!9885 lt!340909))) (currentByte!9767 (_2!9885 lt!340909)) (currentBit!9762 (_2!9885 lt!340909)))))))

(assert (= (and d!73481 res!182303) b!216709))

(assert (= (and b!216709 res!182301) b!216710))

(assert (= (and b!216710 (not res!182302)) b!216711))

(assert (=> b!216709 m!333889))

(assert (=> b!216709 m!331661))

(assert (=> b!216711 m!333889))

(assert (=> b!216711 m!333889))

(declare-fun m!334405 () Bool)

(assert (=> b!216711 m!334405))

(assert (=> b!215770 d!73481))

(declare-fun d!73483 () Bool)

(assert (=> d!73483 (= (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9885 lt!340143)))) ((_ sign_extend 32) (currentByte!9767 (_2!9885 lt!340143))) ((_ sign_extend 32) (currentBit!9762 (_2!9885 lt!340143)))) (bvsub (bvmul ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9885 lt!340143)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_2!9885 lt!340143))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_2!9885 lt!340143))))))))

(assert (=> d!72567 d!73483))

(declare-fun d!73485 () Bool)

(assert (=> d!73485 (= (invariant!0 (currentBit!9762 (_2!9885 lt!340143)) (currentByte!9767 (_2!9885 lt!340143)) (size!4654 (buf!5189 (_2!9885 lt!340143)))) (and (bvsge (currentBit!9762 (_2!9885 lt!340143)) #b00000000000000000000000000000000) (bvslt (currentBit!9762 (_2!9885 lt!340143)) #b00000000000000000000000000001000) (bvsge (currentByte!9767 (_2!9885 lt!340143)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9767 (_2!9885 lt!340143)) (size!4654 (buf!5189 (_2!9885 lt!340143)))) (and (= (currentBit!9762 (_2!9885 lt!340143)) #b00000000000000000000000000000000) (= (currentByte!9767 (_2!9885 lt!340143)) (size!4654 (buf!5189 (_2!9885 lt!340143))))))))))

(assert (=> d!72567 d!73485))

(assert (=> d!72695 d!72661))

(declare-fun d!73487 () Bool)

(assert (=> d!73487 (validate_offset_bits!1 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340151)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340128))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340128))) lt!340130)))

(assert (=> d!73487 true))

(declare-fun _$6!399 () Unit!15292)

(assert (=> d!73487 (= (choose!9 (_2!9886 lt!340128) (buf!5189 (_2!9886 lt!340151)) lt!340130 (BitStream!8417 (buf!5189 (_2!9886 lt!340151)) (currentByte!9767 (_2!9886 lt!340128)) (currentBit!9762 (_2!9886 lt!340128)))) _$6!399)))

(declare-fun bs!17951 () Bool)

(assert (= bs!17951 d!73487))

(assert (=> bs!17951 m!331703))

(assert (=> d!72695 d!73487))

(assert (=> b!215927 d!73395))

(assert (=> b!215927 d!72569))

(declare-fun d!73489 () Bool)

(assert (=> d!73489 (= (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9884 lt!340127)))) ((_ sign_extend 32) (currentByte!9767 (_1!9884 lt!340127))) ((_ sign_extend 32) (currentBit!9762 (_1!9884 lt!340127)))) (bvsub (bvmul ((_ sign_extend 32) (size!4654 (buf!5189 (_1!9884 lt!340127)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_1!9884 lt!340127))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_1!9884 lt!340127))))))))

(assert (=> d!72565 d!73489))

(declare-fun d!73491 () Bool)

(assert (=> d!73491 (= (invariant!0 (currentBit!9762 (_1!9884 lt!340127)) (currentByte!9767 (_1!9884 lt!340127)) (size!4654 (buf!5189 (_1!9884 lt!340127)))) (and (bvsge (currentBit!9762 (_1!9884 lt!340127)) #b00000000000000000000000000000000) (bvslt (currentBit!9762 (_1!9884 lt!340127)) #b00000000000000000000000000001000) (bvsge (currentByte!9767 (_1!9884 lt!340127)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9767 (_1!9884 lt!340127)) (size!4654 (buf!5189 (_1!9884 lt!340127)))) (and (= (currentBit!9762 (_1!9884 lt!340127)) #b00000000000000000000000000000000) (= (currentByte!9767 (_1!9884 lt!340127)) (size!4654 (buf!5189 (_1!9884 lt!340127))))))))))

(assert (=> d!72565 d!73491))

(declare-fun d!73493 () Bool)

(assert (=> d!73493 (= (remainingBits!0 ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340151)))) ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340128))) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340128)))) (bvsub (bvmul ((_ sign_extend 32) (size!4654 (buf!5189 (_2!9886 lt!340151)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9767 (_2!9886 lt!340128))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9762 (_2!9886 lt!340128))))))))

(assert (=> d!72661 d!73493))

(push 1)

(assert (not b!216625))

(assert (not b!216624))

(assert (not b!216592))

(assert (not d!73467))

(assert (not d!73449))

(assert (not b!216682))

(assert (not b!216578))

(assert (not b!216709))

(assert (not d!73281))

(assert (not b!216627))

(assert (not b!216700))

(assert (not b!216524))

(assert (not b!216622))

(assert (not d!73271))

(assert (not b!216573))

(assert (not b!216642))

(assert (not b!216474))

(assert (not b!216658))

(assert (not d!73469))

(assert (not b!216669))

(assert (not b!216657))

(assert (not b!216575))

(assert (not d!73293))

(assert (not b!216647))

(assert (not b!216632))

(assert (not b!216543))

(assert (not b!216604))

(assert (not bm!3385))

(assert (not b!216610))

(assert (not d!73311))

(assert (not b!216662))

(assert (not b!216665))

(assert (not b!216534))

(assert (not b!216588))

(assert (not d!73413))

(assert (not b!216599))

(assert (not b!216556))

(assert (not d!73335))

(assert (not b!216470))

(assert (not b!216585))

(assert (not d!73405))

(assert (not d!73369))

(assert (not b!216591))

(assert (not b!216677))

(assert (not d!73347))

(assert (not bm!3387))

(assert (not b!216681))

(assert (not b!216514))

(assert (not d!73475))

(assert (not d!73409))

(assert (not b!216571))

(assert (not b!216492))

(assert (not b!216525))

(assert (not d!73291))

(assert (not d!73243))

(assert (not b!216558))

(assert (not d!73319))

(assert (not d!73315))

(assert (not d!73367))

(assert (not d!73341))

(assert (not b!216663))

(assert (not b!216671))

(assert (not d!73445))

(assert (not b!216685))

(assert (not b!216586))

(assert (not b!216615))

(assert (not d!73395))

(assert (not d!73479))

(assert (not b!216602))

(assert (not d!73383))

(assert (not bm!3390))

(assert (not d!73487))

(assert (not d!73325))

(assert (not d!73353))

(assert (not d!73437))

(assert (not b!216659))

(assert (not d!73419))

(assert (not b!216540))

(assert (not b!216613))

(assert (not d!73377))

(assert (not d!73255))

(assert (not d!73269))

(assert (not b!216679))

(assert (not d!73403))

(assert (not b!216476))

(assert (not d!73447))

(assert (not d!73379))

(assert (not b!216601))

(assert (not b!216664))

(assert (not d!73343))

(assert (not b!216499))

(assert (not b!216673))

(assert (not b!216699))

(assert (not b!216529))

(assert (not b!216590))

(assert (not d!73257))

(assert (not b!216684))

(assert (not b!216516))

(assert (not d!73309))

(assert (not b!216576))

(assert (not b!216634))

(assert (not d!73473))

(assert (not d!73365))

(assert (not b!216640))

(assert (not d!73345))

(assert (not d!73305))

(assert (not d!73359))

(assert (not b!216536))

(assert (not b!216628))

(assert (not d!73381))

(assert (not d!73451))

(assert (not d!73459))

(assert (not b!216711))

(assert (not b!216527))

(assert (not b!216565))

(assert (not d!73267))

(assert (not b!216698))

(assert (not d!73329))

(assert (not d!73295))

(assert (not d!73455))

(assert (not bm!3388))

(assert (not b!216577))

(assert (not b!216630))

(assert (not b!216487))

(assert (not d!73385))

(assert (not d!73435))

(assert (not d!73327))

(assert (not b!216497))

(assert (not b!216523))

(assert (not b!216526))

(assert (not d!73423))

(assert (not d!73323))

(assert (not b!216587))

(assert (not b!216635))

(assert (not b!216598))

(assert (not b!216478))

(assert (not b!216579))

(assert (not d!73307))

(assert (not d!73279))

(assert (not b!216636))

(assert (not b!216597))

(assert (not b!216583))

(assert (not d!73443))

(assert (not b!216533))

(assert (not b!216566))

(assert (not d!73349))

(assert (not d!73331))

(assert (not b!216643))

(assert (not d!73453))

(assert (not d!73373))

(assert (not b!216542))

(assert (not b!216545))

(assert (not d!73253))

(assert (not b!216701))

(assert (not b!216611))

(assert (not d!73289))

(assert (not d!73333))

(assert (not b!216655))

(assert (not b!216619))

(assert (not d!73363))

(assert (not b!216519))

(assert (not b!216531))

(assert (not bm!3386))

(assert (not b!216621))

(assert (not b!216537))

(assert (not d!73393))

(assert (not b!216612))

(assert (not d!73399))

(assert (not b!216708))

(assert (not b!216706))

(assert (not b!216539))

(assert (not b!216609))

(assert (not b!216697))

(assert (not d!73407))

(assert (not d!73397))

(assert (not b!216600))

(assert (not d!73355))

(assert (not b!216661))

(assert (not b!216517))

(assert (not b!216515))

(assert (not d!73471))

(assert (not d!73361))

(assert (not d!73337))

(assert (not b!216572))

(assert (not d!73299))

(assert (not d!73317))

(assert (not d!73351))

(assert (not b!216672))

(assert (not b!216469))

(assert (not bm!3389))

(check-sat)

(pop 1)

(push 1)

(check-sat)

