; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44544 () Bool)

(assert start!44544)

(declare-fun b!212174 () Bool)

(declare-fun e!144613 () Bool)

(declare-fun e!144612 () Bool)

(assert (=> b!212174 (= e!144613 e!144612)))

(declare-fun res!178200 () Bool)

(assert (=> b!212174 (=> (not res!178200) (not e!144612))))

(declare-fun lt!334689 () (_ BitVec 64))

(declare-fun lt!334678 () (_ BitVec 64))

(assert (=> b!212174 (= res!178200 (= lt!334689 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!334678)))))

(declare-datatypes ((array!10517 0))(
  ( (array!10518 (arr!5548 (Array (_ BitVec 32) (_ BitVec 8))) (size!4618 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8344 0))(
  ( (BitStream!8345 (buf!5147 array!10517) (currentByte!9713 (_ BitVec 32)) (currentBit!9708 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!15142 0))(
  ( (Unit!15143) )
))
(declare-datatypes ((tuple2!18146 0))(
  ( (tuple2!18147 (_1!9728 Unit!15142) (_2!9728 BitStream!8344)) )
))
(declare-fun lt!334680 () tuple2!18146)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!212174 (= lt!334689 (bitIndex!0 (size!4618 (buf!5147 (_2!9728 lt!334680))) (currentByte!9713 (_2!9728 lt!334680)) (currentBit!9708 (_2!9728 lt!334680))))))

(declare-fun thiss!1204 () BitStream!8344)

(assert (=> b!212174 (= lt!334678 (bitIndex!0 (size!4618 (buf!5147 thiss!1204)) (currentByte!9713 thiss!1204) (currentBit!9708 thiss!1204)))))

(declare-fun b!212175 () Bool)

(declare-fun e!144614 () Bool)

(assert (=> b!212175 (= e!144612 e!144614)))

(declare-fun res!178205 () Bool)

(assert (=> b!212175 (=> (not res!178205) (not e!144614))))

(declare-fun lt!334702 () Bool)

(declare-datatypes ((tuple2!18148 0))(
  ( (tuple2!18149 (_1!9729 BitStream!8344) (_2!9729 Bool)) )
))
(declare-fun lt!334682 () tuple2!18148)

(assert (=> b!212175 (= res!178205 (and (= (_2!9729 lt!334682) lt!334702) (= (_1!9729 lt!334682) (_2!9728 lt!334680))))))

(declare-fun readBitPure!0 (BitStream!8344) tuple2!18148)

(declare-fun readerFrom!0 (BitStream!8344 (_ BitVec 32) (_ BitVec 32)) BitStream!8344)

(assert (=> b!212175 (= lt!334682 (readBitPure!0 (readerFrom!0 (_2!9728 lt!334680) (currentBit!9708 thiss!1204) (currentByte!9713 thiss!1204))))))

(declare-fun b!212176 () Bool)

(declare-fun e!144609 () Bool)

(declare-fun e!144618 () Bool)

(assert (=> b!212176 (= e!144609 e!144618)))

(declare-fun res!178202 () Bool)

(assert (=> b!212176 (=> res!178202 e!144618)))

(declare-fun i!590 () (_ BitVec 32))

(declare-datatypes ((tuple2!18150 0))(
  ( (tuple2!18151 (_1!9730 BitStream!8344) (_2!9730 BitStream!8344)) )
))
(declare-fun lt!334687 () tuple2!18150)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!334683 () (_ BitVec 64))

(declare-datatypes ((tuple2!18152 0))(
  ( (tuple2!18153 (_1!9731 BitStream!8344) (_2!9731 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8344 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18152)

(assert (=> b!212176 (= res!178202 (not (= (_1!9731 (readNBitsLSBFirstsLoopPure!0 (_1!9730 lt!334687) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!334683)) (_2!9730 lt!334687))))))

(declare-fun lt!334681 () tuple2!18146)

(declare-fun lt!334699 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!212176 (validate_offset_bits!1 ((_ sign_extend 32) (size!4618 (buf!5147 (_2!9728 lt!334681)))) ((_ sign_extend 32) (currentByte!9713 (_2!9728 lt!334680))) ((_ sign_extend 32) (currentBit!9708 (_2!9728 lt!334680))) lt!334699)))

(declare-fun lt!334696 () Unit!15142)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8344 array!10517 (_ BitVec 64)) Unit!15142)

(assert (=> b!212176 (= lt!334696 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9728 lt!334680) (buf!5147 (_2!9728 lt!334681)) lt!334699))))

