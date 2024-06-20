; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43754 () Bool)

(assert start!43754)

(declare-fun b!208135 () Bool)

(declare-fun res!174657 () Bool)

(declare-fun e!142222 () Bool)

(assert (=> b!208135 (=> (not res!174657) (not e!142222))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!208135 (= res!174657 (not (= i!590 nBits!348)))))

(declare-fun b!208136 () Bool)

(declare-fun res!174671 () Bool)

(declare-fun e!142216 () Bool)

(assert (=> b!208136 (=> res!174671 e!142216)))

(declare-fun lt!325170 () (_ BitVec 64))

(declare-datatypes ((array!10444 0))(
  ( (array!10445 (arr!5522 (Array (_ BitVec 32) (_ BitVec 8))) (size!4592 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8292 0))(
  ( (BitStream!8293 (buf!5100 array!10444) (currentByte!9624 (_ BitVec 32)) (currentBit!9619 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14817 0))(
  ( (Unit!14818) )
))
(declare-datatypes ((tuple2!17854 0))(
  ( (tuple2!17855 (_1!9582 Unit!14817) (_2!9582 BitStream!8292)) )
))
(declare-fun lt!325165 () tuple2!17854)

(declare-fun thiss!1204 () BitStream!8292)

(declare-fun lt!325156 () (_ BitVec 64))

(assert (=> b!208136 (= res!174671 (or (not (= (size!4592 (buf!5100 (_2!9582 lt!325165))) (size!4592 (buf!5100 thiss!1204)))) (not (= lt!325156 (bvsub (bvadd lt!325170 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!208137 () Bool)

(declare-fun e!142214 () Bool)

(declare-datatypes ((tuple2!17856 0))(
  ( (tuple2!17857 (_1!9583 BitStream!8292) (_2!9583 Bool)) )
))
(declare-fun lt!325151 () tuple2!17856)

(declare-fun lt!325161 () tuple2!17856)

(assert (=> b!208137 (= e!142214 (= (_2!9583 lt!325151) (_2!9583 lt!325161)))))

(declare-fun b!208138 () Bool)

(declare-fun e!142224 () Bool)

(assert (=> b!208138 (= e!142224 e!142222)))

(declare-fun res!174661 () Bool)

(assert (=> b!208138 (=> (not res!174661) (not e!142222))))

(declare-fun lt!325153 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!208138 (= res!174661 (validate_offset_bits!1 ((_ sign_extend 32) (size!4592 (buf!5100 thiss!1204))) ((_ sign_extend 32) (currentByte!9624 thiss!1204)) ((_ sign_extend 32) (currentBit!9619 thiss!1204)) lt!325153))))

(assert (=> b!208138 (= lt!325153 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!208139 () Bool)

(declare-fun e!142217 () Bool)

(assert (=> b!208139 (= e!142217 e!142216)))

(declare-fun res!174664 () Bool)

(assert (=> b!208139 (=> res!174664 e!142216)))

(declare-fun lt!325164 () (_ BitVec 64))

(assert (=> b!208139 (= res!174664 (not (= lt!325156 (bvsub (bvsub (bvadd lt!325164 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!208139 (= lt!325156 (bitIndex!0 (size!4592 (buf!5100 (_2!9582 lt!325165))) (currentByte!9624 (_2!9582 lt!325165)) (currentBit!9619 (_2!9582 lt!325165))))))

(declare-fun isPrefixOf!0 (BitStream!8292 BitStream!8292) Bool)

(assert (=> b!208139 (isPrefixOf!0 thiss!1204 (_2!9582 lt!325165))))

(declare-fun lt!325149 () tuple2!17854)

(declare-fun lt!325162 () Unit!14817)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8292 BitStream!8292 BitStream!8292) Unit!14817)

(assert (=> b!208139 (= lt!325162 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9582 lt!325149) (_2!9582 lt!325165)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8292 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17854)

(assert (=> b!208139 (= lt!325165 (appendBitsLSBFirstLoopTR!0 (_2!9582 lt!325149) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!208140 () Bool)

(declare-fun e!142220 () Bool)

(declare-fun lt!325155 () tuple2!17856)

(declare-fun lt!325172 () (_ BitVec 64))

(assert (=> b!208140 (= e!142220 (= (bitIndex!0 (size!4592 (buf!5100 (_1!9583 lt!325155))) (currentByte!9624 (_1!9583 lt!325155)) (currentBit!9619 (_1!9583 lt!325155))) lt!325172))))

(declare-fun b!208141 () Bool)

(declare-fun res!174670 () Bool)

(declare-fun e!142215 () Bool)

(assert (=> b!208141 (=> (not res!174670) (not e!142215))))

(assert (=> b!208141 (= res!174670 (isPrefixOf!0 thiss!1204 (_2!9582 lt!325149)))))

(declare-fun b!208142 () Bool)

(declare-fun res!174656 () Bool)

(assert (=> b!208142 (=> res!174656 e!142216)))

(assert (=> b!208142 (= res!174656 (not (isPrefixOf!0 thiss!1204 (_2!9582 lt!325149))))))

(declare-fun b!208143 () Bool)

(declare-fun e!142213 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!208143 (= e!142213 (invariant!0 (currentBit!9619 thiss!1204) (currentByte!9624 thiss!1204) (size!4592 (buf!5100 (_2!9582 lt!325165)))))))

(declare-fun b!208144 () Bool)

(declare-fun e!142219 () Bool)

(declare-fun array_inv!4333 (array!10444) Bool)

(assert (=> b!208144 (= e!142219 (array_inv!4333 (buf!5100 thiss!1204)))))

(declare-fun b!208145 () Bool)

(declare-fun e!142223 () Bool)

(assert (=> b!208145 (= e!142216 e!142223)))

(declare-fun res!174659 () Bool)

(assert (=> b!208145 (=> res!174659 e!142223)))

(declare-datatypes ((tuple2!17858 0))(
  ( (tuple2!17859 (_1!9584 BitStream!8292) (_2!9584 BitStream!8292)) )
))
(declare-fun lt!325171 () tuple2!17858)

(declare-fun lt!325159 () tuple2!17856)

(declare-fun lt!325168 () (_ BitVec 64))

(declare-fun lt!325150 () (_ BitVec 64))

(declare-datatypes ((tuple2!17860 0))(
  ( (tuple2!17861 (_1!9585 BitStream!8292) (_2!9585 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8292 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17860)

(assert (=> b!208145 (= res!174659 (not (= (_1!9585 (readNBitsLSBFirstsLoopPure!0 (_1!9584 lt!325171) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!325168 (ite (_2!9583 lt!325159) lt!325150 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9584 lt!325171))))))

(declare-fun lt!325158 () (_ BitVec 64))

(assert (=> b!208145 (validate_offset_bits!1 ((_ sign_extend 32) (size!4592 (buf!5100 (_2!9582 lt!325165)))) ((_ sign_extend 32) (currentByte!9624 (_2!9582 lt!325149))) ((_ sign_extend 32) (currentBit!9619 (_2!9582 lt!325149))) lt!325158)))

(declare-fun lt!325166 () Unit!14817)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8292 array!10444 (_ BitVec 64)) Unit!14817)

(assert (=> b!208145 (= lt!325166 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9582 lt!325149) (buf!5100 (_2!9582 lt!325165)) lt!325158))))

(assert (=> b!208145 (= lt!325158 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!325154 () tuple2!17858)

(declare-fun lt!325157 () tuple2!17860)

(assert (=> b!208145 (= lt!325157 (readNBitsLSBFirstsLoopPure!0 (_1!9584 lt!325154) nBits!348 i!590 lt!325168))))

(assert (=> b!208145 (validate_offset_bits!1 ((_ sign_extend 32) (size!4592 (buf!5100 (_2!9582 lt!325165)))) ((_ sign_extend 32) (currentByte!9624 thiss!1204)) ((_ sign_extend 32) (currentBit!9619 thiss!1204)) lt!325153)))

(declare-fun lt!325167 () Unit!14817)

(assert (=> b!208145 (= lt!325167 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5100 (_2!9582 lt!325165)) lt!325153))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!208145 (= lt!325168 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!325169 () Bool)

(assert (=> b!208145 (= (_2!9583 lt!325159) lt!325169)))

(declare-fun readBitPure!0 (BitStream!8292) tuple2!17856)

(assert (=> b!208145 (= lt!325159 (readBitPure!0 (_1!9584 lt!325154)))))

(declare-fun reader!0 (BitStream!8292 BitStream!8292) tuple2!17858)

(assert (=> b!208145 (= lt!325171 (reader!0 (_2!9582 lt!325149) (_2!9582 lt!325165)))))

(assert (=> b!208145 (= lt!325154 (reader!0 thiss!1204 (_2!9582 lt!325165)))))

(assert (=> b!208145 e!142214))

(declare-fun res!174663 () Bool)

(assert (=> b!208145 (=> (not res!174663) (not e!142214))))

(assert (=> b!208145 (= res!174663 (= (bitIndex!0 (size!4592 (buf!5100 (_1!9583 lt!325151))) (currentByte!9624 (_1!9583 lt!325151)) (currentBit!9619 (_1!9583 lt!325151))) (bitIndex!0 (size!4592 (buf!5100 (_1!9583 lt!325161))) (currentByte!9624 (_1!9583 lt!325161)) (currentBit!9619 (_1!9583 lt!325161)))))))

(declare-fun lt!325160 () Unit!14817)

(declare-fun lt!325152 () BitStream!8292)

(declare-fun readBitPrefixLemma!0 (BitStream!8292 BitStream!8292) Unit!14817)

(assert (=> b!208145 (= lt!325160 (readBitPrefixLemma!0 lt!325152 (_2!9582 lt!325165)))))

(assert (=> b!208145 (= lt!325161 (readBitPure!0 (BitStream!8293 (buf!5100 (_2!9582 lt!325165)) (currentByte!9624 thiss!1204) (currentBit!9619 thiss!1204))))))

(assert (=> b!208145 (= lt!325151 (readBitPure!0 lt!325152))))

(assert (=> b!208145 e!142213))

(declare-fun res!174669 () Bool)

(assert (=> b!208145 (=> (not res!174669) (not e!142213))))

(assert (=> b!208145 (= res!174669 (invariant!0 (currentBit!9619 thiss!1204) (currentByte!9624 thiss!1204) (size!4592 (buf!5100 (_2!9582 lt!325149)))))))

(assert (=> b!208145 (= lt!325152 (BitStream!8293 (buf!5100 (_2!9582 lt!325149)) (currentByte!9624 thiss!1204) (currentBit!9619 thiss!1204)))))

(declare-fun b!208146 () Bool)

(declare-fun res!174662 () Bool)

(assert (=> b!208146 (=> (not res!174662) (not e!142222))))

(assert (=> b!208146 (= res!174662 (invariant!0 (currentBit!9619 thiss!1204) (currentByte!9624 thiss!1204) (size!4592 (buf!5100 thiss!1204))))))

(declare-fun b!208147 () Bool)

(declare-fun res!174660 () Bool)

(assert (=> b!208147 (=> res!174660 e!142216)))

(assert (=> b!208147 (= res!174660 (not (invariant!0 (currentBit!9619 (_2!9582 lt!325165)) (currentByte!9624 (_2!9582 lt!325165)) (size!4592 (buf!5100 (_2!9582 lt!325165))))))))

(declare-fun b!208148 () Bool)

(declare-fun e!142221 () Bool)

(assert (=> b!208148 (= e!142221 e!142215)))

(declare-fun res!174666 () Bool)

(assert (=> b!208148 (=> (not res!174666) (not e!142215))))

(declare-fun lt!325163 () (_ BitVec 64))

(assert (=> b!208148 (= res!174666 (= lt!325172 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!325163)))))

(assert (=> b!208148 (= lt!325172 (bitIndex!0 (size!4592 (buf!5100 (_2!9582 lt!325149))) (currentByte!9624 (_2!9582 lt!325149)) (currentBit!9619 (_2!9582 lt!325149))))))

(assert (=> b!208148 (= lt!325163 (bitIndex!0 (size!4592 (buf!5100 thiss!1204)) (currentByte!9624 thiss!1204) (currentBit!9619 thiss!1204)))))

(declare-fun res!174668 () Bool)

(assert (=> start!43754 (=> (not res!174668) (not e!142224))))

(assert (=> start!43754 (= res!174668 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43754 e!142224))

(assert (=> start!43754 true))

(declare-fun inv!12 (BitStream!8292) Bool)

(assert (=> start!43754 (and (inv!12 thiss!1204) e!142219)))

(declare-fun b!208149 () Bool)

(declare-fun res!174665 () Bool)

(assert (=> b!208149 (=> res!174665 e!142216)))

(assert (=> b!208149 (= res!174665 (not (isPrefixOf!0 (_2!9582 lt!325149) (_2!9582 lt!325165))))))

(declare-fun b!208150 () Bool)

(assert (=> b!208150 (= e!142222 (not e!142217))))

(declare-fun res!174658 () Bool)

(assert (=> b!208150 (=> res!174658 e!142217)))

(assert (=> b!208150 (= res!174658 (not (= lt!325164 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!325170))))))

(assert (=> b!208150 (= lt!325164 (bitIndex!0 (size!4592 (buf!5100 (_2!9582 lt!325149))) (currentByte!9624 (_2!9582 lt!325149)) (currentBit!9619 (_2!9582 lt!325149))))))

(assert (=> b!208150 (= lt!325170 (bitIndex!0 (size!4592 (buf!5100 thiss!1204)) (currentByte!9624 thiss!1204) (currentBit!9619 thiss!1204)))))

(assert (=> b!208150 e!142221))

(declare-fun res!174655 () Bool)

(assert (=> b!208150 (=> (not res!174655) (not e!142221))))

(assert (=> b!208150 (= res!174655 (= (size!4592 (buf!5100 thiss!1204)) (size!4592 (buf!5100 (_2!9582 lt!325149)))))))

(declare-fun appendBit!0 (BitStream!8292 Bool) tuple2!17854)

(assert (=> b!208150 (= lt!325149 (appendBit!0 thiss!1204 lt!325169))))

(assert (=> b!208150 (= lt!325169 (not (= (bvand v!189 lt!325150) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208150 (= lt!325150 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!208151 () Bool)

(assert (=> b!208151 (= e!142215 e!142220)))

(declare-fun res!174667 () Bool)

(assert (=> b!208151 (=> (not res!174667) (not e!142220))))

(assert (=> b!208151 (= res!174667 (and (= (_2!9583 lt!325155) lt!325169) (= (_1!9583 lt!325155) (_2!9582 lt!325149))))))

(declare-fun readerFrom!0 (BitStream!8292 (_ BitVec 32) (_ BitVec 32)) BitStream!8292)

(assert (=> b!208151 (= lt!325155 (readBitPure!0 (readerFrom!0 (_2!9582 lt!325149) (currentBit!9619 thiss!1204) (currentByte!9624 thiss!1204))))))

(declare-fun b!208152 () Bool)

(assert (=> b!208152 (= e!142223 (bvslt i!590 nBits!348))))

(assert (= (and start!43754 res!174668) b!208138))

(assert (= (and b!208138 res!174661) b!208146))

(assert (= (and b!208146 res!174662) b!208135))

(assert (= (and b!208135 res!174657) b!208150))

(assert (= (and b!208150 res!174655) b!208148))

(assert (= (and b!208148 res!174666) b!208141))

(assert (= (and b!208141 res!174670) b!208151))

(assert (= (and b!208151 res!174667) b!208140))

(assert (= (and b!208150 (not res!174658)) b!208139))

(assert (= (and b!208139 (not res!174664)) b!208147))

(assert (= (and b!208147 (not res!174660)) b!208136))

(assert (= (and b!208136 (not res!174671)) b!208149))

(assert (= (and b!208149 (not res!174665)) b!208142))

(assert (= (and b!208142 (not res!174656)) b!208145))

(assert (= (and b!208145 res!174669) b!208143))

(assert (= (and b!208145 res!174663) b!208137))

(assert (= (and b!208145 (not res!174659)) b!208152))

(assert (= start!43754 b!208144))

(declare-fun m!320249 () Bool)

(assert (=> b!208143 m!320249))

(declare-fun m!320251 () Bool)

(assert (=> b!208146 m!320251))

(declare-fun m!320253 () Bool)

(assert (=> b!208138 m!320253))

(declare-fun m!320255 () Bool)

(assert (=> b!208139 m!320255))

(declare-fun m!320257 () Bool)

(assert (=> b!208139 m!320257))

(declare-fun m!320259 () Bool)

(assert (=> b!208139 m!320259))

(declare-fun m!320261 () Bool)

(assert (=> b!208139 m!320261))

(declare-fun m!320263 () Bool)

(assert (=> b!208142 m!320263))

(declare-fun m!320265 () Bool)

(assert (=> b!208140 m!320265))

(declare-fun m!320267 () Bool)

(assert (=> b!208151 m!320267))

(assert (=> b!208151 m!320267))

(declare-fun m!320269 () Bool)

(assert (=> b!208151 m!320269))

(declare-fun m!320271 () Bool)

(assert (=> b!208144 m!320271))

(declare-fun m!320273 () Bool)

(assert (=> start!43754 m!320273))

(declare-fun m!320275 () Bool)

(assert (=> b!208145 m!320275))

(declare-fun m!320277 () Bool)

(assert (=> b!208145 m!320277))

(declare-fun m!320279 () Bool)

(assert (=> b!208145 m!320279))

(declare-fun m!320281 () Bool)

(assert (=> b!208145 m!320281))

(declare-fun m!320283 () Bool)

(assert (=> b!208145 m!320283))

(declare-fun m!320285 () Bool)

(assert (=> b!208145 m!320285))

(declare-fun m!320287 () Bool)

(assert (=> b!208145 m!320287))

(declare-fun m!320289 () Bool)

(assert (=> b!208145 m!320289))

(declare-fun m!320291 () Bool)

(assert (=> b!208145 m!320291))

(declare-fun m!320293 () Bool)

(assert (=> b!208145 m!320293))

(declare-fun m!320295 () Bool)

(assert (=> b!208145 m!320295))

(declare-fun m!320297 () Bool)

(assert (=> b!208145 m!320297))

(declare-fun m!320299 () Bool)

(assert (=> b!208145 m!320299))

(declare-fun m!320301 () Bool)

(assert (=> b!208145 m!320301))

(declare-fun m!320303 () Bool)

(assert (=> b!208145 m!320303))

(declare-fun m!320305 () Bool)

(assert (=> b!208145 m!320305))

(declare-fun m!320307 () Bool)

(assert (=> b!208147 m!320307))

(declare-fun m!320309 () Bool)

(assert (=> b!208149 m!320309))

(assert (=> b!208141 m!320263))

(declare-fun m!320311 () Bool)

(assert (=> b!208148 m!320311))

(declare-fun m!320313 () Bool)

(assert (=> b!208148 m!320313))

(assert (=> b!208150 m!320311))

(assert (=> b!208150 m!320313))

(declare-fun m!320315 () Bool)

(assert (=> b!208150 m!320315))

(check-sat (not b!208139) (not b!208150) (not b!208151) (not b!208148) (not b!208149) (not b!208145) (not b!208144) (not b!208138) (not b!208141) (not b!208142) (not b!208147) (not b!208140) (not b!208146) (not b!208143) (not start!43754))
(check-sat)
