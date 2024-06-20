; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39736 () Bool)

(assert start!39736)

(declare-fun b!180161 () Bool)

(declare-fun res!149567 () Bool)

(declare-fun e!125225 () Bool)

(assert (=> b!180161 (=> res!149567 e!125225)))

(declare-datatypes ((array!9670 0))(
  ( (array!9671 (arr!5195 (Array (_ BitVec 32) (_ BitVec 8))) (size!4265 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7638 0))(
  ( (BitStream!7639 (buf!4708 array!9670) (currentByte!8918 (_ BitVec 32)) (currentBit!8913 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7638)

(declare-datatypes ((Unit!12949 0))(
  ( (Unit!12950) )
))
(declare-datatypes ((tuple2!15536 0))(
  ( (tuple2!15537 (_1!8413 Unit!12949) (_2!8413 BitStream!7638)) )
))
(declare-fun lt!276277 () tuple2!15536)

(declare-fun isPrefixOf!0 (BitStream!7638 BitStream!7638) Bool)

(assert (=> b!180161 (= res!149567 (not (isPrefixOf!0 thiss!1204 (_2!8413 lt!276277))))))

(declare-fun b!180162 () Bool)

(assert (=> b!180162 (= e!125225 true)))

(declare-datatypes ((tuple2!15538 0))(
  ( (tuple2!15539 (_1!8414 BitStream!7638) (_2!8414 BitStream!7638)) )
))
(declare-fun lt!276273 () tuple2!15538)

(declare-fun lt!276279 () Bool)

(declare-datatypes ((tuple2!15540 0))(
  ( (tuple2!15541 (_1!8415 BitStream!7638) (_2!8415 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!7638) tuple2!15540)

(assert (=> b!180162 (= (_2!8415 (readBitPure!0 (_1!8414 lt!276273))) lt!276279)))

(declare-fun lt!276275 () tuple2!15538)

(declare-fun lt!276280 () tuple2!15536)

(declare-fun reader!0 (BitStream!7638 BitStream!7638) tuple2!15538)

(assert (=> b!180162 (= lt!276275 (reader!0 (_2!8413 lt!276277) (_2!8413 lt!276280)))))

(assert (=> b!180162 (= lt!276273 (reader!0 thiss!1204 (_2!8413 lt!276280)))))

(declare-fun e!125227 () Bool)

(assert (=> b!180162 e!125227))

(declare-fun res!149571 () Bool)

(assert (=> b!180162 (=> (not res!149571) (not e!125227))))

(declare-fun lt!276286 () tuple2!15540)

(declare-fun lt!276284 () tuple2!15540)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!180162 (= res!149571 (= (bitIndex!0 (size!4265 (buf!4708 (_1!8415 lt!276286))) (currentByte!8918 (_1!8415 lt!276286)) (currentBit!8913 (_1!8415 lt!276286))) (bitIndex!0 (size!4265 (buf!4708 (_1!8415 lt!276284))) (currentByte!8918 (_1!8415 lt!276284)) (currentBit!8913 (_1!8415 lt!276284)))))))

(declare-fun lt!276276 () Unit!12949)

(declare-fun lt!276282 () BitStream!7638)

(declare-fun readBitPrefixLemma!0 (BitStream!7638 BitStream!7638) Unit!12949)

(assert (=> b!180162 (= lt!276276 (readBitPrefixLemma!0 lt!276282 (_2!8413 lt!276280)))))

(assert (=> b!180162 (= lt!276284 (readBitPure!0 (BitStream!7639 (buf!4708 (_2!8413 lt!276280)) (currentByte!8918 thiss!1204) (currentBit!8913 thiss!1204))))))

(assert (=> b!180162 (= lt!276286 (readBitPure!0 lt!276282))))

(declare-fun e!125223 () Bool)

(assert (=> b!180162 e!125223))

(declare-fun res!149569 () Bool)

(assert (=> b!180162 (=> (not res!149569) (not e!125223))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!180162 (= res!149569 (invariant!0 (currentBit!8913 thiss!1204) (currentByte!8918 thiss!1204) (size!4265 (buf!4708 (_2!8413 lt!276277)))))))

(assert (=> b!180162 (= lt!276282 (BitStream!7639 (buf!4708 (_2!8413 lt!276277)) (currentByte!8918 thiss!1204) (currentBit!8913 thiss!1204)))))

(declare-fun b!180163 () Bool)

(assert (=> b!180163 (= e!125223 (invariant!0 (currentBit!8913 thiss!1204) (currentByte!8918 thiss!1204) (size!4265 (buf!4708 (_2!8413 lt!276280)))))))

(declare-fun b!180164 () Bool)

(declare-fun res!149573 () Bool)

(declare-fun e!125226 () Bool)

(assert (=> b!180164 (=> (not res!149573) (not e!125226))))

(assert (=> b!180164 (= res!149573 (invariant!0 (currentBit!8913 thiss!1204) (currentByte!8918 thiss!1204) (size!4265 (buf!4708 thiss!1204))))))

(declare-fun res!149574 () Bool)

(assert (=> start!39736 (=> (not res!149574) (not e!125226))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!39736 (= res!149574 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39736 e!125226))

(assert (=> start!39736 true))

(declare-fun e!125222 () Bool)

(declare-fun inv!12 (BitStream!7638) Bool)

(assert (=> start!39736 (and (inv!12 thiss!1204) e!125222)))

(declare-fun b!180165 () Bool)

(declare-fun res!149568 () Bool)

(declare-fun e!125224 () Bool)

(assert (=> b!180165 (=> (not res!149568) (not e!125224))))

(assert (=> b!180165 (= res!149568 (isPrefixOf!0 thiss!1204 (_2!8413 lt!276277)))))

(declare-fun b!180166 () Bool)

(declare-fun res!149575 () Bool)

(assert (=> b!180166 (=> (not res!149575) (not e!125226))))

(assert (=> b!180166 (= res!149575 (not (= i!590 nBits!348)))))

(declare-fun b!180167 () Bool)

(declare-fun e!125230 () Bool)

(assert (=> b!180167 (= e!125230 e!125225)))

(declare-fun res!149572 () Bool)

(assert (=> b!180167 (=> res!149572 e!125225)))

(declare-fun lt!276285 () (_ BitVec 64))

(declare-fun lt!276287 () (_ BitVec 64))

(assert (=> b!180167 (= res!149572 (not (= lt!276287 (bvsub (bvsub (bvadd lt!276285 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!180167 (= lt!276287 (bitIndex!0 (size!4265 (buf!4708 (_2!8413 lt!276280))) (currentByte!8918 (_2!8413 lt!276280)) (currentBit!8913 (_2!8413 lt!276280))))))

(assert (=> b!180167 (isPrefixOf!0 thiss!1204 (_2!8413 lt!276280))))

(declare-fun lt!276283 () Unit!12949)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7638 BitStream!7638 BitStream!7638) Unit!12949)

(assert (=> b!180167 (= lt!276283 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8413 lt!276277) (_2!8413 lt!276280)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7638 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15536)

(assert (=> b!180167 (= lt!276280 (appendBitsLSBFirstLoopTR!0 (_2!8413 lt!276277) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!180168 () Bool)

(declare-fun res!149576 () Bool)

(assert (=> b!180168 (=> res!149576 e!125225)))

(declare-fun lt!276272 () (_ BitVec 64))

(assert (=> b!180168 (= res!149576 (or (not (= (size!4265 (buf!4708 (_2!8413 lt!276280))) (size!4265 (buf!4708 thiss!1204)))) (not (= lt!276287 (bvsub (bvadd lt!276272 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!180169 () Bool)

(declare-fun e!125221 () Bool)

(declare-fun lt!276274 () tuple2!15540)

(declare-fun lt!276281 () (_ BitVec 64))

(assert (=> b!180169 (= e!125221 (= (bitIndex!0 (size!4265 (buf!4708 (_1!8415 lt!276274))) (currentByte!8918 (_1!8415 lt!276274)) (currentBit!8913 (_1!8415 lt!276274))) lt!276281))))

(declare-fun b!180170 () Bool)

(assert (=> b!180170 (= e!125226 (not e!125230))))

(declare-fun res!149565 () Bool)

(assert (=> b!180170 (=> res!149565 e!125230)))

(assert (=> b!180170 (= res!149565 (not (= lt!276285 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!276272))))))

(assert (=> b!180170 (= lt!276285 (bitIndex!0 (size!4265 (buf!4708 (_2!8413 lt!276277))) (currentByte!8918 (_2!8413 lt!276277)) (currentBit!8913 (_2!8413 lt!276277))))))

(assert (=> b!180170 (= lt!276272 (bitIndex!0 (size!4265 (buf!4708 thiss!1204)) (currentByte!8918 thiss!1204) (currentBit!8913 thiss!1204)))))

(declare-fun e!125228 () Bool)

(assert (=> b!180170 e!125228))

(declare-fun res!149570 () Bool)

(assert (=> b!180170 (=> (not res!149570) (not e!125228))))

(assert (=> b!180170 (= res!149570 (= (size!4265 (buf!4708 thiss!1204)) (size!4265 (buf!4708 (_2!8413 lt!276277)))))))

(declare-fun appendBit!0 (BitStream!7638 Bool) tuple2!15536)

(assert (=> b!180170 (= lt!276277 (appendBit!0 thiss!1204 lt!276279))))

(assert (=> b!180170 (= lt!276279 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!180171 () Bool)

(declare-fun res!149566 () Bool)

(assert (=> b!180171 (=> res!149566 e!125225)))

(assert (=> b!180171 (= res!149566 (not (isPrefixOf!0 (_2!8413 lt!276277) (_2!8413 lt!276280))))))

(declare-fun b!180172 () Bool)

(assert (=> b!180172 (= e!125224 e!125221)))

(declare-fun res!149564 () Bool)

(assert (=> b!180172 (=> (not res!149564) (not e!125221))))

(assert (=> b!180172 (= res!149564 (and (= (_2!8415 lt!276274) lt!276279) (= (_1!8415 lt!276274) (_2!8413 lt!276277))))))

(declare-fun readerFrom!0 (BitStream!7638 (_ BitVec 32) (_ BitVec 32)) BitStream!7638)

(assert (=> b!180172 (= lt!276274 (readBitPure!0 (readerFrom!0 (_2!8413 lt!276277) (currentBit!8913 thiss!1204) (currentByte!8918 thiss!1204))))))

(declare-fun b!180173 () Bool)

(assert (=> b!180173 (= e!125228 e!125224)))

(declare-fun res!149563 () Bool)

(assert (=> b!180173 (=> (not res!149563) (not e!125224))))

(declare-fun lt!276278 () (_ BitVec 64))

(assert (=> b!180173 (= res!149563 (= lt!276281 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!276278)))))

(assert (=> b!180173 (= lt!276281 (bitIndex!0 (size!4265 (buf!4708 (_2!8413 lt!276277))) (currentByte!8918 (_2!8413 lt!276277)) (currentBit!8913 (_2!8413 lt!276277))))))

(assert (=> b!180173 (= lt!276278 (bitIndex!0 (size!4265 (buf!4708 thiss!1204)) (currentByte!8918 thiss!1204) (currentBit!8913 thiss!1204)))))

(declare-fun b!180174 () Bool)

(assert (=> b!180174 (= e!125227 (= (_2!8415 lt!276286) (_2!8415 lt!276284)))))

(declare-fun b!180175 () Bool)

(declare-fun res!149577 () Bool)

(assert (=> b!180175 (=> (not res!149577) (not e!125226))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!180175 (= res!149577 (validate_offset_bits!1 ((_ sign_extend 32) (size!4265 (buf!4708 thiss!1204))) ((_ sign_extend 32) (currentByte!8918 thiss!1204)) ((_ sign_extend 32) (currentBit!8913 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!180176 () Bool)

(declare-fun res!149562 () Bool)

(assert (=> b!180176 (=> res!149562 e!125225)))

(assert (=> b!180176 (= res!149562 (not (invariant!0 (currentBit!8913 (_2!8413 lt!276280)) (currentByte!8918 (_2!8413 lt!276280)) (size!4265 (buf!4708 (_2!8413 lt!276280))))))))

(declare-fun b!180177 () Bool)

(declare-fun array_inv!4006 (array!9670) Bool)

(assert (=> b!180177 (= e!125222 (array_inv!4006 (buf!4708 thiss!1204)))))

(assert (= (and start!39736 res!149574) b!180175))

(assert (= (and b!180175 res!149577) b!180164))

(assert (= (and b!180164 res!149573) b!180166))

(assert (= (and b!180166 res!149575) b!180170))

(assert (= (and b!180170 res!149570) b!180173))

(assert (= (and b!180173 res!149563) b!180165))

(assert (= (and b!180165 res!149568) b!180172))

(assert (= (and b!180172 res!149564) b!180169))

(assert (= (and b!180170 (not res!149565)) b!180167))

(assert (= (and b!180167 (not res!149572)) b!180176))

(assert (= (and b!180176 (not res!149562)) b!180168))

(assert (= (and b!180168 (not res!149576)) b!180171))

(assert (= (and b!180171 (not res!149566)) b!180161))

(assert (= (and b!180161 (not res!149567)) b!180162))

(assert (= (and b!180162 res!149569) b!180163))

(assert (= (and b!180162 res!149571) b!180174))

(assert (= start!39736 b!180177))

(declare-fun m!280543 () Bool)

(assert (=> b!180175 m!280543))

(declare-fun m!280545 () Bool)

(assert (=> start!39736 m!280545))

(declare-fun m!280547 () Bool)

(assert (=> b!180177 m!280547))

(declare-fun m!280549 () Bool)

(assert (=> b!180170 m!280549))

(declare-fun m!280551 () Bool)

(assert (=> b!180170 m!280551))

(declare-fun m!280553 () Bool)

(assert (=> b!180170 m!280553))

(declare-fun m!280555 () Bool)

(assert (=> b!180167 m!280555))

(declare-fun m!280557 () Bool)

(assert (=> b!180167 m!280557))

(declare-fun m!280559 () Bool)

(assert (=> b!180167 m!280559))

(declare-fun m!280561 () Bool)

(assert (=> b!180167 m!280561))

(declare-fun m!280563 () Bool)

(assert (=> b!180163 m!280563))

(assert (=> b!180173 m!280549))

(assert (=> b!180173 m!280551))

(declare-fun m!280565 () Bool)

(assert (=> b!180164 m!280565))

(declare-fun m!280567 () Bool)

(assert (=> b!180161 m!280567))

(declare-fun m!280569 () Bool)

(assert (=> b!180169 m!280569))

(assert (=> b!180165 m!280567))

(declare-fun m!280571 () Bool)

(assert (=> b!180172 m!280571))

(assert (=> b!180172 m!280571))

(declare-fun m!280573 () Bool)

(assert (=> b!180172 m!280573))

(declare-fun m!280575 () Bool)

(assert (=> b!180162 m!280575))

(declare-fun m!280577 () Bool)

(assert (=> b!180162 m!280577))

(declare-fun m!280579 () Bool)

(assert (=> b!180162 m!280579))

(declare-fun m!280581 () Bool)

(assert (=> b!180162 m!280581))

(declare-fun m!280583 () Bool)

(assert (=> b!180162 m!280583))

(declare-fun m!280585 () Bool)

(assert (=> b!180162 m!280585))

(declare-fun m!280587 () Bool)

(assert (=> b!180162 m!280587))

(declare-fun m!280589 () Bool)

(assert (=> b!180162 m!280589))

(declare-fun m!280591 () Bool)

(assert (=> b!180162 m!280591))

(declare-fun m!280593 () Bool)

(assert (=> b!180176 m!280593))

(declare-fun m!280595 () Bool)

(assert (=> b!180171 m!280595))

(check-sat (not b!180176) (not b!180169) (not b!180164) (not b!180170) (not b!180175) (not b!180162) (not b!180167) (not b!180171) (not b!180177) (not b!180163) (not b!180161) (not b!180172) (not start!39736) (not b!180165) (not b!180173))