(assert (=> b!212176 (= lt!334699 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!334695 () (_ BitVec 64))

(declare-fun lt!334694 () (_ BitVec 64))

(declare-fun lt!334701 () tuple2!18148)

(assert (=> b!212176 (= lt!334683 (bvor lt!334694 (ite (_2!9729 lt!334701) lt!334695 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!334693 () tuple2!18152)

(declare-fun lt!334686 () tuple2!18150)

(assert (=> b!212176 (= lt!334693 (readNBitsLSBFirstsLoopPure!0 (_1!9730 lt!334686) nBits!348 i!590 lt!334694))))

(declare-fun lt!334688 () (_ BitVec 64))

(assert (=> b!212176 (validate_offset_bits!1 ((_ sign_extend 32) (size!4618 (buf!5147 (_2!9728 lt!334681)))) ((_ sign_extend 32) (currentByte!9713 thiss!1204)) ((_ sign_extend 32) (currentBit!9708 thiss!1204)) lt!334688)))

(declare-fun lt!334692 () Unit!15142)

(assert (=> b!212176 (= lt!334692 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5147 (_2!9728 lt!334681)) lt!334688))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!212176 (= lt!334694 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!212176 (= (_2!9729 lt!334701) lt!334702)))

(assert (=> b!212176 (= lt!334701 (readBitPure!0 (_1!9730 lt!334686)))))

(declare-fun reader!0 (BitStream!8344 BitStream!8344) tuple2!18150)

(assert (=> b!212176 (= lt!334687 (reader!0 (_2!9728 lt!334680) (_2!9728 lt!334681)))))

(assert (=> b!212176 (= lt!334686 (reader!0 thiss!1204 (_2!9728 lt!334681)))))

(declare-fun e!144608 () Bool)

(assert (=> b!212176 e!144608))

(declare-fun res!178214 () Bool)

(assert (=> b!212176 (=> (not res!178214) (not e!144608))))

(declare-fun lt!334679 () tuple2!18148)

(declare-fun lt!334684 () tuple2!18148)

(assert (=> b!212176 (= res!178214 (= (bitIndex!0 (size!4618 (buf!5147 (_1!9729 lt!334679))) (currentByte!9713 (_1!9729 lt!334679)) (currentBit!9708 (_1!9729 lt!334679))) (bitIndex!0 (size!4618 (buf!5147 (_1!9729 lt!334684))) (currentByte!9713 (_1!9729 lt!334684)) (currentBit!9708 (_1!9729 lt!334684)))))))

(declare-fun lt!334677 () Unit!15142)

(declare-fun lt!334698 () BitStream!8344)

(declare-fun readBitPrefixLemma!0 (BitStream!8344 BitStream!8344) Unit!15142)

(assert (=> b!212176 (= lt!334677 (readBitPrefixLemma!0 lt!334698 (_2!9728 lt!334681)))))

(assert (=> b!212176 (= lt!334684 (readBitPure!0 (BitStream!8345 (buf!5147 (_2!9728 lt!334681)) (currentByte!9713 thiss!1204) (currentBit!9708 thiss!1204))))))

(assert (=> b!212176 (= lt!334679 (readBitPure!0 lt!334698))))

(declare-fun e!144617 () Bool)

(assert (=> b!212176 e!144617))

(declare-fun res!178206 () Bool)

(assert (=> b!212176 (=> (not res!178206) (not e!144617))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!212176 (= res!178206 (invariant!0 (currentBit!9708 thiss!1204) (currentByte!9713 thiss!1204) (size!4618 (buf!5147 (_2!9728 lt!334680)))))))

(assert (=> b!212176 (= lt!334698 (BitStream!8345 (buf!5147 (_2!9728 lt!334680)) (currentByte!9713 thiss!1204) (currentBit!9708 thiss!1204)))))

(declare-fun b!212177 () Bool)

(declare-fun res!178199 () Bool)

(declare-fun e!144610 () Bool)

(assert (=> b!212177 (=> (not res!178199) (not e!144610))))

(declare-fun lt!334691 () (_ BitVec 64))

(declare-fun lt!334697 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8344 (_ BitVec 64)) BitStream!8344)

(assert (=> b!212177 (= res!178199 (= (_1!9730 lt!334686) (withMovedBitIndex!0 (_2!9730 lt!334686) (bvsub lt!334691 lt!334697))))))

(declare-fun b!212178 () Bool)

(assert (=> b!212178 (= e!144614 (= (bitIndex!0 (size!4618 (buf!5147 (_1!9729 lt!334682))) (currentByte!9713 (_1!9729 lt!334682)) (currentBit!9708 (_1!9729 lt!334682))) lt!334689))))

(declare-fun b!212179 () Bool)

(declare-fun lt!334703 () (_ BitVec 64))

(assert (=> b!212179 (= e!144618 (= lt!334691 (bvsub lt!334703 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!212179 e!144610))

(declare-fun res!178198 () Bool)

(assert (=> b!212179 (=> (not res!178198) (not e!144610))))

(declare-fun lt!334700 () tuple2!18152)

(assert (=> b!212179 (= res!178198 (and (= (_2!9731 lt!334693) (_2!9731 lt!334700)) (= (_1!9731 lt!334693) (_1!9731 lt!334700))))))

(declare-fun lt!334685 () Unit!15142)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8344 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15142)

(assert (=> b!212179 (= lt!334685 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9730 lt!334686) nBits!348 i!590 lt!334694))))

(assert (=> b!212179 (= lt!334700 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9730 lt!334686) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!334683))))

(declare-fun b!212180 () Bool)

(assert (=> b!212180 (= e!144610 (= (_1!9730 lt!334687) (withMovedBitIndex!0 (_2!9730 lt!334687) (bvsub lt!334703 lt!334697))))))

(declare-fun res!178212 () Bool)

(declare-fun e!144606 () Bool)

(assert (=> start!44544 (=> (not res!178212) (not e!144606))))

(assert (=> start!44544 (= res!178212 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44544 e!144606))

(assert (=> start!44544 true))

(declare-fun e!144616 () Bool)

(declare-fun inv!12 (BitStream!8344) Bool)

(assert (=> start!44544 (and (inv!12 thiss!1204) e!144616)))

(declare-fun b!212181 () Bool)

(declare-fun res!178201 () Bool)

(assert (=> b!212181 (=> res!178201 e!144609)))

(assert (=> b!212181 (= res!178201 (or (not (= (size!4618 (buf!5147 (_2!9728 lt!334681))) (size!4618 (buf!5147 thiss!1204)))) (not (= lt!334697 (bvsub (bvadd lt!334691 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!212182 () Bool)

(declare-fun res!178208 () Bool)

(assert (=> b!212182 (=> res!178208 e!144609)))

(declare-fun isPrefixOf!0 (BitStream!8344 BitStream!8344) Bool)

(assert (=> b!212182 (= res!178208 (not (isPrefixOf!0 thiss!1204 (_2!9728 lt!334680))))))

(declare-fun b!212183 () Bool)

(declare-fun e!144611 () Bool)

(assert (=> b!212183 (= e!144606 e!144611)))

(declare-fun res!178197 () Bool)

(assert (=> b!212183 (=> (not res!178197) (not e!144611))))

(assert (=> b!212183 (= res!178197 (validate_offset_bits!1 ((_ sign_extend 32) (size!4618 (buf!5147 thiss!1204))) ((_ sign_extend 32) (currentByte!9713 thiss!1204)) ((_ sign_extend 32) (currentBit!9708 thiss!1204)) lt!334688))))

(assert (=> b!212183 (= lt!334688 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!212184 () Bool)

(assert (=> b!212184 (= e!144608 (= (_2!9729 lt!334679) (_2!9729 lt!334684)))))

(declare-fun b!212185 () Bool)

(declare-fun res!178203 () Bool)

(assert (=> b!212185 (=> (not res!178203) (not e!144612))))

(assert (=> b!212185 (= res!178203 (isPrefixOf!0 thiss!1204 (_2!9728 lt!334680)))))

(declare-fun b!212186 () Bool)

(declare-fun array_inv!4359 (array!10517) Bool)

(assert (=> b!212186 (= e!144616 (array_inv!4359 (buf!5147 thiss!1204)))))

(declare-fun b!212187 () Bool)

(declare-fun e!144615 () Bool)

(assert (=> b!212187 (= e!144611 (not e!144615))))

(declare-fun res!178213 () Bool)

(assert (=> b!212187 (=> res!178213 e!144615)))

(assert (=> b!212187 (= res!178213 (not (= lt!334703 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!334691))))))

(assert (=> b!212187 (= lt!334703 (bitIndex!0 (size!4618 (buf!5147 (_2!9728 lt!334680))) (currentByte!9713 (_2!9728 lt!334680)) (currentBit!9708 (_2!9728 lt!334680))))))

(assert (=> b!212187 (= lt!334691 (bitIndex!0 (size!4618 (buf!5147 thiss!1204)) (currentByte!9713 thiss!1204) (currentBit!9708 thiss!1204)))))

(assert (=> b!212187 e!144613))

(declare-fun res!178210 () Bool)

(assert (=> b!212187 (=> (not res!178210) (not e!144613))))

(assert (=> b!212187 (= res!178210 (= (size!4618 (buf!5147 thiss!1204)) (size!4618 (buf!5147 (_2!9728 lt!334680)))))))

(declare-fun appendBit!0 (BitStream!8344 Bool) tuple2!18146)

(assert (=> b!212187 (= lt!334680 (appendBit!0 thiss!1204 lt!334702))))

(assert (=> b!212187 (= lt!334702 (not (= (bvand v!189 lt!334695) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212187 (= lt!334695 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!212188 () Bool)

(declare-fun res!178204 () Bool)

(assert (=> b!212188 (=> (not res!178204) (not e!144611))))

(assert (=> b!212188 (= res!178204 (not (= i!590 nBits!348)))))

(declare-fun b!212189 () Bool)

(assert (=> b!212189 (= e!144617 (invariant!0 (currentBit!9708 thiss!1204) (currentByte!9713 thiss!1204) (size!4618 (buf!5147 (_2!9728 lt!334681)))))))

(declare-fun b!212190 () Bool)

(declare-fun res!178211 () Bool)

(assert (=> b!212190 (=> res!178211 e!144609)))

(assert (=> b!212190 (= res!178211 (not (invariant!0 (currentBit!9708 (_2!9728 lt!334681)) (currentByte!9713 (_2!9728 lt!334681)) (size!4618 (buf!5147 (_2!9728 lt!334681))))))))

(declare-fun b!212191 () Bool)

(assert (=> b!212191 (= e!144615 e!144609)))

(declare-fun res!178209 () Bool)

(assert (=> b!212191 (=> res!178209 e!144609)))

(assert (=> b!212191 (= res!178209 (not (= lt!334697 (bvsub (bvsub (bvadd lt!334703 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!212191 (= lt!334697 (bitIndex!0 (size!4618 (buf!5147 (_2!9728 lt!334681))) (currentByte!9713 (_2!9728 lt!334681)) (currentBit!9708 (_2!9728 lt!334681))))))

(assert (=> b!212191 (isPrefixOf!0 thiss!1204 (_2!9728 lt!334681))))

(declare-fun lt!334690 () Unit!15142)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8344 BitStream!8344 BitStream!8344) Unit!15142)

(assert (=> b!212191 (= lt!334690 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9728 lt!334680) (_2!9728 lt!334681)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8344 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18146)

(assert (=> b!212191 (= lt!334681 (appendBitsLSBFirstLoopTR!0 (_2!9728 lt!334680) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!212192 () Bool)

(declare-fun res!178207 () Bool)

(assert (=> b!212192 (=> (not res!178207) (not e!144611))))

(assert (=> b!212192 (= res!178207 (invariant!0 (currentBit!9708 thiss!1204) (currentByte!9713 thiss!1204) (size!4618 (buf!5147 thiss!1204))))))

(declare-fun b!212193 () Bool)

(declare-fun res!178196 () Bool)

(assert (=> b!212193 (=> res!178196 e!144609)))

(assert (=> b!212193 (= res!178196 (not (isPrefixOf!0 (_2!9728 lt!334680) (_2!9728 lt!334681))))))

(assert (= (and start!44544 res!178212) b!212183))

(assert (= (and b!212183 res!178197) b!212192))

(assert (= (and b!212192 res!178207) b!212188))

(assert (= (and b!212188 res!178204) b!212187))

(assert (= (and b!212187 res!178210) b!212174))

(assert (= (and b!212174 res!178200) b!212185))

(assert (= (and b!212185 res!178203) b!212175))

(assert (= (and b!212175 res!178205) b!212178))

(assert (= (and b!212187 (not res!178213)) b!212191))

(assert (= (and b!212191 (not res!178209)) b!212190))

(assert (= (and b!212190 (not res!178211)) b!212181))

(assert (= (and b!212181 (not res!178201)) b!212193))

(assert (= (and b!212193 (not res!178196)) b!212182))

(assert (= (and b!212182 (not res!178208)) b!212176))

(assert (= (and b!212176 res!178206) b!212189))

(assert (= (and b!212176 res!178214) b!212184))

(assert (= (and b!212176 (not res!178202)) b!212179))

(assert (= (and b!212179 res!178198) b!212177))

(assert (= (and b!212177 res!178199) b!212180))

(assert (= start!44544 b!212186))

(declare-fun m!327159 () Bool)

(assert (=> b!212191 m!327159))

(declare-fun m!327161 () Bool)

(assert (=> b!212191 m!327161))

(declare-fun m!327163 () Bool)

(assert (=> b!212191 m!327163))

(declare-fun m!327165 () Bool)

(assert (=> b!212191 m!327165))

(declare-fun m!327167 () Bool)

(assert (=> b!212189 m!327167))

(declare-fun m!327169 () Bool)

(assert (=> b!212183 m!327169))

(declare-fun m!327171 () Bool)

(assert (=> b!212182 m!327171))

(declare-fun m!327173 () Bool)

(assert (=> start!44544 m!327173))

(declare-fun m!327175 () Bool)

(assert (=> b!212176 m!327175))

(declare-fun m!327177 () Bool)

(assert (=> b!212176 m!327177))

(declare-fun m!327179 () Bool)

(assert (=> b!212176 m!327179))

(declare-fun m!327181 () Bool)

(assert (=> b!212176 m!327181))

(declare-fun m!327183 () Bool)

(assert (=> b!212176 m!327183))

(declare-fun m!327185 () Bool)

(assert (=> b!212176 m!327185))

(declare-fun m!327187 () Bool)

(assert (=> b!212176 m!327187))

(declare-fun m!327189 () Bool)

(assert (=> b!212176 m!327189))

(declare-fun m!327191 () Bool)

(assert (=> b!212176 m!327191))

(declare-fun m!327193 () Bool)

(assert (=> b!212176 m!327193))

(declare-fun m!327195 () Bool)

(assert (=> b!212176 m!327195))

(declare-fun m!327197 () Bool)

(assert (=> b!212176 m!327197))

(declare-fun m!327199 () Bool)

(assert (=> b!212176 m!327199))

(declare-fun m!327201 () Bool)

(assert (=> b!212176 m!327201))

(declare-fun m!327203 () Bool)

(assert (=> b!212176 m!327203))

(declare-fun m!327205 () Bool)

(assert (=> b!212176 m!327205))

(declare-fun m!327207 () Bool)

(assert (=> b!212178 m!327207))

(declare-fun m!327209 () Bool)

(assert (=> b!212192 m!327209))

(declare-fun m!327211 () Bool)

(assert (=> b!212180 m!327211))

(declare-fun m!327213 () Bool)

(assert (=> b!212177 m!327213))

(declare-fun m!327215 () Bool)

(assert (=> b!212175 m!327215))

(assert (=> b!212175 m!327215))

(declare-fun m!327217 () Bool)

(assert (=> b!212175 m!327217))

(declare-fun m!327219 () Bool)

(assert (=> b!212174 m!327219))

(declare-fun m!327221 () Bool)

(assert (=> b!212174 m!327221))

(assert (=> b!212185 m!327171))

(assert (=> b!212187 m!327219))

(assert (=> b!212187 m!327221))

(declare-fun m!327223 () Bool)

(assert (=> b!212187 m!327223))

(declare-fun m!327225 () Bool)

(assert (=> b!212186 m!327225))

(declare-fun m!327227 () Bool)

(assert (=> b!212179 m!327227))

(declare-fun m!327229 () Bool)

(assert (=> b!212179 m!327229))

(assert (=> b!212179 m!327229))

(declare-fun m!327231 () Bool)

(assert (=> b!212179 m!327231))

(declare-fun m!327233 () Bool)

(assert (=> b!212190 m!327233))

(declare-fun m!327235 () Bool)

(assert (=> b!212193 m!327235))

(push 1)

(assert (not b!212189))

(assert (not b!212186))

(assert (not b!212191))

(assert (not b!212180))

(assert (not b!212182))

(assert (not b!212185))

(assert (not b!212174))

(assert (not b!212183))

(assert (not b!212177))

(assert (not b!212187))

(assert (not b!212178))

(assert (not b!212192))

(assert (not b!212179))

(assert (not b!212176))

(assert (not b!212193))

(assert (not b!212175))

(assert (not b!212190))

(assert (not start!44544))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

