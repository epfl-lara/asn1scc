; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43594 () Bool)

(assert start!43594)

(declare-fun b!206135 () Bool)

(declare-fun res!172818 () Bool)

(declare-fun e!140971 () Bool)

(assert (=> b!206135 (=> (not res!172818) (not e!140971))))

(declare-datatypes ((array!10377 0))(
  ( (array!10378 (arr!5490 (Array (_ BitVec 32) (_ BitVec 8))) (size!4560 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8228 0))(
  ( (BitStream!8229 (buf!5065 array!10377) (currentByte!9583 (_ BitVec 32)) (currentBit!9578 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8228)

(declare-datatypes ((Unit!14714 0))(
  ( (Unit!14715) )
))
(declare-datatypes ((tuple2!17606 0))(
  ( (tuple2!17607 (_1!9458 Unit!14714) (_2!9458 BitStream!8228)) )
))
(declare-fun lt!322327 () tuple2!17606)

(declare-fun isPrefixOf!0 (BitStream!8228 BitStream!8228) Bool)

(assert (=> b!206135 (= res!172818 (isPrefixOf!0 thiss!1204 (_2!9458 lt!322327)))))

(declare-fun b!206136 () Bool)

(declare-fun e!140974 () Bool)

(declare-fun e!140969 () Bool)

(assert (=> b!206136 (= e!140974 e!140969)))

(declare-fun res!172817 () Bool)

(assert (=> b!206136 (=> res!172817 e!140969)))

(declare-fun lt!322328 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!322338 () (_ BitVec 64))

(assert (=> b!206136 (= res!172817 (not (= lt!322328 (bvsub (bvsub (bvadd lt!322338 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!322330 () tuple2!17606)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!206136 (= lt!322328 (bitIndex!0 (size!4560 (buf!5065 (_2!9458 lt!322330))) (currentByte!9583 (_2!9458 lt!322330)) (currentBit!9578 (_2!9458 lt!322330))))))

(assert (=> b!206136 (isPrefixOf!0 thiss!1204 (_2!9458 lt!322330))))

(declare-fun lt!322325 () Unit!14714)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8228 BitStream!8228 BitStream!8228) Unit!14714)

(assert (=> b!206136 (= lt!322325 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9458 lt!322327) (_2!9458 lt!322330)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8228 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17606)

(assert (=> b!206136 (= lt!322330 (appendBitsLSBFirstLoopTR!0 (_2!9458 lt!322327) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!206137 () Bool)

(declare-fun e!140968 () Bool)

(assert (=> b!206137 (= e!140968 (not e!140974))))

(declare-fun res!172811 () Bool)

(assert (=> b!206137 (=> res!172811 e!140974)))

(declare-fun lt!322329 () (_ BitVec 64))

(assert (=> b!206137 (= res!172811 (not (= lt!322338 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322329))))))

(assert (=> b!206137 (= lt!322338 (bitIndex!0 (size!4560 (buf!5065 (_2!9458 lt!322327))) (currentByte!9583 (_2!9458 lt!322327)) (currentBit!9578 (_2!9458 lt!322327))))))

(assert (=> b!206137 (= lt!322329 (bitIndex!0 (size!4560 (buf!5065 thiss!1204)) (currentByte!9583 thiss!1204) (currentBit!9578 thiss!1204)))))

(declare-fun e!140973 () Bool)

(assert (=> b!206137 e!140973))

(declare-fun res!172812 () Bool)

(assert (=> b!206137 (=> (not res!172812) (not e!140973))))

(assert (=> b!206137 (= res!172812 (= (size!4560 (buf!5065 thiss!1204)) (size!4560 (buf!5065 (_2!9458 lt!322327)))))))

(declare-fun lt!322326 () Bool)

(declare-fun appendBit!0 (BitStream!8228 Bool) tuple2!17606)

(assert (=> b!206137 (= lt!322327 (appendBit!0 thiss!1204 lt!322326))))

(assert (=> b!206137 (= lt!322326 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!206138 () Bool)

(declare-fun res!172820 () Bool)

(assert (=> b!206138 (=> res!172820 e!140969)))

(assert (=> b!206138 (= res!172820 (or (not (= (size!4560 (buf!5065 (_2!9458 lt!322330))) (size!4560 (buf!5065 thiss!1204)))) (not (= lt!322328 (bvsub (bvadd lt!322329 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun res!172813 () Bool)

(assert (=> start!43594 (=> (not res!172813) (not e!140968))))

(assert (=> start!43594 (= res!172813 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43594 e!140968))

(assert (=> start!43594 true))

(declare-fun e!140972 () Bool)

(declare-fun inv!12 (BitStream!8228) Bool)

(assert (=> start!43594 (and (inv!12 thiss!1204) e!140972)))

(declare-fun b!206139 () Bool)

(declare-fun e!140967 () Bool)

(declare-datatypes ((tuple2!17608 0))(
  ( (tuple2!17609 (_1!9459 BitStream!8228) (_2!9459 Bool)) )
))
(declare-fun lt!322331 () tuple2!17608)

(declare-fun lt!322336 () (_ BitVec 64))

(assert (=> b!206139 (= e!140967 (= (bitIndex!0 (size!4560 (buf!5065 (_1!9459 lt!322331))) (currentByte!9583 (_1!9459 lt!322331)) (currentBit!9578 (_1!9459 lt!322331))) lt!322336))))

(declare-fun b!206140 () Bool)

(declare-fun e!140970 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!206140 (= e!140970 (invariant!0 (currentBit!9578 thiss!1204) (currentByte!9583 thiss!1204) (size!4560 (buf!5065 (_2!9458 lt!322330)))))))

(declare-fun b!206141 () Bool)

(assert (=> b!206141 (= e!140973 e!140971)))

(declare-fun res!172819 () Bool)

(assert (=> b!206141 (=> (not res!172819) (not e!140971))))

(declare-fun lt!322333 () (_ BitVec 64))

(assert (=> b!206141 (= res!172819 (= lt!322336 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322333)))))

(assert (=> b!206141 (= lt!322336 (bitIndex!0 (size!4560 (buf!5065 (_2!9458 lt!322327))) (currentByte!9583 (_2!9458 lt!322327)) (currentBit!9578 (_2!9458 lt!322327))))))

(assert (=> b!206141 (= lt!322333 (bitIndex!0 (size!4560 (buf!5065 thiss!1204)) (currentByte!9583 thiss!1204) (currentBit!9578 thiss!1204)))))

(declare-fun b!206142 () Bool)

(declare-fun array_inv!4301 (array!10377) Bool)

(assert (=> b!206142 (= e!140972 (array_inv!4301 (buf!5065 thiss!1204)))))

(declare-fun b!206143 () Bool)

(declare-fun res!172826 () Bool)

(assert (=> b!206143 (=> res!172826 e!140969)))

(assert (=> b!206143 (= res!172826 (not (isPrefixOf!0 (_2!9458 lt!322327) (_2!9458 lt!322330))))))

(declare-fun b!206144 () Bool)

(assert (=> b!206144 (= e!140971 e!140967)))

(declare-fun res!172824 () Bool)

(assert (=> b!206144 (=> (not res!172824) (not e!140967))))

(assert (=> b!206144 (= res!172824 (and (= (_2!9459 lt!322331) lt!322326) (= (_1!9459 lt!322331) (_2!9458 lt!322327))))))

(declare-fun readBitPure!0 (BitStream!8228) tuple2!17608)

(declare-fun readerFrom!0 (BitStream!8228 (_ BitVec 32) (_ BitVec 32)) BitStream!8228)

(assert (=> b!206144 (= lt!322331 (readBitPure!0 (readerFrom!0 (_2!9458 lt!322327) (currentBit!9578 thiss!1204) (currentByte!9583 thiss!1204))))))

(declare-fun b!206145 () Bool)

(declare-fun res!172821 () Bool)

(assert (=> b!206145 (=> (not res!172821) (not e!140968))))

(assert (=> b!206145 (= res!172821 (invariant!0 (currentBit!9578 thiss!1204) (currentByte!9583 thiss!1204) (size!4560 (buf!5065 thiss!1204))))))

(declare-fun b!206146 () Bool)

(declare-fun res!172823 () Bool)

(assert (=> b!206146 (=> res!172823 e!140969)))

(assert (=> b!206146 (= res!172823 (not (invariant!0 (currentBit!9578 (_2!9458 lt!322330)) (currentByte!9583 (_2!9458 lt!322330)) (size!4560 (buf!5065 (_2!9458 lt!322330))))))))

(declare-fun b!206147 () Bool)

(declare-fun e!140976 () Bool)

(declare-fun lt!322335 () tuple2!17608)

(declare-fun lt!322334 () tuple2!17608)

(assert (=> b!206147 (= e!140976 (= (_2!9459 lt!322335) (_2!9459 lt!322334)))))

(declare-fun b!206148 () Bool)

(declare-fun res!172822 () Bool)

(assert (=> b!206148 (=> (not res!172822) (not e!140968))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!206148 (= res!172822 (validate_offset_bits!1 ((_ sign_extend 32) (size!4560 (buf!5065 thiss!1204))) ((_ sign_extend 32) (currentByte!9583 thiss!1204)) ((_ sign_extend 32) (currentBit!9578 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!206149 () Bool)

(declare-fun res!172814 () Bool)

(assert (=> b!206149 (=> res!172814 e!140969)))

(assert (=> b!206149 (= res!172814 (not (isPrefixOf!0 thiss!1204 (_2!9458 lt!322327))))))

(declare-fun b!206150 () Bool)

(declare-fun res!172825 () Bool)

(assert (=> b!206150 (=> (not res!172825) (not e!140968))))

(assert (=> b!206150 (= res!172825 (not (= i!590 nBits!348)))))

(declare-fun b!206151 () Bool)

(assert (=> b!206151 (= e!140969 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand i!590 #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000))))))

(declare-datatypes ((tuple2!17610 0))(
  ( (tuple2!17611 (_1!9460 BitStream!8228) (_2!9460 BitStream!8228)) )
))
(declare-fun lt!322340 () tuple2!17610)

(assert (=> b!206151 (= (_2!9459 (readBitPure!0 (_1!9460 lt!322340))) lt!322326)))

(declare-fun lt!322332 () tuple2!17610)

(declare-fun reader!0 (BitStream!8228 BitStream!8228) tuple2!17610)

(assert (=> b!206151 (= lt!322332 (reader!0 (_2!9458 lt!322327) (_2!9458 lt!322330)))))

(assert (=> b!206151 (= lt!322340 (reader!0 thiss!1204 (_2!9458 lt!322330)))))

(assert (=> b!206151 e!140976))

(declare-fun res!172815 () Bool)

(assert (=> b!206151 (=> (not res!172815) (not e!140976))))

(assert (=> b!206151 (= res!172815 (= (bitIndex!0 (size!4560 (buf!5065 (_1!9459 lt!322335))) (currentByte!9583 (_1!9459 lt!322335)) (currentBit!9578 (_1!9459 lt!322335))) (bitIndex!0 (size!4560 (buf!5065 (_1!9459 lt!322334))) (currentByte!9583 (_1!9459 lt!322334)) (currentBit!9578 (_1!9459 lt!322334)))))))

(declare-fun lt!322337 () Unit!14714)

(declare-fun lt!322339 () BitStream!8228)

(declare-fun readBitPrefixLemma!0 (BitStream!8228 BitStream!8228) Unit!14714)

(assert (=> b!206151 (= lt!322337 (readBitPrefixLemma!0 lt!322339 (_2!9458 lt!322330)))))

(assert (=> b!206151 (= lt!322334 (readBitPure!0 (BitStream!8229 (buf!5065 (_2!9458 lt!322330)) (currentByte!9583 thiss!1204) (currentBit!9578 thiss!1204))))))

(assert (=> b!206151 (= lt!322335 (readBitPure!0 lt!322339))))

(assert (=> b!206151 e!140970))

(declare-fun res!172816 () Bool)

(assert (=> b!206151 (=> (not res!172816) (not e!140970))))

(assert (=> b!206151 (= res!172816 (invariant!0 (currentBit!9578 thiss!1204) (currentByte!9583 thiss!1204) (size!4560 (buf!5065 (_2!9458 lt!322327)))))))

(assert (=> b!206151 (= lt!322339 (BitStream!8229 (buf!5065 (_2!9458 lt!322327)) (currentByte!9583 thiss!1204) (currentBit!9578 thiss!1204)))))

(assert (= (and start!43594 res!172813) b!206148))

(assert (= (and b!206148 res!172822) b!206145))

(assert (= (and b!206145 res!172821) b!206150))

(assert (= (and b!206150 res!172825) b!206137))

(assert (= (and b!206137 res!172812) b!206141))

(assert (= (and b!206141 res!172819) b!206135))

(assert (= (and b!206135 res!172818) b!206144))

(assert (= (and b!206144 res!172824) b!206139))

(assert (= (and b!206137 (not res!172811)) b!206136))

(assert (= (and b!206136 (not res!172817)) b!206146))

(assert (= (and b!206146 (not res!172823)) b!206138))

(assert (= (and b!206138 (not res!172820)) b!206143))

(assert (= (and b!206143 (not res!172826)) b!206149))

(assert (= (and b!206149 (not res!172814)) b!206151))

(assert (= (and b!206151 res!172816) b!206140))

(assert (= (and b!206151 res!172815) b!206147))

(assert (= start!43594 b!206142))

(declare-fun m!317679 () Bool)

(assert (=> b!206141 m!317679))

(declare-fun m!317681 () Bool)

(assert (=> b!206141 m!317681))

(assert (=> b!206137 m!317679))

(assert (=> b!206137 m!317681))

(declare-fun m!317683 () Bool)

(assert (=> b!206137 m!317683))

(declare-fun m!317685 () Bool)

(assert (=> b!206139 m!317685))

(declare-fun m!317687 () Bool)

(assert (=> b!206143 m!317687))

(declare-fun m!317689 () Bool)

(assert (=> b!206148 m!317689))

(declare-fun m!317691 () Bool)

(assert (=> b!206145 m!317691))

(declare-fun m!317693 () Bool)

(assert (=> start!43594 m!317693))

(declare-fun m!317695 () Bool)

(assert (=> b!206135 m!317695))

(declare-fun m!317697 () Bool)

(assert (=> b!206151 m!317697))

(declare-fun m!317699 () Bool)

(assert (=> b!206151 m!317699))

(declare-fun m!317701 () Bool)

(assert (=> b!206151 m!317701))

(declare-fun m!317703 () Bool)

(assert (=> b!206151 m!317703))

(declare-fun m!317705 () Bool)

(assert (=> b!206151 m!317705))

(declare-fun m!317707 () Bool)

(assert (=> b!206151 m!317707))

(declare-fun m!317709 () Bool)

(assert (=> b!206151 m!317709))

(declare-fun m!317711 () Bool)

(assert (=> b!206151 m!317711))

(declare-fun m!317713 () Bool)

(assert (=> b!206151 m!317713))

(declare-fun m!317715 () Bool)

(assert (=> b!206144 m!317715))

(assert (=> b!206144 m!317715))

(declare-fun m!317717 () Bool)

(assert (=> b!206144 m!317717))

(declare-fun m!317719 () Bool)

(assert (=> b!206140 m!317719))

(declare-fun m!317721 () Bool)

(assert (=> b!206146 m!317721))

(assert (=> b!206149 m!317695))

(declare-fun m!317723 () Bool)

(assert (=> b!206142 m!317723))

(declare-fun m!317725 () Bool)

(assert (=> b!206136 m!317725))

(declare-fun m!317727 () Bool)

(assert (=> b!206136 m!317727))

(declare-fun m!317729 () Bool)

(assert (=> b!206136 m!317729))

(declare-fun m!317731 () Bool)

(assert (=> b!206136 m!317731))

(push 1)

(assert (not start!43594))

(assert (not b!206151))

(assert (not b!206149))

(assert (not b!206140))

(assert (not b!206148))

(assert (not b!206139))

(assert (not b!206144))

(assert (not b!206142))

(assert (not b!206145))

(assert (not b!206135))

(assert (not b!206141))

(assert (not b!206137))

(assert (not b!206143))

(assert (not b!206146))

(assert (not b!206136))

(check-sat)

(pop 1)

(push 1)

(check-sat)

