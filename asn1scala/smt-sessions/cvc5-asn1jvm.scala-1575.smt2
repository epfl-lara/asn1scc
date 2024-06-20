; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44796 () Bool)

(assert start!44796)

(declare-fun b!214148 () Bool)

(declare-fun e!145801 () Bool)

(declare-fun e!145805 () Bool)

(assert (=> b!214148 (= e!145801 (not e!145805))))

(declare-fun res!179998 () Bool)

(assert (=> b!214148 (=> res!179998 e!145805)))

(declare-fun lt!338580 () (_ BitVec 64))

(declare-fun lt!338564 () (_ BitVec 64))

(assert (=> b!214148 (= res!179998 (not (= lt!338580 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!338564))))))

(declare-datatypes ((array!10559 0))(
  ( (array!10560 (arr!5566 (Array (_ BitVec 32) (_ BitVec 8))) (size!4636 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8380 0))(
  ( (BitStream!8381 (buf!5171 array!10559) (currentByte!9749 (_ BitVec 32)) (currentBit!9744 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!15256 0))(
  ( (Unit!15257) )
))
(declare-datatypes ((tuple2!18314 0))(
  ( (tuple2!18315 (_1!9812 Unit!15256) (_2!9812 BitStream!8380)) )
))
(declare-fun lt!338566 () tuple2!18314)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!214148 (= lt!338580 (bitIndex!0 (size!4636 (buf!5171 (_2!9812 lt!338566))) (currentByte!9749 (_2!9812 lt!338566)) (currentBit!9744 (_2!9812 lt!338566))))))

(declare-fun thiss!1204 () BitStream!8380)

(assert (=> b!214148 (= lt!338564 (bitIndex!0 (size!4636 (buf!5171 thiss!1204)) (currentByte!9749 thiss!1204) (currentBit!9744 thiss!1204)))))

(declare-fun e!145806 () Bool)

(assert (=> b!214148 e!145806))

(declare-fun res!180005 () Bool)

(assert (=> b!214148 (=> (not res!180005) (not e!145806))))

(assert (=> b!214148 (= res!180005 (= (size!4636 (buf!5171 thiss!1204)) (size!4636 (buf!5171 (_2!9812 lt!338566)))))))

(declare-fun lt!338576 () Bool)

(declare-fun appendBit!0 (BitStream!8380 Bool) tuple2!18314)

(assert (=> b!214148 (= lt!338566 (appendBit!0 thiss!1204 lt!338576))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!338572 () (_ BitVec 64))

(assert (=> b!214148 (= lt!338576 (not (= (bvand v!189 lt!338572) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!214148 (= lt!338572 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!214149 () Bool)

(declare-fun e!145797 () Bool)

(declare-fun e!145809 () Bool)

(assert (=> b!214149 (= e!145797 e!145809)))

(declare-fun res!180017 () Bool)

(assert (=> b!214149 (=> (not res!180017) (not e!145809))))

(declare-datatypes ((tuple2!18316 0))(
  ( (tuple2!18317 (_1!9813 BitStream!8380) (_2!9813 Bool)) )
))
(declare-fun lt!338579 () tuple2!18316)

(assert (=> b!214149 (= res!180017 (and (= (_2!9813 lt!338579) lt!338576) (= (_1!9813 lt!338579) (_2!9812 lt!338566))))))

(declare-fun readBitPure!0 (BitStream!8380) tuple2!18316)

(declare-fun readerFrom!0 (BitStream!8380 (_ BitVec 32) (_ BitVec 32)) BitStream!8380)

(assert (=> b!214149 (= lt!338579 (readBitPure!0 (readerFrom!0 (_2!9812 lt!338566) (currentBit!9744 thiss!1204) (currentByte!9749 thiss!1204))))))

(declare-fun b!214150 () Bool)

(declare-fun res!180016 () Bool)

(declare-fun e!145800 () Bool)

(assert (=> b!214150 (=> (not res!180016) (not e!145800))))

(declare-fun lt!338587 () (_ BitVec 64))

(declare-datatypes ((tuple2!18318 0))(
  ( (tuple2!18319 (_1!9814 BitStream!8380) (_2!9814 BitStream!8380)) )
))
(declare-fun lt!338578 () tuple2!18318)

(declare-fun withMovedBitIndex!0 (BitStream!8380 (_ BitVec 64)) BitStream!8380)

(assert (=> b!214150 (= res!180016 (= (_1!9814 lt!338578) (withMovedBitIndex!0 (_2!9814 lt!338578) (bvsub lt!338564 lt!338587))))))

(declare-fun b!214151 () Bool)

(assert (=> b!214151 (= e!145806 e!145797)))

(declare-fun res!180002 () Bool)

(assert (=> b!214151 (=> (not res!180002) (not e!145797))))

(declare-fun lt!338586 () (_ BitVec 64))

(declare-fun lt!338568 () (_ BitVec 64))

(assert (=> b!214151 (= res!180002 (= lt!338586 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!338568)))))

(assert (=> b!214151 (= lt!338586 (bitIndex!0 (size!4636 (buf!5171 (_2!9812 lt!338566))) (currentByte!9749 (_2!9812 lt!338566)) (currentBit!9744 (_2!9812 lt!338566))))))

(assert (=> b!214151 (= lt!338568 (bitIndex!0 (size!4636 (buf!5171 thiss!1204)) (currentByte!9749 thiss!1204) (currentBit!9744 thiss!1204)))))

(declare-fun b!214152 () Bool)

(declare-fun res!180012 () Bool)

(declare-fun e!145798 () Bool)

(assert (=> b!214152 (=> res!180012 e!145798)))

(declare-fun isPrefixOf!0 (BitStream!8380 BitStream!8380) Bool)

(assert (=> b!214152 (= res!180012 (not (isPrefixOf!0 thiss!1204 (_2!9812 lt!338566))))))

(declare-fun b!214153 () Bool)

(declare-fun e!145802 () Bool)

(assert (=> b!214153 (= e!145802 e!145801)))

(declare-fun res!180013 () Bool)

(assert (=> b!214153 (=> (not res!180013) (not e!145801))))

(declare-fun lt!338569 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!214153 (= res!180013 (validate_offset_bits!1 ((_ sign_extend 32) (size!4636 (buf!5171 thiss!1204))) ((_ sign_extend 32) (currentByte!9749 thiss!1204)) ((_ sign_extend 32) (currentBit!9744 thiss!1204)) lt!338569))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!214153 (= lt!338569 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!214154 () Bool)

(declare-fun e!145807 () Bool)

(declare-fun lt!338561 () tuple2!18316)

(declare-fun lt!338583 () tuple2!18316)

(assert (=> b!214154 (= e!145807 (= (_2!9813 lt!338561) (_2!9813 lt!338583)))))

(declare-fun res!179999 () Bool)

(assert (=> start!44796 (=> (not res!179999) (not e!145802))))

(assert (=> start!44796 (= res!179999 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44796 e!145802))

(assert (=> start!44796 true))

(declare-fun e!145799 () Bool)

(declare-fun inv!12 (BitStream!8380) Bool)

(assert (=> start!44796 (and (inv!12 thiss!1204) e!145799)))

(declare-fun b!214155 () Bool)

(declare-fun res!180010 () Bool)

(assert (=> b!214155 (=> res!180010 e!145798)))

(declare-fun lt!338570 () tuple2!18314)

(assert (=> b!214155 (= res!180010 (or (not (= (size!4636 (buf!5171 (_2!9812 lt!338570))) (size!4636 (buf!5171 thiss!1204)))) (not (= lt!338587 (bvsub (bvadd lt!338564 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!214156 () Bool)

(declare-fun e!145803 () Bool)

(assert (=> b!214156 (= e!145798 e!145803)))

(declare-fun res!180009 () Bool)

(assert (=> b!214156 (=> res!180009 e!145803)))

(declare-datatypes ((tuple2!18320 0))(
  ( (tuple2!18321 (_1!9815 BitStream!8380) (_2!9815 (_ BitVec 64))) )
))
(declare-fun lt!338582 () tuple2!18320)

(declare-fun lt!338584 () tuple2!18318)

(assert (=> b!214156 (= res!180009 (not (= (_1!9815 lt!338582) (_2!9814 lt!338584))))))

(declare-fun lt!338577 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8380 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18320)

(assert (=> b!214156 (= lt!338582 (readNBitsLSBFirstsLoopPure!0 (_1!9814 lt!338584) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!338577))))

(declare-fun lt!338575 () (_ BitVec 64))

(assert (=> b!214156 (validate_offset_bits!1 ((_ sign_extend 32) (size!4636 (buf!5171 (_2!9812 lt!338570)))) ((_ sign_extend 32) (currentByte!9749 (_2!9812 lt!338566))) ((_ sign_extend 32) (currentBit!9744 (_2!9812 lt!338566))) lt!338575)))

(declare-fun lt!338571 () Unit!15256)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8380 array!10559 (_ BitVec 64)) Unit!15256)

(assert (=> b!214156 (= lt!338571 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9812 lt!338566) (buf!5171 (_2!9812 lt!338570)) lt!338575))))

(assert (=> b!214156 (= lt!338575 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!338585 () tuple2!18316)

(declare-fun lt!338588 () (_ BitVec 64))

(assert (=> b!214156 (= lt!338577 (bvor lt!338588 (ite (_2!9813 lt!338585) lt!338572 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!338562 () tuple2!18320)

(assert (=> b!214156 (= lt!338562 (readNBitsLSBFirstsLoopPure!0 (_1!9814 lt!338578) nBits!348 i!590 lt!338588))))

(assert (=> b!214156 (validate_offset_bits!1 ((_ sign_extend 32) (size!4636 (buf!5171 (_2!9812 lt!338570)))) ((_ sign_extend 32) (currentByte!9749 thiss!1204)) ((_ sign_extend 32) (currentBit!9744 thiss!1204)) lt!338569)))

(declare-fun lt!338574 () Unit!15256)

(assert (=> b!214156 (= lt!338574 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5171 (_2!9812 lt!338570)) lt!338569))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!214156 (= lt!338588 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!214156 (= (_2!9813 lt!338585) lt!338576)))

(assert (=> b!214156 (= lt!338585 (readBitPure!0 (_1!9814 lt!338578)))))

(declare-fun reader!0 (BitStream!8380 BitStream!8380) tuple2!18318)

(assert (=> b!214156 (= lt!338584 (reader!0 (_2!9812 lt!338566) (_2!9812 lt!338570)))))

(assert (=> b!214156 (= lt!338578 (reader!0 thiss!1204 (_2!9812 lt!338570)))))

(assert (=> b!214156 e!145807))

(declare-fun res!179996 () Bool)

(assert (=> b!214156 (=> (not res!179996) (not e!145807))))

(assert (=> b!214156 (= res!179996 (= (bitIndex!0 (size!4636 (buf!5171 (_1!9813 lt!338561))) (currentByte!9749 (_1!9813 lt!338561)) (currentBit!9744 (_1!9813 lt!338561))) (bitIndex!0 (size!4636 (buf!5171 (_1!9813 lt!338583))) (currentByte!9749 (_1!9813 lt!338583)) (currentBit!9744 (_1!9813 lt!338583)))))))

(declare-fun lt!338573 () Unit!15256)

(declare-fun lt!338560 () BitStream!8380)

(declare-fun readBitPrefixLemma!0 (BitStream!8380 BitStream!8380) Unit!15256)

(assert (=> b!214156 (= lt!338573 (readBitPrefixLemma!0 lt!338560 (_2!9812 lt!338570)))))

(assert (=> b!214156 (= lt!338583 (readBitPure!0 (BitStream!8381 (buf!5171 (_2!9812 lt!338570)) (currentByte!9749 thiss!1204) (currentBit!9744 thiss!1204))))))

(assert (=> b!214156 (= lt!338561 (readBitPure!0 lt!338560))))

(declare-fun e!145804 () Bool)

(assert (=> b!214156 e!145804))

(declare-fun res!180014 () Bool)

(assert (=> b!214156 (=> (not res!180014) (not e!145804))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!214156 (= res!180014 (invariant!0 (currentBit!9744 thiss!1204) (currentByte!9749 thiss!1204) (size!4636 (buf!5171 (_2!9812 lt!338566)))))))

(assert (=> b!214156 (= lt!338560 (BitStream!8381 (buf!5171 (_2!9812 lt!338566)) (currentByte!9749 thiss!1204) (currentBit!9744 thiss!1204)))))

(declare-fun b!214157 () Bool)

(assert (=> b!214157 (= e!145809 (= (bitIndex!0 (size!4636 (buf!5171 (_1!9813 lt!338579))) (currentByte!9749 (_1!9813 lt!338579)) (currentBit!9744 (_1!9813 lt!338579))) lt!338586))))

(declare-fun b!214158 () Bool)

(assert (=> b!214158 (= e!145804 (invariant!0 (currentBit!9744 thiss!1204) (currentByte!9749 thiss!1204) (size!4636 (buf!5171 (_2!9812 lt!338570)))))))

(declare-fun b!214159 () Bool)

(declare-fun lt!338567 () BitStream!8380)

(assert (=> b!214159 (= e!145800 (and (= lt!338564 (bvsub lt!338580 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9814 lt!338584) lt!338567)) (= (_2!9815 lt!338562) (_2!9815 lt!338582)))))))

(declare-fun b!214160 () Bool)

(declare-fun res!180001 () Bool)

(assert (=> b!214160 (=> res!180001 e!145798)))

(assert (=> b!214160 (= res!180001 (not (isPrefixOf!0 (_2!9812 lt!338566) (_2!9812 lt!338570))))))

(declare-fun b!214161 () Bool)

(declare-fun e!145808 () Bool)

(assert (=> b!214161 (= e!145808 true)))

(assert (=> b!214161 (= (size!4636 (buf!5171 thiss!1204)) (size!4636 (buf!5171 (_2!9812 lt!338570))))))

(declare-fun b!214162 () Bool)

(declare-fun res!180004 () Bool)

(assert (=> b!214162 (=> res!180004 e!145798)))

(assert (=> b!214162 (= res!180004 (not (invariant!0 (currentBit!9744 (_2!9812 lt!338570)) (currentByte!9749 (_2!9812 lt!338570)) (size!4636 (buf!5171 (_2!9812 lt!338570))))))))

(declare-fun b!214163 () Bool)

(assert (=> b!214163 (= e!145805 e!145798)))

(declare-fun res!180007 () Bool)

(assert (=> b!214163 (=> res!180007 e!145798)))

(assert (=> b!214163 (= res!180007 (not (= lt!338587 (bvsub (bvsub (bvadd lt!338580 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!214163 (= lt!338587 (bitIndex!0 (size!4636 (buf!5171 (_2!9812 lt!338570))) (currentByte!9749 (_2!9812 lt!338570)) (currentBit!9744 (_2!9812 lt!338570))))))

(assert (=> b!214163 (isPrefixOf!0 thiss!1204 (_2!9812 lt!338570))))

(declare-fun lt!338581 () Unit!15256)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8380 BitStream!8380 BitStream!8380) Unit!15256)

(assert (=> b!214163 (= lt!338581 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9812 lt!338566) (_2!9812 lt!338570)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8380 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18314)

(assert (=> b!214163 (= lt!338570 (appendBitsLSBFirstLoopTR!0 (_2!9812 lt!338566) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!214164 () Bool)

(assert (=> b!214164 (= e!145803 e!145808)))

(declare-fun res!179997 () Bool)

(assert (=> b!214164 (=> res!179997 e!145808)))

(assert (=> b!214164 (= res!179997 (not (= (_1!9814 lt!338584) lt!338567)))))

(assert (=> b!214164 e!145800))

(declare-fun res!180006 () Bool)

(assert (=> b!214164 (=> (not res!180006) (not e!145800))))

(declare-fun lt!338565 () tuple2!18320)

(assert (=> b!214164 (= res!180006 (and (= (_2!9815 lt!338562) (_2!9815 lt!338565)) (= (_1!9815 lt!338562) (_1!9815 lt!338565))))))

(declare-fun lt!338563 () Unit!15256)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8380 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15256)

(assert (=> b!214164 (= lt!338563 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9814 lt!338578) nBits!348 i!590 lt!338588))))

(assert (=> b!214164 (= lt!338565 (readNBitsLSBFirstsLoopPure!0 lt!338567 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!338577))))

(assert (=> b!214164 (= lt!338567 (withMovedBitIndex!0 (_1!9814 lt!338578) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!214165 () Bool)

(declare-fun res!180015 () Bool)

(assert (=> b!214165 (=> (not res!180015) (not e!145801))))

(assert (=> b!214165 (= res!180015 (not (= i!590 nBits!348)))))

(declare-fun b!214166 () Bool)

(declare-fun array_inv!4377 (array!10559) Bool)

(assert (=> b!214166 (= e!145799 (array_inv!4377 (buf!5171 thiss!1204)))))

(declare-fun b!214167 () Bool)

(declare-fun res!180011 () Bool)

(assert (=> b!214167 (=> (not res!180011) (not e!145797))))

(assert (=> b!214167 (= res!180011 (isPrefixOf!0 thiss!1204 (_2!9812 lt!338566)))))

(declare-fun b!214168 () Bool)

(declare-fun res!180008 () Bool)

(assert (=> b!214168 (=> res!180008 e!145808)))

(assert (=> b!214168 (= res!180008 (not (= (bitIndex!0 (size!4636 (buf!5171 (_1!9815 lt!338562))) (currentByte!9749 (_1!9815 lt!338562)) (currentBit!9744 (_1!9815 lt!338562))) (bitIndex!0 (size!4636 (buf!5171 (_2!9814 lt!338578))) (currentByte!9749 (_2!9814 lt!338578)) (currentBit!9744 (_2!9814 lt!338578))))))))

(declare-fun b!214169 () Bool)

(declare-fun res!180003 () Bool)

(assert (=> b!214169 (=> (not res!180003) (not e!145801))))

(assert (=> b!214169 (= res!180003 (invariant!0 (currentBit!9744 thiss!1204) (currentByte!9749 thiss!1204) (size!4636 (buf!5171 thiss!1204))))))

(declare-fun b!214170 () Bool)

(declare-fun res!180000 () Bool)

(assert (=> b!214170 (=> (not res!180000) (not e!145800))))

(assert (=> b!214170 (= res!180000 (= (_1!9814 lt!338584) (withMovedBitIndex!0 (_2!9814 lt!338584) (bvsub lt!338580 lt!338587))))))

(assert (= (and start!44796 res!179999) b!214153))

(assert (= (and b!214153 res!180013) b!214169))

(assert (= (and b!214169 res!180003) b!214165))

(assert (= (and b!214165 res!180015) b!214148))

(assert (= (and b!214148 res!180005) b!214151))

(assert (= (and b!214151 res!180002) b!214167))

(assert (= (and b!214167 res!180011) b!214149))

(assert (= (and b!214149 res!180017) b!214157))

(assert (= (and b!214148 (not res!179998)) b!214163))

(assert (= (and b!214163 (not res!180007)) b!214162))

(assert (= (and b!214162 (not res!180004)) b!214155))

(assert (= (and b!214155 (not res!180010)) b!214160))

(assert (= (and b!214160 (not res!180001)) b!214152))

(assert (= (and b!214152 (not res!180012)) b!214156))

(assert (= (and b!214156 res!180014) b!214158))

(assert (= (and b!214156 res!179996) b!214154))

(assert (= (and b!214156 (not res!180009)) b!214164))

(assert (= (and b!214164 res!180006) b!214150))

(assert (= (and b!214150 res!180016) b!214170))

(assert (= (and b!214170 res!180000) b!214159))

(assert (= (and b!214164 (not res!179997)) b!214168))

(assert (= (and b!214168 (not res!180008)) b!214161))

(assert (= start!44796 b!214166))

(declare-fun m!330147 () Bool)

(assert (=> b!214164 m!330147))

(declare-fun m!330149 () Bool)

(assert (=> b!214164 m!330149))

(declare-fun m!330151 () Bool)

(assert (=> b!214164 m!330151))

(declare-fun m!330153 () Bool)

(assert (=> b!214152 m!330153))

(declare-fun m!330155 () Bool)

(assert (=> b!214157 m!330155))

(declare-fun m!330157 () Bool)

(assert (=> b!214148 m!330157))

(declare-fun m!330159 () Bool)

(assert (=> b!214148 m!330159))

(declare-fun m!330161 () Bool)

(assert (=> b!214148 m!330161))

(declare-fun m!330163 () Bool)

(assert (=> b!214170 m!330163))

(declare-fun m!330165 () Bool)

(assert (=> b!214166 m!330165))

(assert (=> b!214151 m!330157))

(assert (=> b!214151 m!330159))

(declare-fun m!330167 () Bool)

(assert (=> b!214149 m!330167))

(assert (=> b!214149 m!330167))

(declare-fun m!330169 () Bool)

(assert (=> b!214149 m!330169))

(declare-fun m!330171 () Bool)

(assert (=> b!214163 m!330171))

(declare-fun m!330173 () Bool)

(assert (=> b!214163 m!330173))

(declare-fun m!330175 () Bool)

(assert (=> b!214163 m!330175))

(declare-fun m!330177 () Bool)

(assert (=> b!214163 m!330177))

(declare-fun m!330179 () Bool)

(assert (=> b!214162 m!330179))

(declare-fun m!330181 () Bool)

(assert (=> start!44796 m!330181))

(declare-fun m!330183 () Bool)

(assert (=> b!214153 m!330183))

(declare-fun m!330185 () Bool)

(assert (=> b!214150 m!330185))

(assert (=> b!214167 m!330153))

(declare-fun m!330187 () Bool)

(assert (=> b!214156 m!330187))

(declare-fun m!330189 () Bool)

(assert (=> b!214156 m!330189))

(declare-fun m!330191 () Bool)

(assert (=> b!214156 m!330191))

(declare-fun m!330193 () Bool)

(assert (=> b!214156 m!330193))

(declare-fun m!330195 () Bool)

(assert (=> b!214156 m!330195))

(declare-fun m!330197 () Bool)

(assert (=> b!214156 m!330197))

(declare-fun m!330199 () Bool)

(assert (=> b!214156 m!330199))

(declare-fun m!330201 () Bool)

(assert (=> b!214156 m!330201))

(declare-fun m!330203 () Bool)

(assert (=> b!214156 m!330203))

(declare-fun m!330205 () Bool)

(assert (=> b!214156 m!330205))

(declare-fun m!330207 () Bool)

(assert (=> b!214156 m!330207))

(declare-fun m!330209 () Bool)

(assert (=> b!214156 m!330209))

(declare-fun m!330211 () Bool)

(assert (=> b!214156 m!330211))

(declare-fun m!330213 () Bool)

(assert (=> b!214156 m!330213))

(declare-fun m!330215 () Bool)

(assert (=> b!214156 m!330215))

(declare-fun m!330217 () Bool)

(assert (=> b!214156 m!330217))

(declare-fun m!330219 () Bool)

(assert (=> b!214169 m!330219))

(declare-fun m!330221 () Bool)

(assert (=> b!214168 m!330221))

(declare-fun m!330223 () Bool)

(assert (=> b!214168 m!330223))

(declare-fun m!330225 () Bool)

(assert (=> b!214160 m!330225))

(declare-fun m!330227 () Bool)

(assert (=> b!214158 m!330227))

(push 1)

(assert (not b!214166))

(assert (not b!214156))

(assert (not b!214157))

(assert (not b!214150))

(assert (not b!214163))

(assert (not b!214164))

(assert (not b!214167))

(assert (not start!44796))

(assert (not b!214151))

(assert (not b!214158))

(assert (not b!214152))

(assert (not b!214148))

(assert (not b!214149))

(assert (not b!214169))

(assert (not b!214168))

(assert (not b!214162))

(assert (not b!214170))

(assert (not b!214153))

(assert (not b!214160))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

