; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41762 () Bool)

(assert start!41762)

(declare-fun b!196386 () Bool)

(declare-fun res!164318 () Bool)

(declare-fun e!134970 () Bool)

(assert (=> b!196386 (=> (not res!164318) (not e!134970))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!10073 0))(
  ( (array!10074 (arr!5371 (Array (_ BitVec 32) (_ BitVec 8))) (size!4441 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7990 0))(
  ( (BitStream!7991 (buf!4927 array!10073) (currentByte!9247 (_ BitVec 32)) (currentBit!9242 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7990)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!196386 (= res!164318 (validate_offset_bits!1 ((_ sign_extend 32) (size!4441 (buf!4927 thiss!1204))) ((_ sign_extend 32) (currentByte!9247 thiss!1204)) ((_ sign_extend 32) (currentBit!9242 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!196387 () Bool)

(declare-fun res!164314 () Bool)

(declare-fun e!134971 () Bool)

(assert (=> b!196387 (=> res!164314 e!134971)))

(declare-datatypes ((Unit!13881 0))(
  ( (Unit!13882) )
))
(declare-datatypes ((tuple2!16988 0))(
  ( (tuple2!16989 (_1!9139 Unit!13881) (_2!9139 BitStream!7990)) )
))
(declare-fun lt!305505 () tuple2!16988)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!196387 (= res!164314 (not (invariant!0 (currentBit!9242 (_2!9139 lt!305505)) (currentByte!9247 (_2!9139 lt!305505)) (size!4441 (buf!4927 (_2!9139 lt!305505))))))))

(declare-fun b!196388 () Bool)

(declare-fun res!164313 () Bool)

(assert (=> b!196388 (=> (not res!164313) (not e!134970))))

(assert (=> b!196388 (= res!164313 (invariant!0 (currentBit!9242 thiss!1204) (currentByte!9247 thiss!1204) (size!4441 (buf!4927 thiss!1204))))))

(declare-fun b!196389 () Bool)

(declare-fun e!134965 () Bool)

(assert (=> b!196389 (= e!134965 e!134971)))

(declare-fun res!164321 () Bool)

(assert (=> b!196389 (=> res!164321 e!134971)))

(declare-fun lt!305507 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!196389 (= res!164321 (not (= (bitIndex!0 (size!4441 (buf!4927 (_2!9139 lt!305505))) (currentByte!9247 (_2!9139 lt!305505)) (currentBit!9242 (_2!9139 lt!305505))) (bvsub (bvsub (bvadd lt!305507 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun isPrefixOf!0 (BitStream!7990 BitStream!7990) Bool)

(assert (=> b!196389 (isPrefixOf!0 thiss!1204 (_2!9139 lt!305505))))

(declare-fun lt!305506 () tuple2!16988)

(declare-fun lt!305501 () Unit!13881)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7990 BitStream!7990 BitStream!7990) Unit!13881)

(assert (=> b!196389 (= lt!305501 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9139 lt!305506) (_2!9139 lt!305505)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7990 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16988)

(assert (=> b!196389 (= lt!305505 (appendBitsLSBFirstLoopTR!0 (_2!9139 lt!305506) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!196390 () Bool)

(declare-fun res!164312 () Bool)

(declare-fun e!134967 () Bool)

(assert (=> b!196390 (=> (not res!164312) (not e!134967))))

(assert (=> b!196390 (= res!164312 (isPrefixOf!0 thiss!1204 (_2!9139 lt!305506)))))

(declare-fun b!196391 () Bool)

(declare-fun e!134972 () Bool)

(assert (=> b!196391 (= e!134967 e!134972)))

(declare-fun res!164320 () Bool)

(assert (=> b!196391 (=> (not res!164320) (not e!134972))))

(declare-datatypes ((tuple2!16990 0))(
  ( (tuple2!16991 (_1!9140 BitStream!7990) (_2!9140 Bool)) )
))
(declare-fun lt!305508 () tuple2!16990)

(declare-fun lt!305502 () Bool)

(assert (=> b!196391 (= res!164320 (and (= (_2!9140 lt!305508) lt!305502) (= (_1!9140 lt!305508) (_2!9139 lt!305506))))))

(declare-fun readBitPure!0 (BitStream!7990) tuple2!16990)

(declare-fun readerFrom!0 (BitStream!7990 (_ BitVec 32) (_ BitVec 32)) BitStream!7990)

(assert (=> b!196391 (= lt!305508 (readBitPure!0 (readerFrom!0 (_2!9139 lt!305506) (currentBit!9242 thiss!1204) (currentByte!9247 thiss!1204))))))

(declare-fun b!196392 () Bool)

(assert (=> b!196392 (= e!134971 (= (size!4441 (buf!4927 (_2!9139 lt!305505))) (size!4441 (buf!4927 thiss!1204))))))

(declare-fun b!196393 () Bool)

(assert (=> b!196393 (= e!134970 (not e!134965))))

(declare-fun res!164316 () Bool)

(assert (=> b!196393 (=> res!164316 e!134965)))

(declare-fun lt!305503 () (_ BitVec 64))

(assert (=> b!196393 (= res!164316 (not (= lt!305507 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!305503))))))

(assert (=> b!196393 (= lt!305507 (bitIndex!0 (size!4441 (buf!4927 (_2!9139 lt!305506))) (currentByte!9247 (_2!9139 lt!305506)) (currentBit!9242 (_2!9139 lt!305506))))))

(assert (=> b!196393 (= lt!305503 (bitIndex!0 (size!4441 (buf!4927 thiss!1204)) (currentByte!9247 thiss!1204) (currentBit!9242 thiss!1204)))))

(declare-fun e!134968 () Bool)

(assert (=> b!196393 e!134968))

(declare-fun res!164319 () Bool)

(assert (=> b!196393 (=> (not res!164319) (not e!134968))))

(assert (=> b!196393 (= res!164319 (= (size!4441 (buf!4927 thiss!1204)) (size!4441 (buf!4927 (_2!9139 lt!305506)))))))

(declare-fun appendBit!0 (BitStream!7990 Bool) tuple2!16988)

(assert (=> b!196393 (= lt!305506 (appendBit!0 thiss!1204 lt!305502))))

(assert (=> b!196393 (= lt!305502 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!196395 () Bool)

(declare-fun e!134969 () Bool)

(declare-fun array_inv!4182 (array!10073) Bool)

(assert (=> b!196395 (= e!134969 (array_inv!4182 (buf!4927 thiss!1204)))))

(declare-fun b!196396 () Bool)

(declare-fun res!164317 () Bool)

(assert (=> b!196396 (=> (not res!164317) (not e!134970))))

(assert (=> b!196396 (= res!164317 (not (= i!590 nBits!348)))))

(declare-fun b!196397 () Bool)

(declare-fun lt!305504 () (_ BitVec 64))

(assert (=> b!196397 (= e!134972 (= (bitIndex!0 (size!4441 (buf!4927 (_1!9140 lt!305508))) (currentByte!9247 (_1!9140 lt!305508)) (currentBit!9242 (_1!9140 lt!305508))) lt!305504))))

(declare-fun res!164322 () Bool)

(assert (=> start!41762 (=> (not res!164322) (not e!134970))))

(assert (=> start!41762 (= res!164322 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41762 e!134970))

(assert (=> start!41762 true))

(declare-fun inv!12 (BitStream!7990) Bool)

(assert (=> start!41762 (and (inv!12 thiss!1204) e!134969)))

(declare-fun b!196394 () Bool)

(assert (=> b!196394 (= e!134968 e!134967)))

(declare-fun res!164315 () Bool)

(assert (=> b!196394 (=> (not res!164315) (not e!134967))))

(declare-fun lt!305509 () (_ BitVec 64))

(assert (=> b!196394 (= res!164315 (= lt!305504 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!305509)))))

(assert (=> b!196394 (= lt!305504 (bitIndex!0 (size!4441 (buf!4927 (_2!9139 lt!305506))) (currentByte!9247 (_2!9139 lt!305506)) (currentBit!9242 (_2!9139 lt!305506))))))

(assert (=> b!196394 (= lt!305509 (bitIndex!0 (size!4441 (buf!4927 thiss!1204)) (currentByte!9247 thiss!1204) (currentBit!9242 thiss!1204)))))

(assert (= (and start!41762 res!164322) b!196386))

(assert (= (and b!196386 res!164318) b!196388))

(assert (= (and b!196388 res!164313) b!196396))

(assert (= (and b!196396 res!164317) b!196393))

(assert (= (and b!196393 res!164319) b!196394))

(assert (= (and b!196394 res!164315) b!196390))

(assert (= (and b!196390 res!164312) b!196391))

(assert (= (and b!196391 res!164320) b!196397))

(assert (= (and b!196393 (not res!164316)) b!196389))

(assert (= (and b!196389 (not res!164321)) b!196387))

(assert (= (and b!196387 (not res!164314)) b!196392))

(assert (= start!41762 b!196395))

(declare-fun m!303797 () Bool)

(assert (=> b!196388 m!303797))

(declare-fun m!303799 () Bool)

(assert (=> b!196393 m!303799))

(declare-fun m!303801 () Bool)

(assert (=> b!196393 m!303801))

(declare-fun m!303803 () Bool)

(assert (=> b!196393 m!303803))

(declare-fun m!303805 () Bool)

(assert (=> b!196395 m!303805))

(declare-fun m!303807 () Bool)

(assert (=> b!196390 m!303807))

(declare-fun m!303809 () Bool)

(assert (=> b!196387 m!303809))

(declare-fun m!303811 () Bool)

(assert (=> b!196391 m!303811))

(assert (=> b!196391 m!303811))

(declare-fun m!303813 () Bool)

(assert (=> b!196391 m!303813))

(assert (=> b!196394 m!303799))

(assert (=> b!196394 m!303801))

(declare-fun m!303815 () Bool)

(assert (=> b!196386 m!303815))

(declare-fun m!303817 () Bool)

(assert (=> b!196397 m!303817))

(declare-fun m!303819 () Bool)

(assert (=> start!41762 m!303819))

(declare-fun m!303821 () Bool)

(assert (=> b!196389 m!303821))

(declare-fun m!303823 () Bool)

(assert (=> b!196389 m!303823))

(declare-fun m!303825 () Bool)

(assert (=> b!196389 m!303825))

(declare-fun m!303827 () Bool)

(assert (=> b!196389 m!303827))

(push 1)

(assert (not b!196386))

(assert (not b!196387))

(assert (not b!196389))

(assert (not b!196391))

(assert (not start!41762))

(assert (not b!196388))

(assert (not b!196390))

(assert (not b!196393))

(assert (not b!196394))

(assert (not b!196397))

(assert (not b!196395))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66451 () Bool)

(declare-datatypes ((tuple2!17000 0))(
  ( (tuple2!17001 (_1!9145 Bool) (_2!9145 BitStream!7990)) )
))
(declare-fun lt!305578 () tuple2!17000)

(declare-fun readBit!0 (BitStream!7990) tuple2!17000)

(assert (=> d!66451 (= lt!305578 (readBit!0 (readerFrom!0 (_2!9139 lt!305506) (currentBit!9242 thiss!1204) (currentByte!9247 thiss!1204))))))

(assert (=> d!66451 (= (readBitPure!0 (readerFrom!0 (_2!9139 lt!305506) (currentBit!9242 thiss!1204) (currentByte!9247 thiss!1204))) (tuple2!16991 (_2!9145 lt!305578) (_1!9145 lt!305578)))))

(declare-fun bs!16512 () Bool)

(assert (= bs!16512 d!66451))

(assert (=> bs!16512 m!303811))

(declare-fun m!303893 () Bool)

(assert (=> bs!16512 m!303893))

(assert (=> b!196391 d!66451))

(declare-fun d!66453 () Bool)

(declare-fun e!135028 () Bool)

(assert (=> d!66453 e!135028))

(declare-fun res!164402 () Bool)

(assert (=> d!66453 (=> (not res!164402) (not e!135028))))

(assert (=> d!66453 (= res!164402 (invariant!0 (currentBit!9242 (_2!9139 lt!305506)) (currentByte!9247 (_2!9139 lt!305506)) (size!4441 (buf!4927 (_2!9139 lt!305506)))))))

(assert (=> d!66453 (= (readerFrom!0 (_2!9139 lt!305506) (currentBit!9242 thiss!1204) (currentByte!9247 thiss!1204)) (BitStream!7991 (buf!4927 (_2!9139 lt!305506)) (currentByte!9247 thiss!1204) (currentBit!9242 thiss!1204)))))

(declare-fun b!196482 () Bool)

(assert (=> b!196482 (= e!135028 (invariant!0 (currentBit!9242 thiss!1204) (currentByte!9247 thiss!1204) (size!4441 (buf!4927 (_2!9139 lt!305506)))))))

(assert (= (and d!66453 res!164402) b!196482))

(declare-fun m!303905 () Bool)

(assert (=> d!66453 m!303905))

(declare-fun m!303907 () Bool)

(assert (=> b!196482 m!303907))

(assert (=> b!196391 d!66453))

(declare-fun d!66461 () Bool)

(declare-fun e!135031 () Bool)

(assert (=> d!66461 e!135031))

(declare-fun res!164407 () Bool)

(assert (=> d!66461 (=> (not res!164407) (not e!135031))))

(declare-fun lt!305609 () (_ BitVec 64))

(declare-fun lt!305611 () (_ BitVec 64))

(declare-fun lt!305613 () (_ BitVec 64))

(assert (=> d!66461 (= res!164407 (= lt!305611 (bvsub lt!305609 lt!305613)))))

(assert (=> d!66461 (or (= (bvand lt!305609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!305613 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!305609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!305609 lt!305613) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!66461 (= lt!305613 (remainingBits!0 ((_ sign_extend 32) (size!4441 (buf!4927 (_2!9139 lt!305505)))) ((_ sign_extend 32) (currentByte!9247 (_2!9139 lt!305505))) ((_ sign_extend 32) (currentBit!9242 (_2!9139 lt!305505)))))))

(declare-fun lt!305610 () (_ BitVec 64))

(declare-fun lt!305612 () (_ BitVec 64))

(assert (=> d!66461 (= lt!305609 (bvmul lt!305610 lt!305612))))

(assert (=> d!66461 (or (= lt!305610 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!305612 (bvsdiv (bvmul lt!305610 lt!305612) lt!305610)))))

(assert (=> d!66461 (= lt!305612 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66461 (= lt!305610 ((_ sign_extend 32) (size!4441 (buf!4927 (_2!9139 lt!305505)))))))

(assert (=> d!66461 (= lt!305611 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9247 (_2!9139 lt!305505))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9242 (_2!9139 lt!305505)))))))

(assert (=> d!66461 (invariant!0 (currentBit!9242 (_2!9139 lt!305505)) (currentByte!9247 (_2!9139 lt!305505)) (size!4441 (buf!4927 (_2!9139 lt!305505))))))

(assert (=> d!66461 (= (bitIndex!0 (size!4441 (buf!4927 (_2!9139 lt!305505))) (currentByte!9247 (_2!9139 lt!305505)) (currentBit!9242 (_2!9139 lt!305505))) lt!305611)))

(declare-fun b!196487 () Bool)

(declare-fun res!164408 () Bool)

(assert (=> b!196487 (=> (not res!164408) (not e!135031))))

(assert (=> b!196487 (= res!164408 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!305611))))

(declare-fun b!196488 () Bool)

(declare-fun lt!305614 () (_ BitVec 64))

(assert (=> b!196488 (= e!135031 (bvsle lt!305611 (bvmul lt!305614 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196488 (or (= lt!305614 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!305614 #b0000000000000000000000000000000000000000000000000000000000001000) lt!305614)))))

(assert (=> b!196488 (= lt!305614 ((_ sign_extend 32) (size!4441 (buf!4927 (_2!9139 lt!305505)))))))

(assert (= (and d!66461 res!164407) b!196487))

(assert (= (and b!196487 res!164408) b!196488))

(declare-fun m!303909 () Bool)

(assert (=> d!66461 m!303909))

(assert (=> d!66461 m!303809))

(assert (=> b!196389 d!66461))

(declare-fun d!66465 () Bool)

(declare-fun res!164426 () Bool)

(declare-fun e!135043 () Bool)

(assert (=> d!66465 (=> (not res!164426) (not e!135043))))

(assert (=> d!66465 (= res!164426 (= (size!4441 (buf!4927 thiss!1204)) (size!4441 (buf!4927 (_2!9139 lt!305505)))))))

(assert (=> d!66465 (= (isPrefixOf!0 thiss!1204 (_2!9139 lt!305505)) e!135043)))

(declare-fun b!196506 () Bool)

(declare-fun res!164427 () Bool)

(assert (=> b!196506 (=> (not res!164427) (not e!135043))))

(assert (=> b!196506 (= res!164427 (bvsle (bitIndex!0 (size!4441 (buf!4927 thiss!1204)) (currentByte!9247 thiss!1204) (currentBit!9242 thiss!1204)) (bitIndex!0 (size!4441 (buf!4927 (_2!9139 lt!305505))) (currentByte!9247 (_2!9139 lt!305505)) (currentBit!9242 (_2!9139 lt!305505)))))))

(declare-fun b!196507 () Bool)

(declare-fun e!135042 () Bool)

(assert (=> b!196507 (= e!135043 e!135042)))

(declare-fun res!164428 () Bool)

(assert (=> b!196507 (=> res!164428 e!135042)))

(assert (=> b!196507 (= res!164428 (= (size!4441 (buf!4927 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!196508 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10073 array!10073 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!196508 (= e!135042 (arrayBitRangesEq!0 (buf!4927 thiss!1204) (buf!4927 (_2!9139 lt!305505)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4441 (buf!4927 thiss!1204)) (currentByte!9247 thiss!1204) (currentBit!9242 thiss!1204))))))

(assert (= (and d!66465 res!164426) b!196506))

(assert (= (and b!196506 res!164427) b!196507))

(assert (= (and b!196507 (not res!164428)) b!196508))

(assert (=> b!196506 m!303801))

(assert (=> b!196506 m!303821))

(assert (=> b!196508 m!303801))

(assert (=> b!196508 m!303801))

(declare-fun m!303913 () Bool)

(assert (=> b!196508 m!303913))

(assert (=> b!196389 d!66465))

(declare-fun d!66469 () Bool)

(assert (=> d!66469 (isPrefixOf!0 thiss!1204 (_2!9139 lt!305505))))

(declare-fun lt!305632 () Unit!13881)

(declare-fun choose!30 (BitStream!7990 BitStream!7990 BitStream!7990) Unit!13881)

(assert (=> d!66469 (= lt!305632 (choose!30 thiss!1204 (_2!9139 lt!305506) (_2!9139 lt!305505)))))

(assert (=> d!66469 (isPrefixOf!0 thiss!1204 (_2!9139 lt!305506))))

(assert (=> d!66469 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9139 lt!305506) (_2!9139 lt!305505)) lt!305632)))

(declare-fun bs!16517 () Bool)

(assert (= bs!16517 d!66469))

(assert (=> bs!16517 m!303823))

(declare-fun m!303935 () Bool)

(assert (=> bs!16517 m!303935))

(assert (=> bs!16517 m!303807))

(assert (=> b!196389 d!66469))

(declare-fun b!196595 () Bool)

(declare-fun e!135103 () Bool)

(declare-fun lt!305906 () tuple2!16990)

(declare-fun lt!305915 () tuple2!16990)

(assert (=> b!196595 (= e!135103 (= (_2!9140 lt!305906) (_2!9140 lt!305915)))))

(declare-fun b!196596 () Bool)

(declare-fun e!135101 () Bool)

(declare-fun lt!305923 () tuple2!16990)

(declare-fun lt!305925 () tuple2!16988)

(assert (=> b!196596 (= e!135101 (= (bitIndex!0 (size!4441 (buf!4927 (_1!9140 lt!305923))) (currentByte!9247 (_1!9140 lt!305923)) (currentBit!9242 (_1!9140 lt!305923))) (bitIndex!0 (size!4441 (buf!4927 (_2!9139 lt!305925))) (currentByte!9247 (_2!9139 lt!305925)) (currentBit!9242 (_2!9139 lt!305925)))))))

(declare-fun b!196597 () Bool)

(declare-fun e!135097 () (_ BitVec 64))

(assert (=> b!196597 (= e!135097 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!196598 () Bool)

(assert (=> b!196598 (= e!135097 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!196599 () Bool)

(declare-fun res!164508 () Bool)

(declare-fun e!135104 () Bool)

(assert (=> b!196599 (=> (not res!164508) (not e!135104))))

(declare-fun lt!305877 () tuple2!16988)

(assert (=> b!196599 (= res!164508 (isPrefixOf!0 (_2!9139 lt!305506) (_2!9139 lt!305877)))))

(declare-fun d!66485 () Bool)

(assert (=> d!66485 e!135104))

(declare-fun res!164511 () Bool)

(assert (=> d!66485 (=> (not res!164511) (not e!135104))))

(assert (=> d!66485 (= res!164511 (invariant!0 (currentBit!9242 (_2!9139 lt!305877)) (currentByte!9247 (_2!9139 lt!305877)) (size!4441 (buf!4927 (_2!9139 lt!305877)))))))

(declare-fun e!135102 () tuple2!16988)

(assert (=> d!66485 (= lt!305877 e!135102)))

(declare-fun c!9785 () Bool)

(assert (=> d!66485 (= c!9785 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!66485 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!66485 (= (appendBitsLSBFirstLoopTR!0 (_2!9139 lt!305506) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!305877)))

(declare-fun b!196600 () Bool)

(declare-fun Unit!13887 () Unit!13881)

(assert (=> b!196600 (= e!135102 (tuple2!16989 Unit!13887 (_2!9139 lt!305506)))))

(declare-fun lt!305914 () Unit!13881)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7990) Unit!13881)

(assert (=> b!196600 (= lt!305914 (lemmaIsPrefixRefl!0 (_2!9139 lt!305506)))))

(declare-fun call!3088 () Bool)

(assert (=> b!196600 call!3088))

(declare-fun lt!305873 () Unit!13881)

(assert (=> b!196600 (= lt!305873 lt!305914)))

(declare-fun b!196601 () Bool)

(assert (=> b!196601 (= lt!305923 (readBitPure!0 (readerFrom!0 (_2!9139 lt!305925) (currentBit!9242 (_2!9139 lt!305506)) (currentByte!9247 (_2!9139 lt!305506)))))))

(declare-fun lt!305896 () Bool)

(declare-fun res!164510 () Bool)

(assert (=> b!196601 (= res!164510 (and (= (_2!9140 lt!305923) lt!305896) (= (_1!9140 lt!305923) (_2!9139 lt!305925))))))

(assert (=> b!196601 (=> (not res!164510) (not e!135101))))

(declare-fun e!135099 () Bool)

(assert (=> b!196601 (= e!135099 e!135101)))

(declare-fun b!196602 () Bool)

(declare-fun e!135098 () Bool)

(declare-fun lt!305892 () (_ BitVec 64))

(assert (=> b!196602 (= e!135098 (validate_offset_bits!1 ((_ sign_extend 32) (size!4441 (buf!4927 (_2!9139 lt!305506)))) ((_ sign_extend 32) (currentByte!9247 (_2!9139 lt!305506))) ((_ sign_extend 32) (currentBit!9242 (_2!9139 lt!305506))) lt!305892))))

(declare-fun b!196603 () Bool)

(declare-fun lt!305872 () tuple2!16988)

(assert (=> b!196603 (= e!135102 (tuple2!16989 (_1!9139 lt!305872) (_2!9139 lt!305872)))))

(assert (=> b!196603 (= lt!305896 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!196603 (= lt!305925 (appendBit!0 (_2!9139 lt!305506) lt!305896))))

(declare-fun res!164502 () Bool)

(assert (=> b!196603 (= res!164502 (= (size!4441 (buf!4927 (_2!9139 lt!305506))) (size!4441 (buf!4927 (_2!9139 lt!305925)))))))

(assert (=> b!196603 (=> (not res!164502) (not e!135099))))

(assert (=> b!196603 e!135099))

(declare-fun lt!305924 () tuple2!16988)

(assert (=> b!196603 (= lt!305924 lt!305925)))

(assert (=> b!196603 (= lt!305872 (appendBitsLSBFirstLoopTR!0 (_2!9139 lt!305924) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!305887 () Unit!13881)

(assert (=> b!196603 (= lt!305887 (lemmaIsPrefixTransitive!0 (_2!9139 lt!305506) (_2!9139 lt!305924) (_2!9139 lt!305872)))))

(assert (=> b!196603 call!3088))

(declare-fun lt!305897 () Unit!13881)

(assert (=> b!196603 (= lt!305897 lt!305887)))

(assert (=> b!196603 (invariant!0 (currentBit!9242 (_2!9139 lt!305506)) (currentByte!9247 (_2!9139 lt!305506)) (size!4441 (buf!4927 (_2!9139 lt!305924))))))

(declare-fun lt!305922 () BitStream!7990)

(assert (=> b!196603 (= lt!305922 (BitStream!7991 (buf!4927 (_2!9139 lt!305924)) (currentByte!9247 (_2!9139 lt!305506)) (currentBit!9242 (_2!9139 lt!305506))))))

(assert (=> b!196603 (invariant!0 (currentBit!9242 lt!305922) (currentByte!9247 lt!305922) (size!4441 (buf!4927 (_2!9139 lt!305872))))))

(declare-fun lt!305907 () BitStream!7990)

(assert (=> b!196603 (= lt!305907 (BitStream!7991 (buf!4927 (_2!9139 lt!305872)) (currentByte!9247 lt!305922) (currentBit!9242 lt!305922)))))

(assert (=> b!196603 (= lt!305906 (readBitPure!0 lt!305922))))

(assert (=> b!196603 (= lt!305915 (readBitPure!0 lt!305907))))

(declare-fun lt!305883 () Unit!13881)

(declare-fun readBitPrefixLemma!0 (BitStream!7990 BitStream!7990) Unit!13881)

(assert (=> b!196603 (= lt!305883 (readBitPrefixLemma!0 lt!305922 (_2!9139 lt!305872)))))

(declare-fun res!164503 () Bool)

(assert (=> b!196603 (= res!164503 (= (bitIndex!0 (size!4441 (buf!4927 (_1!9140 lt!305906))) (currentByte!9247 (_1!9140 lt!305906)) (currentBit!9242 (_1!9140 lt!305906))) (bitIndex!0 (size!4441 (buf!4927 (_1!9140 lt!305915))) (currentByte!9247 (_1!9140 lt!305915)) (currentBit!9242 (_1!9140 lt!305915)))))))

(assert (=> b!196603 (=> (not res!164503) (not e!135103))))

(assert (=> b!196603 e!135103))

(declare-fun lt!305894 () Unit!13881)

(assert (=> b!196603 (= lt!305894 lt!305883)))

(declare-datatypes ((tuple2!17004 0))(
  ( (tuple2!17005 (_1!9147 BitStream!7990) (_2!9147 BitStream!7990)) )
))
(declare-fun lt!305921 () tuple2!17004)

(declare-fun reader!0 (BitStream!7990 BitStream!7990) tuple2!17004)

(assert (=> b!196603 (= lt!305921 (reader!0 (_2!9139 lt!305506) (_2!9139 lt!305872)))))

(declare-fun lt!305917 () tuple2!17004)

(assert (=> b!196603 (= lt!305917 (reader!0 (_2!9139 lt!305924) (_2!9139 lt!305872)))))

(declare-fun lt!305893 () tuple2!16990)

(assert (=> b!196603 (= lt!305893 (readBitPure!0 (_1!9147 lt!305921)))))

(assert (=> b!196603 (= (_2!9140 lt!305893) lt!305896)))

(declare-fun lt!305875 () Unit!13881)

(declare-fun Unit!13888 () Unit!13881)

(assert (=> b!196603 (= lt!305875 Unit!13888)))

(declare-fun lt!305903 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!196603 (= lt!305903 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!305899 () (_ BitVec 64))

(assert (=> b!196603 (= lt!305899 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!305908 () Unit!13881)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7990 array!10073 (_ BitVec 64)) Unit!13881)

(assert (=> b!196603 (= lt!305908 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9139 lt!305506) (buf!4927 (_2!9139 lt!305872)) lt!305899))))

(assert (=> b!196603 (validate_offset_bits!1 ((_ sign_extend 32) (size!4441 (buf!4927 (_2!9139 lt!305872)))) ((_ sign_extend 32) (currentByte!9247 (_2!9139 lt!305506))) ((_ sign_extend 32) (currentBit!9242 (_2!9139 lt!305506))) lt!305899)))

(declare-fun lt!305895 () Unit!13881)

(assert (=> b!196603 (= lt!305895 lt!305908)))

(declare-datatypes ((tuple2!17006 0))(
  ( (tuple2!17007 (_1!9148 BitStream!7990) (_2!9148 (_ BitVec 64))) )
))
(declare-fun lt!305885 () tuple2!17006)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7990 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17006)

(assert (=> b!196603 (= lt!305885 (readNBitsLSBFirstsLoopPure!0 (_1!9147 lt!305921) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!305903))))

(declare-fun lt!305902 () (_ BitVec 64))

(assert (=> b!196603 (= lt!305902 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!305886 () Unit!13881)

(assert (=> b!196603 (= lt!305886 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9139 lt!305924) (buf!4927 (_2!9139 lt!305872)) lt!305902))))

(assert (=> b!196603 (validate_offset_bits!1 ((_ sign_extend 32) (size!4441 (buf!4927 (_2!9139 lt!305872)))) ((_ sign_extend 32) (currentByte!9247 (_2!9139 lt!305924))) ((_ sign_extend 32) (currentBit!9242 (_2!9139 lt!305924))) lt!305902)))

(declare-fun lt!305909 () Unit!13881)

(assert (=> b!196603 (= lt!305909 lt!305886)))

(declare-fun lt!305879 () tuple2!17006)

(assert (=> b!196603 (= lt!305879 (readNBitsLSBFirstsLoopPure!0 (_1!9147 lt!305917) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!305903 (ite (_2!9140 lt!305893) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!305927 () tuple2!17006)

(assert (=> b!196603 (= lt!305927 (readNBitsLSBFirstsLoopPure!0 (_1!9147 lt!305921) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!305903))))

(declare-fun c!9784 () Bool)

(assert (=> b!196603 (= c!9784 (_2!9140 (readBitPure!0 (_1!9147 lt!305921))))))

(declare-fun lt!305900 () tuple2!17006)

(declare-fun withMovedBitIndex!0 (BitStream!7990 (_ BitVec 64)) BitStream!7990)

(assert (=> b!196603 (= lt!305900 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9147 lt!305921) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!305903 e!135097)))))

(declare-fun lt!305910 () Unit!13881)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7990 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13881)

(assert (=> b!196603 (= lt!305910 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9147 lt!305921) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!305903))))

(assert (=> b!196603 (and (= (_2!9148 lt!305927) (_2!9148 lt!305900)) (= (_1!9148 lt!305927) (_1!9148 lt!305900)))))

(declare-fun lt!305913 () Unit!13881)

(assert (=> b!196603 (= lt!305913 lt!305910)))

(assert (=> b!196603 (= (_1!9147 lt!305921) (withMovedBitIndex!0 (_2!9147 lt!305921) (bvsub (bitIndex!0 (size!4441 (buf!4927 (_2!9139 lt!305506))) (currentByte!9247 (_2!9139 lt!305506)) (currentBit!9242 (_2!9139 lt!305506))) (bitIndex!0 (size!4441 (buf!4927 (_2!9139 lt!305872))) (currentByte!9247 (_2!9139 lt!305872)) (currentBit!9242 (_2!9139 lt!305872))))))))

(declare-fun lt!305916 () Unit!13881)

(declare-fun Unit!13889 () Unit!13881)

(assert (=> b!196603 (= lt!305916 Unit!13889)))

(assert (=> b!196603 (= (_1!9147 lt!305917) (withMovedBitIndex!0 (_2!9147 lt!305917) (bvsub (bitIndex!0 (size!4441 (buf!4927 (_2!9139 lt!305924))) (currentByte!9247 (_2!9139 lt!305924)) (currentBit!9242 (_2!9139 lt!305924))) (bitIndex!0 (size!4441 (buf!4927 (_2!9139 lt!305872))) (currentByte!9247 (_2!9139 lt!305872)) (currentBit!9242 (_2!9139 lt!305872))))))))

(declare-fun lt!305905 () Unit!13881)

(declare-fun Unit!13890 () Unit!13881)

(assert (=> b!196603 (= lt!305905 Unit!13890)))

(assert (=> b!196603 (= (bitIndex!0 (size!4441 (buf!4927 (_2!9139 lt!305506))) (currentByte!9247 (_2!9139 lt!305506)) (currentBit!9242 (_2!9139 lt!305506))) (bvsub (bitIndex!0 (size!4441 (buf!4927 (_2!9139 lt!305924))) (currentByte!9247 (_2!9139 lt!305924)) (currentBit!9242 (_2!9139 lt!305924))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!305898 () Unit!13881)

(declare-fun Unit!13891 () Unit!13881)

(assert (=> b!196603 (= lt!305898 Unit!13891)))

(assert (=> b!196603 (= (_2!9148 lt!305885) (_2!9148 lt!305879))))

(declare-fun lt!305884 () Unit!13881)

(declare-fun Unit!13892 () Unit!13881)

(assert (=> b!196603 (= lt!305884 Unit!13892)))

(assert (=> b!196603 (invariant!0 (currentBit!9242 (_2!9139 lt!305872)) (currentByte!9247 (_2!9139 lt!305872)) (size!4441 (buf!4927 (_2!9139 lt!305872))))))

(declare-fun lt!305926 () Unit!13881)

(declare-fun Unit!13893 () Unit!13881)

(assert (=> b!196603 (= lt!305926 Unit!13893)))

(assert (=> b!196603 (= (size!4441 (buf!4927 (_2!9139 lt!305506))) (size!4441 (buf!4927 (_2!9139 lt!305872))))))

(declare-fun lt!305881 () Unit!13881)

(declare-fun Unit!13894 () Unit!13881)

(assert (=> b!196603 (= lt!305881 Unit!13894)))

(assert (=> b!196603 (= (bitIndex!0 (size!4441 (buf!4927 (_2!9139 lt!305872))) (currentByte!9247 (_2!9139 lt!305872)) (currentBit!9242 (_2!9139 lt!305872))) (bvsub (bvadd (bitIndex!0 (size!4441 (buf!4927 (_2!9139 lt!305506))) (currentByte!9247 (_2!9139 lt!305506)) (currentBit!9242 (_2!9139 lt!305506))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!305889 () Unit!13881)

(declare-fun Unit!13895 () Unit!13881)

(assert (=> b!196603 (= lt!305889 Unit!13895)))

(declare-fun lt!305919 () Unit!13881)

(declare-fun Unit!13896 () Unit!13881)

(assert (=> b!196603 (= lt!305919 Unit!13896)))

(declare-fun lt!305891 () tuple2!17004)

(assert (=> b!196603 (= lt!305891 (reader!0 (_2!9139 lt!305506) (_2!9139 lt!305872)))))

(declare-fun lt!305911 () (_ BitVec 64))

(assert (=> b!196603 (= lt!305911 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!305918 () Unit!13881)

(assert (=> b!196603 (= lt!305918 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9139 lt!305506) (buf!4927 (_2!9139 lt!305872)) lt!305911))))

(assert (=> b!196603 (validate_offset_bits!1 ((_ sign_extend 32) (size!4441 (buf!4927 (_2!9139 lt!305872)))) ((_ sign_extend 32) (currentByte!9247 (_2!9139 lt!305506))) ((_ sign_extend 32) (currentBit!9242 (_2!9139 lt!305506))) lt!305911)))

(declare-fun lt!305878 () Unit!13881)

(assert (=> b!196603 (= lt!305878 lt!305918)))

(declare-fun lt!305880 () tuple2!17006)

(assert (=> b!196603 (= lt!305880 (readNBitsLSBFirstsLoopPure!0 (_1!9147 lt!305891) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!164509 () Bool)

(assert (=> b!196603 (= res!164509 (= (_2!9148 lt!305880) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!135100 () Bool)

(assert (=> b!196603 (=> (not res!164509) (not e!135100))))

(assert (=> b!196603 e!135100))

(declare-fun lt!305901 () Unit!13881)

(declare-fun Unit!13897 () Unit!13881)

(assert (=> b!196603 (= lt!305901 Unit!13897)))

(declare-fun b!196604 () Bool)

(declare-fun res!164505 () Bool)

(assert (=> b!196604 (=> (not res!164505) (not e!135104))))

(declare-fun lt!305874 () (_ BitVec 64))

(declare-fun lt!305882 () (_ BitVec 64))

(assert (=> b!196604 (= res!164505 (= (bitIndex!0 (size!4441 (buf!4927 (_2!9139 lt!305877))) (currentByte!9247 (_2!9139 lt!305877)) (currentBit!9242 (_2!9139 lt!305877))) (bvsub lt!305874 lt!305882)))))

(assert (=> b!196604 (or (= (bvand lt!305874 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!305882 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!305874 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!305874 lt!305882) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!196604 (= lt!305882 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!305912 () (_ BitVec 64))

(declare-fun lt!305876 () (_ BitVec 64))

(assert (=> b!196604 (= lt!305874 (bvadd lt!305912 lt!305876))))

(assert (=> b!196604 (or (not (= (bvand lt!305912 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!305876 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!305912 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!305912 lt!305876) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!196604 (= lt!305876 ((_ sign_extend 32) nBits!348))))

(assert (=> b!196604 (= lt!305912 (bitIndex!0 (size!4441 (buf!4927 (_2!9139 lt!305506))) (currentByte!9247 (_2!9139 lt!305506)) (currentBit!9242 (_2!9139 lt!305506))))))

(declare-fun b!196605 () Bool)

(declare-fun res!164501 () Bool)

(assert (=> b!196605 (= res!164501 (isPrefixOf!0 (_2!9139 lt!305506) (_2!9139 lt!305925)))))

(assert (=> b!196605 (=> (not res!164501) (not e!135099))))

(declare-fun b!196606 () Bool)

(assert (=> b!196606 (= e!135100 (= (_1!9148 lt!305880) (_2!9147 lt!305891)))))

(declare-fun b!196607 () Bool)

(declare-fun res!164507 () Bool)

(assert (=> b!196607 (= res!164507 (= (bitIndex!0 (size!4441 (buf!4927 (_2!9139 lt!305925))) (currentByte!9247 (_2!9139 lt!305925)) (currentBit!9242 (_2!9139 lt!305925))) (bvadd (bitIndex!0 (size!4441 (buf!4927 (_2!9139 lt!305506))) (currentByte!9247 (_2!9139 lt!305506)) (currentBit!9242 (_2!9139 lt!305506))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!196607 (=> (not res!164507) (not e!135099))))

(declare-fun b!196608 () Bool)

(declare-fun e!135096 () Bool)

(assert (=> b!196608 (= e!135104 e!135096)))

(declare-fun res!164506 () Bool)

(assert (=> b!196608 (=> (not res!164506) (not e!135096))))

(declare-fun lt!305904 () tuple2!17006)

(assert (=> b!196608 (= res!164506 (= (_2!9148 lt!305904) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!305920 () tuple2!17004)

(assert (=> b!196608 (= lt!305904 (readNBitsLSBFirstsLoopPure!0 (_1!9147 lt!305920) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!305888 () Unit!13881)

(declare-fun lt!305890 () Unit!13881)

(assert (=> b!196608 (= lt!305888 lt!305890)))

(assert (=> b!196608 (validate_offset_bits!1 ((_ sign_extend 32) (size!4441 (buf!4927 (_2!9139 lt!305877)))) ((_ sign_extend 32) (currentByte!9247 (_2!9139 lt!305506))) ((_ sign_extend 32) (currentBit!9242 (_2!9139 lt!305506))) lt!305892)))

(assert (=> b!196608 (= lt!305890 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9139 lt!305506) (buf!4927 (_2!9139 lt!305877)) lt!305892))))

(assert (=> b!196608 e!135098))

(declare-fun res!164504 () Bool)

(assert (=> b!196608 (=> (not res!164504) (not e!135098))))

(assert (=> b!196608 (= res!164504 (and (= (size!4441 (buf!4927 (_2!9139 lt!305506))) (size!4441 (buf!4927 (_2!9139 lt!305877)))) (bvsge lt!305892 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!196608 (= lt!305892 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!196608 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!196608 (= lt!305920 (reader!0 (_2!9139 lt!305506) (_2!9139 lt!305877)))))

(declare-fun bm!3083 () Bool)

(assert (=> bm!3083 (= call!3088 (isPrefixOf!0 (_2!9139 lt!305506) (ite c!9785 (_2!9139 lt!305506) (_2!9139 lt!305872))))))

(declare-fun b!196609 () Bool)

(declare-fun res!164500 () Bool)

(assert (=> b!196609 (=> (not res!164500) (not e!135104))))

(assert (=> b!196609 (= res!164500 (= (size!4441 (buf!4927 (_2!9139 lt!305506))) (size!4441 (buf!4927 (_2!9139 lt!305877)))))))

(declare-fun b!196610 () Bool)

(assert (=> b!196610 (= e!135096 (= (_1!9148 lt!305904) (_2!9147 lt!305920)))))

(assert (= (and d!66485 c!9785) b!196600))

(assert (= (and d!66485 (not c!9785)) b!196603))

(assert (= (and b!196603 res!164502) b!196607))

(assert (= (and b!196607 res!164507) b!196605))

(assert (= (and b!196605 res!164501) b!196601))

(assert (= (and b!196601 res!164510) b!196596))

(assert (= (and b!196603 res!164503) b!196595))

(assert (= (and b!196603 c!9784) b!196598))

(assert (= (and b!196603 (not c!9784)) b!196597))

(assert (= (and b!196603 res!164509) b!196606))

(assert (= (or b!196600 b!196603) bm!3083))

(assert (= (and d!66485 res!164511) b!196609))

(assert (= (and b!196609 res!164500) b!196604))

(assert (= (and b!196604 res!164505) b!196599))

(assert (= (and b!196599 res!164508) b!196608))

(assert (= (and b!196608 res!164504) b!196602))

(assert (= (and b!196608 res!164506) b!196610))

(declare-fun m!303953 () Bool)

(assert (=> d!66485 m!303953))

(declare-fun m!303955 () Bool)

(assert (=> b!196599 m!303955))

(declare-fun m!303957 () Bool)

(assert (=> b!196600 m!303957))

(declare-fun m!303959 () Bool)

(assert (=> b!196602 m!303959))

(declare-fun m!303961 () Bool)

(assert (=> b!196603 m!303961))

(declare-fun m!303963 () Bool)

(assert (=> b!196603 m!303963))

(declare-fun m!303965 () Bool)

(assert (=> b!196603 m!303965))

(declare-fun m!303967 () Bool)

(assert (=> b!196603 m!303967))

(declare-fun m!303969 () Bool)

(assert (=> b!196603 m!303969))

(assert (=> b!196603 m!303799))

(declare-fun m!303971 () Bool)

(assert (=> b!196603 m!303971))

(declare-fun m!303973 () Bool)

(assert (=> b!196603 m!303973))

(declare-fun m!303975 () Bool)

(assert (=> b!196603 m!303975))

(declare-fun m!303977 () Bool)

(assert (=> b!196603 m!303977))

(declare-fun m!303979 () Bool)

(assert (=> b!196603 m!303979))

(declare-fun m!303981 () Bool)

(assert (=> b!196603 m!303981))

(declare-fun m!303983 () Bool)

(assert (=> b!196603 m!303983))

(declare-fun m!303985 () Bool)

(assert (=> b!196603 m!303985))

(declare-fun m!303987 () Bool)

(assert (=> b!196603 m!303987))

(declare-fun m!303989 () Bool)

(assert (=> b!196603 m!303989))

(declare-fun m!303991 () Bool)

(assert (=> b!196603 m!303991))

(declare-fun m!303993 () Bool)

(assert (=> b!196603 m!303993))

(declare-fun m!303995 () Bool)

(assert (=> b!196603 m!303995))

(declare-fun m!303997 () Bool)

(assert (=> b!196603 m!303997))

(declare-fun m!303999 () Bool)

(assert (=> b!196603 m!303999))

(declare-fun m!304001 () Bool)

(assert (=> b!196603 m!304001))

(declare-fun m!304003 () Bool)

(assert (=> b!196603 m!304003))

(declare-fun m!304005 () Bool)

(assert (=> b!196603 m!304005))

(declare-fun m!304007 () Bool)

(assert (=> b!196603 m!304007))

(declare-fun m!304009 () Bool)

(assert (=> b!196603 m!304009))

(declare-fun m!304011 () Bool)

(assert (=> b!196603 m!304011))

(declare-fun m!304013 () Bool)

(assert (=> b!196603 m!304013))

(assert (=> b!196603 m!303963))

(declare-fun m!304015 () Bool)

(assert (=> b!196603 m!304015))

(declare-fun m!304017 () Bool)

(assert (=> b!196603 m!304017))

(declare-fun m!304019 () Bool)

(assert (=> b!196603 m!304019))

(declare-fun m!304021 () Bool)

(assert (=> b!196603 m!304021))

(declare-fun m!304023 () Bool)

(assert (=> b!196603 m!304023))

(declare-fun m!304025 () Bool)

(assert (=> b!196596 m!304025))

(declare-fun m!304027 () Bool)

(assert (=> b!196596 m!304027))

(assert (=> b!196607 m!304027))

(assert (=> b!196607 m!303799))

(declare-fun m!304029 () Bool)

(assert (=> bm!3083 m!304029))

(declare-fun m!304031 () Bool)

(assert (=> b!196604 m!304031))

(assert (=> b!196604 m!303799))

(declare-fun m!304033 () Bool)

(assert (=> b!196608 m!304033))

(declare-fun m!304035 () Bool)

(assert (=> b!196608 m!304035))

(assert (=> b!196608 m!304009))

(declare-fun m!304037 () Bool)

(assert (=> b!196608 m!304037))

(assert (=> b!196608 m!304021))

(declare-fun m!304039 () Bool)

(assert (=> b!196608 m!304039))

(declare-fun m!304041 () Bool)

(assert (=> b!196601 m!304041))

(assert (=> b!196601 m!304041))

(declare-fun m!304043 () Bool)

(assert (=> b!196601 m!304043))

(declare-fun m!304045 () Bool)

(assert (=> b!196605 m!304045))

(assert (=> b!196389 d!66485))

(declare-fun d!66503 () Bool)

(declare-fun res!164524 () Bool)

(declare-fun e!135112 () Bool)

(assert (=> d!66503 (=> (not res!164524) (not e!135112))))

(assert (=> d!66503 (= res!164524 (= (size!4441 (buf!4927 thiss!1204)) (size!4441 (buf!4927 (_2!9139 lt!305506)))))))

(assert (=> d!66503 (= (isPrefixOf!0 thiss!1204 (_2!9139 lt!305506)) e!135112)))

(declare-fun b!196623 () Bool)

(declare-fun res!164525 () Bool)

(assert (=> b!196623 (=> (not res!164525) (not e!135112))))

(assert (=> b!196623 (= res!164525 (bvsle (bitIndex!0 (size!4441 (buf!4927 thiss!1204)) (currentByte!9247 thiss!1204) (currentBit!9242 thiss!1204)) (bitIndex!0 (size!4441 (buf!4927 (_2!9139 lt!305506))) (currentByte!9247 (_2!9139 lt!305506)) (currentBit!9242 (_2!9139 lt!305506)))))))

(declare-fun b!196624 () Bool)

(declare-fun e!135111 () Bool)

(assert (=> b!196624 (= e!135112 e!135111)))

(declare-fun res!164526 () Bool)

(assert (=> b!196624 (=> res!164526 e!135111)))

(assert (=> b!196624 (= res!164526 (= (size!4441 (buf!4927 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!196625 () Bool)

(assert (=> b!196625 (= e!135111 (arrayBitRangesEq!0 (buf!4927 thiss!1204) (buf!4927 (_2!9139 lt!305506)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4441 (buf!4927 thiss!1204)) (currentByte!9247 thiss!1204) (currentBit!9242 thiss!1204))))))

(assert (= (and d!66503 res!164524) b!196623))

(assert (= (and b!196623 res!164525) b!196624))

(assert (= (and b!196624 (not res!164526)) b!196625))

(assert (=> b!196623 m!303801))

(assert (=> b!196623 m!303799))

(assert (=> b!196625 m!303801))

(assert (=> b!196625 m!303801))

(declare-fun m!304047 () Bool)

(assert (=> b!196625 m!304047))

(assert (=> b!196390 d!66503))

(declare-fun d!66505 () Bool)

(declare-fun e!135113 () Bool)

(assert (=> d!66505 e!135113))

(declare-fun res!164527 () Bool)

(assert (=> d!66505 (=> (not res!164527) (not e!135113))))

(declare-fun lt!305948 () (_ BitVec 64))

(declare-fun lt!305946 () (_ BitVec 64))

(declare-fun lt!305950 () (_ BitVec 64))

(assert (=> d!66505 (= res!164527 (= lt!305948 (bvsub lt!305946 lt!305950)))))

(assert (=> d!66505 (or (= (bvand lt!305946 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!305950 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!305946 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!305946 lt!305950) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66505 (= lt!305950 (remainingBits!0 ((_ sign_extend 32) (size!4441 (buf!4927 (_2!9139 lt!305506)))) ((_ sign_extend 32) (currentByte!9247 (_2!9139 lt!305506))) ((_ sign_extend 32) (currentBit!9242 (_2!9139 lt!305506)))))))

(declare-fun lt!305947 () (_ BitVec 64))

(declare-fun lt!305949 () (_ BitVec 64))

(assert (=> d!66505 (= lt!305946 (bvmul lt!305947 lt!305949))))

(assert (=> d!66505 (or (= lt!305947 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!305949 (bvsdiv (bvmul lt!305947 lt!305949) lt!305947)))))

(assert (=> d!66505 (= lt!305949 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66505 (= lt!305947 ((_ sign_extend 32) (size!4441 (buf!4927 (_2!9139 lt!305506)))))))

(assert (=> d!66505 (= lt!305948 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9247 (_2!9139 lt!305506))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9242 (_2!9139 lt!305506)))))))

(assert (=> d!66505 (invariant!0 (currentBit!9242 (_2!9139 lt!305506)) (currentByte!9247 (_2!9139 lt!305506)) (size!4441 (buf!4927 (_2!9139 lt!305506))))))

(assert (=> d!66505 (= (bitIndex!0 (size!4441 (buf!4927 (_2!9139 lt!305506))) (currentByte!9247 (_2!9139 lt!305506)) (currentBit!9242 (_2!9139 lt!305506))) lt!305948)))

(declare-fun b!196626 () Bool)

(declare-fun res!164528 () Bool)

(assert (=> b!196626 (=> (not res!164528) (not e!135113))))

(assert (=> b!196626 (= res!164528 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!305948))))

(declare-fun b!196627 () Bool)

(declare-fun lt!305951 () (_ BitVec 64))

(assert (=> b!196627 (= e!135113 (bvsle lt!305948 (bvmul lt!305951 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196627 (or (= lt!305951 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!305951 #b0000000000000000000000000000000000000000000000000000000000001000) lt!305951)))))

(assert (=> b!196627 (= lt!305951 ((_ sign_extend 32) (size!4441 (buf!4927 (_2!9139 lt!305506)))))))

(assert (= (and d!66505 res!164527) b!196626))

(assert (= (and b!196626 res!164528) b!196627))

(declare-fun m!304049 () Bool)

(assert (=> d!66505 m!304049))

(assert (=> d!66505 m!303905))

(assert (=> b!196393 d!66505))

(declare-fun d!66507 () Bool)

(declare-fun e!135114 () Bool)

(assert (=> d!66507 e!135114))

(declare-fun res!164529 () Bool)

(assert (=> d!66507 (=> (not res!164529) (not e!135114))))

(declare-fun lt!305952 () (_ BitVec 64))

(declare-fun lt!305956 () (_ BitVec 64))

(declare-fun lt!305954 () (_ BitVec 64))

(assert (=> d!66507 (= res!164529 (= lt!305954 (bvsub lt!305952 lt!305956)))))

(assert (=> d!66507 (or (= (bvand lt!305952 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!305956 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!305952 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!305952 lt!305956) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66507 (= lt!305956 (remainingBits!0 ((_ sign_extend 32) (size!4441 (buf!4927 thiss!1204))) ((_ sign_extend 32) (currentByte!9247 thiss!1204)) ((_ sign_extend 32) (currentBit!9242 thiss!1204))))))

(declare-fun lt!305953 () (_ BitVec 64))

(declare-fun lt!305955 () (_ BitVec 64))

(assert (=> d!66507 (= lt!305952 (bvmul lt!305953 lt!305955))))

(assert (=> d!66507 (or (= lt!305953 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!305955 (bvsdiv (bvmul lt!305953 lt!305955) lt!305953)))))

(assert (=> d!66507 (= lt!305955 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66507 (= lt!305953 ((_ sign_extend 32) (size!4441 (buf!4927 thiss!1204))))))

(assert (=> d!66507 (= lt!305954 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9247 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9242 thiss!1204))))))

(assert (=> d!66507 (invariant!0 (currentBit!9242 thiss!1204) (currentByte!9247 thiss!1204) (size!4441 (buf!4927 thiss!1204)))))

(assert (=> d!66507 (= (bitIndex!0 (size!4441 (buf!4927 thiss!1204)) (currentByte!9247 thiss!1204) (currentBit!9242 thiss!1204)) lt!305954)))

(declare-fun b!196628 () Bool)

(declare-fun res!164530 () Bool)

(assert (=> b!196628 (=> (not res!164530) (not e!135114))))

(assert (=> b!196628 (= res!164530 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!305954))))

(declare-fun b!196629 () Bool)

(declare-fun lt!305957 () (_ BitVec 64))

(assert (=> b!196629 (= e!135114 (bvsle lt!305954 (bvmul lt!305957 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196629 (or (= lt!305957 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!305957 #b0000000000000000000000000000000000000000000000000000000000001000) lt!305957)))))

(assert (=> b!196629 (= lt!305957 ((_ sign_extend 32) (size!4441 (buf!4927 thiss!1204))))))

(assert (= (and d!66507 res!164529) b!196628))

(assert (= (and b!196628 res!164530) b!196629))

(declare-fun m!304051 () Bool)

(assert (=> d!66507 m!304051))

(assert (=> d!66507 m!303797))

(assert (=> b!196393 d!66507))

(declare-fun b!196695 () Bool)

(declare-fun e!135147 () Bool)

(declare-fun lt!306146 () tuple2!16990)

(declare-fun lt!306144 () tuple2!16988)

(assert (=> b!196695 (= e!135147 (= (bitIndex!0 (size!4441 (buf!4927 (_1!9140 lt!306146))) (currentByte!9247 (_1!9140 lt!306146)) (currentBit!9242 (_1!9140 lt!306146))) (bitIndex!0 (size!4441 (buf!4927 (_2!9139 lt!306144))) (currentByte!9247 (_2!9139 lt!306144)) (currentBit!9242 (_2!9139 lt!306144)))))))

(declare-fun d!66509 () Bool)

(declare-fun e!135148 () Bool)

(assert (=> d!66509 e!135148))

(declare-fun res!164581 () Bool)

(assert (=> d!66509 (=> (not res!164581) (not e!135148))))

(assert (=> d!66509 (= res!164581 (= (size!4441 (buf!4927 thiss!1204)) (size!4441 (buf!4927 (_2!9139 lt!306144)))))))

(declare-fun choose!16 (BitStream!7990 Bool) tuple2!16988)

(assert (=> d!66509 (= lt!306144 (choose!16 thiss!1204 lt!305502))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!66509 (validate_offset_bit!0 ((_ sign_extend 32) (size!4441 (buf!4927 thiss!1204))) ((_ sign_extend 32) (currentByte!9247 thiss!1204)) ((_ sign_extend 32) (currentBit!9242 thiss!1204)))))

(assert (=> d!66509 (= (appendBit!0 thiss!1204 lt!305502) lt!306144)))

(declare-fun b!196692 () Bool)

(declare-fun res!164583 () Bool)

(assert (=> b!196692 (=> (not res!164583) (not e!135148))))

(declare-fun lt!306147 () (_ BitVec 64))

(declare-fun lt!306145 () (_ BitVec 64))

(assert (=> b!196692 (= res!164583 (= (bitIndex!0 (size!4441 (buf!4927 (_2!9139 lt!306144))) (currentByte!9247 (_2!9139 lt!306144)) (currentBit!9242 (_2!9139 lt!306144))) (bvadd lt!306145 lt!306147)))))

(assert (=> b!196692 (or (not (= (bvand lt!306145 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!306147 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!306145 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!306145 lt!306147) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!196692 (= lt!306147 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!196692 (= lt!306145 (bitIndex!0 (size!4441 (buf!4927 thiss!1204)) (currentByte!9247 thiss!1204) (currentBit!9242 thiss!1204)))))

(declare-fun b!196693 () Bool)

(declare-fun res!164580 () Bool)

(assert (=> b!196693 (=> (not res!164580) (not e!135148))))

(assert (=> b!196693 (= res!164580 (isPrefixOf!0 thiss!1204 (_2!9139 lt!306144)))))

(declare-fun b!196694 () Bool)

(assert (=> b!196694 (= e!135148 e!135147)))

(declare-fun res!164582 () Bool)

(assert (=> b!196694 (=> (not res!164582) (not e!135147))))

(assert (=> b!196694 (= res!164582 (and (= (_2!9140 lt!306146) lt!305502) (= (_1!9140 lt!306146) (_2!9139 lt!306144))))))

(assert (=> b!196694 (= lt!306146 (readBitPure!0 (readerFrom!0 (_2!9139 lt!306144) (currentBit!9242 thiss!1204) (currentByte!9247 thiss!1204))))))

(assert (= (and d!66509 res!164581) b!196692))

(assert (= (and b!196692 res!164583) b!196693))

(assert (= (and b!196693 res!164580) b!196694))

(assert (= (and b!196694 res!164582) b!196695))

(declare-fun m!304155 () Bool)

(assert (=> b!196694 m!304155))

(assert (=> b!196694 m!304155))

(declare-fun m!304157 () Bool)

(assert (=> b!196694 m!304157))

(declare-fun m!304159 () Bool)

(assert (=> d!66509 m!304159))

(declare-fun m!304161 () Bool)

(assert (=> d!66509 m!304161))

(declare-fun m!304163 () Bool)

(assert (=> b!196692 m!304163))

(assert (=> b!196692 m!303801))

(declare-fun m!304165 () Bool)

(assert (=> b!196693 m!304165))

(declare-fun m!304167 () Bool)

(assert (=> b!196695 m!304167))

(assert (=> b!196695 m!304163))

(assert (=> b!196393 d!66509))

(assert (=> b!196394 d!66505))

(assert (=> b!196394 d!66507))

(declare-fun d!66525 () Bool)

(assert (=> d!66525 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4441 (buf!4927 thiss!1204))) ((_ sign_extend 32) (currentByte!9247 thiss!1204)) ((_ sign_extend 32) (currentBit!9242 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4441 (buf!4927 thiss!1204))) ((_ sign_extend 32) (currentByte!9247 thiss!1204)) ((_ sign_extend 32) (currentBit!9242 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!16521 () Bool)

(assert (= bs!16521 d!66525))

(assert (=> bs!16521 m!304051))

(assert (=> b!196386 d!66525))

(declare-fun d!66527 () Bool)

(assert (=> d!66527 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9242 thiss!1204) (currentByte!9247 thiss!1204) (size!4441 (buf!4927 thiss!1204))))))

(declare-fun bs!16522 () Bool)

(assert (= bs!16522 d!66527))

(assert (=> bs!16522 m!303797))

(assert (=> start!41762 d!66527))

(declare-fun d!66529 () Bool)

(assert (=> d!66529 (= (array_inv!4182 (buf!4927 thiss!1204)) (bvsge (size!4441 (buf!4927 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!196395 d!66529))

(declare-fun d!66531 () Bool)

(assert (=> d!66531 (= (invariant!0 (currentBit!9242 thiss!1204) (currentByte!9247 thiss!1204) (size!4441 (buf!4927 thiss!1204))) (and (bvsge (currentBit!9242 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9242 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9247 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9247 thiss!1204) (size!4441 (buf!4927 thiss!1204))) (and (= (currentBit!9242 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9247 thiss!1204) (size!4441 (buf!4927 thiss!1204)))))))))

(assert (=> b!196388 d!66531))

(declare-fun d!66533 () Bool)

(declare-fun e!135153 () Bool)

(assert (=> d!66533 e!135153))

(declare-fun res!164588 () Bool)

(assert (=> d!66533 (=> (not res!164588) (not e!135153))))

(declare-fun lt!306160 () (_ BitVec 64))

(declare-fun lt!306158 () (_ BitVec 64))

(declare-fun lt!306156 () (_ BitVec 64))

(assert (=> d!66533 (= res!164588 (= lt!306158 (bvsub lt!306156 lt!306160)))))

(assert (=> d!66533 (or (= (bvand lt!306156 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!306160 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!306156 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!306156 lt!306160) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66533 (= lt!306160 (remainingBits!0 ((_ sign_extend 32) (size!4441 (buf!4927 (_1!9140 lt!305508)))) ((_ sign_extend 32) (currentByte!9247 (_1!9140 lt!305508))) ((_ sign_extend 32) (currentBit!9242 (_1!9140 lt!305508)))))))

(declare-fun lt!306157 () (_ BitVec 64))

(declare-fun lt!306159 () (_ BitVec 64))

(assert (=> d!66533 (= lt!306156 (bvmul lt!306157 lt!306159))))

(assert (=> d!66533 (or (= lt!306157 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!306159 (bvsdiv (bvmul lt!306157 lt!306159) lt!306157)))))

(assert (=> d!66533 (= lt!306159 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66533 (= lt!306157 ((_ sign_extend 32) (size!4441 (buf!4927 (_1!9140 lt!305508)))))))

(assert (=> d!66533 (= lt!306158 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9247 (_1!9140 lt!305508))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9242 (_1!9140 lt!305508)))))))

(assert (=> d!66533 (invariant!0 (currentBit!9242 (_1!9140 lt!305508)) (currentByte!9247 (_1!9140 lt!305508)) (size!4441 (buf!4927 (_1!9140 lt!305508))))))

(assert (=> d!66533 (= (bitIndex!0 (size!4441 (buf!4927 (_1!9140 lt!305508))) (currentByte!9247 (_1!9140 lt!305508)) (currentBit!9242 (_1!9140 lt!305508))) lt!306158)))

(declare-fun b!196700 () Bool)

(declare-fun res!164589 () Bool)

(assert (=> b!196700 (=> (not res!164589) (not e!135153))))

(assert (=> b!196700 (= res!164589 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!306158))))

(declare-fun b!196701 () Bool)

(declare-fun lt!306161 () (_ BitVec 64))

(assert (=> b!196701 (= e!135153 (bvsle lt!306158 (bvmul lt!306161 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196701 (or (= lt!306161 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!306161 #b0000000000000000000000000000000000000000000000000000000000001000) lt!306161)))))

(assert (=> b!196701 (= lt!306161 ((_ sign_extend 32) (size!4441 (buf!4927 (_1!9140 lt!305508)))))))

(assert (= (and d!66533 res!164588) b!196700))

(assert (= (and b!196700 res!164589) b!196701))

(declare-fun m!304169 () Bool)

(assert (=> d!66533 m!304169))

(declare-fun m!304171 () Bool)

(assert (=> d!66533 m!304171))

(assert (=> b!196397 d!66533))

(declare-fun d!66535 () Bool)

(assert (=> d!66535 (= (invariant!0 (currentBit!9242 (_2!9139 lt!305505)) (currentByte!9247 (_2!9139 lt!305505)) (size!4441 (buf!4927 (_2!9139 lt!305505)))) (and (bvsge (currentBit!9242 (_2!9139 lt!305505)) #b00000000000000000000000000000000) (bvslt (currentBit!9242 (_2!9139 lt!305505)) #b00000000000000000000000000001000) (bvsge (currentByte!9247 (_2!9139 lt!305505)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9247 (_2!9139 lt!305505)) (size!4441 (buf!4927 (_2!9139 lt!305505)))) (and (= (currentBit!9242 (_2!9139 lt!305505)) #b00000000000000000000000000000000) (= (currentByte!9247 (_2!9139 lt!305505)) (size!4441 (buf!4927 (_2!9139 lt!305505))))))))))

(assert (=> b!196387 d!66535))

(push 1)

(assert (not b!196508))

(assert (not b!196692))

(assert (not b!196599))

(assert (not b!196596))

(assert (not b!196605))

(assert (not d!66509))

(assert (not bm!3083))

(assert (not b!196607))

(assert (not b!196604))

(assert (not b!196694))

(assert (not b!196695))

(assert (not d!66507))

(assert (not d!66453))

(assert (not b!196602))

(assert (not b!196600))

(assert (not d!66533))

(assert (not d!66505))

(assert (not d!66451))

(assert (not d!66469))

(assert (not b!196623))

(assert (not b!196693))

(assert (not b!196625))

(assert (not d!66461))

(assert (not b!196601))

(assert (not b!196506))

(assert (not d!66485))

(assert (not b!196608))

(assert (not d!66527))

(assert (not d!66525))

(assert (not b!196482))

(assert (not b!196603))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

