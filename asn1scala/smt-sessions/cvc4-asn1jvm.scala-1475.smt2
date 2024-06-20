; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40746 () Bool)

(assert start!40746)

(declare-fun b!187556 () Bool)

(declare-fun res!156222 () Bool)

(declare-fun e!129670 () Bool)

(assert (=> b!187556 (=> (not res!156222) (not e!129670))))

(declare-datatypes ((array!9846 0))(
  ( (array!9847 (arr!5271 (Array (_ BitVec 32) (_ BitVec 8))) (size!4341 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7790 0))(
  ( (BitStream!7791 (buf!4809 array!9846) (currentByte!9069 (_ BitVec 32)) (currentBit!9064 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7790)

(declare-datatypes ((Unit!13403 0))(
  ( (Unit!13404) )
))
(declare-datatypes ((tuple2!16212 0))(
  ( (tuple2!16213 (_1!8751 Unit!13403) (_2!8751 BitStream!7790)) )
))
(declare-fun lt!290519 () tuple2!16212)

(declare-fun isPrefixOf!0 (BitStream!7790 BitStream!7790) Bool)

(assert (=> b!187556 (= res!156222 (isPrefixOf!0 thiss!1204 (_2!8751 lt!290519)))))

(declare-fun b!187557 () Bool)

(declare-fun res!156219 () Bool)

(declare-fun e!129679 () Bool)

(assert (=> b!187557 (=> res!156219 e!129679)))

(declare-fun lt!290522 () tuple2!16212)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!187557 (= res!156219 (not (invariant!0 (currentBit!9064 (_2!8751 lt!290522)) (currentByte!9069 (_2!8751 lt!290522)) (size!4341 (buf!4809 (_2!8751 lt!290522))))))))

(declare-fun res!156234 () Bool)

(declare-fun e!129671 () Bool)

(assert (=> start!40746 (=> (not res!156234) (not e!129671))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!40746 (= res!156234 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40746 e!129671))

(assert (=> start!40746 true))

(declare-fun e!129683 () Bool)

(declare-fun inv!12 (BitStream!7790) Bool)

(assert (=> start!40746 (and (inv!12 thiss!1204) e!129683)))

(declare-fun b!187558 () Bool)

(declare-fun e!129674 () Bool)

(declare-datatypes ((tuple2!16214 0))(
  ( (tuple2!16215 (_1!8752 BitStream!7790) (_2!8752 Bool)) )
))
(declare-fun lt!290527 () tuple2!16214)

(declare-fun lt!290520 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!187558 (= e!129674 (= (bitIndex!0 (size!4341 (buf!4809 (_1!8752 lt!290527))) (currentByte!9069 (_1!8752 lt!290527)) (currentBit!9064 (_1!8752 lt!290527))) lt!290520))))

(declare-fun b!187559 () Bool)

(declare-fun res!156223 () Bool)

(declare-fun e!129680 () Bool)

(assert (=> b!187559 (=> (not res!156223) (not e!129680))))

(assert (=> b!187559 (= res!156223 (not (= i!590 nBits!348)))))

(declare-fun b!187560 () Bool)

(assert (=> b!187560 (= e!129670 e!129674)))

(declare-fun res!156224 () Bool)

(assert (=> b!187560 (=> (not res!156224) (not e!129674))))

(declare-fun lt!290506 () Bool)

(assert (=> b!187560 (= res!156224 (and (= (_2!8752 lt!290527) lt!290506) (= (_1!8752 lt!290527) (_2!8751 lt!290519))))))

(declare-fun readBitPure!0 (BitStream!7790) tuple2!16214)

(declare-fun readerFrom!0 (BitStream!7790 (_ BitVec 32) (_ BitVec 32)) BitStream!7790)

(assert (=> b!187560 (= lt!290527 (readBitPure!0 (readerFrom!0 (_2!8751 lt!290519) (currentBit!9064 thiss!1204) (currentByte!9069 thiss!1204))))))

(declare-fun b!187561 () Bool)

(declare-fun res!156218 () Bool)

(declare-fun e!129672 () Bool)

(assert (=> b!187561 (=> (not res!156218) (not e!129672))))

(declare-datatypes ((tuple2!16216 0))(
  ( (tuple2!16217 (_1!8753 BitStream!7790) (_2!8753 BitStream!7790)) )
))
(declare-fun lt!290526 () tuple2!16216)

(declare-fun lt!290528 () (_ BitVec 64))

(declare-fun lt!290507 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7790 (_ BitVec 64)) BitStream!7790)

(assert (=> b!187561 (= res!156218 (= (_1!8753 lt!290526) (withMovedBitIndex!0 (_2!8753 lt!290526) (bvsub lt!290507 lt!290528))))))

(declare-fun b!187562 () Bool)

(declare-fun e!129678 () Bool)

(assert (=> b!187562 (= e!129678 (invariant!0 (currentBit!9064 thiss!1204) (currentByte!9069 thiss!1204) (size!4341 (buf!4809 (_2!8751 lt!290522)))))))

(declare-fun b!187563 () Bool)

(declare-fun res!156221 () Bool)

(assert (=> b!187563 (=> (not res!156221) (not e!129672))))

(declare-fun lt!290510 () tuple2!16216)

(declare-fun lt!290505 () (_ BitVec 64))

(assert (=> b!187563 (= res!156221 (= (_1!8753 lt!290510) (withMovedBitIndex!0 (_2!8753 lt!290510) (bvsub lt!290505 lt!290528))))))

(declare-fun b!187564 () Bool)

(declare-fun e!129681 () Bool)

(declare-fun lt!290509 () tuple2!16214)

(declare-fun lt!290516 () tuple2!16214)

(assert (=> b!187564 (= e!129681 (= (_2!8752 lt!290509) (_2!8752 lt!290516)))))

(declare-fun b!187565 () Bool)

(declare-fun e!129675 () Bool)

(assert (=> b!187565 (= e!129680 (not e!129675))))

(declare-fun res!156229 () Bool)

(assert (=> b!187565 (=> res!156229 e!129675)))

(assert (=> b!187565 (= res!156229 (not (= lt!290505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!290507))))))

(assert (=> b!187565 (= lt!290505 (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!290519))) (currentByte!9069 (_2!8751 lt!290519)) (currentBit!9064 (_2!8751 lt!290519))))))

(assert (=> b!187565 (= lt!290507 (bitIndex!0 (size!4341 (buf!4809 thiss!1204)) (currentByte!9069 thiss!1204) (currentBit!9064 thiss!1204)))))

(declare-fun e!129673 () Bool)

(assert (=> b!187565 e!129673))

(declare-fun res!156215 () Bool)

(assert (=> b!187565 (=> (not res!156215) (not e!129673))))

(assert (=> b!187565 (= res!156215 (= (size!4341 (buf!4809 thiss!1204)) (size!4341 (buf!4809 (_2!8751 lt!290519)))))))

(declare-fun appendBit!0 (BitStream!7790 Bool) tuple2!16212)

