; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44800 () Bool)

(assert start!44800)

(declare-fun b!214286 () Bool)

(declare-fun res!180148 () Bool)

(declare-fun e!145881 () Bool)

(assert (=> b!214286 (=> (not res!180148) (not e!145881))))

(declare-datatypes ((array!10563 0))(
  ( (array!10564 (arr!5568 (Array (_ BitVec 32) (_ BitVec 8))) (size!4638 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8384 0))(
  ( (BitStream!8385 (buf!5173 array!10563) (currentByte!9751 (_ BitVec 32)) (currentBit!9746 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8384)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!214286 (= res!180148 (invariant!0 (currentBit!9746 thiss!1204) (currentByte!9751 thiss!1204) (size!4638 (buf!5173 thiss!1204))))))

(declare-fun b!214287 () Bool)

(declare-fun res!180147 () Bool)

(declare-fun e!145883 () Bool)

(assert (=> b!214287 (=> res!180147 e!145883)))

(declare-datatypes ((Unit!15260 0))(
  ( (Unit!15261) )
))
(declare-datatypes ((tuple2!18330 0))(
  ( (tuple2!18331 (_1!9820 Unit!15260) (_2!9820 BitStream!8384)) )
))
(declare-fun lt!338757 () tuple2!18330)

(declare-fun lt!338759 () tuple2!18330)

(declare-fun isPrefixOf!0 (BitStream!8384 BitStream!8384) Bool)

(assert (=> b!214287 (= res!180147 (not (isPrefixOf!0 (_2!9820 lt!338757) (_2!9820 lt!338759))))))

(declare-fun b!214288 () Bool)

(declare-fun res!180136 () Bool)

(declare-fun e!145880 () Bool)

(assert (=> b!214288 (=> (not res!180136) (not e!145880))))

(declare-fun lt!338741 () (_ BitVec 64))

(declare-datatypes ((tuple2!18332 0))(
  ( (tuple2!18333 (_1!9821 BitStream!8384) (_2!9821 BitStream!8384)) )
))
(declare-fun lt!338751 () tuple2!18332)

(declare-fun lt!338754 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8384 (_ BitVec 64)) BitStream!8384)

(assert (=> b!214288 (= res!180136 (= (_1!9821 lt!338751) (withMovedBitIndex!0 (_2!9821 lt!338751) (bvsub lt!338754 lt!338741))))))

(declare-fun b!214289 () Bool)

(declare-fun e!145891 () Bool)

(declare-datatypes ((tuple2!18334 0))(
  ( (tuple2!18335 (_1!9822 BitStream!8384) (_2!9822 Bool)) )
))
(declare-fun lt!338748 () tuple2!18334)

(declare-fun lt!338740 () tuple2!18334)

(assert (=> b!214289 (= e!145891 (= (_2!9822 lt!338748) (_2!9822 lt!338740)))))

(declare-fun b!214290 () Bool)

(declare-fun e!145886 () Bool)

(assert (=> b!214290 (= e!145886 (invariant!0 (currentBit!9746 thiss!1204) (currentByte!9751 thiss!1204) (size!4638 (buf!5173 (_2!9820 lt!338759)))))))

(declare-fun b!214291 () Bool)

(declare-fun e!145889 () Bool)

(assert (=> b!214291 (= e!145889 true)))

(assert (=> b!214291 (= (size!4638 (buf!5173 thiss!1204)) (size!4638 (buf!5173 (_2!9820 lt!338759))))))

(declare-fun b!214292 () Bool)

(declare-fun res!180145 () Bool)

(assert (=> b!214292 (=> res!180145 e!145889)))

(declare-datatypes ((tuple2!18336 0))(
  ( (tuple2!18337 (_1!9823 BitStream!8384) (_2!9823 (_ BitVec 64))) )
))
(declare-fun lt!338747 () tuple2!18336)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!214292 (= res!180145 (not (= (bitIndex!0 (size!4638 (buf!5173 (_1!9823 lt!338747))) (currentByte!9751 (_1!9823 lt!338747)) (currentBit!9746 (_1!9823 lt!338747))) (bitIndex!0 (size!4638 (buf!5173 (_2!9821 lt!338751))) (currentByte!9751 (_2!9821 lt!338751)) (currentBit!9746 (_2!9821 lt!338751))))))))

(declare-fun b!214293 () Bool)

(declare-fun res!180137 () Bool)

(assert (=> b!214293 (=> res!180137 e!145883)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!214293 (= res!180137 (or (not (= (size!4638 (buf!5173 (_2!9820 lt!338759))) (size!4638 (buf!5173 thiss!1204)))) (not (= lt!338741 (bvsub (bvadd lt!338754 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!214294 () Bool)

(declare-fun e!145884 () Bool)

(declare-fun e!145893 () Bool)

(assert (=> b!214294 (= e!145884 e!145893)))

(declare-fun res!180139 () Bool)

(assert (=> b!214294 (=> (not res!180139) (not e!145893))))

(declare-fun lt!338745 () tuple2!18334)

(declare-fun lt!338749 () Bool)

(assert (=> b!214294 (= res!180139 (and (= (_2!9822 lt!338745) lt!338749) (= (_1!9822 lt!338745) (_2!9820 lt!338757))))))

(declare-fun readBitPure!0 (BitStream!8384) tuple2!18334)

(declare-fun readerFrom!0 (BitStream!8384 (_ BitVec 32) (_ BitVec 32)) BitStream!8384)

(assert (=> b!214294 (= lt!338745 (readBitPure!0 (readerFrom!0 (_2!9820 lt!338757) (currentBit!9746 thiss!1204) (currentByte!9751 thiss!1204))))))

(declare-fun res!180133 () Bool)

(declare-fun e!145885 () Bool)

(assert (=> start!44800 (=> (not res!180133) (not e!145885))))

(assert (=> start!44800 (= res!180133 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44800 e!145885))

(assert (=> start!44800 true))

(declare-fun e!145882 () Bool)

(declare-fun inv!12 (BitStream!8384) Bool)

(assert (=> start!44800 (and (inv!12 thiss!1204) e!145882)))

(declare-fun b!214295 () Bool)

(declare-fun lt!338760 () (_ BitVec 64))

(assert (=> b!214295 (= e!145893 (= (bitIndex!0 (size!4638 (buf!5173 (_1!9822 lt!338745))) (currentByte!9751 (_1!9822 lt!338745)) (currentBit!9746 (_1!9822 lt!338745))) lt!338760))))

(declare-fun b!214296 () Bool)

(declare-fun res!180141 () Bool)

(assert (=> b!214296 (=> res!180141 e!145883)))

(assert (=> b!214296 (= res!180141 (not (isPrefixOf!0 thiss!1204 (_2!9820 lt!338757))))))

(declare-fun b!214297 () Bool)

(declare-fun e!145887 () Bool)

(assert (=> b!214297 (= e!145887 e!145883)))

(declare-fun res!180146 () Bool)

(assert (=> b!214297 (=> res!180146 e!145883)))

(declare-fun lt!338739 () (_ BitVec 64))

(assert (=> b!214297 (= res!180146 (not (= lt!338741 (bvsub (bvsub (bvadd lt!338739 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!214297 (= lt!338741 (bitIndex!0 (size!4638 (buf!5173 (_2!9820 lt!338759))) (currentByte!9751 (_2!9820 lt!338759)) (currentBit!9746 (_2!9820 lt!338759))))))

(assert (=> b!214297 (isPrefixOf!0 thiss!1204 (_2!9820 lt!338759))))

(declare-fun lt!338758 () Unit!15260)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8384 BitStream!8384 BitStream!8384) Unit!15260)

(assert (=> b!214297 (= lt!338758 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9820 lt!338757) (_2!9820 lt!338759)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8384 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18330)

(assert (=> b!214297 (= lt!338759 (appendBitsLSBFirstLoopTR!0 (_2!9820 lt!338757) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!214298 () Bool)

(declare-fun res!180131 () Bool)

(assert (=> b!214298 (=> res!180131 e!145883)))

(assert (=> b!214298 (= res!180131 (not (invariant!0 (currentBit!9746 (_2!9820 lt!338759)) (currentByte!9751 (_2!9820 lt!338759)) (size!4638 (buf!5173 (_2!9820 lt!338759))))))))

(declare-fun lt!338736 () BitStream!8384)

(declare-fun lt!338744 () tuple2!18332)

(declare-fun lt!338753 () tuple2!18336)

(declare-fun b!214299 () Bool)

(assert (=> b!214299 (= e!145880 (and (= lt!338754 (bvsub lt!338739 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9821 lt!338744) lt!338736)) (= (_2!9823 lt!338747) (_2!9823 lt!338753)))))))

(declare-fun b!214300 () Bool)

(declare-fun res!180129 () Bool)

(assert (=> b!214300 (=> (not res!180129) (not e!145884))))

(assert (=> b!214300 (= res!180129 (isPrefixOf!0 thiss!1204 (_2!9820 lt!338757)))))

(declare-fun b!214301 () Bool)

(assert (=> b!214301 (= e!145885 e!145881)))

(declare-fun res!180149 () Bool)

(assert (=> b!214301 (=> (not res!180149) (not e!145881))))

(declare-fun lt!338761 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!214301 (= res!180149 (validate_offset_bits!1 ((_ sign_extend 32) (size!4638 (buf!5173 thiss!1204))) ((_ sign_extend 32) (currentByte!9751 thiss!1204)) ((_ sign_extend 32) (currentBit!9746 thiss!1204)) lt!338761))))

(assert (=> b!214301 (= lt!338761 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!214302 () Bool)

(declare-fun e!145892 () Bool)

(assert (=> b!214302 (= e!145883 e!145892)))

(declare-fun res!180142 () Bool)

(assert (=> b!214302 (=> res!180142 e!145892)))

(assert (=> b!214302 (= res!180142 (not (= (_1!9823 lt!338753) (_2!9821 lt!338744))))))

(declare-fun lt!338752 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8384 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18336)

(assert (=> b!214302 (= lt!338753 (readNBitsLSBFirstsLoopPure!0 (_1!9821 lt!338744) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!338752))))

(declare-fun lt!338755 () (_ BitVec 64))

(assert (=> b!214302 (validate_offset_bits!1 ((_ sign_extend 32) (size!4638 (buf!5173 (_2!9820 lt!338759)))) ((_ sign_extend 32) (currentByte!9751 (_2!9820 lt!338757))) ((_ sign_extend 32) (currentBit!9746 (_2!9820 lt!338757))) lt!338755)))

(declare-fun lt!338750 () Unit!15260)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8384 array!10563 (_ BitVec 64)) Unit!15260)

(assert (=> b!214302 (= lt!338750 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9820 lt!338757) (buf!5173 (_2!9820 lt!338759)) lt!338755))))

(assert (=> b!214302 (= lt!338755 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!338734 () (_ BitVec 64))

(declare-fun lt!338746 () tuple2!18334)

(declare-fun lt!338743 () (_ BitVec 64))

(assert (=> b!214302 (= lt!338752 (bvor lt!338743 (ite (_2!9822 lt!338746) lt!338734 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!214302 (= lt!338747 (readNBitsLSBFirstsLoopPure!0 (_1!9821 lt!338751) nBits!348 i!590 lt!338743))))

(assert (=> b!214302 (validate_offset_bits!1 ((_ sign_extend 32) (size!4638 (buf!5173 (_2!9820 lt!338759)))) ((_ sign_extend 32) (currentByte!9751 thiss!1204)) ((_ sign_extend 32) (currentBit!9746 thiss!1204)) lt!338761)))

(declare-fun lt!338737 () Unit!15260)

(assert (=> b!214302 (= lt!338737 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5173 (_2!9820 lt!338759)) lt!338761))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!214302 (= lt!338743 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!214302 (= (_2!9822 lt!338746) lt!338749)))

(assert (=> b!214302 (= lt!338746 (readBitPure!0 (_1!9821 lt!338751)))))

(declare-fun reader!0 (BitStream!8384 BitStream!8384) tuple2!18332)

(assert (=> b!214302 (= lt!338744 (reader!0 (_2!9820 lt!338757) (_2!9820 lt!338759)))))

(assert (=> b!214302 (= lt!338751 (reader!0 thiss!1204 (_2!9820 lt!338759)))))

(assert (=> b!214302 e!145891))

(declare-fun res!180134 () Bool)

(assert (=> b!214302 (=> (not res!180134) (not e!145891))))

(assert (=> b!214302 (= res!180134 (= (bitIndex!0 (size!4638 (buf!5173 (_1!9822 lt!338748))) (currentByte!9751 (_1!9822 lt!338748)) (currentBit!9746 (_1!9822 lt!338748))) (bitIndex!0 (size!4638 (buf!5173 (_1!9822 lt!338740))) (currentByte!9751 (_1!9822 lt!338740)) (currentBit!9746 (_1!9822 lt!338740)))))))

(declare-fun lt!338762 () Unit!15260)

(declare-fun lt!338738 () BitStream!8384)

(declare-fun readBitPrefixLemma!0 (BitStream!8384 BitStream!8384) Unit!15260)

(assert (=> b!214302 (= lt!338762 (readBitPrefixLemma!0 lt!338738 (_2!9820 lt!338759)))))

(assert (=> b!214302 (= lt!338740 (readBitPure!0 (BitStream!8385 (buf!5173 (_2!9820 lt!338759)) (currentByte!9751 thiss!1204) (currentBit!9746 thiss!1204))))))

(assert (=> b!214302 (= lt!338748 (readBitPure!0 lt!338738))))

(assert (=> b!214302 e!145886))

(declare-fun res!180138 () Bool)

(assert (=> b!214302 (=> (not res!180138) (not e!145886))))

(assert (=> b!214302 (= res!180138 (invariant!0 (currentBit!9746 thiss!1204) (currentByte!9751 thiss!1204) (size!4638 (buf!5173 (_2!9820 lt!338757)))))))

(assert (=> b!214302 (= lt!338738 (BitStream!8385 (buf!5173 (_2!9820 lt!338757)) (currentByte!9751 thiss!1204) (currentBit!9746 thiss!1204)))))

(declare-fun b!214303 () Bool)

(declare-fun res!180144 () Bool)

(assert (=> b!214303 (=> (not res!180144) (not e!145881))))

(assert (=> b!214303 (= res!180144 (not (= i!590 nBits!348)))))

(declare-fun b!214304 () Bool)

(declare-fun e!145888 () Bool)

(assert (=> b!214304 (= e!145888 e!145884)))

(declare-fun res!180135 () Bool)

(assert (=> b!214304 (=> (not res!180135) (not e!145884))))

(declare-fun lt!338756 () (_ BitVec 64))

(assert (=> b!214304 (= res!180135 (= lt!338760 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!338756)))))

(assert (=> b!214304 (= lt!338760 (bitIndex!0 (size!4638 (buf!5173 (_2!9820 lt!338757))) (currentByte!9751 (_2!9820 lt!338757)) (currentBit!9746 (_2!9820 lt!338757))))))

(assert (=> b!214304 (= lt!338756 (bitIndex!0 (size!4638 (buf!5173 thiss!1204)) (currentByte!9751 thiss!1204) (currentBit!9746 thiss!1204)))))

(declare-fun b!214305 () Bool)

(assert (=> b!214305 (= e!145881 (not e!145887))))

(declare-fun res!180143 () Bool)

(assert (=> b!214305 (=> res!180143 e!145887)))

(assert (=> b!214305 (= res!180143 (not (= lt!338739 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!338754))))))

(assert (=> b!214305 (= lt!338739 (bitIndex!0 (size!4638 (buf!5173 (_2!9820 lt!338757))) (currentByte!9751 (_2!9820 lt!338757)) (currentBit!9746 (_2!9820 lt!338757))))))

(assert (=> b!214305 (= lt!338754 (bitIndex!0 (size!4638 (buf!5173 thiss!1204)) (currentByte!9751 thiss!1204) (currentBit!9746 thiss!1204)))))

(assert (=> b!214305 e!145888))

(declare-fun res!180128 () Bool)

(assert (=> b!214305 (=> (not res!180128) (not e!145888))))

(assert (=> b!214305 (= res!180128 (= (size!4638 (buf!5173 thiss!1204)) (size!4638 (buf!5173 (_2!9820 lt!338757)))))))

(declare-fun appendBit!0 (BitStream!8384 Bool) tuple2!18330)

(assert (=> b!214305 (= lt!338757 (appendBit!0 thiss!1204 lt!338749))))

(assert (=> b!214305 (= lt!338749 (not (= (bvand v!189 lt!338734) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!214305 (= lt!338734 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!214306 () Bool)

(declare-fun res!180130 () Bool)

(assert (=> b!214306 (=> (not res!180130) (not e!145880))))

(assert (=> b!214306 (= res!180130 (= (_1!9821 lt!338744) (withMovedBitIndex!0 (_2!9821 lt!338744) (bvsub lt!338739 lt!338741))))))

(declare-fun b!214307 () Bool)

(assert (=> b!214307 (= e!145892 e!145889)))

(declare-fun res!180132 () Bool)

(assert (=> b!214307 (=> res!180132 e!145889)))

(assert (=> b!214307 (= res!180132 (not (= (_1!9821 lt!338744) lt!338736)))))

(assert (=> b!214307 e!145880))

(declare-fun res!180140 () Bool)

(assert (=> b!214307 (=> (not res!180140) (not e!145880))))

(declare-fun lt!338735 () tuple2!18336)

(assert (=> b!214307 (= res!180140 (and (= (_2!9823 lt!338747) (_2!9823 lt!338735)) (= (_1!9823 lt!338747) (_1!9823 lt!338735))))))

(declare-fun lt!338742 () Unit!15260)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8384 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15260)

(assert (=> b!214307 (= lt!338742 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9821 lt!338751) nBits!348 i!590 lt!338743))))

(assert (=> b!214307 (= lt!338735 (readNBitsLSBFirstsLoopPure!0 lt!338736 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!338752))))

(assert (=> b!214307 (= lt!338736 (withMovedBitIndex!0 (_1!9821 lt!338751) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!214308 () Bool)

(declare-fun array_inv!4379 (array!10563) Bool)

(assert (=> b!214308 (= e!145882 (array_inv!4379 (buf!5173 thiss!1204)))))

(assert (= (and start!44800 res!180133) b!214301))

(assert (= (and b!214301 res!180149) b!214286))

(assert (= (and b!214286 res!180148) b!214303))

(assert (= (and b!214303 res!180144) b!214305))

(assert (= (and b!214305 res!180128) b!214304))

(assert (= (and b!214304 res!180135) b!214300))

(assert (= (and b!214300 res!180129) b!214294))

(assert (= (and b!214294 res!180139) b!214295))

(assert (= (and b!214305 (not res!180143)) b!214297))

(assert (= (and b!214297 (not res!180146)) b!214298))

(assert (= (and b!214298 (not res!180131)) b!214293))

(assert (= (and b!214293 (not res!180137)) b!214287))

(assert (= (and b!214287 (not res!180147)) b!214296))

(assert (= (and b!214296 (not res!180141)) b!214302))

(assert (= (and b!214302 res!180138) b!214290))

(assert (= (and b!214302 res!180134) b!214289))

(assert (= (and b!214302 (not res!180142)) b!214307))

(assert (= (and b!214307 res!180140) b!214288))

(assert (= (and b!214288 res!180136) b!214306))

(assert (= (and b!214306 res!180130) b!214299))

(assert (= (and b!214307 (not res!180132)) b!214292))

(assert (= (and b!214292 (not res!180145)) b!214291))

(assert (= start!44800 b!214308))

(declare-fun m!330311 () Bool)

(assert (=> b!214301 m!330311))

(declare-fun m!330313 () Bool)

(assert (=> b!214287 m!330313))

(declare-fun m!330315 () Bool)

(assert (=> b!214305 m!330315))

(declare-fun m!330317 () Bool)

(assert (=> b!214305 m!330317))

(declare-fun m!330319 () Bool)

(assert (=> b!214305 m!330319))

(declare-fun m!330321 () Bool)

(assert (=> b!214306 m!330321))

(declare-fun m!330323 () Bool)

(assert (=> b!214288 m!330323))

(declare-fun m!330325 () Bool)

(assert (=> b!214307 m!330325))

(declare-fun m!330327 () Bool)

(assert (=> b!214307 m!330327))

(declare-fun m!330329 () Bool)

(assert (=> b!214307 m!330329))

(declare-fun m!330331 () Bool)

(assert (=> b!214292 m!330331))

(declare-fun m!330333 () Bool)

(assert (=> b!214292 m!330333))

(declare-fun m!330335 () Bool)

(assert (=> b!214290 m!330335))

(declare-fun m!330337 () Bool)

(assert (=> b!214297 m!330337))

(declare-fun m!330339 () Bool)

(assert (=> b!214297 m!330339))

(declare-fun m!330341 () Bool)

(assert (=> b!214297 m!330341))

(declare-fun m!330343 () Bool)

(assert (=> b!214297 m!330343))

(declare-fun m!330345 () Bool)

(assert (=> b!214294 m!330345))

(assert (=> b!214294 m!330345))

(declare-fun m!330347 () Bool)

(assert (=> b!214294 m!330347))

(declare-fun m!330349 () Bool)

(assert (=> b!214300 m!330349))

(declare-fun m!330351 () Bool)

(assert (=> b!214286 m!330351))

(assert (=> b!214296 m!330349))

(assert (=> b!214304 m!330315))

(assert (=> b!214304 m!330317))

(declare-fun m!330353 () Bool)

(assert (=> b!214295 m!330353))

(declare-fun m!330355 () Bool)

(assert (=> b!214302 m!330355))

(declare-fun m!330357 () Bool)

(assert (=> b!214302 m!330357))

(declare-fun m!330359 () Bool)

(assert (=> b!214302 m!330359))

(declare-fun m!330361 () Bool)

(assert (=> b!214302 m!330361))

(declare-fun m!330363 () Bool)

(assert (=> b!214302 m!330363))

(declare-fun m!330365 () Bool)

(assert (=> b!214302 m!330365))

(declare-fun m!330367 () Bool)

(assert (=> b!214302 m!330367))

(declare-fun m!330369 () Bool)

(assert (=> b!214302 m!330369))

(declare-fun m!330371 () Bool)

(assert (=> b!214302 m!330371))

(declare-fun m!330373 () Bool)

(assert (=> b!214302 m!330373))

(declare-fun m!330375 () Bool)

(assert (=> b!214302 m!330375))

(declare-fun m!330377 () Bool)

(assert (=> b!214302 m!330377))

(declare-fun m!330379 () Bool)

(assert (=> b!214302 m!330379))

(declare-fun m!330381 () Bool)

(assert (=> b!214302 m!330381))

(declare-fun m!330383 () Bool)

(assert (=> b!214302 m!330383))

(declare-fun m!330385 () Bool)

(assert (=> b!214302 m!330385))

(declare-fun m!330387 () Bool)

(assert (=> b!214308 m!330387))

(declare-fun m!330389 () Bool)

(assert (=> b!214298 m!330389))

(declare-fun m!330391 () Bool)

(assert (=> start!44800 m!330391))

(push 1)

(assert (not b!214298))

(assert (not b!214304))

(assert (not start!44800))

(assert (not b!214302))

(assert (not b!214305))

(assert (not b!214306))

(assert (not b!214300))

(assert (not b!214297))

(assert (not b!214294))

(assert (not b!214295))

(assert (not b!214308))

(assert (not b!214301))

(assert (not b!214290))

(assert (not b!214292))

(assert (not b!214288))

(assert (not b!214286))

(assert (not b!214307))

(assert (not b!214296))

(assert (not b!214287))

(check-sat)

(pop 1)

