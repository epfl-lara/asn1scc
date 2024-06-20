; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31030 () Bool)

(assert start!31030)

(declare-fun b!156587 () Bool)

(declare-fun e!105836 () Bool)

(declare-fun e!105835 () Bool)

(assert (=> b!156587 (= e!105836 e!105835)))

(declare-fun res!130871 () Bool)

(assert (=> b!156587 (=> (not res!130871) (not e!105835))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(assert (=> b!156587 (= res!130871 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((array!7188 0))(
  ( (array!7189 (arr!4088 (Array (_ BitVec 32) (_ BitVec 8))) (size!3223 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5704 0))(
  ( (BitStream!5705 (buf!3726 array!7188) (currentByte!6853 (_ BitVec 32)) (currentBit!6848 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5704)

(declare-fun arr!153 () array!7188)

(declare-fun lt!245217 () BitStream!5704)

(declare-datatypes ((tuple2!14032 0))(
  ( (tuple2!14033 (_1!7460 BitStream!5704) (_2!7460 array!7188)) )
))
(declare-fun lt!245221 () tuple2!14032)

(declare-fun readByteArrayLoopPure!0 (BitStream!5704 array!7188 (_ BitVec 32) (_ BitVec 32)) tuple2!14032)

(declare-datatypes ((tuple2!14034 0))(
  ( (tuple2!14035 (_1!7461 BitStream!5704) (_2!7461 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5704) tuple2!14034)

(assert (=> b!156587 (= lt!245221 (readByteArrayLoopPure!0 lt!245217 (array!7189 (store (arr!4088 arr!153) from!240 (_2!7461 (readBytePure!0 bs!65))) (size!3223 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5704 (_ BitVec 32)) BitStream!5704)

(assert (=> b!156587 (= lt!245217 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!245220 () tuple2!14032)

(assert (=> b!156587 (= lt!245220 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156588 () Bool)

(declare-fun e!105834 () Bool)

(assert (=> b!156588 (= e!105834 false)))

(declare-fun lt!245219 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!156588 (= lt!245219 (bitIndex!0 (size!3223 (buf!3726 bs!65)) (currentByte!6853 bs!65) (currentBit!6848 bs!65)))))

(declare-fun b!156589 () Bool)

(assert (=> b!156589 (= e!105835 e!105834)))

(declare-fun res!130874 () Bool)

(assert (=> b!156589 (=> (not res!130874) (not e!105834))))

(assert (=> b!156589 (= res!130874 (= (size!3223 (buf!3726 bs!65)) (size!3223 (buf!3726 lt!245217))))))

(declare-fun lt!245218 () tuple2!14034)

(assert (=> b!156589 (= lt!245218 (readBytePure!0 lt!245217))))

(declare-fun b!156590 () Bool)

(declare-fun res!130872 () Bool)

(assert (=> b!156590 (=> (not res!130872) (not e!105834))))

(assert (=> b!156590 (= res!130872 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3223 (buf!3726 lt!245217)) (currentByte!6853 lt!245217) (currentBit!6848 lt!245217))))))

(declare-fun res!130873 () Bool)

(assert (=> start!31030 (=> (not res!130873) (not e!105836))))

(assert (=> start!31030 (= res!130873 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3223 arr!153))))))

(assert (=> start!31030 e!105836))

(assert (=> start!31030 true))

(declare-fun array_inv!3012 (array!7188) Bool)

(assert (=> start!31030 (array_inv!3012 arr!153)))

(declare-fun e!105838 () Bool)

(declare-fun inv!12 (BitStream!5704) Bool)

(assert (=> start!31030 (and (inv!12 bs!65) e!105838)))

(declare-fun b!156591 () Bool)

(declare-fun res!130870 () Bool)

(assert (=> b!156591 (=> (not res!130870) (not e!105836))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156591 (= res!130870 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3223 (buf!3726 bs!65))) ((_ sign_extend 32) (currentByte!6853 bs!65)) ((_ sign_extend 32) (currentBit!6848 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!156592 () Bool)

(assert (=> b!156592 (= e!105838 (array_inv!3012 (buf!3726 bs!65)))))

(assert (= (and start!31030 res!130873) b!156591))

(assert (= (and b!156591 res!130870) b!156587))

(assert (= (and b!156587 res!130871) b!156589))

(assert (= (and b!156589 res!130874) b!156590))

(assert (= (and b!156590 res!130872) b!156588))

(assert (= start!31030 b!156592))

(declare-fun m!244161 () Bool)

(assert (=> b!156588 m!244161))

(declare-fun m!244163 () Bool)

(assert (=> b!156589 m!244163))

(declare-fun m!244165 () Bool)

(assert (=> start!31030 m!244165))

(declare-fun m!244167 () Bool)

(assert (=> start!31030 m!244167))

(declare-fun m!244169 () Bool)

(assert (=> b!156591 m!244169))

(declare-fun m!244171 () Bool)

(assert (=> b!156592 m!244171))

(declare-fun m!244173 () Bool)

(assert (=> b!156590 m!244173))

(declare-fun m!244175 () Bool)

(assert (=> b!156587 m!244175))

(declare-fun m!244177 () Bool)

(assert (=> b!156587 m!244177))

(declare-fun m!244179 () Bool)

(assert (=> b!156587 m!244179))

(declare-fun m!244181 () Bool)

(assert (=> b!156587 m!244181))

(declare-fun m!244183 () Bool)

(assert (=> b!156587 m!244183))

(push 1)

(assert (not b!156588))

(assert (not b!156587))

(assert (not b!156589))

(assert (not b!156592))

(assert (not b!156590))

(assert (not b!156591))

(assert (not start!31030))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