(assert (=> b!187565 (= lt!290519 (appendBit!0 thiss!1204 lt!290506))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!290515 () (_ BitVec 64))

(assert (=> b!187565 (= lt!290506 (not (= (bvand v!189 lt!290515) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187565 (= lt!290515 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!187566 () Bool)

(declare-fun array_inv!4082 (array!9846) Bool)

(assert (=> b!187566 (= e!129683 (array_inv!4082 (buf!4809 thiss!1204)))))

(declare-fun b!187567 () Bool)

(declare-fun e!129676 () Bool)

(assert (=> b!187567 (= e!129679 e!129676)))

(declare-fun res!156214 () Bool)

(assert (=> b!187567 (=> res!156214 e!129676)))

(declare-datatypes ((tuple2!16218 0))(
  ( (tuple2!16219 (_1!8754 BitStream!7790) (_2!8754 (_ BitVec 64))) )
))
(declare-fun lt!290521 () tuple2!16218)

(assert (=> b!187567 (= res!156214 (not (= (_1!8754 lt!290521) (_2!8753 lt!290510))))))

(declare-fun lt!290514 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7790 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16218)

(assert (=> b!187567 (= lt!290521 (readNBitsLSBFirstsLoopPure!0 (_1!8753 lt!290510) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!290514))))

(declare-fun lt!290530 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!187567 (validate_offset_bits!1 ((_ sign_extend 32) (size!4341 (buf!4809 (_2!8751 lt!290522)))) ((_ sign_extend 32) (currentByte!9069 (_2!8751 lt!290519))) ((_ sign_extend 32) (currentBit!9064 (_2!8751 lt!290519))) lt!290530)))

(declare-fun lt!290529 () Unit!13403)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7790 array!9846 (_ BitVec 64)) Unit!13403)

(assert (=> b!187567 (= lt!290529 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8751 lt!290519) (buf!4809 (_2!8751 lt!290522)) lt!290530))))

(assert (=> b!187567 (= lt!290530 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!290513 () (_ BitVec 64))

(declare-fun lt!290512 () tuple2!16214)

(assert (=> b!187567 (= lt!290514 (bvor lt!290513 (ite (_2!8752 lt!290512) lt!290515 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!290508 () tuple2!16218)

(assert (=> b!187567 (= lt!290508 (readNBitsLSBFirstsLoopPure!0 (_1!8753 lt!290526) nBits!348 i!590 lt!290513))))

(declare-fun lt!290533 () (_ BitVec 64))

(assert (=> b!187567 (validate_offset_bits!1 ((_ sign_extend 32) (size!4341 (buf!4809 (_2!8751 lt!290522)))) ((_ sign_extend 32) (currentByte!9069 thiss!1204)) ((_ sign_extend 32) (currentBit!9064 thiss!1204)) lt!290533)))

(declare-fun lt!290511 () Unit!13403)

(assert (=> b!187567 (= lt!290511 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4809 (_2!8751 lt!290522)) lt!290533))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!187567 (= lt!290513 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!187567 (= (_2!8752 lt!290512) lt!290506)))

(assert (=> b!187567 (= lt!290512 (readBitPure!0 (_1!8753 lt!290526)))))

(declare-fun reader!0 (BitStream!7790 BitStream!7790) tuple2!16216)

(assert (=> b!187567 (= lt!290510 (reader!0 (_2!8751 lt!290519) (_2!8751 lt!290522)))))

(assert (=> b!187567 (= lt!290526 (reader!0 thiss!1204 (_2!8751 lt!290522)))))

(assert (=> b!187567 e!129681))

(declare-fun res!156226 () Bool)

(assert (=> b!187567 (=> (not res!156226) (not e!129681))))

(assert (=> b!187567 (= res!156226 (= (bitIndex!0 (size!4341 (buf!4809 (_1!8752 lt!290509))) (currentByte!9069 (_1!8752 lt!290509)) (currentBit!9064 (_1!8752 lt!290509))) (bitIndex!0 (size!4341 (buf!4809 (_1!8752 lt!290516))) (currentByte!9069 (_1!8752 lt!290516)) (currentBit!9064 (_1!8752 lt!290516)))))))

(declare-fun lt!290518 () Unit!13403)

(declare-fun lt!290523 () BitStream!7790)

(declare-fun readBitPrefixLemma!0 (BitStream!7790 BitStream!7790) Unit!13403)

(assert (=> b!187567 (= lt!290518 (readBitPrefixLemma!0 lt!290523 (_2!8751 lt!290522)))))

(assert (=> b!187567 (= lt!290516 (readBitPure!0 (BitStream!7791 (buf!4809 (_2!8751 lt!290522)) (currentByte!9069 thiss!1204) (currentBit!9064 thiss!1204))))))

(assert (=> b!187567 (= lt!290509 (readBitPure!0 lt!290523))))

(assert (=> b!187567 e!129678))

(declare-fun res!156228 () Bool)

(assert (=> b!187567 (=> (not res!156228) (not e!129678))))

(assert (=> b!187567 (= res!156228 (invariant!0 (currentBit!9064 thiss!1204) (currentByte!9069 thiss!1204) (size!4341 (buf!4809 (_2!8751 lt!290519)))))))

(assert (=> b!187567 (= lt!290523 (BitStream!7791 (buf!4809 (_2!8751 lt!290519)) (currentByte!9069 thiss!1204) (currentBit!9064 thiss!1204)))))

(declare-fun b!187568 () Bool)

(declare-fun res!156217 () Bool)

(assert (=> b!187568 (=> (not res!156217) (not e!129680))))

(assert (=> b!187568 (= res!156217 (invariant!0 (currentBit!9064 thiss!1204) (currentByte!9069 thiss!1204) (size!4341 (buf!4809 thiss!1204))))))

(declare-fun b!187569 () Bool)

(assert (=> b!187569 (= e!129671 e!129680)))

(declare-fun res!156232 () Bool)

(assert (=> b!187569 (=> (not res!156232) (not e!129680))))

(assert (=> b!187569 (= res!156232 (validate_offset_bits!1 ((_ sign_extend 32) (size!4341 (buf!4809 thiss!1204))) ((_ sign_extend 32) (currentByte!9069 thiss!1204)) ((_ sign_extend 32) (currentBit!9064 thiss!1204)) lt!290533))))

(assert (=> b!187569 (= lt!290533 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!187570 () Bool)

(declare-fun lt!290532 () BitStream!7790)

(assert (=> b!187570 (= e!129672 (and (= lt!290507 (bvsub lt!290505 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8753 lt!290510) lt!290532)) (= (_2!8754 lt!290508) (_2!8754 lt!290521)))))))

(declare-fun b!187571 () Bool)

(declare-fun res!156220 () Bool)

(assert (=> b!187571 (=> res!156220 e!129679)))

(assert (=> b!187571 (= res!156220 (or (not (= (size!4341 (buf!4809 (_2!8751 lt!290522))) (size!4341 (buf!4809 thiss!1204)))) (not (= lt!290528 (bvsub (bvadd lt!290507 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!187572 () Bool)

(declare-fun e!129682 () Bool)

(assert (=> b!187572 (= e!129682 (invariant!0 (currentBit!9064 (_1!8754 lt!290508)) (currentByte!9069 (_1!8754 lt!290508)) (size!4341 (buf!4809 (_1!8754 lt!290508)))))))

(declare-fun b!187573 () Bool)

(assert (=> b!187573 (= e!129675 e!129679)))

(declare-fun res!156230 () Bool)

(assert (=> b!187573 (=> res!156230 e!129679)))

(assert (=> b!187573 (= res!156230 (not (= lt!290528 (bvsub (bvsub (bvadd lt!290505 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!187573 (= lt!290528 (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!290522))) (currentByte!9069 (_2!8751 lt!290522)) (currentBit!9064 (_2!8751 lt!290522))))))

(assert (=> b!187573 (isPrefixOf!0 thiss!1204 (_2!8751 lt!290522))))

(declare-fun lt!290531 () Unit!13403)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7790 BitStream!7790 BitStream!7790) Unit!13403)

(assert (=> b!187573 (= lt!290531 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8751 lt!290519) (_2!8751 lt!290522)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7790 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16212)

(assert (=> b!187573 (= lt!290522 (appendBitsLSBFirstLoopTR!0 (_2!8751 lt!290519) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!187574 () Bool)

(declare-fun res!156227 () Bool)

(assert (=> b!187574 (=> res!156227 e!129679)))

(assert (=> b!187574 (= res!156227 (not (isPrefixOf!0 (_2!8751 lt!290519) (_2!8751 lt!290522))))))

(declare-fun b!187575 () Bool)

(assert (=> b!187575 (= e!129676 e!129682)))

(declare-fun res!156216 () Bool)

(assert (=> b!187575 (=> res!156216 e!129682)))

(assert (=> b!187575 (= res!156216 (not (= (_1!8753 lt!290510) lt!290532)))))

(assert (=> b!187575 e!129672))

(declare-fun res!156231 () Bool)

(assert (=> b!187575 (=> (not res!156231) (not e!129672))))

(declare-fun lt!290525 () tuple2!16218)

(assert (=> b!187575 (= res!156231 (and (= (_2!8754 lt!290508) (_2!8754 lt!290525)) (= (_1!8754 lt!290508) (_1!8754 lt!290525))))))

(declare-fun lt!290524 () Unit!13403)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7790 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13403)

(assert (=> b!187575 (= lt!290524 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8753 lt!290526) nBits!348 i!590 lt!290513))))

(assert (=> b!187575 (= lt!290525 (readNBitsLSBFirstsLoopPure!0 lt!290532 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!290514))))

(assert (=> b!187575 (= lt!290532 (withMovedBitIndex!0 (_1!8753 lt!290526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!187576 () Bool)

(declare-fun res!156225 () Bool)

(assert (=> b!187576 (=> res!156225 e!129679)))

(assert (=> b!187576 (= res!156225 (not (isPrefixOf!0 thiss!1204 (_2!8751 lt!290519))))))

(declare-fun b!187577 () Bool)

(assert (=> b!187577 (= e!129673 e!129670)))

(declare-fun res!156233 () Bool)

(assert (=> b!187577 (=> (not res!156233) (not e!129670))))

(declare-fun lt!290517 () (_ BitVec 64))

(assert (=> b!187577 (= res!156233 (= lt!290520 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!290517)))))

(assert (=> b!187577 (= lt!290520 (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!290519))) (currentByte!9069 (_2!8751 lt!290519)) (currentBit!9064 (_2!8751 lt!290519))))))

(assert (=> b!187577 (= lt!290517 (bitIndex!0 (size!4341 (buf!4809 thiss!1204)) (currentByte!9069 thiss!1204) (currentBit!9064 thiss!1204)))))

(assert (= (and start!40746 res!156234) b!187569))

(assert (= (and b!187569 res!156232) b!187568))

(assert (= (and b!187568 res!156217) b!187559))

(assert (= (and b!187559 res!156223) b!187565))

(assert (= (and b!187565 res!156215) b!187577))

(assert (= (and b!187577 res!156233) b!187556))

(assert (= (and b!187556 res!156222) b!187560))

(assert (= (and b!187560 res!156224) b!187558))

(assert (= (and b!187565 (not res!156229)) b!187573))

(assert (= (and b!187573 (not res!156230)) b!187557))

(assert (= (and b!187557 (not res!156219)) b!187571))

(assert (= (and b!187571 (not res!156220)) b!187574))

(assert (= (and b!187574 (not res!156227)) b!187576))

(assert (= (and b!187576 (not res!156225)) b!187567))

(assert (= (and b!187567 res!156228) b!187562))

(assert (= (and b!187567 res!156226) b!187564))

(assert (= (and b!187567 (not res!156214)) b!187575))

(assert (= (and b!187575 res!156231) b!187561))

(assert (= (and b!187561 res!156218) b!187563))

(assert (= (and b!187563 res!156221) b!187570))

(assert (= (and b!187575 (not res!156216)) b!187572))

(assert (= start!40746 b!187566))

(declare-fun m!291585 () Bool)

(assert (=> b!187574 m!291585))

(declare-fun m!291587 () Bool)

(assert (=> b!187566 m!291587))

(declare-fun m!291589 () Bool)

(assert (=> b!187567 m!291589))

(declare-fun m!291591 () Bool)

(assert (=> b!187567 m!291591))

(declare-fun m!291593 () Bool)

(assert (=> b!187567 m!291593))

(declare-fun m!291595 () Bool)

(assert (=> b!187567 m!291595))

(declare-fun m!291597 () Bool)

(assert (=> b!187567 m!291597))

(declare-fun m!291599 () Bool)

(assert (=> b!187567 m!291599))

(declare-fun m!291601 () Bool)

(assert (=> b!187567 m!291601))

(declare-fun m!291603 () Bool)

(assert (=> b!187567 m!291603))

(declare-fun m!291605 () Bool)

(assert (=> b!187567 m!291605))

(declare-fun m!291607 () Bool)

(assert (=> b!187567 m!291607))

(declare-fun m!291609 () Bool)

(assert (=> b!187567 m!291609))

(declare-fun m!291611 () Bool)

(assert (=> b!187567 m!291611))

(declare-fun m!291613 () Bool)

(assert (=> b!187567 m!291613))

(declare-fun m!291615 () Bool)

(assert (=> b!187567 m!291615))

(declare-fun m!291617 () Bool)

(assert (=> b!187567 m!291617))

(declare-fun m!291619 () Bool)

(assert (=> b!187567 m!291619))

(declare-fun m!291621 () Bool)

(assert (=> b!187558 m!291621))

(declare-fun m!291623 () Bool)

(assert (=> b!187557 m!291623))

(declare-fun m!291625 () Bool)

(assert (=> b!187565 m!291625))

(declare-fun m!291627 () Bool)

(assert (=> b!187565 m!291627))

(declare-fun m!291629 () Bool)

(assert (=> b!187565 m!291629))

(declare-fun m!291631 () Bool)

(assert (=> b!187556 m!291631))

(declare-fun m!291633 () Bool)

(assert (=> b!187561 m!291633))

(declare-fun m!291635 () Bool)

(assert (=> b!187568 m!291635))

(declare-fun m!291637 () Bool)

(assert (=> b!187572 m!291637))

(declare-fun m!291639 () Bool)

(assert (=> b!187575 m!291639))

(declare-fun m!291641 () Bool)

(assert (=> b!187575 m!291641))

(declare-fun m!291643 () Bool)

(assert (=> b!187575 m!291643))

(declare-fun m!291645 () Bool)

(assert (=> b!187562 m!291645))

(declare-fun m!291647 () Bool)

(assert (=> b!187563 m!291647))

(assert (=> b!187577 m!291625))

(assert (=> b!187577 m!291627))

(declare-fun m!291649 () Bool)

(assert (=> start!40746 m!291649))

(declare-fun m!291651 () Bool)

(assert (=> b!187573 m!291651))

(declare-fun m!291653 () Bool)

(assert (=> b!187573 m!291653))

(declare-fun m!291655 () Bool)

(assert (=> b!187573 m!291655))

(declare-fun m!291657 () Bool)

(assert (=> b!187573 m!291657))

(declare-fun m!291659 () Bool)

(assert (=> b!187560 m!291659))

(assert (=> b!187560 m!291659))

(declare-fun m!291661 () Bool)

(assert (=> b!187560 m!291661))

(assert (=> b!187576 m!291631))

(declare-fun m!291663 () Bool)

(assert (=> b!187569 m!291663))

(push 1)

(assert (not b!187565))

(assert (not b!187563))

(assert (not b!187562))

(assert (not start!40746))

(assert (not b!187577))

(assert (not b!187575))

(assert (not b!187572))

(assert (not b!187574))

(assert (not b!187566))

(assert (not b!187567))

(assert (not b!187569))

(assert (not b!187557))

(assert (not b!187576))

(assert (not b!187556))

(assert (not b!187568))

(assert (not b!187558))

(assert (not b!187573))

(assert (not b!187560))

(assert (not b!187561))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!64743 () Bool)

(declare-fun res!156319 () Bool)

(declare-fun e!129738 () Bool)

(assert (=> d!64743 (=> (not res!156319) (not e!129738))))

(assert (=> d!64743 (= res!156319 (= (size!4341 (buf!4809 (_2!8751 lt!290519))) (size!4341 (buf!4809 (_2!8751 lt!290522)))))))

(assert (=> d!64743 (= (isPrefixOf!0 (_2!8751 lt!290519) (_2!8751 lt!290522)) e!129738)))

(declare-fun b!187668 () Bool)

(declare-fun res!156317 () Bool)

(assert (=> b!187668 (=> (not res!156317) (not e!129738))))

(assert (=> b!187668 (= res!156317 (bvsle (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!290519))) (currentByte!9069 (_2!8751 lt!290519)) (currentBit!9064 (_2!8751 lt!290519))) (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!290522))) (currentByte!9069 (_2!8751 lt!290522)) (currentBit!9064 (_2!8751 lt!290522)))))))

(declare-fun b!187669 () Bool)

(declare-fun e!129737 () Bool)

(assert (=> b!187669 (= e!129738 e!129737)))

(declare-fun res!156318 () Bool)

(assert (=> b!187669 (=> res!156318 e!129737)))

(assert (=> b!187669 (= res!156318 (= (size!4341 (buf!4809 (_2!8751 lt!290519))) #b00000000000000000000000000000000))))

(declare-fun b!187670 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9846 array!9846 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!187670 (= e!129737 (arrayBitRangesEq!0 (buf!4809 (_2!8751 lt!290519)) (buf!4809 (_2!8751 lt!290522)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!290519))) (currentByte!9069 (_2!8751 lt!290519)) (currentBit!9064 (_2!8751 lt!290519)))))))

(assert (= (and d!64743 res!156319) b!187668))

(assert (= (and b!187668 res!156317) b!187669))

(assert (= (and b!187669 (not res!156318)) b!187670))

(assert (=> b!187668 m!291625))

(assert (=> b!187668 m!291651))

(assert (=> b!187670 m!291625))

(assert (=> b!187670 m!291625))

(declare-fun m!291825 () Bool)

(assert (=> b!187670 m!291825))

(assert (=> b!187574 d!64743))

(declare-fun d!64745 () Bool)

(declare-fun e!129744 () Bool)

(assert (=> d!64745 e!129744))

(declare-fun res!156328 () Bool)

(assert (=> d!64745 (=> (not res!156328) (not e!129744))))

(declare-fun lt!290754 () BitStream!7790)

(declare-fun lt!290755 () (_ BitVec 64))

(assert (=> d!64745 (= res!156328 (= (bvadd lt!290755 (bvsub lt!290505 lt!290528)) (bitIndex!0 (size!4341 (buf!4809 lt!290754)) (currentByte!9069 lt!290754) (currentBit!9064 lt!290754))))))

(assert (=> d!64745 (or (not (= (bvand lt!290755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!290505 lt!290528) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!290755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!290755 (bvsub lt!290505 lt!290528)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64745 (= lt!290755 (bitIndex!0 (size!4341 (buf!4809 (_2!8753 lt!290510))) (currentByte!9069 (_2!8753 lt!290510)) (currentBit!9064 (_2!8753 lt!290510))))))

(declare-fun moveBitIndex!0 (BitStream!7790 (_ BitVec 64)) tuple2!16212)

(assert (=> d!64745 (= lt!290754 (_2!8751 (moveBitIndex!0 (_2!8753 lt!290510) (bvsub lt!290505 lt!290528))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7790 (_ BitVec 64)) Bool)

(assert (=> d!64745 (moveBitIndexPrecond!0 (_2!8753 lt!290510) (bvsub lt!290505 lt!290528))))

(assert (=> d!64745 (= (withMovedBitIndex!0 (_2!8753 lt!290510) (bvsub lt!290505 lt!290528)) lt!290754)))

(declare-fun b!187679 () Bool)

(assert (=> b!187679 (= e!129744 (= (size!4341 (buf!4809 (_2!8753 lt!290510))) (size!4341 (buf!4809 lt!290754))))))

(assert (= (and d!64745 res!156328) b!187679))

(declare-fun m!291831 () Bool)

(assert (=> d!64745 m!291831))

(declare-fun m!291833 () Bool)

(assert (=> d!64745 m!291833))

(declare-fun m!291835 () Bool)

(assert (=> d!64745 m!291835))

(declare-fun m!291837 () Bool)

(assert (=> d!64745 m!291837))

(assert (=> b!187563 d!64745))

(declare-fun d!64749 () Bool)

(declare-fun e!129750 () Bool)

(assert (=> d!64749 e!129750))

(declare-fun res!156337 () Bool)

(assert (=> d!64749 (=> (not res!156337) (not e!129750))))

(declare-fun lt!290777 () (_ BitVec 64))

(declare-fun lt!290778 () (_ BitVec 64))

(declare-fun lt!290779 () (_ BitVec 64))

(assert (=> d!64749 (= res!156337 (= lt!290778 (bvsub lt!290777 lt!290779)))))

(assert (=> d!64749 (or (= (bvand lt!290777 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!290779 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!290777 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!290777 lt!290779) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!64749 (= lt!290779 (remainingBits!0 ((_ sign_extend 32) (size!4341 (buf!4809 (_2!8751 lt!290522)))) ((_ sign_extend 32) (currentByte!9069 (_2!8751 lt!290522))) ((_ sign_extend 32) (currentBit!9064 (_2!8751 lt!290522)))))))

(declare-fun lt!290774 () (_ BitVec 64))

(declare-fun lt!290775 () (_ BitVec 64))

(assert (=> d!64749 (= lt!290777 (bvmul lt!290774 lt!290775))))

(assert (=> d!64749 (or (= lt!290774 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!290775 (bvsdiv (bvmul lt!290774 lt!290775) lt!290774)))))

(assert (=> d!64749 (= lt!290775 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64749 (= lt!290774 ((_ sign_extend 32) (size!4341 (buf!4809 (_2!8751 lt!290522)))))))

(assert (=> d!64749 (= lt!290778 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9069 (_2!8751 lt!290522))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9064 (_2!8751 lt!290522)))))))

(assert (=> d!64749 (invariant!0 (currentBit!9064 (_2!8751 lt!290522)) (currentByte!9069 (_2!8751 lt!290522)) (size!4341 (buf!4809 (_2!8751 lt!290522))))))

(assert (=> d!64749 (= (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!290522))) (currentByte!9069 (_2!8751 lt!290522)) (currentBit!9064 (_2!8751 lt!290522))) lt!290778)))

(declare-fun b!187687 () Bool)

(declare-fun res!156336 () Bool)

(assert (=> b!187687 (=> (not res!156336) (not e!129750))))

(assert (=> b!187687 (= res!156336 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!290778))))

(declare-fun b!187688 () Bool)

(declare-fun lt!290776 () (_ BitVec 64))

(assert (=> b!187688 (= e!129750 (bvsle lt!290778 (bvmul lt!290776 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187688 (or (= lt!290776 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!290776 #b0000000000000000000000000000000000000000000000000000000000001000) lt!290776)))))

(assert (=> b!187688 (= lt!290776 ((_ sign_extend 32) (size!4341 (buf!4809 (_2!8751 lt!290522)))))))

(assert (= (and d!64749 res!156337) b!187687))

(assert (= (and b!187687 res!156336) b!187688))

(declare-fun m!291847 () Bool)

(assert (=> d!64749 m!291847))

(assert (=> d!64749 m!291623))

(assert (=> b!187573 d!64749))

(declare-fun d!64755 () Bool)

(declare-fun res!156340 () Bool)

(declare-fun e!129752 () Bool)

(assert (=> d!64755 (=> (not res!156340) (not e!129752))))

(assert (=> d!64755 (= res!156340 (= (size!4341 (buf!4809 thiss!1204)) (size!4341 (buf!4809 (_2!8751 lt!290522)))))))

(assert (=> d!64755 (= (isPrefixOf!0 thiss!1204 (_2!8751 lt!290522)) e!129752)))

(declare-fun b!187689 () Bool)

(declare-fun res!156338 () Bool)

(assert (=> b!187689 (=> (not res!156338) (not e!129752))))

(assert (=> b!187689 (= res!156338 (bvsle (bitIndex!0 (size!4341 (buf!4809 thiss!1204)) (currentByte!9069 thiss!1204) (currentBit!9064 thiss!1204)) (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!290522))) (currentByte!9069 (_2!8751 lt!290522)) (currentBit!9064 (_2!8751 lt!290522)))))))

(declare-fun b!187690 () Bool)

(declare-fun e!129751 () Bool)

(assert (=> b!187690 (= e!129752 e!129751)))

(declare-fun res!156339 () Bool)

(assert (=> b!187690 (=> res!156339 e!129751)))

(assert (=> b!187690 (= res!156339 (= (size!4341 (buf!4809 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!187691 () Bool)

(assert (=> b!187691 (= e!129751 (arrayBitRangesEq!0 (buf!4809 thiss!1204) (buf!4809 (_2!8751 lt!290522)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4341 (buf!4809 thiss!1204)) (currentByte!9069 thiss!1204) (currentBit!9064 thiss!1204))))))

(assert (= (and d!64755 res!156340) b!187689))

(assert (= (and b!187689 res!156338) b!187690))

(assert (= (and b!187690 (not res!156339)) b!187691))

(assert (=> b!187689 m!291627))

(assert (=> b!187689 m!291651))

(assert (=> b!187691 m!291627))

(assert (=> b!187691 m!291627))

(declare-fun m!291849 () Bool)

(assert (=> b!187691 m!291849))

(assert (=> b!187573 d!64755))

(declare-fun d!64757 () Bool)

(assert (=> d!64757 (isPrefixOf!0 thiss!1204 (_2!8751 lt!290522))))

(declare-fun lt!290800 () Unit!13403)

(declare-fun choose!30 (BitStream!7790 BitStream!7790 BitStream!7790) Unit!13403)

(assert (=> d!64757 (= lt!290800 (choose!30 thiss!1204 (_2!8751 lt!290519) (_2!8751 lt!290522)))))

(assert (=> d!64757 (isPrefixOf!0 thiss!1204 (_2!8751 lt!290519))))

(assert (=> d!64757 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8751 lt!290519) (_2!8751 lt!290522)) lt!290800)))

(declare-fun bs!16099 () Bool)

(assert (= bs!16099 d!64757))

(assert (=> bs!16099 m!291653))

(declare-fun m!291853 () Bool)

(assert (=> bs!16099 m!291853))

(assert (=> bs!16099 m!291631))

(assert (=> b!187573 d!64757))

(declare-fun b!187829 () Bool)

(declare-fun e!129832 () tuple2!16212)

(declare-fun Unit!13418 () Unit!13403)

(assert (=> b!187829 (= e!129832 (tuple2!16213 Unit!13418 (_2!8751 lt!290519)))))

(declare-fun lt!291269 () Unit!13403)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7790) Unit!13403)

(assert (=> b!187829 (= lt!291269 (lemmaIsPrefixRefl!0 (_2!8751 lt!290519)))))

(declare-fun call!3017 () Bool)

(assert (=> b!187829 call!3017))

(declare-fun lt!291284 () Unit!13403)

(assert (=> b!187829 (= lt!291284 lt!291269)))

(declare-fun b!187830 () Bool)

(declare-fun res!156460 () Bool)

(declare-fun lt!291270 () tuple2!16212)

(assert (=> b!187830 (= res!156460 (isPrefixOf!0 (_2!8751 lt!290519) (_2!8751 lt!291270)))))

(declare-fun e!129831 () Bool)

(assert (=> b!187830 (=> (not res!156460) (not e!129831))))

(declare-fun b!187831 () Bool)

(declare-fun e!129834 () Bool)

(declare-fun lt!291274 () tuple2!16218)

(declare-fun lt!291259 () tuple2!16216)

(assert (=> b!187831 (= e!129834 (= (_1!8754 lt!291274) (_2!8753 lt!291259)))))

(declare-fun b!187832 () Bool)

(declare-fun lt!291291 () tuple2!16212)

(assert (=> b!187832 (= e!129832 (tuple2!16213 (_1!8751 lt!291291) (_2!8751 lt!291291)))))

(declare-fun lt!291267 () Bool)

(assert (=> b!187832 (= lt!291267 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187832 (= lt!291270 (appendBit!0 (_2!8751 lt!290519) lt!291267))))

(declare-fun res!156452 () Bool)

(assert (=> b!187832 (= res!156452 (= (size!4341 (buf!4809 (_2!8751 lt!290519))) (size!4341 (buf!4809 (_2!8751 lt!291270)))))))

(assert (=> b!187832 (=> (not res!156452) (not e!129831))))

(assert (=> b!187832 e!129831))

(declare-fun lt!291266 () tuple2!16212)

(assert (=> b!187832 (= lt!291266 lt!291270)))

(assert (=> b!187832 (= lt!291291 (appendBitsLSBFirstLoopTR!0 (_2!8751 lt!291266) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!291248 () Unit!13403)

(assert (=> b!187832 (= lt!291248 (lemmaIsPrefixTransitive!0 (_2!8751 lt!290519) (_2!8751 lt!291266) (_2!8751 lt!291291)))))

(assert (=> b!187832 call!3017))

(declare-fun lt!291252 () Unit!13403)

(assert (=> b!187832 (= lt!291252 lt!291248)))

(assert (=> b!187832 (invariant!0 (currentBit!9064 (_2!8751 lt!290519)) (currentByte!9069 (_2!8751 lt!290519)) (size!4341 (buf!4809 (_2!8751 lt!291266))))))

(declare-fun lt!291285 () BitStream!7790)

(assert (=> b!187832 (= lt!291285 (BitStream!7791 (buf!4809 (_2!8751 lt!291266)) (currentByte!9069 (_2!8751 lt!290519)) (currentBit!9064 (_2!8751 lt!290519))))))

(assert (=> b!187832 (invariant!0 (currentBit!9064 lt!291285) (currentByte!9069 lt!291285) (size!4341 (buf!4809 (_2!8751 lt!291291))))))

(declare-fun lt!291243 () BitStream!7790)

(assert (=> b!187832 (= lt!291243 (BitStream!7791 (buf!4809 (_2!8751 lt!291291)) (currentByte!9069 lt!291285) (currentBit!9064 lt!291285)))))

(declare-fun lt!291238 () tuple2!16214)

(assert (=> b!187832 (= lt!291238 (readBitPure!0 lt!291285))))

(declare-fun lt!291273 () tuple2!16214)

(assert (=> b!187832 (= lt!291273 (readBitPure!0 lt!291243))))

(declare-fun lt!291272 () Unit!13403)

(assert (=> b!187832 (= lt!291272 (readBitPrefixLemma!0 lt!291285 (_2!8751 lt!291291)))))

(declare-fun res!156456 () Bool)

(assert (=> b!187832 (= res!156456 (= (bitIndex!0 (size!4341 (buf!4809 (_1!8752 lt!291238))) (currentByte!9069 (_1!8752 lt!291238)) (currentBit!9064 (_1!8752 lt!291238))) (bitIndex!0 (size!4341 (buf!4809 (_1!8752 lt!291273))) (currentByte!9069 (_1!8752 lt!291273)) (currentBit!9064 (_1!8752 lt!291273)))))))

(declare-fun e!129833 () Bool)

(assert (=> b!187832 (=> (not res!156456) (not e!129833))))

(assert (=> b!187832 e!129833))

(declare-fun lt!291247 () Unit!13403)

(assert (=> b!187832 (= lt!291247 lt!291272)))

(declare-fun lt!291240 () tuple2!16216)

(assert (=> b!187832 (= lt!291240 (reader!0 (_2!8751 lt!290519) (_2!8751 lt!291291)))))

(declare-fun lt!291287 () tuple2!16216)

(assert (=> b!187832 (= lt!291287 (reader!0 (_2!8751 lt!291266) (_2!8751 lt!291291)))))

(declare-fun lt!291257 () tuple2!16214)

(assert (=> b!187832 (= lt!291257 (readBitPure!0 (_1!8753 lt!291240)))))

(assert (=> b!187832 (= (_2!8752 lt!291257) lt!291267)))

(declare-fun lt!291261 () Unit!13403)

(declare-fun Unit!13420 () Unit!13403)

(assert (=> b!187832 (= lt!291261 Unit!13420)))

(declare-fun lt!291292 () (_ BitVec 64))

(assert (=> b!187832 (= lt!291292 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!291283 () (_ BitVec 64))

(assert (=> b!187832 (= lt!291283 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!291271 () Unit!13403)

(assert (=> b!187832 (= lt!291271 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8751 lt!290519) (buf!4809 (_2!8751 lt!291291)) lt!291283))))

(assert (=> b!187832 (validate_offset_bits!1 ((_ sign_extend 32) (size!4341 (buf!4809 (_2!8751 lt!291291)))) ((_ sign_extend 32) (currentByte!9069 (_2!8751 lt!290519))) ((_ sign_extend 32) (currentBit!9064 (_2!8751 lt!290519))) lt!291283)))

(declare-fun lt!291254 () Unit!13403)

(assert (=> b!187832 (= lt!291254 lt!291271)))

(declare-fun lt!291263 () tuple2!16218)

(assert (=> b!187832 (= lt!291263 (readNBitsLSBFirstsLoopPure!0 (_1!8753 lt!291240) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!291292))))

(declare-fun lt!291242 () (_ BitVec 64))

(assert (=> b!187832 (= lt!291242 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!291255 () Unit!13403)

(assert (=> b!187832 (= lt!291255 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8751 lt!291266) (buf!4809 (_2!8751 lt!291291)) lt!291242))))

(assert (=> b!187832 (validate_offset_bits!1 ((_ sign_extend 32) (size!4341 (buf!4809 (_2!8751 lt!291291)))) ((_ sign_extend 32) (currentByte!9069 (_2!8751 lt!291266))) ((_ sign_extend 32) (currentBit!9064 (_2!8751 lt!291266))) lt!291242)))

(declare-fun lt!291258 () Unit!13403)

(assert (=> b!187832 (= lt!291258 lt!291255)))

(declare-fun lt!291275 () tuple2!16218)

(assert (=> b!187832 (= lt!291275 (readNBitsLSBFirstsLoopPure!0 (_1!8753 lt!291287) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!291292 (ite (_2!8752 lt!291257) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!291280 () tuple2!16218)

(assert (=> b!187832 (= lt!291280 (readNBitsLSBFirstsLoopPure!0 (_1!8753 lt!291240) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!291292))))

(declare-fun c!9578 () Bool)

(assert (=> b!187832 (= c!9578 (_2!8752 (readBitPure!0 (_1!8753 lt!291240))))))

(declare-fun lt!291277 () tuple2!16218)

(declare-fun e!129835 () (_ BitVec 64))

(assert (=> b!187832 (= lt!291277 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8753 lt!291240) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!291292 e!129835)))))

(declare-fun lt!291245 () Unit!13403)

(assert (=> b!187832 (= lt!291245 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8753 lt!291240) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!291292))))

(assert (=> b!187832 (and (= (_2!8754 lt!291280) (_2!8754 lt!291277)) (= (_1!8754 lt!291280) (_1!8754 lt!291277)))))

(declare-fun lt!291281 () Unit!13403)

(assert (=> b!187832 (= lt!291281 lt!291245)))

(assert (=> b!187832 (= (_1!8753 lt!291240) (withMovedBitIndex!0 (_2!8753 lt!291240) (bvsub (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!290519))) (currentByte!9069 (_2!8751 lt!290519)) (currentBit!9064 (_2!8751 lt!290519))) (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!291291))) (currentByte!9069 (_2!8751 lt!291291)) (currentBit!9064 (_2!8751 lt!291291))))))))

(declare-fun lt!291253 () Unit!13403)

(declare-fun Unit!13422 () Unit!13403)

(assert (=> b!187832 (= lt!291253 Unit!13422)))

(assert (=> b!187832 (= (_1!8753 lt!291287) (withMovedBitIndex!0 (_2!8753 lt!291287) (bvsub (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!291266))) (currentByte!9069 (_2!8751 lt!291266)) (currentBit!9064 (_2!8751 lt!291266))) (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!291291))) (currentByte!9069 (_2!8751 lt!291291)) (currentBit!9064 (_2!8751 lt!291291))))))))

(declare-fun lt!291290 () Unit!13403)

(declare-fun Unit!13423 () Unit!13403)

(assert (=> b!187832 (= lt!291290 Unit!13423)))

(assert (=> b!187832 (= (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!290519))) (currentByte!9069 (_2!8751 lt!290519)) (currentBit!9064 (_2!8751 lt!290519))) (bvsub (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!291266))) (currentByte!9069 (_2!8751 lt!291266)) (currentBit!9064 (_2!8751 lt!291266))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!291279 () Unit!13403)

(declare-fun Unit!13424 () Unit!13403)

(assert (=> b!187832 (= lt!291279 Unit!13424)))

(assert (=> b!187832 (= (_2!8754 lt!291263) (_2!8754 lt!291275))))

(declare-fun lt!291265 () Unit!13403)

(declare-fun Unit!13425 () Unit!13403)

(assert (=> b!187832 (= lt!291265 Unit!13425)))

(assert (=> b!187832 (invariant!0 (currentBit!9064 (_2!8751 lt!291291)) (currentByte!9069 (_2!8751 lt!291291)) (size!4341 (buf!4809 (_2!8751 lt!291291))))))

(declare-fun lt!291250 () Unit!13403)

(declare-fun Unit!13426 () Unit!13403)

(assert (=> b!187832 (= lt!291250 Unit!13426)))

(assert (=> b!187832 (= (size!4341 (buf!4809 (_2!8751 lt!290519))) (size!4341 (buf!4809 (_2!8751 lt!291291))))))

(declare-fun lt!291249 () Unit!13403)

(declare-fun Unit!13427 () Unit!13403)

(assert (=> b!187832 (= lt!291249 Unit!13427)))

(assert (=> b!187832 (= (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!291291))) (currentByte!9069 (_2!8751 lt!291291)) (currentBit!9064 (_2!8751 lt!291291))) (bvsub (bvadd (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!290519))) (currentByte!9069 (_2!8751 lt!290519)) (currentBit!9064 (_2!8751 lt!290519))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!291260 () Unit!13403)

(declare-fun Unit!13428 () Unit!13403)

(assert (=> b!187832 (= lt!291260 Unit!13428)))

(declare-fun lt!291256 () Unit!13403)

(declare-fun Unit!13429 () Unit!13403)

(assert (=> b!187832 (= lt!291256 Unit!13429)))

(declare-fun lt!291246 () tuple2!16216)

(assert (=> b!187832 (= lt!291246 (reader!0 (_2!8751 lt!290519) (_2!8751 lt!291291)))))

(declare-fun lt!291278 () (_ BitVec 64))

(assert (=> b!187832 (= lt!291278 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!291241 () Unit!13403)

(assert (=> b!187832 (= lt!291241 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8751 lt!290519) (buf!4809 (_2!8751 lt!291291)) lt!291278))))

(assert (=> b!187832 (validate_offset_bits!1 ((_ sign_extend 32) (size!4341 (buf!4809 (_2!8751 lt!291291)))) ((_ sign_extend 32) (currentByte!9069 (_2!8751 lt!290519))) ((_ sign_extend 32) (currentBit!9064 (_2!8751 lt!290519))) lt!291278)))

(declare-fun lt!291286 () Unit!13403)

(assert (=> b!187832 (= lt!291286 lt!291241)))

(declare-fun lt!291262 () tuple2!16218)

(assert (=> b!187832 (= lt!291262 (readNBitsLSBFirstsLoopPure!0 (_1!8753 lt!291246) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!156451 () Bool)

(assert (=> b!187832 (= res!156451 (= (_2!8754 lt!291262) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!129829 () Bool)

(assert (=> b!187832 (=> (not res!156451) (not e!129829))))

(assert (=> b!187832 e!129829))

(declare-fun lt!291237 () Unit!13403)

(declare-fun Unit!13430 () Unit!13403)

(assert (=> b!187832 (= lt!291237 Unit!13430)))

(declare-fun b!187833 () Bool)

(declare-fun e!129830 () Bool)

(declare-fun lt!291288 () tuple2!16214)

(assert (=> b!187833 (= e!129830 (= (bitIndex!0 (size!4341 (buf!4809 (_1!8752 lt!291288))) (currentByte!9069 (_1!8752 lt!291288)) (currentBit!9064 (_1!8752 lt!291288))) (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!291270))) (currentByte!9069 (_2!8751 lt!291270)) (currentBit!9064 (_2!8751 lt!291270)))))))

(declare-fun b!187834 () Bool)

(declare-fun res!156461 () Bool)

(declare-fun e!129837 () Bool)

(assert (=> b!187834 (=> (not res!156461) (not e!129837))))

(declare-fun lt!291251 () tuple2!16212)

(declare-fun lt!291276 () (_ BitVec 64))

(declare-fun lt!291264 () (_ BitVec 64))

(assert (=> b!187834 (= res!156461 (= (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!291251))) (currentByte!9069 (_2!8751 lt!291251)) (currentBit!9064 (_2!8751 lt!291251))) (bvsub lt!291276 lt!291264)))))

(assert (=> b!187834 (or (= (bvand lt!291276 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!291264 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!291276 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!291276 lt!291264) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187834 (= lt!291264 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!291239 () (_ BitVec 64))

(declare-fun lt!291244 () (_ BitVec 64))

(assert (=> b!187834 (= lt!291276 (bvadd lt!291239 lt!291244))))

(assert (=> b!187834 (or (not (= (bvand lt!291239 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!291244 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!291239 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!291239 lt!291244) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187834 (= lt!291244 ((_ sign_extend 32) nBits!348))))

(assert (=> b!187834 (= lt!291239 (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!290519))) (currentByte!9069 (_2!8751 lt!290519)) (currentBit!9064 (_2!8751 lt!290519))))))

(declare-fun b!187835 () Bool)

(declare-fun e!129836 () Bool)

(declare-fun lt!291289 () (_ BitVec 64))

(assert (=> b!187835 (= e!129836 (validate_offset_bits!1 ((_ sign_extend 32) (size!4341 (buf!4809 (_2!8751 lt!290519)))) ((_ sign_extend 32) (currentByte!9069 (_2!8751 lt!290519))) ((_ sign_extend 32) (currentBit!9064 (_2!8751 lt!290519))) lt!291289))))

(declare-fun b!187836 () Bool)

(assert (=> b!187836 (= e!129829 (= (_1!8754 lt!291262) (_2!8753 lt!291246)))))

(declare-fun b!187837 () Bool)

(declare-fun res!156453 () Bool)

(assert (=> b!187837 (=> (not res!156453) (not e!129837))))

(assert (=> b!187837 (= res!156453 (isPrefixOf!0 (_2!8751 lt!290519) (_2!8751 lt!291251)))))

(declare-fun c!9579 () Bool)

(declare-fun bm!3014 () Bool)

(assert (=> bm!3014 (= call!3017 (isPrefixOf!0 (_2!8751 lt!290519) (ite c!9579 (_2!8751 lt!290519) (_2!8751 lt!291291))))))

(declare-fun d!64759 () Bool)

(assert (=> d!64759 e!129837))

(declare-fun res!156455 () Bool)

(assert (=> d!64759 (=> (not res!156455) (not e!129837))))

(assert (=> d!64759 (= res!156455 (invariant!0 (currentBit!9064 (_2!8751 lt!291251)) (currentByte!9069 (_2!8751 lt!291251)) (size!4341 (buf!4809 (_2!8751 lt!291251)))))))

(assert (=> d!64759 (= lt!291251 e!129832)))

(assert (=> d!64759 (= c!9579 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!64759 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!64759 (= (appendBitsLSBFirstLoopTR!0 (_2!8751 lt!290519) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!291251)))

(declare-fun b!187838 () Bool)

(assert (=> b!187838 (= lt!291288 (readBitPure!0 (readerFrom!0 (_2!8751 lt!291270) (currentBit!9064 (_2!8751 lt!290519)) (currentByte!9069 (_2!8751 lt!290519)))))))

(declare-fun res!156458 () Bool)

(assert (=> b!187838 (= res!156458 (and (= (_2!8752 lt!291288) lt!291267) (= (_1!8752 lt!291288) (_2!8751 lt!291270))))))

(assert (=> b!187838 (=> (not res!156458) (not e!129830))))

(assert (=> b!187838 (= e!129831 e!129830)))

(declare-fun b!187839 () Bool)

(assert (=> b!187839 (= e!129833 (= (_2!8752 lt!291238) (_2!8752 lt!291273)))))

(declare-fun b!187840 () Bool)

(assert (=> b!187840 (= e!129835 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!187841 () Bool)

(assert (=> b!187841 (= e!129837 e!129834)))

(declare-fun res!156450 () Bool)

(assert (=> b!187841 (=> (not res!156450) (not e!129834))))

(assert (=> b!187841 (= res!156450 (= (_2!8754 lt!291274) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!187841 (= lt!291274 (readNBitsLSBFirstsLoopPure!0 (_1!8753 lt!291259) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!291282 () Unit!13403)

(declare-fun lt!291268 () Unit!13403)

(assert (=> b!187841 (= lt!291282 lt!291268)))

(assert (=> b!187841 (validate_offset_bits!1 ((_ sign_extend 32) (size!4341 (buf!4809 (_2!8751 lt!291251)))) ((_ sign_extend 32) (currentByte!9069 (_2!8751 lt!290519))) ((_ sign_extend 32) (currentBit!9064 (_2!8751 lt!290519))) lt!291289)))

(assert (=> b!187841 (= lt!291268 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8751 lt!290519) (buf!4809 (_2!8751 lt!291251)) lt!291289))))

(assert (=> b!187841 e!129836))

(declare-fun res!156459 () Bool)

(assert (=> b!187841 (=> (not res!156459) (not e!129836))))

(assert (=> b!187841 (= res!156459 (and (= (size!4341 (buf!4809 (_2!8751 lt!290519))) (size!4341 (buf!4809 (_2!8751 lt!291251)))) (bvsge lt!291289 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187841 (= lt!291289 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!187841 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!187841 (= lt!291259 (reader!0 (_2!8751 lt!290519) (_2!8751 lt!291251)))))

(declare-fun b!187842 () Bool)

(declare-fun res!156457 () Bool)

(assert (=> b!187842 (= res!156457 (= (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!291270))) (currentByte!9069 (_2!8751 lt!291270)) (currentBit!9064 (_2!8751 lt!291270))) (bvadd (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!290519))) (currentByte!9069 (_2!8751 lt!290519)) (currentBit!9064 (_2!8751 lt!290519))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!187842 (=> (not res!156457) (not e!129831))))

(declare-fun b!187843 () Bool)

(assert (=> b!187843 (= e!129835 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!187844 () Bool)

(declare-fun res!156454 () Bool)

(assert (=> b!187844 (=> (not res!156454) (not e!129837))))

(assert (=> b!187844 (= res!156454 (= (size!4341 (buf!4809 (_2!8751 lt!290519))) (size!4341 (buf!4809 (_2!8751 lt!291251)))))))

(assert (= (and d!64759 c!9579) b!187829))

(assert (= (and d!64759 (not c!9579)) b!187832))

(assert (= (and b!187832 res!156452) b!187842))

(assert (= (and b!187842 res!156457) b!187830))

(assert (= (and b!187830 res!156460) b!187838))

(assert (= (and b!187838 res!156458) b!187833))

(assert (= (and b!187832 res!156456) b!187839))

(assert (= (and b!187832 c!9578) b!187840))

(assert (= (and b!187832 (not c!9578)) b!187843))

(assert (= (and b!187832 res!156451) b!187836))

(assert (= (or b!187829 b!187832) bm!3014))

(assert (= (and d!64759 res!156455) b!187844))

(assert (= (and b!187844 res!156454) b!187834))

(assert (= (and b!187834 res!156461) b!187837))

(assert (= (and b!187837 res!156453) b!187841))

(assert (= (and b!187841 res!156459) b!187835))

(assert (= (and b!187841 res!156450) b!187831))

(declare-fun m!292089 () Bool)

(assert (=> b!187842 m!292089))

(assert (=> b!187842 m!291625))

(declare-fun m!292091 () Bool)

(assert (=> b!187837 m!292091))

(declare-fun m!292093 () Bool)

(assert (=> b!187833 m!292093))

(assert (=> b!187833 m!292089))

(declare-fun m!292095 () Bool)

(assert (=> b!187838 m!292095))

(assert (=> b!187838 m!292095))

(declare-fun m!292097 () Bool)

(assert (=> b!187838 m!292097))

(declare-fun m!292099 () Bool)

(assert (=> bm!3014 m!292099))

(declare-fun m!292101 () Bool)

(assert (=> b!187834 m!292101))

(assert (=> b!187834 m!291625))

(declare-fun m!292103 () Bool)

(assert (=> b!187841 m!292103))

(declare-fun m!292105 () Bool)

(assert (=> b!187841 m!292105))

(declare-fun m!292107 () Bool)

(assert (=> b!187841 m!292107))

(declare-fun m!292109 () Bool)

(assert (=> b!187841 m!292109))

(declare-fun m!292111 () Bool)

(assert (=> b!187841 m!292111))

(declare-fun m!292113 () Bool)

(assert (=> b!187841 m!292113))

(declare-fun m!292115 () Bool)

(assert (=> d!64759 m!292115))

(declare-fun m!292117 () Bool)

(assert (=> b!187829 m!292117))

(declare-fun m!292119 () Bool)

(assert (=> b!187832 m!292119))

(declare-fun m!292121 () Bool)

(assert (=> b!187832 m!292121))

(assert (=> b!187832 m!292105))

(declare-fun m!292123 () Bool)

(assert (=> b!187832 m!292123))

(declare-fun m!292125 () Bool)

(assert (=> b!187832 m!292125))

(declare-fun m!292127 () Bool)

(assert (=> b!187832 m!292127))

(declare-fun m!292129 () Bool)

(assert (=> b!187832 m!292129))

(declare-fun m!292131 () Bool)

(assert (=> b!187832 m!292131))

(declare-fun m!292133 () Bool)

(assert (=> b!187832 m!292133))

(declare-fun m!292135 () Bool)

(assert (=> b!187832 m!292135))

(declare-fun m!292137 () Bool)

(assert (=> b!187832 m!292137))

(declare-fun m!292139 () Bool)

(assert (=> b!187832 m!292139))

(declare-fun m!292141 () Bool)

(assert (=> b!187832 m!292141))

(declare-fun m!292143 () Bool)

(assert (=> b!187832 m!292143))

(declare-fun m!292145 () Bool)

(assert (=> b!187832 m!292145))

(declare-fun m!292147 () Bool)

(assert (=> b!187832 m!292147))

(declare-fun m!292149 () Bool)

(assert (=> b!187832 m!292149))

(declare-fun m!292151 () Bool)

(assert (=> b!187832 m!292151))

(declare-fun m!292153 () Bool)

(assert (=> b!187832 m!292153))

(assert (=> b!187832 m!292129))

(declare-fun m!292155 () Bool)

(assert (=> b!187832 m!292155))

(declare-fun m!292157 () Bool)

(assert (=> b!187832 m!292157))

(assert (=> b!187832 m!291625))

(declare-fun m!292159 () Bool)

(assert (=> b!187832 m!292159))

(declare-fun m!292161 () Bool)

(assert (=> b!187832 m!292161))

(assert (=> b!187832 m!292111))

(declare-fun m!292163 () Bool)

(assert (=> b!187832 m!292163))

(declare-fun m!292165 () Bool)

(assert (=> b!187832 m!292165))

(declare-fun m!292167 () Bool)

(assert (=> b!187832 m!292167))

(declare-fun m!292169 () Bool)

(assert (=> b!187832 m!292169))

(declare-fun m!292171 () Bool)

(assert (=> b!187832 m!292171))

(declare-fun m!292173 () Bool)

(assert (=> b!187832 m!292173))

(declare-fun m!292175 () Bool)

(assert (=> b!187832 m!292175))

(declare-fun m!292177 () Bool)

(assert (=> b!187832 m!292177))

(declare-fun m!292179 () Bool)

(assert (=> b!187830 m!292179))

(declare-fun m!292181 () Bool)

(assert (=> b!187835 m!292181))

(assert (=> b!187573 d!64759))

(declare-fun d!64827 () Bool)

(assert (=> d!64827 (= (invariant!0 (currentBit!9064 thiss!1204) (currentByte!9069 thiss!1204) (size!4341 (buf!4809 (_2!8751 lt!290522)))) (and (bvsge (currentBit!9064 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9064 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9069 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9069 thiss!1204) (size!4341 (buf!4809 (_2!8751 lt!290522)))) (and (= (currentBit!9064 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9069 thiss!1204) (size!4341 (buf!4809 (_2!8751 lt!290522))))))))))

(assert (=> b!187562 d!64827))

(declare-fun d!64829 () Bool)

(assert (=> d!64829 (= (invariant!0 (currentBit!9064 (_1!8754 lt!290508)) (currentByte!9069 (_1!8754 lt!290508)) (size!4341 (buf!4809 (_1!8754 lt!290508)))) (and (bvsge (currentBit!9064 (_1!8754 lt!290508)) #b00000000000000000000000000000000) (bvslt (currentBit!9064 (_1!8754 lt!290508)) #b00000000000000000000000000001000) (bvsge (currentByte!9069 (_1!8754 lt!290508)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9069 (_1!8754 lt!290508)) (size!4341 (buf!4809 (_1!8754 lt!290508)))) (and (= (currentBit!9064 (_1!8754 lt!290508)) #b00000000000000000000000000000000) (= (currentByte!9069 (_1!8754 lt!290508)) (size!4341 (buf!4809 (_1!8754 lt!290508))))))))))

(assert (=> b!187572 d!64829))

(declare-fun d!64831 () Bool)

(declare-fun e!129838 () Bool)

(assert (=> d!64831 e!129838))

(declare-fun res!156462 () Bool)

(assert (=> d!64831 (=> (not res!156462) (not e!129838))))

(declare-fun lt!291294 () (_ BitVec 64))

(declare-fun lt!291293 () BitStream!7790)

(assert (=> d!64831 (= res!156462 (= (bvadd lt!291294 (bvsub lt!290507 lt!290528)) (bitIndex!0 (size!4341 (buf!4809 lt!291293)) (currentByte!9069 lt!291293) (currentBit!9064 lt!291293))))))

(assert (=> d!64831 (or (not (= (bvand lt!291294 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!290507 lt!290528) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!291294 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!291294 (bvsub lt!290507 lt!290528)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64831 (= lt!291294 (bitIndex!0 (size!4341 (buf!4809 (_2!8753 lt!290526))) (currentByte!9069 (_2!8753 lt!290526)) (currentBit!9064 (_2!8753 lt!290526))))))

(assert (=> d!64831 (= lt!291293 (_2!8751 (moveBitIndex!0 (_2!8753 lt!290526) (bvsub lt!290507 lt!290528))))))

(assert (=> d!64831 (moveBitIndexPrecond!0 (_2!8753 lt!290526) (bvsub lt!290507 lt!290528))))

(assert (=> d!64831 (= (withMovedBitIndex!0 (_2!8753 lt!290526) (bvsub lt!290507 lt!290528)) lt!291293)))

(declare-fun b!187845 () Bool)

(assert (=> b!187845 (= e!129838 (= (size!4341 (buf!4809 (_2!8753 lt!290526))) (size!4341 (buf!4809 lt!291293))))))

(assert (= (and d!64831 res!156462) b!187845))

(declare-fun m!292183 () Bool)

(assert (=> d!64831 m!292183))

(declare-fun m!292185 () Bool)

(assert (=> d!64831 m!292185))

(declare-fun m!292187 () Bool)

(assert (=> d!64831 m!292187))

(declare-fun m!292189 () Bool)

(assert (=> d!64831 m!292189))

(assert (=> b!187561 d!64831))

(declare-fun d!64833 () Bool)

(declare-datatypes ((tuple2!16228 0))(
  ( (tuple2!16229 (_1!8759 Bool) (_2!8759 BitStream!7790)) )
))
(declare-fun lt!291297 () tuple2!16228)

(declare-fun readBit!0 (BitStream!7790) tuple2!16228)

(assert (=> d!64833 (= lt!291297 (readBit!0 (readerFrom!0 (_2!8751 lt!290519) (currentBit!9064 thiss!1204) (currentByte!9069 thiss!1204))))))

(assert (=> d!64833 (= (readBitPure!0 (readerFrom!0 (_2!8751 lt!290519) (currentBit!9064 thiss!1204) (currentByte!9069 thiss!1204))) (tuple2!16215 (_2!8759 lt!291297) (_1!8759 lt!291297)))))

(declare-fun bs!16113 () Bool)

(assert (= bs!16113 d!64833))

(assert (=> bs!16113 m!291659))

(declare-fun m!292191 () Bool)

(assert (=> bs!16113 m!292191))

(assert (=> b!187560 d!64833))

(declare-fun d!64835 () Bool)

(declare-fun e!129841 () Bool)

(assert (=> d!64835 e!129841))

(declare-fun res!156466 () Bool)

(assert (=> d!64835 (=> (not res!156466) (not e!129841))))

(assert (=> d!64835 (= res!156466 (invariant!0 (currentBit!9064 (_2!8751 lt!290519)) (currentByte!9069 (_2!8751 lt!290519)) (size!4341 (buf!4809 (_2!8751 lt!290519)))))))

(assert (=> d!64835 (= (readerFrom!0 (_2!8751 lt!290519) (currentBit!9064 thiss!1204) (currentByte!9069 thiss!1204)) (BitStream!7791 (buf!4809 (_2!8751 lt!290519)) (currentByte!9069 thiss!1204) (currentBit!9064 thiss!1204)))))

(declare-fun b!187848 () Bool)

(assert (=> b!187848 (= e!129841 (invariant!0 (currentBit!9064 thiss!1204) (currentByte!9069 thiss!1204) (size!4341 (buf!4809 (_2!8751 lt!290519)))))))

(assert (= (and d!64835 res!156466) b!187848))

(declare-fun m!292193 () Bool)

(assert (=> d!64835 m!292193))

(assert (=> b!187848 m!291589))

(assert (=> b!187560 d!64835))

(declare-fun d!64837 () Bool)

(assert (=> d!64837 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4341 (buf!4809 thiss!1204))) ((_ sign_extend 32) (currentByte!9069 thiss!1204)) ((_ sign_extend 32) (currentBit!9064 thiss!1204)) lt!290533) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4341 (buf!4809 thiss!1204))) ((_ sign_extend 32) (currentByte!9069 thiss!1204)) ((_ sign_extend 32) (currentBit!9064 thiss!1204))) lt!290533))))

(declare-fun bs!16114 () Bool)

(assert (= bs!16114 d!64837))

(declare-fun m!292195 () Bool)

(assert (=> bs!16114 m!292195))

(assert (=> b!187569 d!64837))

(declare-fun d!64839 () Bool)

(declare-fun e!129842 () Bool)

(assert (=> d!64839 e!129842))

(declare-fun res!156468 () Bool)

(assert (=> d!64839 (=> (not res!156468) (not e!129842))))

(declare-fun lt!291303 () (_ BitVec 64))

(declare-fun lt!291302 () (_ BitVec 64))

(declare-fun lt!291301 () (_ BitVec 64))

(assert (=> d!64839 (= res!156468 (= lt!291302 (bvsub lt!291301 lt!291303)))))

(assert (=> d!64839 (or (= (bvand lt!291301 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!291303 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!291301 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!291301 lt!291303) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64839 (= lt!291303 (remainingBits!0 ((_ sign_extend 32) (size!4341 (buf!4809 (_1!8752 lt!290527)))) ((_ sign_extend 32) (currentByte!9069 (_1!8752 lt!290527))) ((_ sign_extend 32) (currentBit!9064 (_1!8752 lt!290527)))))))

(declare-fun lt!291298 () (_ BitVec 64))

(declare-fun lt!291299 () (_ BitVec 64))

(assert (=> d!64839 (= lt!291301 (bvmul lt!291298 lt!291299))))

(assert (=> d!64839 (or (= lt!291298 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!291299 (bvsdiv (bvmul lt!291298 lt!291299) lt!291298)))))

(assert (=> d!64839 (= lt!291299 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64839 (= lt!291298 ((_ sign_extend 32) (size!4341 (buf!4809 (_1!8752 lt!290527)))))))

(assert (=> d!64839 (= lt!291302 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9069 (_1!8752 lt!290527))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9064 (_1!8752 lt!290527)))))))

(assert (=> d!64839 (invariant!0 (currentBit!9064 (_1!8752 lt!290527)) (currentByte!9069 (_1!8752 lt!290527)) (size!4341 (buf!4809 (_1!8752 lt!290527))))))

(assert (=> d!64839 (= (bitIndex!0 (size!4341 (buf!4809 (_1!8752 lt!290527))) (currentByte!9069 (_1!8752 lt!290527)) (currentBit!9064 (_1!8752 lt!290527))) lt!291302)))

(declare-fun b!187849 () Bool)

(declare-fun res!156467 () Bool)

(assert (=> b!187849 (=> (not res!156467) (not e!129842))))

(assert (=> b!187849 (= res!156467 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!291302))))

(declare-fun b!187850 () Bool)

(declare-fun lt!291300 () (_ BitVec 64))

(assert (=> b!187850 (= e!129842 (bvsle lt!291302 (bvmul lt!291300 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187850 (or (= lt!291300 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!291300 #b0000000000000000000000000000000000000000000000000000000000001000) lt!291300)))))

(assert (=> b!187850 (= lt!291300 ((_ sign_extend 32) (size!4341 (buf!4809 (_1!8752 lt!290527)))))))

(assert (= (and d!64839 res!156468) b!187849))

(assert (= (and b!187849 res!156467) b!187850))

(declare-fun m!292197 () Bool)

(assert (=> d!64839 m!292197))

(declare-fun m!292199 () Bool)

(assert (=> d!64839 m!292199))

(assert (=> b!187558 d!64839))

(declare-fun d!64841 () Bool)

(assert (=> d!64841 (= (invariant!0 (currentBit!9064 thiss!1204) (currentByte!9069 thiss!1204) (size!4341 (buf!4809 thiss!1204))) (and (bvsge (currentBit!9064 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9064 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9069 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9069 thiss!1204) (size!4341 (buf!4809 thiss!1204))) (and (= (currentBit!9064 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9069 thiss!1204) (size!4341 (buf!4809 thiss!1204)))))))))

(assert (=> b!187568 d!64841))

(declare-fun d!64843 () Bool)

(assert (=> d!64843 (= (invariant!0 (currentBit!9064 (_2!8751 lt!290522)) (currentByte!9069 (_2!8751 lt!290522)) (size!4341 (buf!4809 (_2!8751 lt!290522)))) (and (bvsge (currentBit!9064 (_2!8751 lt!290522)) #b00000000000000000000000000000000) (bvslt (currentBit!9064 (_2!8751 lt!290522)) #b00000000000000000000000000001000) (bvsge (currentByte!9069 (_2!8751 lt!290522)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9069 (_2!8751 lt!290522)) (size!4341 (buf!4809 (_2!8751 lt!290522)))) (and (= (currentBit!9064 (_2!8751 lt!290522)) #b00000000000000000000000000000000) (= (currentByte!9069 (_2!8751 lt!290522)) (size!4341 (buf!4809 (_2!8751 lt!290522))))))))))

(assert (=> b!187557 d!64843))

(declare-fun d!64845 () Bool)

(declare-fun lt!291304 () tuple2!16228)

(assert (=> d!64845 (= lt!291304 (readBit!0 lt!290523))))

(assert (=> d!64845 (= (readBitPure!0 lt!290523) (tuple2!16215 (_2!8759 lt!291304) (_1!8759 lt!291304)))))

(declare-fun bs!16115 () Bool)

(assert (= bs!16115 d!64845))

(declare-fun m!292201 () Bool)

(assert (=> bs!16115 m!292201))

(assert (=> b!187567 d!64845))

(declare-fun d!64847 () Bool)

(assert (=> d!64847 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4341 (buf!4809 (_2!8751 lt!290522)))) ((_ sign_extend 32) (currentByte!9069 (_2!8751 lt!290519))) ((_ sign_extend 32) (currentBit!9064 (_2!8751 lt!290519))) lt!290530) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4341 (buf!4809 (_2!8751 lt!290522)))) ((_ sign_extend 32) (currentByte!9069 (_2!8751 lt!290519))) ((_ sign_extend 32) (currentBit!9064 (_2!8751 lt!290519)))) lt!290530))))

(declare-fun bs!16116 () Bool)

(assert (= bs!16116 d!64847))

(declare-fun m!292203 () Bool)

(assert (=> bs!16116 m!292203))

(assert (=> b!187567 d!64847))

(declare-fun d!64849 () Bool)

(assert (=> d!64849 (validate_offset_bits!1 ((_ sign_extend 32) (size!4341 (buf!4809 (_2!8751 lt!290522)))) ((_ sign_extend 32) (currentByte!9069 (_2!8751 lt!290519))) ((_ sign_extend 32) (currentBit!9064 (_2!8751 lt!290519))) lt!290530)))

(declare-fun lt!291307 () Unit!13403)

(declare-fun choose!9 (BitStream!7790 array!9846 (_ BitVec 64) BitStream!7790) Unit!13403)

(assert (=> d!64849 (= lt!291307 (choose!9 (_2!8751 lt!290519) (buf!4809 (_2!8751 lt!290522)) lt!290530 (BitStream!7791 (buf!4809 (_2!8751 lt!290522)) (currentByte!9069 (_2!8751 lt!290519)) (currentBit!9064 (_2!8751 lt!290519)))))))

(assert (=> d!64849 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8751 lt!290519) (buf!4809 (_2!8751 lt!290522)) lt!290530) lt!291307)))

(declare-fun bs!16117 () Bool)

(assert (= bs!16117 d!64849))

(assert (=> bs!16117 m!291603))

(declare-fun m!292205 () Bool)

(assert (=> bs!16117 m!292205))

(assert (=> b!187567 d!64849))

(declare-fun d!64851 () Bool)

(assert (=> d!64851 (= (invariant!0 (currentBit!9064 thiss!1204) (currentByte!9069 thiss!1204) (size!4341 (buf!4809 (_2!8751 lt!290519)))) (and (bvsge (currentBit!9064 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9064 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9069 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9069 thiss!1204) (size!4341 (buf!4809 (_2!8751 lt!290519)))) (and (= (currentBit!9064 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9069 thiss!1204) (size!4341 (buf!4809 (_2!8751 lt!290519))))))))))

(assert (=> b!187567 d!64851))

(declare-fun d!64853 () Bool)

(declare-datatypes ((tuple2!16230 0))(
  ( (tuple2!16231 (_1!8760 (_ BitVec 64)) (_2!8760 BitStream!7790)) )
))
(declare-fun lt!291310 () tuple2!16230)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7790 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16230)

(assert (=> d!64853 (= lt!291310 (readNBitsLSBFirstsLoop!0 (_1!8753 lt!290510) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!290514))))

(assert (=> d!64853 (= (readNBitsLSBFirstsLoopPure!0 (_1!8753 lt!290510) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!290514) (tuple2!16219 (_2!8760 lt!291310) (_1!8760 lt!291310)))))

(declare-fun bs!16118 () Bool)

(assert (= bs!16118 d!64853))

(declare-fun m!292207 () Bool)

(assert (=> bs!16118 m!292207))

(assert (=> b!187567 d!64853))

(declare-fun d!64855 () Bool)

(declare-fun e!129843 () Bool)

(assert (=> d!64855 e!129843))

(declare-fun res!156470 () Bool)

(assert (=> d!64855 (=> (not res!156470) (not e!129843))))

(declare-fun lt!291315 () (_ BitVec 64))

(declare-fun lt!291316 () (_ BitVec 64))

(declare-fun lt!291314 () (_ BitVec 64))

(assert (=> d!64855 (= res!156470 (= lt!291315 (bvsub lt!291314 lt!291316)))))

(assert (=> d!64855 (or (= (bvand lt!291314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!291316 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!291314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!291314 lt!291316) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64855 (= lt!291316 (remainingBits!0 ((_ sign_extend 32) (size!4341 (buf!4809 (_1!8752 lt!290516)))) ((_ sign_extend 32) (currentByte!9069 (_1!8752 lt!290516))) ((_ sign_extend 32) (currentBit!9064 (_1!8752 lt!290516)))))))

(declare-fun lt!291311 () (_ BitVec 64))

(declare-fun lt!291312 () (_ BitVec 64))

(assert (=> d!64855 (= lt!291314 (bvmul lt!291311 lt!291312))))

(assert (=> d!64855 (or (= lt!291311 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!291312 (bvsdiv (bvmul lt!291311 lt!291312) lt!291311)))))

(assert (=> d!64855 (= lt!291312 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64855 (= lt!291311 ((_ sign_extend 32) (size!4341 (buf!4809 (_1!8752 lt!290516)))))))

(assert (=> d!64855 (= lt!291315 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9069 (_1!8752 lt!290516))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9064 (_1!8752 lt!290516)))))))

(assert (=> d!64855 (invariant!0 (currentBit!9064 (_1!8752 lt!290516)) (currentByte!9069 (_1!8752 lt!290516)) (size!4341 (buf!4809 (_1!8752 lt!290516))))))

(assert (=> d!64855 (= (bitIndex!0 (size!4341 (buf!4809 (_1!8752 lt!290516))) (currentByte!9069 (_1!8752 lt!290516)) (currentBit!9064 (_1!8752 lt!290516))) lt!291315)))

(declare-fun b!187851 () Bool)

(declare-fun res!156469 () Bool)

(assert (=> b!187851 (=> (not res!156469) (not e!129843))))

(assert (=> b!187851 (= res!156469 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!291315))))

(declare-fun b!187852 () Bool)

(declare-fun lt!291313 () (_ BitVec 64))

(assert (=> b!187852 (= e!129843 (bvsle lt!291315 (bvmul lt!291313 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187852 (or (= lt!291313 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!291313 #b0000000000000000000000000000000000000000000000000000000000001000) lt!291313)))))

(assert (=> b!187852 (= lt!291313 ((_ sign_extend 32) (size!4341 (buf!4809 (_1!8752 lt!290516)))))))

(assert (= (and d!64855 res!156470) b!187851))

(assert (= (and b!187851 res!156469) b!187852))

(declare-fun m!292209 () Bool)

(assert (=> d!64855 m!292209))

(declare-fun m!292211 () Bool)

(assert (=> d!64855 m!292211))

(assert (=> b!187567 d!64855))

(declare-fun d!64857 () Bool)

(assert (=> d!64857 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4341 (buf!4809 (_2!8751 lt!290522)))) ((_ sign_extend 32) (currentByte!9069 thiss!1204)) ((_ sign_extend 32) (currentBit!9064 thiss!1204)) lt!290533) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4341 (buf!4809 (_2!8751 lt!290522)))) ((_ sign_extend 32) (currentByte!9069 thiss!1204)) ((_ sign_extend 32) (currentBit!9064 thiss!1204))) lt!290533))))

(declare-fun bs!16119 () Bool)

(assert (= bs!16119 d!64857))

(declare-fun m!292213 () Bool)

(assert (=> bs!16119 m!292213))

(assert (=> b!187567 d!64857))

(declare-fun b!187881 () Bool)

(declare-fun e!129859 () Unit!13403)

(declare-fun lt!291445 () Unit!13403)

(assert (=> b!187881 (= e!129859 lt!291445)))

(declare-fun lt!291444 () (_ BitVec 64))

(assert (=> b!187881 (= lt!291444 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!291439 () (_ BitVec 64))

(assert (=> b!187881 (= lt!291439 (bitIndex!0 (size!4341 (buf!4809 thiss!1204)) (currentByte!9069 thiss!1204) (currentBit!9064 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9846 array!9846 (_ BitVec 64) (_ BitVec 64)) Unit!13403)

(assert (=> b!187881 (= lt!291445 (arrayBitRangesEqSymmetric!0 (buf!4809 thiss!1204) (buf!4809 (_2!8751 lt!290522)) lt!291444 lt!291439))))

(assert (=> b!187881 (arrayBitRangesEq!0 (buf!4809 (_2!8751 lt!290522)) (buf!4809 thiss!1204) lt!291444 lt!291439)))

(declare-fun b!187882 () Bool)

(declare-fun res!156488 () Bool)

(declare-fun e!129858 () Bool)

(assert (=> b!187882 (=> (not res!156488) (not e!129858))))

(declare-fun lt!291436 () tuple2!16216)

(assert (=> b!187882 (= res!156488 (isPrefixOf!0 (_1!8753 lt!291436) thiss!1204))))

(declare-fun lt!291447 () (_ BitVec 64))

(declare-fun lt!291448 () (_ BitVec 64))

(declare-fun b!187883 () Bool)

(assert (=> b!187883 (= e!129858 (= (_1!8753 lt!291436) (withMovedBitIndex!0 (_2!8753 lt!291436) (bvsub lt!291447 lt!291448))))))

(assert (=> b!187883 (or (= (bvand lt!291447 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!291448 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!291447 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!291447 lt!291448) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187883 (= lt!291448 (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!290522))) (currentByte!9069 (_2!8751 lt!290522)) (currentBit!9064 (_2!8751 lt!290522))))))

(assert (=> b!187883 (= lt!291447 (bitIndex!0 (size!4341 (buf!4809 thiss!1204)) (currentByte!9069 thiss!1204) (currentBit!9064 thiss!1204)))))

(declare-fun b!187884 () Bool)

(declare-fun res!156489 () Bool)

(assert (=> b!187884 (=> (not res!156489) (not e!129858))))

(assert (=> b!187884 (= res!156489 (isPrefixOf!0 (_2!8753 lt!291436) (_2!8751 lt!290522)))))

(declare-fun b!187885 () Bool)

(declare-fun Unit!13442 () Unit!13403)

(assert (=> b!187885 (= e!129859 Unit!13442)))

(declare-fun d!64859 () Bool)

(assert (=> d!64859 e!129858))

(declare-fun res!156487 () Bool)

(assert (=> d!64859 (=> (not res!156487) (not e!129858))))

(assert (=> d!64859 (= res!156487 (isPrefixOf!0 (_1!8753 lt!291436) (_2!8753 lt!291436)))))

(declare-fun lt!291440 () BitStream!7790)

(assert (=> d!64859 (= lt!291436 (tuple2!16217 lt!291440 (_2!8751 lt!290522)))))

(declare-fun lt!291430 () Unit!13403)

(declare-fun lt!291429 () Unit!13403)

(assert (=> d!64859 (= lt!291430 lt!291429)))

(assert (=> d!64859 (isPrefixOf!0 lt!291440 (_2!8751 lt!290522))))

(assert (=> d!64859 (= lt!291429 (lemmaIsPrefixTransitive!0 lt!291440 (_2!8751 lt!290522) (_2!8751 lt!290522)))))

(declare-fun lt!291442 () Unit!13403)

(declare-fun lt!291435 () Unit!13403)

(assert (=> d!64859 (= lt!291442 lt!291435)))

(assert (=> d!64859 (isPrefixOf!0 lt!291440 (_2!8751 lt!290522))))

(assert (=> d!64859 (= lt!291435 (lemmaIsPrefixTransitive!0 lt!291440 thiss!1204 (_2!8751 lt!290522)))))

(declare-fun lt!291438 () Unit!13403)

(assert (=> d!64859 (= lt!291438 e!129859)))

(declare-fun c!9586 () Bool)

(assert (=> d!64859 (= c!9586 (not (= (size!4341 (buf!4809 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!291431 () Unit!13403)

(declare-fun lt!291437 () Unit!13403)

(assert (=> d!64859 (= lt!291431 lt!291437)))

(assert (=> d!64859 (isPrefixOf!0 (_2!8751 lt!290522) (_2!8751 lt!290522))))

(assert (=> d!64859 (= lt!291437 (lemmaIsPrefixRefl!0 (_2!8751 lt!290522)))))

(declare-fun lt!291446 () Unit!13403)

(declare-fun lt!291432 () Unit!13403)

(assert (=> d!64859 (= lt!291446 lt!291432)))

(assert (=> d!64859 (= lt!291432 (lemmaIsPrefixRefl!0 (_2!8751 lt!290522)))))

(declare-fun lt!291433 () Unit!13403)

(declare-fun lt!291443 () Unit!13403)

(assert (=> d!64859 (= lt!291433 lt!291443)))

(assert (=> d!64859 (isPrefixOf!0 lt!291440 lt!291440)))

(assert (=> d!64859 (= lt!291443 (lemmaIsPrefixRefl!0 lt!291440))))

(declare-fun lt!291434 () Unit!13403)

(declare-fun lt!291441 () Unit!13403)

(assert (=> d!64859 (= lt!291434 lt!291441)))

(assert (=> d!64859 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!64859 (= lt!291441 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!64859 (= lt!291440 (BitStream!7791 (buf!4809 (_2!8751 lt!290522)) (currentByte!9069 thiss!1204) (currentBit!9064 thiss!1204)))))

(assert (=> d!64859 (isPrefixOf!0 thiss!1204 (_2!8751 lt!290522))))

(assert (=> d!64859 (= (reader!0 thiss!1204 (_2!8751 lt!290522)) lt!291436)))

(assert (= (and d!64859 c!9586) b!187881))

(assert (= (and d!64859 (not c!9586)) b!187885))

(assert (= (and d!64859 res!156487) b!187882))

(assert (= (and b!187882 res!156488) b!187884))

(assert (= (and b!187884 res!156489) b!187883))

(assert (=> b!187881 m!291627))

(declare-fun m!292215 () Bool)

(assert (=> b!187881 m!292215))

(declare-fun m!292217 () Bool)

(assert (=> b!187881 m!292217))

(declare-fun m!292219 () Bool)

(assert (=> b!187883 m!292219))

(assert (=> b!187883 m!291651))

(assert (=> b!187883 m!291627))

(declare-fun m!292221 () Bool)

(assert (=> b!187884 m!292221))

(declare-fun m!292223 () Bool)

(assert (=> b!187882 m!292223))

(assert (=> d!64859 m!291653))

(declare-fun m!292225 () Bool)

(assert (=> d!64859 m!292225))

(declare-fun m!292227 () Bool)

(assert (=> d!64859 m!292227))

(declare-fun m!292229 () Bool)

(assert (=> d!64859 m!292229))

(declare-fun m!292231 () Bool)

(assert (=> d!64859 m!292231))

(declare-fun m!292233 () Bool)

(assert (=> d!64859 m!292233))

(declare-fun m!292235 () Bool)

(assert (=> d!64859 m!292235))

(declare-fun m!292237 () Bool)

(assert (=> d!64859 m!292237))

(declare-fun m!292239 () Bool)

(assert (=> d!64859 m!292239))

(declare-fun m!292241 () Bool)

(assert (=> d!64859 m!292241))

(declare-fun m!292243 () Bool)

(assert (=> d!64859 m!292243))

(assert (=> b!187567 d!64859))

(declare-fun d!64861 () Bool)

(declare-fun lt!291471 () tuple2!16228)

(assert (=> d!64861 (= lt!291471 (readBit!0 (BitStream!7791 (buf!4809 (_2!8751 lt!290522)) (currentByte!9069 thiss!1204) (currentBit!9064 thiss!1204))))))

(assert (=> d!64861 (= (readBitPure!0 (BitStream!7791 (buf!4809 (_2!8751 lt!290522)) (currentByte!9069 thiss!1204) (currentBit!9064 thiss!1204))) (tuple2!16215 (_2!8759 lt!291471) (_1!8759 lt!291471)))))

(declare-fun bs!16120 () Bool)

(assert (= bs!16120 d!64861))

(declare-fun m!292245 () Bool)

(assert (=> bs!16120 m!292245))

(assert (=> b!187567 d!64861))

(declare-fun d!64863 () Bool)

(declare-fun e!129870 () Bool)

(assert (=> d!64863 e!129870))

(declare-fun res!156506 () Bool)

(assert (=> d!64863 (=> (not res!156506) (not e!129870))))

(declare-fun lt!291498 () tuple2!16214)

(declare-fun lt!291499 () tuple2!16214)

(assert (=> d!64863 (= res!156506 (= (bitIndex!0 (size!4341 (buf!4809 (_1!8752 lt!291498))) (currentByte!9069 (_1!8752 lt!291498)) (currentBit!9064 (_1!8752 lt!291498))) (bitIndex!0 (size!4341 (buf!4809 (_1!8752 lt!291499))) (currentByte!9069 (_1!8752 lt!291499)) (currentBit!9064 (_1!8752 lt!291499)))))))

(declare-fun lt!291501 () Unit!13403)

(declare-fun lt!291500 () BitStream!7790)

(declare-fun choose!50 (BitStream!7790 BitStream!7790 BitStream!7790 tuple2!16214 tuple2!16214 BitStream!7790 Bool tuple2!16214 tuple2!16214 BitStream!7790 Bool) Unit!13403)

(assert (=> d!64863 (= lt!291501 (choose!50 lt!290523 (_2!8751 lt!290522) lt!291500 lt!291498 (tuple2!16215 (_1!8752 lt!291498) (_2!8752 lt!291498)) (_1!8752 lt!291498) (_2!8752 lt!291498) lt!291499 (tuple2!16215 (_1!8752 lt!291499) (_2!8752 lt!291499)) (_1!8752 lt!291499) (_2!8752 lt!291499)))))

(assert (=> d!64863 (= lt!291499 (readBitPure!0 lt!291500))))

(assert (=> d!64863 (= lt!291498 (readBitPure!0 lt!290523))))

(assert (=> d!64863 (= lt!291500 (BitStream!7791 (buf!4809 (_2!8751 lt!290522)) (currentByte!9069 lt!290523) (currentBit!9064 lt!290523)))))

(assert (=> d!64863 (invariant!0 (currentBit!9064 lt!290523) (currentByte!9069 lt!290523) (size!4341 (buf!4809 (_2!8751 lt!290522))))))

(assert (=> d!64863 (= (readBitPrefixLemma!0 lt!290523 (_2!8751 lt!290522)) lt!291501)))

(declare-fun b!187902 () Bool)

(assert (=> b!187902 (= e!129870 (= (_2!8752 lt!291498) (_2!8752 lt!291499)))))

(assert (= (and d!64863 res!156506) b!187902))

(declare-fun m!292247 () Bool)

(assert (=> d!64863 m!292247))

(declare-fun m!292249 () Bool)

(assert (=> d!64863 m!292249))

(assert (=> d!64863 m!291617))

(declare-fun m!292251 () Bool)

(assert (=> d!64863 m!292251))

(declare-fun m!292253 () Bool)

(assert (=> d!64863 m!292253))

(declare-fun m!292255 () Bool)

(assert (=> d!64863 m!292255))

(assert (=> b!187567 d!64863))

(declare-fun b!187903 () Bool)

(declare-fun e!129872 () Unit!13403)

(declare-fun lt!291518 () Unit!13403)

(assert (=> b!187903 (= e!129872 lt!291518)))

(declare-fun lt!291517 () (_ BitVec 64))

(assert (=> b!187903 (= lt!291517 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!291512 () (_ BitVec 64))

(assert (=> b!187903 (= lt!291512 (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!290519))) (currentByte!9069 (_2!8751 lt!290519)) (currentBit!9064 (_2!8751 lt!290519))))))

(assert (=> b!187903 (= lt!291518 (arrayBitRangesEqSymmetric!0 (buf!4809 (_2!8751 lt!290519)) (buf!4809 (_2!8751 lt!290522)) lt!291517 lt!291512))))

(assert (=> b!187903 (arrayBitRangesEq!0 (buf!4809 (_2!8751 lt!290522)) (buf!4809 (_2!8751 lt!290519)) lt!291517 lt!291512)))

(declare-fun b!187904 () Bool)

(declare-fun res!156508 () Bool)

(declare-fun e!129871 () Bool)

(assert (=> b!187904 (=> (not res!156508) (not e!129871))))

(declare-fun lt!291509 () tuple2!16216)

(assert (=> b!187904 (= res!156508 (isPrefixOf!0 (_1!8753 lt!291509) (_2!8751 lt!290519)))))

(declare-fun lt!291520 () (_ BitVec 64))

(declare-fun b!187905 () Bool)

(declare-fun lt!291521 () (_ BitVec 64))

(assert (=> b!187905 (= e!129871 (= (_1!8753 lt!291509) (withMovedBitIndex!0 (_2!8753 lt!291509) (bvsub lt!291520 lt!291521))))))

(assert (=> b!187905 (or (= (bvand lt!291520 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!291521 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!291520 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!291520 lt!291521) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187905 (= lt!291521 (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!290522))) (currentByte!9069 (_2!8751 lt!290522)) (currentBit!9064 (_2!8751 lt!290522))))))

(assert (=> b!187905 (= lt!291520 (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!290519))) (currentByte!9069 (_2!8751 lt!290519)) (currentBit!9064 (_2!8751 lt!290519))))))

(declare-fun b!187906 () Bool)

(declare-fun res!156509 () Bool)

(assert (=> b!187906 (=> (not res!156509) (not e!129871))))

(assert (=> b!187906 (= res!156509 (isPrefixOf!0 (_2!8753 lt!291509) (_2!8751 lt!290522)))))

(declare-fun b!187907 () Bool)

(declare-fun Unit!13443 () Unit!13403)

(assert (=> b!187907 (= e!129872 Unit!13443)))

(declare-fun d!64865 () Bool)

(assert (=> d!64865 e!129871))

(declare-fun res!156507 () Bool)

(assert (=> d!64865 (=> (not res!156507) (not e!129871))))

(assert (=> d!64865 (= res!156507 (isPrefixOf!0 (_1!8753 lt!291509) (_2!8753 lt!291509)))))

(declare-fun lt!291513 () BitStream!7790)

(assert (=> d!64865 (= lt!291509 (tuple2!16217 lt!291513 (_2!8751 lt!290522)))))

(declare-fun lt!291503 () Unit!13403)

(declare-fun lt!291502 () Unit!13403)

(assert (=> d!64865 (= lt!291503 lt!291502)))

(assert (=> d!64865 (isPrefixOf!0 lt!291513 (_2!8751 lt!290522))))

(assert (=> d!64865 (= lt!291502 (lemmaIsPrefixTransitive!0 lt!291513 (_2!8751 lt!290522) (_2!8751 lt!290522)))))

(declare-fun lt!291515 () Unit!13403)

(declare-fun lt!291508 () Unit!13403)

(assert (=> d!64865 (= lt!291515 lt!291508)))

(assert (=> d!64865 (isPrefixOf!0 lt!291513 (_2!8751 lt!290522))))

(assert (=> d!64865 (= lt!291508 (lemmaIsPrefixTransitive!0 lt!291513 (_2!8751 lt!290519) (_2!8751 lt!290522)))))

(declare-fun lt!291511 () Unit!13403)

(assert (=> d!64865 (= lt!291511 e!129872)))

(declare-fun c!9587 () Bool)

(assert (=> d!64865 (= c!9587 (not (= (size!4341 (buf!4809 (_2!8751 lt!290519))) #b00000000000000000000000000000000)))))

(declare-fun lt!291504 () Unit!13403)

(declare-fun lt!291510 () Unit!13403)

(assert (=> d!64865 (= lt!291504 lt!291510)))

(assert (=> d!64865 (isPrefixOf!0 (_2!8751 lt!290522) (_2!8751 lt!290522))))

(assert (=> d!64865 (= lt!291510 (lemmaIsPrefixRefl!0 (_2!8751 lt!290522)))))

(declare-fun lt!291519 () Unit!13403)

(declare-fun lt!291505 () Unit!13403)

(assert (=> d!64865 (= lt!291519 lt!291505)))

(assert (=> d!64865 (= lt!291505 (lemmaIsPrefixRefl!0 (_2!8751 lt!290522)))))

(declare-fun lt!291506 () Unit!13403)

(declare-fun lt!291516 () Unit!13403)

(assert (=> d!64865 (= lt!291506 lt!291516)))

(assert (=> d!64865 (isPrefixOf!0 lt!291513 lt!291513)))

(assert (=> d!64865 (= lt!291516 (lemmaIsPrefixRefl!0 lt!291513))))

(declare-fun lt!291507 () Unit!13403)

(declare-fun lt!291514 () Unit!13403)

(assert (=> d!64865 (= lt!291507 lt!291514)))

(assert (=> d!64865 (isPrefixOf!0 (_2!8751 lt!290519) (_2!8751 lt!290519))))

(assert (=> d!64865 (= lt!291514 (lemmaIsPrefixRefl!0 (_2!8751 lt!290519)))))

(assert (=> d!64865 (= lt!291513 (BitStream!7791 (buf!4809 (_2!8751 lt!290522)) (currentByte!9069 (_2!8751 lt!290519)) (currentBit!9064 (_2!8751 lt!290519))))))

(assert (=> d!64865 (isPrefixOf!0 (_2!8751 lt!290519) (_2!8751 lt!290522))))

(assert (=> d!64865 (= (reader!0 (_2!8751 lt!290519) (_2!8751 lt!290522)) lt!291509)))

(assert (= (and d!64865 c!9587) b!187903))

(assert (= (and d!64865 (not c!9587)) b!187907))

(assert (= (and d!64865 res!156507) b!187904))

(assert (= (and b!187904 res!156508) b!187906))

(assert (= (and b!187906 res!156509) b!187905))

(assert (=> b!187903 m!291625))

(declare-fun m!292257 () Bool)

(assert (=> b!187903 m!292257))

(declare-fun m!292259 () Bool)

(assert (=> b!187903 m!292259))

(declare-fun m!292261 () Bool)

(assert (=> b!187905 m!292261))

(assert (=> b!187905 m!291651))

(assert (=> b!187905 m!291625))

(declare-fun m!292263 () Bool)

(assert (=> b!187906 m!292263))

(declare-fun m!292265 () Bool)

(assert (=> b!187904 m!292265))

(assert (=> d!64865 m!291585))

(declare-fun m!292267 () Bool)

(assert (=> d!64865 m!292267))

(declare-fun m!292269 () Bool)

(assert (=> d!64865 m!292269))

(assert (=> d!64865 m!292117))

(assert (=> d!64865 m!292231))

(declare-fun m!292271 () Bool)

(assert (=> d!64865 m!292271))

(declare-fun m!292273 () Bool)

(assert (=> d!64865 m!292273))

(assert (=> d!64865 m!292237))

(declare-fun m!292275 () Bool)

(assert (=> d!64865 m!292275))

(declare-fun m!292277 () Bool)

(assert (=> d!64865 m!292277))

(declare-fun m!292279 () Bool)

(assert (=> d!64865 m!292279))

(assert (=> b!187567 d!64865))

(declare-fun d!64867 () Bool)

(assert (=> d!64867 (validate_offset_bits!1 ((_ sign_extend 32) (size!4341 (buf!4809 (_2!8751 lt!290522)))) ((_ sign_extend 32) (currentByte!9069 thiss!1204)) ((_ sign_extend 32) (currentBit!9064 thiss!1204)) lt!290533)))

(declare-fun lt!291522 () Unit!13403)

(assert (=> d!64867 (= lt!291522 (choose!9 thiss!1204 (buf!4809 (_2!8751 lt!290522)) lt!290533 (BitStream!7791 (buf!4809 (_2!8751 lt!290522)) (currentByte!9069 thiss!1204) (currentBit!9064 thiss!1204))))))

(assert (=> d!64867 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4809 (_2!8751 lt!290522)) lt!290533) lt!291522)))

(declare-fun bs!16121 () Bool)

(assert (= bs!16121 d!64867))

(assert (=> bs!16121 m!291607))

(declare-fun m!292281 () Bool)

(assert (=> bs!16121 m!292281))

(assert (=> b!187567 d!64867))

(declare-fun d!64869 () Bool)

(assert (=> d!64869 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!187567 d!64869))

(declare-fun lt!291523 () tuple2!16230)

(declare-fun d!64871 () Bool)

(assert (=> d!64871 (= lt!291523 (readNBitsLSBFirstsLoop!0 (_1!8753 lt!290526) nBits!348 i!590 lt!290513))))

(assert (=> d!64871 (= (readNBitsLSBFirstsLoopPure!0 (_1!8753 lt!290526) nBits!348 i!590 lt!290513) (tuple2!16219 (_2!8760 lt!291523) (_1!8760 lt!291523)))))

(declare-fun bs!16122 () Bool)

(assert (= bs!16122 d!64871))

(declare-fun m!292283 () Bool)

(assert (=> bs!16122 m!292283))

(assert (=> b!187567 d!64871))

(declare-fun d!64873 () Bool)

(declare-fun e!129873 () Bool)

(assert (=> d!64873 e!129873))

(declare-fun res!156511 () Bool)

(assert (=> d!64873 (=> (not res!156511) (not e!129873))))

(declare-fun lt!291527 () (_ BitVec 64))

(declare-fun lt!291528 () (_ BitVec 64))

(declare-fun lt!291529 () (_ BitVec 64))

(assert (=> d!64873 (= res!156511 (= lt!291528 (bvsub lt!291527 lt!291529)))))

(assert (=> d!64873 (or (= (bvand lt!291527 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!291529 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!291527 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!291527 lt!291529) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64873 (= lt!291529 (remainingBits!0 ((_ sign_extend 32) (size!4341 (buf!4809 (_1!8752 lt!290509)))) ((_ sign_extend 32) (currentByte!9069 (_1!8752 lt!290509))) ((_ sign_extend 32) (currentBit!9064 (_1!8752 lt!290509)))))))

(declare-fun lt!291524 () (_ BitVec 64))

(declare-fun lt!291525 () (_ BitVec 64))

(assert (=> d!64873 (= lt!291527 (bvmul lt!291524 lt!291525))))

(assert (=> d!64873 (or (= lt!291524 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!291525 (bvsdiv (bvmul lt!291524 lt!291525) lt!291524)))))

(assert (=> d!64873 (= lt!291525 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64873 (= lt!291524 ((_ sign_extend 32) (size!4341 (buf!4809 (_1!8752 lt!290509)))))))

(assert (=> d!64873 (= lt!291528 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9069 (_1!8752 lt!290509))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9064 (_1!8752 lt!290509)))))))

(assert (=> d!64873 (invariant!0 (currentBit!9064 (_1!8752 lt!290509)) (currentByte!9069 (_1!8752 lt!290509)) (size!4341 (buf!4809 (_1!8752 lt!290509))))))

(assert (=> d!64873 (= (bitIndex!0 (size!4341 (buf!4809 (_1!8752 lt!290509))) (currentByte!9069 (_1!8752 lt!290509)) (currentBit!9064 (_1!8752 lt!290509))) lt!291528)))

(declare-fun b!187908 () Bool)

(declare-fun res!156510 () Bool)

(assert (=> b!187908 (=> (not res!156510) (not e!129873))))

(assert (=> b!187908 (= res!156510 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!291528))))

(declare-fun b!187909 () Bool)

(declare-fun lt!291526 () (_ BitVec 64))

(assert (=> b!187909 (= e!129873 (bvsle lt!291528 (bvmul lt!291526 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187909 (or (= lt!291526 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!291526 #b0000000000000000000000000000000000000000000000000000000000001000) lt!291526)))))

(assert (=> b!187909 (= lt!291526 ((_ sign_extend 32) (size!4341 (buf!4809 (_1!8752 lt!290509)))))))

(assert (= (and d!64873 res!156511) b!187908))

(assert (= (and b!187908 res!156510) b!187909))

(declare-fun m!292285 () Bool)

(assert (=> d!64873 m!292285))

(declare-fun m!292287 () Bool)

(assert (=> d!64873 m!292287))

(assert (=> b!187567 d!64873))

(declare-fun d!64875 () Bool)

(declare-fun lt!291530 () tuple2!16228)

(assert (=> d!64875 (= lt!291530 (readBit!0 (_1!8753 lt!290526)))))

(assert (=> d!64875 (= (readBitPure!0 (_1!8753 lt!290526)) (tuple2!16215 (_2!8759 lt!291530) (_1!8759 lt!291530)))))

(declare-fun bs!16123 () Bool)

(assert (= bs!16123 d!64875))

(declare-fun m!292289 () Bool)

(assert (=> bs!16123 m!292289))

(assert (=> b!187567 d!64875))

(declare-fun d!64877 () Bool)

(declare-fun res!156514 () Bool)

(declare-fun e!129875 () Bool)

(assert (=> d!64877 (=> (not res!156514) (not e!129875))))

(assert (=> d!64877 (= res!156514 (= (size!4341 (buf!4809 thiss!1204)) (size!4341 (buf!4809 (_2!8751 lt!290519)))))))

(assert (=> d!64877 (= (isPrefixOf!0 thiss!1204 (_2!8751 lt!290519)) e!129875)))

(declare-fun b!187910 () Bool)

(declare-fun res!156512 () Bool)

(assert (=> b!187910 (=> (not res!156512) (not e!129875))))

(assert (=> b!187910 (= res!156512 (bvsle (bitIndex!0 (size!4341 (buf!4809 thiss!1204)) (currentByte!9069 thiss!1204) (currentBit!9064 thiss!1204)) (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!290519))) (currentByte!9069 (_2!8751 lt!290519)) (currentBit!9064 (_2!8751 lt!290519)))))))

(declare-fun b!187911 () Bool)

(declare-fun e!129874 () Bool)

(assert (=> b!187911 (= e!129875 e!129874)))

(declare-fun res!156513 () Bool)

(assert (=> b!187911 (=> res!156513 e!129874)))

(assert (=> b!187911 (= res!156513 (= (size!4341 (buf!4809 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!187912 () Bool)

(assert (=> b!187912 (= e!129874 (arrayBitRangesEq!0 (buf!4809 thiss!1204) (buf!4809 (_2!8751 lt!290519)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4341 (buf!4809 thiss!1204)) (currentByte!9069 thiss!1204) (currentBit!9064 thiss!1204))))))

(assert (= (and d!64877 res!156514) b!187910))

(assert (= (and b!187910 res!156512) b!187911))

(assert (= (and b!187911 (not res!156513)) b!187912))

(assert (=> b!187910 m!291627))

(assert (=> b!187910 m!291625))

(assert (=> b!187912 m!291627))

(assert (=> b!187912 m!291627))

(declare-fun m!292291 () Bool)

(assert (=> b!187912 m!292291))

(assert (=> b!187556 d!64877))

(declare-fun d!64879 () Bool)

(declare-fun e!129876 () Bool)

(assert (=> d!64879 e!129876))

(declare-fun res!156516 () Bool)

(assert (=> d!64879 (=> (not res!156516) (not e!129876))))

(declare-fun lt!291534 () (_ BitVec 64))

(declare-fun lt!291536 () (_ BitVec 64))

(declare-fun lt!291535 () (_ BitVec 64))

(assert (=> d!64879 (= res!156516 (= lt!291535 (bvsub lt!291534 lt!291536)))))

(assert (=> d!64879 (or (= (bvand lt!291534 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!291536 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!291534 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!291534 lt!291536) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64879 (= lt!291536 (remainingBits!0 ((_ sign_extend 32) (size!4341 (buf!4809 (_2!8751 lt!290519)))) ((_ sign_extend 32) (currentByte!9069 (_2!8751 lt!290519))) ((_ sign_extend 32) (currentBit!9064 (_2!8751 lt!290519)))))))

(declare-fun lt!291531 () (_ BitVec 64))

(declare-fun lt!291532 () (_ BitVec 64))

(assert (=> d!64879 (= lt!291534 (bvmul lt!291531 lt!291532))))

(assert (=> d!64879 (or (= lt!291531 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!291532 (bvsdiv (bvmul lt!291531 lt!291532) lt!291531)))))

(assert (=> d!64879 (= lt!291532 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64879 (= lt!291531 ((_ sign_extend 32) (size!4341 (buf!4809 (_2!8751 lt!290519)))))))

(assert (=> d!64879 (= lt!291535 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9069 (_2!8751 lt!290519))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9064 (_2!8751 lt!290519)))))))

(assert (=> d!64879 (invariant!0 (currentBit!9064 (_2!8751 lt!290519)) (currentByte!9069 (_2!8751 lt!290519)) (size!4341 (buf!4809 (_2!8751 lt!290519))))))

(assert (=> d!64879 (= (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!290519))) (currentByte!9069 (_2!8751 lt!290519)) (currentBit!9064 (_2!8751 lt!290519))) lt!291535)))

(declare-fun b!187913 () Bool)

(declare-fun res!156515 () Bool)

(assert (=> b!187913 (=> (not res!156515) (not e!129876))))

(assert (=> b!187913 (= res!156515 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!291535))))

(declare-fun b!187914 () Bool)

(declare-fun lt!291533 () (_ BitVec 64))

(assert (=> b!187914 (= e!129876 (bvsle lt!291535 (bvmul lt!291533 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187914 (or (= lt!291533 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!291533 #b0000000000000000000000000000000000000000000000000000000000001000) lt!291533)))))

(assert (=> b!187914 (= lt!291533 ((_ sign_extend 32) (size!4341 (buf!4809 (_2!8751 lt!290519)))))))

(assert (= (and d!64879 res!156516) b!187913))

(assert (= (and b!187913 res!156515) b!187914))

(declare-fun m!292293 () Bool)

(assert (=> d!64879 m!292293))

(assert (=> d!64879 m!292193))

(assert (=> b!187577 d!64879))

(declare-fun d!64881 () Bool)

(declare-fun e!129877 () Bool)

(assert (=> d!64881 e!129877))

(declare-fun res!156518 () Bool)

(assert (=> d!64881 (=> (not res!156518) (not e!129877))))

(declare-fun lt!291540 () (_ BitVec 64))

(declare-fun lt!291541 () (_ BitVec 64))

(declare-fun lt!291542 () (_ BitVec 64))

(assert (=> d!64881 (= res!156518 (= lt!291541 (bvsub lt!291540 lt!291542)))))

(assert (=> d!64881 (or (= (bvand lt!291540 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!291542 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!291540 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!291540 lt!291542) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64881 (= lt!291542 (remainingBits!0 ((_ sign_extend 32) (size!4341 (buf!4809 thiss!1204))) ((_ sign_extend 32) (currentByte!9069 thiss!1204)) ((_ sign_extend 32) (currentBit!9064 thiss!1204))))))

(declare-fun lt!291537 () (_ BitVec 64))

(declare-fun lt!291538 () (_ BitVec 64))

(assert (=> d!64881 (= lt!291540 (bvmul lt!291537 lt!291538))))

(assert (=> d!64881 (or (= lt!291537 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!291538 (bvsdiv (bvmul lt!291537 lt!291538) lt!291537)))))

(assert (=> d!64881 (= lt!291538 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64881 (= lt!291537 ((_ sign_extend 32) (size!4341 (buf!4809 thiss!1204))))))

(assert (=> d!64881 (= lt!291541 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9069 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9064 thiss!1204))))))

(assert (=> d!64881 (invariant!0 (currentBit!9064 thiss!1204) (currentByte!9069 thiss!1204) (size!4341 (buf!4809 thiss!1204)))))

(assert (=> d!64881 (= (bitIndex!0 (size!4341 (buf!4809 thiss!1204)) (currentByte!9069 thiss!1204) (currentBit!9064 thiss!1204)) lt!291541)))

(declare-fun b!187915 () Bool)

(declare-fun res!156517 () Bool)

(assert (=> b!187915 (=> (not res!156517) (not e!129877))))

(assert (=> b!187915 (= res!156517 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!291541))))

(declare-fun b!187916 () Bool)

(declare-fun lt!291539 () (_ BitVec 64))

(assert (=> b!187916 (= e!129877 (bvsle lt!291541 (bvmul lt!291539 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187916 (or (= lt!291539 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!291539 #b0000000000000000000000000000000000000000000000000000000000001000) lt!291539)))))

(assert (=> b!187916 (= lt!291539 ((_ sign_extend 32) (size!4341 (buf!4809 thiss!1204))))))

(assert (= (and d!64881 res!156518) b!187915))

(assert (= (and b!187915 res!156517) b!187916))

(assert (=> d!64881 m!292195))

(assert (=> d!64881 m!291635))

(assert (=> b!187577 d!64881))

(declare-fun d!64883 () Bool)

(assert (=> d!64883 (= (array_inv!4082 (buf!4809 thiss!1204)) (bvsge (size!4341 (buf!4809 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!187566 d!64883))

(assert (=> b!187576 d!64877))

(assert (=> b!187565 d!64879))

(assert (=> b!187565 d!64881))

(declare-fun b!187944 () Bool)

(declare-fun e!129892 () Bool)

(declare-fun e!129891 () Bool)

(assert (=> b!187944 (= e!129892 e!129891)))

(declare-fun res!156541 () Bool)

(assert (=> b!187944 (=> (not res!156541) (not e!129891))))

(declare-fun lt!291607 () tuple2!16212)

(declare-fun lt!291610 () tuple2!16214)

(assert (=> b!187944 (= res!156541 (and (= (_2!8752 lt!291610) lt!290506) (= (_1!8752 lt!291610) (_2!8751 lt!291607))))))

(assert (=> b!187944 (= lt!291610 (readBitPure!0 (readerFrom!0 (_2!8751 lt!291607) (currentBit!9064 thiss!1204) (currentByte!9069 thiss!1204))))))

(declare-fun b!187943 () Bool)

(declare-fun res!156540 () Bool)

(assert (=> b!187943 (=> (not res!156540) (not e!129892))))

(assert (=> b!187943 (= res!156540 (isPrefixOf!0 thiss!1204 (_2!8751 lt!291607)))))

(declare-fun d!64885 () Bool)

(assert (=> d!64885 e!129892))

(declare-fun res!156542 () Bool)

(assert (=> d!64885 (=> (not res!156542) (not e!129892))))

(assert (=> d!64885 (= res!156542 (= (size!4341 (buf!4809 thiss!1204)) (size!4341 (buf!4809 (_2!8751 lt!291607)))))))

(declare-fun choose!16 (BitStream!7790 Bool) tuple2!16212)

(assert (=> d!64885 (= lt!291607 (choose!16 thiss!1204 lt!290506))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!64885 (validate_offset_bit!0 ((_ sign_extend 32) (size!4341 (buf!4809 thiss!1204))) ((_ sign_extend 32) (currentByte!9069 thiss!1204)) ((_ sign_extend 32) (currentBit!9064 thiss!1204)))))

(assert (=> d!64885 (= (appendBit!0 thiss!1204 lt!290506) lt!291607)))

(declare-fun b!187945 () Bool)

(assert (=> b!187945 (= e!129891 (= (bitIndex!0 (size!4341 (buf!4809 (_1!8752 lt!291610))) (currentByte!9069 (_1!8752 lt!291610)) (currentBit!9064 (_1!8752 lt!291610))) (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!291607))) (currentByte!9069 (_2!8751 lt!291607)) (currentBit!9064 (_2!8751 lt!291607)))))))

(declare-fun b!187942 () Bool)

(declare-fun res!156539 () Bool)

(assert (=> b!187942 (=> (not res!156539) (not e!129892))))

(declare-fun lt!291608 () (_ BitVec 64))

(declare-fun lt!291609 () (_ BitVec 64))

(assert (=> b!187942 (= res!156539 (= (bitIndex!0 (size!4341 (buf!4809 (_2!8751 lt!291607))) (currentByte!9069 (_2!8751 lt!291607)) (currentBit!9064 (_2!8751 lt!291607))) (bvadd lt!291609 lt!291608)))))

(assert (=> b!187942 (or (not (= (bvand lt!291609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!291608 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!291609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!291609 lt!291608) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187942 (= lt!291608 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!187942 (= lt!291609 (bitIndex!0 (size!4341 (buf!4809 thiss!1204)) (currentByte!9069 thiss!1204) (currentBit!9064 thiss!1204)))))

(assert (= (and d!64885 res!156542) b!187942))

(assert (= (and b!187942 res!156539) b!187943))

(assert (= (and b!187943 res!156540) b!187944))

(assert (= (and b!187944 res!156541) b!187945))

(declare-fun m!292387 () Bool)

(assert (=> b!187942 m!292387))

(assert (=> b!187942 m!291627))

(declare-fun m!292389 () Bool)

(assert (=> b!187944 m!292389))

(assert (=> b!187944 m!292389))

(declare-fun m!292391 () Bool)

(assert (=> b!187944 m!292391))

(declare-fun m!292393 () Bool)

(assert (=> d!64885 m!292393))

(declare-fun m!292395 () Bool)

(assert (=> d!64885 m!292395))

(declare-fun m!292397 () Bool)

(assert (=> b!187943 m!292397))

(declare-fun m!292399 () Bool)

(assert (=> b!187945 m!292399))

(assert (=> b!187945 m!292387))

(assert (=> b!187565 d!64885))

(declare-fun d!64887 () Bool)

(declare-fun lt!291625 () tuple2!16218)

(declare-fun lt!291627 () tuple2!16218)

(assert (=> d!64887 (and (= (_2!8754 lt!291625) (_2!8754 lt!291627)) (= (_1!8754 lt!291625) (_1!8754 lt!291627)))))

(declare-fun lt!291626 () Bool)

(declare-fun lt!291623 () (_ BitVec 64))

(declare-fun lt!291628 () Unit!13403)

(declare-fun lt!291624 () BitStream!7790)

(declare-fun choose!56 (BitStream!7790 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16218 tuple2!16218 BitStream!7790 (_ BitVec 64) Bool BitStream!7790 (_ BitVec 64) tuple2!16218 tuple2!16218 BitStream!7790 (_ BitVec 64)) Unit!13403)

(assert (=> d!64887 (= lt!291628 (choose!56 (_1!8753 lt!290526) nBits!348 i!590 lt!290513 lt!291625 (tuple2!16219 (_1!8754 lt!291625) (_2!8754 lt!291625)) (_1!8754 lt!291625) (_2!8754 lt!291625) lt!291626 lt!291624 lt!291623 lt!291627 (tuple2!16219 (_1!8754 lt!291627) (_2!8754 lt!291627)) (_1!8754 lt!291627) (_2!8754 lt!291627)))))

(assert (=> d!64887 (= lt!291627 (readNBitsLSBFirstsLoopPure!0 lt!291624 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!291623))))

(assert (=> d!64887 (= lt!291623 (bvor lt!290513 (ite lt!291626 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64887 (= lt!291624 (withMovedBitIndex!0 (_1!8753 lt!290526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!64887 (= lt!291626 (_2!8752 (readBitPure!0 (_1!8753 lt!290526))))))

(assert (=> d!64887 (= lt!291625 (readNBitsLSBFirstsLoopPure!0 (_1!8753 lt!290526) nBits!348 i!590 lt!290513))))

(assert (=> d!64887 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8753 lt!290526) nBits!348 i!590 lt!290513) lt!291628)))

(declare-fun bs!16125 () Bool)

(assert (= bs!16125 d!64887))

(declare-fun m!292401 () Bool)

(assert (=> bs!16125 m!292401))

(assert (=> bs!16125 m!291601))

(declare-fun m!292403 () Bool)

(assert (=> bs!16125 m!292403))

(assert (=> bs!16125 m!291643))

(assert (=> bs!16125 m!291619))

(assert (=> b!187575 d!64887))

(declare-fun d!64889 () Bool)

(declare-fun lt!291629 () tuple2!16230)

(assert (=> d!64889 (= lt!291629 (readNBitsLSBFirstsLoop!0 lt!290532 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!290514))))

(assert (=> d!64889 (= (readNBitsLSBFirstsLoopPure!0 lt!290532 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!290514) (tuple2!16219 (_2!8760 lt!291629) (_1!8760 lt!291629)))))

(declare-fun bs!16126 () Bool)

(assert (= bs!16126 d!64889))

(declare-fun m!292405 () Bool)

(assert (=> bs!16126 m!292405))

(assert (=> b!187575 d!64889))

(declare-fun d!64891 () Bool)

(declare-fun e!129893 () Bool)

(assert (=> d!64891 e!129893))

(declare-fun res!156543 () Bool)

(assert (=> d!64891 (=> (not res!156543) (not e!129893))))

(declare-fun lt!291631 () (_ BitVec 64))

(declare-fun lt!291630 () BitStream!7790)

(assert (=> d!64891 (= res!156543 (= (bvadd lt!291631 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4341 (buf!4809 lt!291630)) (currentByte!9069 lt!291630) (currentBit!9064 lt!291630))))))

(assert (=> d!64891 (or (not (= (bvand lt!291631 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!291631 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!291631 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64891 (= lt!291631 (bitIndex!0 (size!4341 (buf!4809 (_1!8753 lt!290526))) (currentByte!9069 (_1!8753 lt!290526)) (currentBit!9064 (_1!8753 lt!290526))))))

(assert (=> d!64891 (= lt!291630 (_2!8751 (moveBitIndex!0 (_1!8753 lt!290526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!64891 (moveBitIndexPrecond!0 (_1!8753 lt!290526) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!64891 (= (withMovedBitIndex!0 (_1!8753 lt!290526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!291630)))

(declare-fun b!187946 () Bool)

(assert (=> b!187946 (= e!129893 (= (size!4341 (buf!4809 (_1!8753 lt!290526))) (size!4341 (buf!4809 lt!291630))))))

(assert (= (and d!64891 res!156543) b!187946))

(declare-fun m!292407 () Bool)

(assert (=> d!64891 m!292407))

(declare-fun m!292409 () Bool)

(assert (=> d!64891 m!292409))

(declare-fun m!292411 () Bool)

(assert (=> d!64891 m!292411))

(declare-fun m!292413 () Bool)

(assert (=> d!64891 m!292413))

(assert (=> b!187575 d!64891))

(declare-fun d!64893 () Bool)

(assert (=> d!64893 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9064 thiss!1204) (currentByte!9069 thiss!1204) (size!4341 (buf!4809 thiss!1204))))))

(declare-fun bs!16127 () Bool)

(assert (= bs!16127 d!64893))

(assert (=> bs!16127 m!291635))

(assert (=> start!40746 d!64893))

(push 1)

(assert (not b!187848))

(assert (not d!64885))

(assert (not d!64859))

(assert (not d!64847))

(assert (not b!187837))

(assert (not b!187884))

(assert (not b!187905))

(assert (not b!187691))

(assert (not b!187835))

(assert (not b!187944))

(assert (not d!64867))

(assert (not d!64831))

(assert (not d!64833))

(assert (not b!187689))

(assert (not d!64889))

(assert (not d!64861))

(assert (not d!64757))

(assert (not d!64857))

(assert (not b!187668))

(assert (not d!64855))

(assert (not b!187883))

(assert (not d!64839))

(assert (not b!187842))

(assert (not b!187904))

(assert (not b!187829))

(assert (not d!64865))

(assert (not b!187838))

(assert (not b!187943))

(assert (not d!64835))

(assert (not b!187882))

(assert (not d!64873))

(assert (not bm!3014))

(assert (not b!187834))

(assert (not d!64845))

(assert (not d!64875))

(assert (not d!64745))

(assert (not b!187841))

(assert (not b!187670))

(assert (not b!187903))

(assert (not d!64871))

(assert (not b!187945))

(assert (not d!64881))

(assert (not d!64891))

(assert (not b!187830))

(assert (not d!64749))

(assert (not d!64837))

(assert (not d!64853))

(assert (not b!187832))

(assert (not b!187833))

(assert (not b!187912))

(assert (not b!187881))

(assert (not d!64863))

(assert (not d!64887))

(assert (not d!64893))

(assert (not b!187942))

(assert (not d!64759))

(assert (not d!64849))

(assert (not b!187910))

(assert (not d!64879))

(assert (not b!187906))

(check-sat)

