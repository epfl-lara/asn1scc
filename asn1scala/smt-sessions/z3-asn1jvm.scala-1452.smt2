; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39748 () Bool)

(assert start!39748)

(declare-fun b!180467 () Bool)

(declare-fun res!149856 () Bool)

(declare-fun e!125421 () Bool)

(assert (=> b!180467 (=> (not res!149856) (not e!125421))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!180467 (= res!149856 (not (= i!590 nBits!348)))))

(declare-fun b!180468 () Bool)

(declare-fun e!125418 () Bool)

(declare-datatypes ((array!9682 0))(
  ( (array!9683 (arr!5201 (Array (_ BitVec 32) (_ BitVec 8))) (size!4271 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7650 0))(
  ( (BitStream!7651 (buf!4714 array!9682) (currentByte!8924 (_ BitVec 32)) (currentBit!8919 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15572 0))(
  ( (tuple2!15573 (_1!8431 BitStream!7650) (_2!8431 BitStream!7650)) )
))
(declare-fun lt!276605 () tuple2!15572)

(declare-fun lt!276596 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!180468 (= e!125418 (validate_offset_bits!1 ((_ sign_extend 32) (size!4271 (buf!4714 (_1!8431 lt!276605)))) ((_ sign_extend 32) (currentByte!8924 (_1!8431 lt!276605))) ((_ sign_extend 32) (currentBit!8919 (_1!8431 lt!276605))) lt!276596))))

(declare-datatypes ((Unit!12961 0))(
  ( (Unit!12962) )
))
(declare-datatypes ((tuple2!15574 0))(
  ( (tuple2!15575 (_1!8432 Unit!12961) (_2!8432 BitStream!7650)) )
))
(declare-fun lt!276601 () tuple2!15574)

(declare-fun thiss!1204 () BitStream!7650)

(assert (=> b!180468 (validate_offset_bits!1 ((_ sign_extend 32) (size!4271 (buf!4714 (_2!8432 lt!276601)))) ((_ sign_extend 32) (currentByte!8924 thiss!1204)) ((_ sign_extend 32) (currentBit!8919 thiss!1204)) lt!276596)))

(declare-fun lt!276595 () Unit!12961)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7650 array!9682 (_ BitVec 64)) Unit!12961)

(assert (=> b!180468 (= lt!276595 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4714 (_2!8432 lt!276601)) lt!276596))))

(declare-fun lt!276589 () Bool)

(declare-datatypes ((tuple2!15576 0))(
  ( (tuple2!15577 (_1!8433 BitStream!7650) (_2!8433 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!7650) tuple2!15576)

(assert (=> b!180468 (= (_2!8433 (readBitPure!0 (_1!8431 lt!276605))) lt!276589)))

(declare-fun lt!276603 () tuple2!15572)

(declare-fun lt!276600 () tuple2!15574)

(declare-fun reader!0 (BitStream!7650 BitStream!7650) tuple2!15572)

(assert (=> b!180468 (= lt!276603 (reader!0 (_2!8432 lt!276600) (_2!8432 lt!276601)))))

(assert (=> b!180468 (= lt!276605 (reader!0 thiss!1204 (_2!8432 lt!276601)))))

(declare-fun e!125424 () Bool)

(assert (=> b!180468 e!125424))

(declare-fun res!149852 () Bool)

(assert (=> b!180468 (=> (not res!149852) (not e!125424))))

(declare-fun lt!276604 () tuple2!15576)

(declare-fun lt!276594 () tuple2!15576)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!180468 (= res!149852 (= (bitIndex!0 (size!4271 (buf!4714 (_1!8433 lt!276604))) (currentByte!8924 (_1!8433 lt!276604)) (currentBit!8919 (_1!8433 lt!276604))) (bitIndex!0 (size!4271 (buf!4714 (_1!8433 lt!276594))) (currentByte!8924 (_1!8433 lt!276594)) (currentBit!8919 (_1!8433 lt!276594)))))))

(declare-fun lt!276590 () Unit!12961)

(declare-fun lt!276593 () BitStream!7650)

(declare-fun readBitPrefixLemma!0 (BitStream!7650 BitStream!7650) Unit!12961)

(assert (=> b!180468 (= lt!276590 (readBitPrefixLemma!0 lt!276593 (_2!8432 lt!276601)))))

(assert (=> b!180468 (= lt!276594 (readBitPure!0 (BitStream!7651 (buf!4714 (_2!8432 lt!276601)) (currentByte!8924 thiss!1204) (currentBit!8919 thiss!1204))))))

(assert (=> b!180468 (= lt!276604 (readBitPure!0 lt!276593))))

(declare-fun e!125417 () Bool)

(assert (=> b!180468 e!125417))

(declare-fun res!149855 () Bool)

(assert (=> b!180468 (=> (not res!149855) (not e!125417))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!180468 (= res!149855 (invariant!0 (currentBit!8919 thiss!1204) (currentByte!8924 thiss!1204) (size!4271 (buf!4714 (_2!8432 lt!276600)))))))

(assert (=> b!180468 (= lt!276593 (BitStream!7651 (buf!4714 (_2!8432 lt!276600)) (currentByte!8924 thiss!1204) (currentBit!8919 thiss!1204)))))

(declare-fun b!180469 () Bool)

(declare-fun e!125420 () Bool)

(declare-fun lt!276599 () tuple2!15576)

(declare-fun lt!276588 () (_ BitVec 64))

(assert (=> b!180469 (= e!125420 (= (bitIndex!0 (size!4271 (buf!4714 (_1!8433 lt!276599))) (currentByte!8924 (_1!8433 lt!276599)) (currentBit!8919 (_1!8433 lt!276599))) lt!276588))))

(declare-fun b!180470 () Bool)

(declare-fun res!149864 () Bool)

(assert (=> b!180470 (=> res!149864 e!125418)))

(declare-fun isPrefixOf!0 (BitStream!7650 BitStream!7650) Bool)

(assert (=> b!180470 (= res!149864 (not (isPrefixOf!0 (_2!8432 lt!276600) (_2!8432 lt!276601))))))

(declare-fun b!180471 () Bool)

(declare-fun res!149859 () Bool)

(assert (=> b!180471 (=> (not res!149859) (not e!125421))))

(assert (=> b!180471 (= res!149859 (invariant!0 (currentBit!8919 thiss!1204) (currentByte!8924 thiss!1204) (size!4271 (buf!4714 thiss!1204))))))

(declare-fun b!180472 () Bool)

(declare-fun res!149857 () Bool)

(assert (=> b!180472 (=> res!149857 e!125418)))

(declare-fun lt!276597 () (_ BitVec 64))

(declare-fun lt!276591 () (_ BitVec 64))

(assert (=> b!180472 (= res!149857 (or (not (= (size!4271 (buf!4714 (_2!8432 lt!276601))) (size!4271 (buf!4714 thiss!1204)))) (not (= lt!276591 (bvsub (bvadd lt!276597 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!180473 () Bool)

(declare-fun e!125416 () Bool)

(declare-fun e!125425 () Bool)

(assert (=> b!180473 (= e!125416 e!125425)))

(declare-fun res!149858 () Bool)

(assert (=> b!180473 (=> (not res!149858) (not e!125425))))

(declare-fun lt!276598 () (_ BitVec 64))

(assert (=> b!180473 (= res!149858 (= lt!276588 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!276598)))))

(assert (=> b!180473 (= lt!276588 (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!276600))) (currentByte!8924 (_2!8432 lt!276600)) (currentBit!8919 (_2!8432 lt!276600))))))

(assert (=> b!180473 (= lt!276598 (bitIndex!0 (size!4271 (buf!4714 thiss!1204)) (currentByte!8924 thiss!1204) (currentBit!8919 thiss!1204)))))

(declare-fun b!180474 () Bool)

(declare-fun res!149865 () Bool)

(assert (=> b!180474 (=> res!149865 e!125418)))

(assert (=> b!180474 (= res!149865 (not (isPrefixOf!0 thiss!1204 (_2!8432 lt!276600))))))

(declare-fun b!180475 () Bool)

(assert (=> b!180475 (= e!125424 (= (_2!8433 lt!276604) (_2!8433 lt!276594)))))

(declare-fun res!149862 () Bool)

(declare-fun e!125419 () Bool)

(assert (=> start!39748 (=> (not res!149862) (not e!125419))))

(assert (=> start!39748 (= res!149862 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39748 e!125419))

(assert (=> start!39748 true))

(declare-fun e!125415 () Bool)

(declare-fun inv!12 (BitStream!7650) Bool)

(assert (=> start!39748 (and (inv!12 thiss!1204) e!125415)))

(declare-fun b!180476 () Bool)

(assert (=> b!180476 (= e!125425 e!125420)))

(declare-fun res!149850 () Bool)

(assert (=> b!180476 (=> (not res!149850) (not e!125420))))

(assert (=> b!180476 (= res!149850 (and (= (_2!8433 lt!276599) lt!276589) (= (_1!8433 lt!276599) (_2!8432 lt!276600))))))

(declare-fun readerFrom!0 (BitStream!7650 (_ BitVec 32) (_ BitVec 32)) BitStream!7650)

(assert (=> b!180476 (= lt!276599 (readBitPure!0 (readerFrom!0 (_2!8432 lt!276600) (currentBit!8919 thiss!1204) (currentByte!8924 thiss!1204))))))

(declare-fun b!180477 () Bool)

(declare-fun array_inv!4012 (array!9682) Bool)

(assert (=> b!180477 (= e!125415 (array_inv!4012 (buf!4714 thiss!1204)))))

(declare-fun b!180478 () Bool)

(declare-fun res!149860 () Bool)

(assert (=> b!180478 (=> res!149860 e!125418)))

(assert (=> b!180478 (= res!149860 (not (invariant!0 (currentBit!8919 (_2!8432 lt!276601)) (currentByte!8924 (_2!8432 lt!276601)) (size!4271 (buf!4714 (_2!8432 lt!276601))))))))

(declare-fun b!180479 () Bool)

(declare-fun res!149851 () Bool)

(assert (=> b!180479 (=> (not res!149851) (not e!125425))))

(assert (=> b!180479 (= res!149851 (isPrefixOf!0 thiss!1204 (_2!8432 lt!276600)))))

(declare-fun b!180480 () Bool)

(declare-fun e!125423 () Bool)

(assert (=> b!180480 (= e!125421 (not e!125423))))

(declare-fun res!149854 () Bool)

(assert (=> b!180480 (=> res!149854 e!125423)))

(declare-fun lt!276602 () (_ BitVec 64))

(assert (=> b!180480 (= res!149854 (not (= lt!276602 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!276597))))))

(assert (=> b!180480 (= lt!276602 (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!276600))) (currentByte!8924 (_2!8432 lt!276600)) (currentBit!8919 (_2!8432 lt!276600))))))

(assert (=> b!180480 (= lt!276597 (bitIndex!0 (size!4271 (buf!4714 thiss!1204)) (currentByte!8924 thiss!1204) (currentBit!8919 thiss!1204)))))

(assert (=> b!180480 e!125416))

(declare-fun res!149863 () Bool)

(assert (=> b!180480 (=> (not res!149863) (not e!125416))))

(assert (=> b!180480 (= res!149863 (= (size!4271 (buf!4714 thiss!1204)) (size!4271 (buf!4714 (_2!8432 lt!276600)))))))

(declare-fun appendBit!0 (BitStream!7650 Bool) tuple2!15574)

(assert (=> b!180480 (= lt!276600 (appendBit!0 thiss!1204 lt!276589))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!180480 (= lt!276589 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!180481 () Bool)

(assert (=> b!180481 (= e!125417 (invariant!0 (currentBit!8919 thiss!1204) (currentByte!8924 thiss!1204) (size!4271 (buf!4714 (_2!8432 lt!276601)))))))

(declare-fun b!180482 () Bool)

(assert (=> b!180482 (= e!125423 e!125418)))

(declare-fun res!149853 () Bool)

(assert (=> b!180482 (=> res!149853 e!125418)))

(assert (=> b!180482 (= res!149853 (not (= lt!276591 (bvsub (bvsub (bvadd lt!276602 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!180482 (= lt!276591 (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!276601))) (currentByte!8924 (_2!8432 lt!276601)) (currentBit!8919 (_2!8432 lt!276601))))))

(assert (=> b!180482 (isPrefixOf!0 thiss!1204 (_2!8432 lt!276601))))

(declare-fun lt!276592 () Unit!12961)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7650 BitStream!7650 BitStream!7650) Unit!12961)

(assert (=> b!180482 (= lt!276592 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8432 lt!276600) (_2!8432 lt!276601)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7650 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15574)

(assert (=> b!180482 (= lt!276601 (appendBitsLSBFirstLoopTR!0 (_2!8432 lt!276600) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!180483 () Bool)

(assert (=> b!180483 (= e!125419 e!125421)))

(declare-fun res!149861 () Bool)

(assert (=> b!180483 (=> (not res!149861) (not e!125421))))

(assert (=> b!180483 (= res!149861 (validate_offset_bits!1 ((_ sign_extend 32) (size!4271 (buf!4714 thiss!1204))) ((_ sign_extend 32) (currentByte!8924 thiss!1204)) ((_ sign_extend 32) (currentBit!8919 thiss!1204)) lt!276596))))

(assert (=> b!180483 (= lt!276596 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (= (and start!39748 res!149862) b!180483))

(assert (= (and b!180483 res!149861) b!180471))

(assert (= (and b!180471 res!149859) b!180467))

(assert (= (and b!180467 res!149856) b!180480))

(assert (= (and b!180480 res!149863) b!180473))

(assert (= (and b!180473 res!149858) b!180479))

(assert (= (and b!180479 res!149851) b!180476))

(assert (= (and b!180476 res!149850) b!180469))

(assert (= (and b!180480 (not res!149854)) b!180482))

(assert (= (and b!180482 (not res!149853)) b!180478))

(assert (= (and b!180478 (not res!149860)) b!180472))

(assert (= (and b!180472 (not res!149857)) b!180470))

(assert (= (and b!180470 (not res!149864)) b!180474))

(assert (= (and b!180474 (not res!149865)) b!180468))

(assert (= (and b!180468 res!149855) b!180481))

(assert (= (and b!180468 res!149852) b!180475))

(assert (= start!39748 b!180477))

(declare-fun m!280885 () Bool)

(assert (=> start!39748 m!280885))

(declare-fun m!280887 () Bool)

(assert (=> b!180476 m!280887))

(assert (=> b!180476 m!280887))

(declare-fun m!280889 () Bool)

(assert (=> b!180476 m!280889))

(declare-fun m!280891 () Bool)

(assert (=> b!180482 m!280891))

(declare-fun m!280893 () Bool)

(assert (=> b!180482 m!280893))

(declare-fun m!280895 () Bool)

(assert (=> b!180482 m!280895))

(declare-fun m!280897 () Bool)

(assert (=> b!180482 m!280897))

(declare-fun m!280899 () Bool)

(assert (=> b!180468 m!280899))

(declare-fun m!280901 () Bool)

(assert (=> b!180468 m!280901))

(declare-fun m!280903 () Bool)

(assert (=> b!180468 m!280903))

(declare-fun m!280905 () Bool)

(assert (=> b!180468 m!280905))

(declare-fun m!280907 () Bool)

(assert (=> b!180468 m!280907))

(declare-fun m!280909 () Bool)

(assert (=> b!180468 m!280909))

(declare-fun m!280911 () Bool)

(assert (=> b!180468 m!280911))

(declare-fun m!280913 () Bool)

(assert (=> b!180468 m!280913))

(declare-fun m!280915 () Bool)

(assert (=> b!180468 m!280915))

(declare-fun m!280917 () Bool)

(assert (=> b!180468 m!280917))

(declare-fun m!280919 () Bool)

(assert (=> b!180468 m!280919))

(declare-fun m!280921 () Bool)

(assert (=> b!180468 m!280921))

(declare-fun m!280923 () Bool)

(assert (=> b!180477 m!280923))

(declare-fun m!280925 () Bool)

(assert (=> b!180478 m!280925))

(declare-fun m!280927 () Bool)

(assert (=> b!180470 m!280927))

(declare-fun m!280929 () Bool)

(assert (=> b!180480 m!280929))

(declare-fun m!280931 () Bool)

(assert (=> b!180480 m!280931))

(declare-fun m!280933 () Bool)

(assert (=> b!180480 m!280933))

(declare-fun m!280935 () Bool)

(assert (=> b!180474 m!280935))

(declare-fun m!280937 () Bool)

(assert (=> b!180483 m!280937))

(assert (=> b!180479 m!280935))

(declare-fun m!280939 () Bool)

(assert (=> b!180471 m!280939))

(declare-fun m!280941 () Bool)

(assert (=> b!180481 m!280941))

(assert (=> b!180473 m!280929))

(assert (=> b!180473 m!280931))

(declare-fun m!280943 () Bool)

(assert (=> b!180469 m!280943))

(check-sat (not b!180479) (not b!180471) (not b!180481) (not b!180478) (not b!180482) (not b!180469) (not b!180476) (not b!180468) (not b!180480) (not b!180470) (not b!180473) (not b!180477) (not start!39748) (not b!180483) (not b!180474))
(check-sat)
(get-model)

(declare-fun d!62817 () Bool)

(declare-datatypes ((tuple2!15584 0))(
  ( (tuple2!15585 (_1!8437 Bool) (_2!8437 BitStream!7650)) )
))
(declare-fun lt!276662 () tuple2!15584)

(declare-fun readBit!0 (BitStream!7650) tuple2!15584)

(assert (=> d!62817 (= lt!276662 (readBit!0 (readerFrom!0 (_2!8432 lt!276600) (currentBit!8919 thiss!1204) (currentByte!8924 thiss!1204))))))

(assert (=> d!62817 (= (readBitPure!0 (readerFrom!0 (_2!8432 lt!276600) (currentBit!8919 thiss!1204) (currentByte!8924 thiss!1204))) (tuple2!15577 (_2!8437 lt!276662) (_1!8437 lt!276662)))))

(declare-fun bs!15667 () Bool)

(assert (= bs!15667 d!62817))

(assert (=> bs!15667 m!280887))

(declare-fun m!281005 () Bool)

(assert (=> bs!15667 m!281005))

(assert (=> b!180476 d!62817))

(declare-fun d!62819 () Bool)

(declare-fun e!125461 () Bool)

(assert (=> d!62819 e!125461))

(declare-fun res!149917 () Bool)

(assert (=> d!62819 (=> (not res!149917) (not e!125461))))

(assert (=> d!62819 (= res!149917 (invariant!0 (currentBit!8919 (_2!8432 lt!276600)) (currentByte!8924 (_2!8432 lt!276600)) (size!4271 (buf!4714 (_2!8432 lt!276600)))))))

(assert (=> d!62819 (= (readerFrom!0 (_2!8432 lt!276600) (currentBit!8919 thiss!1204) (currentByte!8924 thiss!1204)) (BitStream!7651 (buf!4714 (_2!8432 lt!276600)) (currentByte!8924 thiss!1204) (currentBit!8919 thiss!1204)))))

(declare-fun b!180537 () Bool)

(assert (=> b!180537 (= e!125461 (invariant!0 (currentBit!8919 thiss!1204) (currentByte!8924 thiss!1204) (size!4271 (buf!4714 (_2!8432 lt!276600)))))))

(assert (= (and d!62819 res!149917) b!180537))

(declare-fun m!281007 () Bool)

(assert (=> d!62819 m!281007))

(assert (=> b!180537 m!280909))

(assert (=> b!180476 d!62819))

(declare-fun d!62821 () Bool)

(assert (=> d!62821 (= (array_inv!4012 (buf!4714 thiss!1204)) (bvsge (size!4271 (buf!4714 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!180477 d!62821))

(declare-fun d!62823 () Bool)

(assert (=> d!62823 (= (invariant!0 (currentBit!8919 (_2!8432 lt!276601)) (currentByte!8924 (_2!8432 lt!276601)) (size!4271 (buf!4714 (_2!8432 lt!276601)))) (and (bvsge (currentBit!8919 (_2!8432 lt!276601)) #b00000000000000000000000000000000) (bvslt (currentBit!8919 (_2!8432 lt!276601)) #b00000000000000000000000000001000) (bvsge (currentByte!8924 (_2!8432 lt!276601)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8924 (_2!8432 lt!276601)) (size!4271 (buf!4714 (_2!8432 lt!276601)))) (and (= (currentBit!8919 (_2!8432 lt!276601)) #b00000000000000000000000000000000) (= (currentByte!8924 (_2!8432 lt!276601)) (size!4271 (buf!4714 (_2!8432 lt!276601))))))))))

(assert (=> b!180478 d!62823))

(declare-fun d!62825 () Bool)

(assert (=> d!62825 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8919 thiss!1204) (currentByte!8924 thiss!1204) (size!4271 (buf!4714 thiss!1204))))))

(declare-fun bs!15668 () Bool)

(assert (= bs!15668 d!62825))

(assert (=> bs!15668 m!280939))

(assert (=> start!39748 d!62825))

(declare-fun b!180548 () Bool)

(declare-fun e!125466 () Unit!12961)

(declare-fun lt!276705 () Unit!12961)

(assert (=> b!180548 (= e!125466 lt!276705)))

(declare-fun lt!276712 () (_ BitVec 64))

(assert (=> b!180548 (= lt!276712 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!276716 () (_ BitVec 64))

(assert (=> b!180548 (= lt!276716 (bitIndex!0 (size!4271 (buf!4714 thiss!1204)) (currentByte!8924 thiss!1204) (currentBit!8919 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9682 array!9682 (_ BitVec 64) (_ BitVec 64)) Unit!12961)

(assert (=> b!180548 (= lt!276705 (arrayBitRangesEqSymmetric!0 (buf!4714 thiss!1204) (buf!4714 (_2!8432 lt!276601)) lt!276712 lt!276716))))

(declare-fun arrayBitRangesEq!0 (array!9682 array!9682 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!180548 (arrayBitRangesEq!0 (buf!4714 (_2!8432 lt!276601)) (buf!4714 thiss!1204) lt!276712 lt!276716)))

(declare-fun d!62827 () Bool)

(declare-fun e!125467 () Bool)

(assert (=> d!62827 e!125467))

(declare-fun res!149924 () Bool)

(assert (=> d!62827 (=> (not res!149924) (not e!125467))))

(declare-fun lt!276713 () tuple2!15572)

(assert (=> d!62827 (= res!149924 (isPrefixOf!0 (_1!8431 lt!276713) (_2!8431 lt!276713)))))

(declare-fun lt!276711 () BitStream!7650)

(assert (=> d!62827 (= lt!276713 (tuple2!15573 lt!276711 (_2!8432 lt!276601)))))

(declare-fun lt!276718 () Unit!12961)

(declare-fun lt!276717 () Unit!12961)

(assert (=> d!62827 (= lt!276718 lt!276717)))

(assert (=> d!62827 (isPrefixOf!0 lt!276711 (_2!8432 lt!276601))))

(assert (=> d!62827 (= lt!276717 (lemmaIsPrefixTransitive!0 lt!276711 (_2!8432 lt!276601) (_2!8432 lt!276601)))))

(declare-fun lt!276721 () Unit!12961)

(declare-fun lt!276719 () Unit!12961)

(assert (=> d!62827 (= lt!276721 lt!276719)))

(assert (=> d!62827 (isPrefixOf!0 lt!276711 (_2!8432 lt!276601))))

(assert (=> d!62827 (= lt!276719 (lemmaIsPrefixTransitive!0 lt!276711 thiss!1204 (_2!8432 lt!276601)))))

(declare-fun lt!276709 () Unit!12961)

(assert (=> d!62827 (= lt!276709 e!125466)))

(declare-fun c!9309 () Bool)

(assert (=> d!62827 (= c!9309 (not (= (size!4271 (buf!4714 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!276704 () Unit!12961)

(declare-fun lt!276703 () Unit!12961)

(assert (=> d!62827 (= lt!276704 lt!276703)))

(assert (=> d!62827 (isPrefixOf!0 (_2!8432 lt!276601) (_2!8432 lt!276601))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7650) Unit!12961)

(assert (=> d!62827 (= lt!276703 (lemmaIsPrefixRefl!0 (_2!8432 lt!276601)))))

(declare-fun lt!276720 () Unit!12961)

(declare-fun lt!276708 () Unit!12961)

(assert (=> d!62827 (= lt!276720 lt!276708)))

(assert (=> d!62827 (= lt!276708 (lemmaIsPrefixRefl!0 (_2!8432 lt!276601)))))

(declare-fun lt!276710 () Unit!12961)

(declare-fun lt!276722 () Unit!12961)

(assert (=> d!62827 (= lt!276710 lt!276722)))

(assert (=> d!62827 (isPrefixOf!0 lt!276711 lt!276711)))

(assert (=> d!62827 (= lt!276722 (lemmaIsPrefixRefl!0 lt!276711))))

(declare-fun lt!276714 () Unit!12961)

(declare-fun lt!276715 () Unit!12961)

(assert (=> d!62827 (= lt!276714 lt!276715)))

(assert (=> d!62827 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!62827 (= lt!276715 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!62827 (= lt!276711 (BitStream!7651 (buf!4714 (_2!8432 lt!276601)) (currentByte!8924 thiss!1204) (currentBit!8919 thiss!1204)))))

(assert (=> d!62827 (isPrefixOf!0 thiss!1204 (_2!8432 lt!276601))))

(assert (=> d!62827 (= (reader!0 thiss!1204 (_2!8432 lt!276601)) lt!276713)))

(declare-fun b!180549 () Bool)

(declare-fun Unit!12966 () Unit!12961)

(assert (=> b!180549 (= e!125466 Unit!12966)))

(declare-fun b!180550 () Bool)

(declare-fun res!149925 () Bool)

(assert (=> b!180550 (=> (not res!149925) (not e!125467))))

(assert (=> b!180550 (= res!149925 (isPrefixOf!0 (_1!8431 lt!276713) thiss!1204))))

(declare-fun lt!276706 () (_ BitVec 64))

(declare-fun lt!276707 () (_ BitVec 64))

(declare-fun b!180551 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!7650 (_ BitVec 64)) BitStream!7650)

(assert (=> b!180551 (= e!125467 (= (_1!8431 lt!276713) (withMovedBitIndex!0 (_2!8431 lt!276713) (bvsub lt!276707 lt!276706))))))

(assert (=> b!180551 (or (= (bvand lt!276707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!276706 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!276707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!276707 lt!276706) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!180551 (= lt!276706 (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!276601))) (currentByte!8924 (_2!8432 lt!276601)) (currentBit!8919 (_2!8432 lt!276601))))))

(assert (=> b!180551 (= lt!276707 (bitIndex!0 (size!4271 (buf!4714 thiss!1204)) (currentByte!8924 thiss!1204) (currentBit!8919 thiss!1204)))))

(declare-fun b!180552 () Bool)

(declare-fun res!149926 () Bool)

(assert (=> b!180552 (=> (not res!149926) (not e!125467))))

(assert (=> b!180552 (= res!149926 (isPrefixOf!0 (_2!8431 lt!276713) (_2!8432 lt!276601)))))

(assert (= (and d!62827 c!9309) b!180548))

(assert (= (and d!62827 (not c!9309)) b!180549))

(assert (= (and d!62827 res!149924) b!180550))

(assert (= (and b!180550 res!149925) b!180552))

(assert (= (and b!180552 res!149926) b!180551))

(declare-fun m!281009 () Bool)

(assert (=> b!180552 m!281009))

(assert (=> b!180548 m!280931))

(declare-fun m!281011 () Bool)

(assert (=> b!180548 m!281011))

(declare-fun m!281013 () Bool)

(assert (=> b!180548 m!281013))

(declare-fun m!281015 () Bool)

(assert (=> b!180550 m!281015))

(declare-fun m!281017 () Bool)

(assert (=> b!180551 m!281017))

(assert (=> b!180551 m!280891))

(assert (=> b!180551 m!280931))

(declare-fun m!281019 () Bool)

(assert (=> d!62827 m!281019))

(declare-fun m!281021 () Bool)

(assert (=> d!62827 m!281021))

(declare-fun m!281023 () Bool)

(assert (=> d!62827 m!281023))

(declare-fun m!281025 () Bool)

(assert (=> d!62827 m!281025))

(declare-fun m!281027 () Bool)

(assert (=> d!62827 m!281027))

(declare-fun m!281029 () Bool)

(assert (=> d!62827 m!281029))

(declare-fun m!281031 () Bool)

(assert (=> d!62827 m!281031))

(declare-fun m!281033 () Bool)

(assert (=> d!62827 m!281033))

(declare-fun m!281035 () Bool)

(assert (=> d!62827 m!281035))

(declare-fun m!281037 () Bool)

(assert (=> d!62827 m!281037))

(assert (=> d!62827 m!280893))

(assert (=> b!180468 d!62827))

(declare-fun d!62829 () Bool)

(declare-fun lt!276723 () tuple2!15584)

(assert (=> d!62829 (= lt!276723 (readBit!0 (_1!8431 lt!276605)))))

(assert (=> d!62829 (= (readBitPure!0 (_1!8431 lt!276605)) (tuple2!15577 (_2!8437 lt!276723) (_1!8437 lt!276723)))))

(declare-fun bs!15669 () Bool)

(assert (= bs!15669 d!62829))

(declare-fun m!281039 () Bool)

(assert (=> bs!15669 m!281039))

(assert (=> b!180468 d!62829))

(declare-fun d!62831 () Bool)

(declare-fun e!125470 () Bool)

(assert (=> d!62831 e!125470))

(declare-fun res!149932 () Bool)

(assert (=> d!62831 (=> (not res!149932) (not e!125470))))

(declare-fun lt!276740 () (_ BitVec 64))

(declare-fun lt!276737 () (_ BitVec 64))

(declare-fun lt!276739 () (_ BitVec 64))

(assert (=> d!62831 (= res!149932 (= lt!276740 (bvsub lt!276739 lt!276737)))))

(assert (=> d!62831 (or (= (bvand lt!276739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!276737 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!276739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!276739 lt!276737) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!62831 (= lt!276737 (remainingBits!0 ((_ sign_extend 32) (size!4271 (buf!4714 (_1!8433 lt!276594)))) ((_ sign_extend 32) (currentByte!8924 (_1!8433 lt!276594))) ((_ sign_extend 32) (currentBit!8919 (_1!8433 lt!276594)))))))

(declare-fun lt!276736 () (_ BitVec 64))

(declare-fun lt!276738 () (_ BitVec 64))

(assert (=> d!62831 (= lt!276739 (bvmul lt!276736 lt!276738))))

(assert (=> d!62831 (or (= lt!276736 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!276738 (bvsdiv (bvmul lt!276736 lt!276738) lt!276736)))))

(assert (=> d!62831 (= lt!276738 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62831 (= lt!276736 ((_ sign_extend 32) (size!4271 (buf!4714 (_1!8433 lt!276594)))))))

(assert (=> d!62831 (= lt!276740 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8924 (_1!8433 lt!276594))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8919 (_1!8433 lt!276594)))))))

(assert (=> d!62831 (invariant!0 (currentBit!8919 (_1!8433 lt!276594)) (currentByte!8924 (_1!8433 lt!276594)) (size!4271 (buf!4714 (_1!8433 lt!276594))))))

(assert (=> d!62831 (= (bitIndex!0 (size!4271 (buf!4714 (_1!8433 lt!276594))) (currentByte!8924 (_1!8433 lt!276594)) (currentBit!8919 (_1!8433 lt!276594))) lt!276740)))

(declare-fun b!180557 () Bool)

(declare-fun res!149931 () Bool)

(assert (=> b!180557 (=> (not res!149931) (not e!125470))))

(assert (=> b!180557 (= res!149931 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!276740))))

(declare-fun b!180558 () Bool)

(declare-fun lt!276741 () (_ BitVec 64))

(assert (=> b!180558 (= e!125470 (bvsle lt!276740 (bvmul lt!276741 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!180558 (or (= lt!276741 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!276741 #b0000000000000000000000000000000000000000000000000000000000001000) lt!276741)))))

(assert (=> b!180558 (= lt!276741 ((_ sign_extend 32) (size!4271 (buf!4714 (_1!8433 lt!276594)))))))

(assert (= (and d!62831 res!149932) b!180557))

(assert (= (and b!180557 res!149931) b!180558))

(declare-fun m!281041 () Bool)

(assert (=> d!62831 m!281041))

(declare-fun m!281043 () Bool)

(assert (=> d!62831 m!281043))

(assert (=> b!180468 d!62831))

(declare-fun d!62833 () Bool)

(assert (=> d!62833 (validate_offset_bits!1 ((_ sign_extend 32) (size!4271 (buf!4714 (_2!8432 lt!276601)))) ((_ sign_extend 32) (currentByte!8924 thiss!1204)) ((_ sign_extend 32) (currentBit!8919 thiss!1204)) lt!276596)))

(declare-fun lt!276744 () Unit!12961)

(declare-fun choose!9 (BitStream!7650 array!9682 (_ BitVec 64) BitStream!7650) Unit!12961)

(assert (=> d!62833 (= lt!276744 (choose!9 thiss!1204 (buf!4714 (_2!8432 lt!276601)) lt!276596 (BitStream!7651 (buf!4714 (_2!8432 lt!276601)) (currentByte!8924 thiss!1204) (currentBit!8919 thiss!1204))))))

(assert (=> d!62833 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4714 (_2!8432 lt!276601)) lt!276596) lt!276744)))

(declare-fun bs!15670 () Bool)

(assert (= bs!15670 d!62833))

(assert (=> bs!15670 m!280915))

(declare-fun m!281045 () Bool)

(assert (=> bs!15670 m!281045))

(assert (=> b!180468 d!62833))

(declare-fun d!62835 () Bool)

(declare-fun e!125473 () Bool)

(assert (=> d!62835 e!125473))

(declare-fun res!149935 () Bool)

(assert (=> d!62835 (=> (not res!149935) (not e!125473))))

(declare-fun lt!276756 () tuple2!15576)

(declare-fun lt!276754 () tuple2!15576)

(assert (=> d!62835 (= res!149935 (= (bitIndex!0 (size!4271 (buf!4714 (_1!8433 lt!276756))) (currentByte!8924 (_1!8433 lt!276756)) (currentBit!8919 (_1!8433 lt!276756))) (bitIndex!0 (size!4271 (buf!4714 (_1!8433 lt!276754))) (currentByte!8924 (_1!8433 lt!276754)) (currentBit!8919 (_1!8433 lt!276754)))))))

(declare-fun lt!276753 () BitStream!7650)

(declare-fun lt!276755 () Unit!12961)

(declare-fun choose!50 (BitStream!7650 BitStream!7650 BitStream!7650 tuple2!15576 tuple2!15576 BitStream!7650 Bool tuple2!15576 tuple2!15576 BitStream!7650 Bool) Unit!12961)

(assert (=> d!62835 (= lt!276755 (choose!50 lt!276593 (_2!8432 lt!276601) lt!276753 lt!276756 (tuple2!15577 (_1!8433 lt!276756) (_2!8433 lt!276756)) (_1!8433 lt!276756) (_2!8433 lt!276756) lt!276754 (tuple2!15577 (_1!8433 lt!276754) (_2!8433 lt!276754)) (_1!8433 lt!276754) (_2!8433 lt!276754)))))

(assert (=> d!62835 (= lt!276754 (readBitPure!0 lt!276753))))

(assert (=> d!62835 (= lt!276756 (readBitPure!0 lt!276593))))

(assert (=> d!62835 (= lt!276753 (BitStream!7651 (buf!4714 (_2!8432 lt!276601)) (currentByte!8924 lt!276593) (currentBit!8919 lt!276593)))))

(assert (=> d!62835 (invariant!0 (currentBit!8919 lt!276593) (currentByte!8924 lt!276593) (size!4271 (buf!4714 (_2!8432 lt!276601))))))

(assert (=> d!62835 (= (readBitPrefixLemma!0 lt!276593 (_2!8432 lt!276601)) lt!276755)))

(declare-fun b!180561 () Bool)

(assert (=> b!180561 (= e!125473 (= (_2!8433 lt!276756) (_2!8433 lt!276754)))))

(assert (= (and d!62835 res!149935) b!180561))

(declare-fun m!281047 () Bool)

(assert (=> d!62835 m!281047))

(declare-fun m!281049 () Bool)

(assert (=> d!62835 m!281049))

(assert (=> d!62835 m!280905))

(declare-fun m!281051 () Bool)

(assert (=> d!62835 m!281051))

(declare-fun m!281053 () Bool)

(assert (=> d!62835 m!281053))

(declare-fun m!281055 () Bool)

(assert (=> d!62835 m!281055))

(assert (=> b!180468 d!62835))

(declare-fun d!62837 () Bool)

(declare-fun lt!276757 () tuple2!15584)

(assert (=> d!62837 (= lt!276757 (readBit!0 lt!276593))))

(assert (=> d!62837 (= (readBitPure!0 lt!276593) (tuple2!15577 (_2!8437 lt!276757) (_1!8437 lt!276757)))))

(declare-fun bs!15671 () Bool)

(assert (= bs!15671 d!62837))

(declare-fun m!281057 () Bool)

(assert (=> bs!15671 m!281057))

(assert (=> b!180468 d!62837))

(declare-fun d!62839 () Bool)

(assert (=> d!62839 (= (invariant!0 (currentBit!8919 thiss!1204) (currentByte!8924 thiss!1204) (size!4271 (buf!4714 (_2!8432 lt!276600)))) (and (bvsge (currentBit!8919 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8919 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8924 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8924 thiss!1204) (size!4271 (buf!4714 (_2!8432 lt!276600)))) (and (= (currentBit!8919 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8924 thiss!1204) (size!4271 (buf!4714 (_2!8432 lt!276600))))))))))

(assert (=> b!180468 d!62839))

(declare-fun d!62841 () Bool)

(declare-fun e!125474 () Bool)

(assert (=> d!62841 e!125474))

(declare-fun res!149937 () Bool)

(assert (=> d!62841 (=> (not res!149937) (not e!125474))))

(declare-fun lt!276762 () (_ BitVec 64))

(declare-fun lt!276759 () (_ BitVec 64))

(declare-fun lt!276761 () (_ BitVec 64))

(assert (=> d!62841 (= res!149937 (= lt!276762 (bvsub lt!276761 lt!276759)))))

(assert (=> d!62841 (or (= (bvand lt!276761 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!276759 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!276761 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!276761 lt!276759) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62841 (= lt!276759 (remainingBits!0 ((_ sign_extend 32) (size!4271 (buf!4714 (_1!8433 lt!276604)))) ((_ sign_extend 32) (currentByte!8924 (_1!8433 lt!276604))) ((_ sign_extend 32) (currentBit!8919 (_1!8433 lt!276604)))))))

(declare-fun lt!276758 () (_ BitVec 64))

(declare-fun lt!276760 () (_ BitVec 64))

(assert (=> d!62841 (= lt!276761 (bvmul lt!276758 lt!276760))))

(assert (=> d!62841 (or (= lt!276758 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!276760 (bvsdiv (bvmul lt!276758 lt!276760) lt!276758)))))

(assert (=> d!62841 (= lt!276760 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62841 (= lt!276758 ((_ sign_extend 32) (size!4271 (buf!4714 (_1!8433 lt!276604)))))))

(assert (=> d!62841 (= lt!276762 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8924 (_1!8433 lt!276604))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8919 (_1!8433 lt!276604)))))))

(assert (=> d!62841 (invariant!0 (currentBit!8919 (_1!8433 lt!276604)) (currentByte!8924 (_1!8433 lt!276604)) (size!4271 (buf!4714 (_1!8433 lt!276604))))))

(assert (=> d!62841 (= (bitIndex!0 (size!4271 (buf!4714 (_1!8433 lt!276604))) (currentByte!8924 (_1!8433 lt!276604)) (currentBit!8919 (_1!8433 lt!276604))) lt!276762)))

(declare-fun b!180562 () Bool)

(declare-fun res!149936 () Bool)

(assert (=> b!180562 (=> (not res!149936) (not e!125474))))

(assert (=> b!180562 (= res!149936 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!276762))))

(declare-fun b!180563 () Bool)

(declare-fun lt!276763 () (_ BitVec 64))

(assert (=> b!180563 (= e!125474 (bvsle lt!276762 (bvmul lt!276763 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!180563 (or (= lt!276763 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!276763 #b0000000000000000000000000000000000000000000000000000000000001000) lt!276763)))))

(assert (=> b!180563 (= lt!276763 ((_ sign_extend 32) (size!4271 (buf!4714 (_1!8433 lt!276604)))))))

(assert (= (and d!62841 res!149937) b!180562))

(assert (= (and b!180562 res!149936) b!180563))

(declare-fun m!281059 () Bool)

(assert (=> d!62841 m!281059))

(declare-fun m!281061 () Bool)

(assert (=> d!62841 m!281061))

(assert (=> b!180468 d!62841))

(declare-fun d!62843 () Bool)

(assert (=> d!62843 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4271 (buf!4714 (_1!8431 lt!276605)))) ((_ sign_extend 32) (currentByte!8924 (_1!8431 lt!276605))) ((_ sign_extend 32) (currentBit!8919 (_1!8431 lt!276605))) lt!276596) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4271 (buf!4714 (_1!8431 lt!276605)))) ((_ sign_extend 32) (currentByte!8924 (_1!8431 lt!276605))) ((_ sign_extend 32) (currentBit!8919 (_1!8431 lt!276605)))) lt!276596))))

(declare-fun bs!15672 () Bool)

(assert (= bs!15672 d!62843))

(declare-fun m!281063 () Bool)

(assert (=> bs!15672 m!281063))

(assert (=> b!180468 d!62843))

(declare-fun d!62845 () Bool)

(declare-fun lt!276764 () tuple2!15584)

(assert (=> d!62845 (= lt!276764 (readBit!0 (BitStream!7651 (buf!4714 (_2!8432 lt!276601)) (currentByte!8924 thiss!1204) (currentBit!8919 thiss!1204))))))

(assert (=> d!62845 (= (readBitPure!0 (BitStream!7651 (buf!4714 (_2!8432 lt!276601)) (currentByte!8924 thiss!1204) (currentBit!8919 thiss!1204))) (tuple2!15577 (_2!8437 lt!276764) (_1!8437 lt!276764)))))

(declare-fun bs!15673 () Bool)

(assert (= bs!15673 d!62845))

(declare-fun m!281065 () Bool)

(assert (=> bs!15673 m!281065))

(assert (=> b!180468 d!62845))

(declare-fun b!180564 () Bool)

(declare-fun e!125475 () Unit!12961)

(declare-fun lt!276767 () Unit!12961)

(assert (=> b!180564 (= e!125475 lt!276767)))

(declare-fun lt!276774 () (_ BitVec 64))

(assert (=> b!180564 (= lt!276774 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!276778 () (_ BitVec 64))

(assert (=> b!180564 (= lt!276778 (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!276600))) (currentByte!8924 (_2!8432 lt!276600)) (currentBit!8919 (_2!8432 lt!276600))))))

(assert (=> b!180564 (= lt!276767 (arrayBitRangesEqSymmetric!0 (buf!4714 (_2!8432 lt!276600)) (buf!4714 (_2!8432 lt!276601)) lt!276774 lt!276778))))

(assert (=> b!180564 (arrayBitRangesEq!0 (buf!4714 (_2!8432 lt!276601)) (buf!4714 (_2!8432 lt!276600)) lt!276774 lt!276778)))

(declare-fun d!62847 () Bool)

(declare-fun e!125476 () Bool)

(assert (=> d!62847 e!125476))

(declare-fun res!149938 () Bool)

(assert (=> d!62847 (=> (not res!149938) (not e!125476))))

(declare-fun lt!276775 () tuple2!15572)

(assert (=> d!62847 (= res!149938 (isPrefixOf!0 (_1!8431 lt!276775) (_2!8431 lt!276775)))))

(declare-fun lt!276773 () BitStream!7650)

(assert (=> d!62847 (= lt!276775 (tuple2!15573 lt!276773 (_2!8432 lt!276601)))))

(declare-fun lt!276780 () Unit!12961)

(declare-fun lt!276779 () Unit!12961)

(assert (=> d!62847 (= lt!276780 lt!276779)))

(assert (=> d!62847 (isPrefixOf!0 lt!276773 (_2!8432 lt!276601))))

(assert (=> d!62847 (= lt!276779 (lemmaIsPrefixTransitive!0 lt!276773 (_2!8432 lt!276601) (_2!8432 lt!276601)))))

(declare-fun lt!276783 () Unit!12961)

(declare-fun lt!276781 () Unit!12961)

(assert (=> d!62847 (= lt!276783 lt!276781)))

(assert (=> d!62847 (isPrefixOf!0 lt!276773 (_2!8432 lt!276601))))

(assert (=> d!62847 (= lt!276781 (lemmaIsPrefixTransitive!0 lt!276773 (_2!8432 lt!276600) (_2!8432 lt!276601)))))

(declare-fun lt!276771 () Unit!12961)

(assert (=> d!62847 (= lt!276771 e!125475)))

(declare-fun c!9310 () Bool)

(assert (=> d!62847 (= c!9310 (not (= (size!4271 (buf!4714 (_2!8432 lt!276600))) #b00000000000000000000000000000000)))))

(declare-fun lt!276766 () Unit!12961)

(declare-fun lt!276765 () Unit!12961)

(assert (=> d!62847 (= lt!276766 lt!276765)))

(assert (=> d!62847 (isPrefixOf!0 (_2!8432 lt!276601) (_2!8432 lt!276601))))

(assert (=> d!62847 (= lt!276765 (lemmaIsPrefixRefl!0 (_2!8432 lt!276601)))))

(declare-fun lt!276782 () Unit!12961)

(declare-fun lt!276770 () Unit!12961)

(assert (=> d!62847 (= lt!276782 lt!276770)))

(assert (=> d!62847 (= lt!276770 (lemmaIsPrefixRefl!0 (_2!8432 lt!276601)))))

(declare-fun lt!276772 () Unit!12961)

(declare-fun lt!276784 () Unit!12961)

(assert (=> d!62847 (= lt!276772 lt!276784)))

(assert (=> d!62847 (isPrefixOf!0 lt!276773 lt!276773)))

(assert (=> d!62847 (= lt!276784 (lemmaIsPrefixRefl!0 lt!276773))))

(declare-fun lt!276776 () Unit!12961)

(declare-fun lt!276777 () Unit!12961)

(assert (=> d!62847 (= lt!276776 lt!276777)))

(assert (=> d!62847 (isPrefixOf!0 (_2!8432 lt!276600) (_2!8432 lt!276600))))

(assert (=> d!62847 (= lt!276777 (lemmaIsPrefixRefl!0 (_2!8432 lt!276600)))))

(assert (=> d!62847 (= lt!276773 (BitStream!7651 (buf!4714 (_2!8432 lt!276601)) (currentByte!8924 (_2!8432 lt!276600)) (currentBit!8919 (_2!8432 lt!276600))))))

(assert (=> d!62847 (isPrefixOf!0 (_2!8432 lt!276600) (_2!8432 lt!276601))))

(assert (=> d!62847 (= (reader!0 (_2!8432 lt!276600) (_2!8432 lt!276601)) lt!276775)))

(declare-fun b!180565 () Bool)

(declare-fun Unit!12968 () Unit!12961)

(assert (=> b!180565 (= e!125475 Unit!12968)))

(declare-fun b!180566 () Bool)

(declare-fun res!149939 () Bool)

(assert (=> b!180566 (=> (not res!149939) (not e!125476))))

(assert (=> b!180566 (= res!149939 (isPrefixOf!0 (_1!8431 lt!276775) (_2!8432 lt!276600)))))

(declare-fun b!180567 () Bool)

(declare-fun lt!276769 () (_ BitVec 64))

(declare-fun lt!276768 () (_ BitVec 64))

(assert (=> b!180567 (= e!125476 (= (_1!8431 lt!276775) (withMovedBitIndex!0 (_2!8431 lt!276775) (bvsub lt!276769 lt!276768))))))

(assert (=> b!180567 (or (= (bvand lt!276769 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!276768 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!276769 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!276769 lt!276768) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!180567 (= lt!276768 (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!276601))) (currentByte!8924 (_2!8432 lt!276601)) (currentBit!8919 (_2!8432 lt!276601))))))

(assert (=> b!180567 (= lt!276769 (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!276600))) (currentByte!8924 (_2!8432 lt!276600)) (currentBit!8919 (_2!8432 lt!276600))))))

(declare-fun b!180568 () Bool)

(declare-fun res!149940 () Bool)

(assert (=> b!180568 (=> (not res!149940) (not e!125476))))

(assert (=> b!180568 (= res!149940 (isPrefixOf!0 (_2!8431 lt!276775) (_2!8432 lt!276601)))))

(assert (= (and d!62847 c!9310) b!180564))

(assert (= (and d!62847 (not c!9310)) b!180565))

(assert (= (and d!62847 res!149938) b!180566))

(assert (= (and b!180566 res!149939) b!180568))

(assert (= (and b!180568 res!149940) b!180567))

(declare-fun m!281067 () Bool)

(assert (=> b!180568 m!281067))

(assert (=> b!180564 m!280929))

(declare-fun m!281069 () Bool)

(assert (=> b!180564 m!281069))

(declare-fun m!281071 () Bool)

(assert (=> b!180564 m!281071))

(declare-fun m!281073 () Bool)

(assert (=> b!180566 m!281073))

(declare-fun m!281075 () Bool)

(assert (=> b!180567 m!281075))

(assert (=> b!180567 m!280891))

(assert (=> b!180567 m!280929))

(declare-fun m!281077 () Bool)

(assert (=> d!62847 m!281077))

(declare-fun m!281079 () Bool)

(assert (=> d!62847 m!281079))

(declare-fun m!281081 () Bool)

(assert (=> d!62847 m!281081))

(declare-fun m!281083 () Bool)

(assert (=> d!62847 m!281083))

(declare-fun m!281085 () Bool)

(assert (=> d!62847 m!281085))

(declare-fun m!281087 () Bool)

(assert (=> d!62847 m!281087))

(declare-fun m!281089 () Bool)

(assert (=> d!62847 m!281089))

(assert (=> d!62847 m!281033))

(declare-fun m!281091 () Bool)

(assert (=> d!62847 m!281091))

(assert (=> d!62847 m!281037))

(assert (=> d!62847 m!280927))

(assert (=> b!180468 d!62847))

(declare-fun d!62849 () Bool)

(assert (=> d!62849 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4271 (buf!4714 (_2!8432 lt!276601)))) ((_ sign_extend 32) (currentByte!8924 thiss!1204)) ((_ sign_extend 32) (currentBit!8919 thiss!1204)) lt!276596) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4271 (buf!4714 (_2!8432 lt!276601)))) ((_ sign_extend 32) (currentByte!8924 thiss!1204)) ((_ sign_extend 32) (currentBit!8919 thiss!1204))) lt!276596))))

(declare-fun bs!15674 () Bool)

(assert (= bs!15674 d!62849))

(declare-fun m!281093 () Bool)

(assert (=> bs!15674 m!281093))

(assert (=> b!180468 d!62849))

(declare-fun d!62851 () Bool)

(declare-fun res!149949 () Bool)

(declare-fun e!125481 () Bool)

(assert (=> d!62851 (=> (not res!149949) (not e!125481))))

(assert (=> d!62851 (= res!149949 (= (size!4271 (buf!4714 thiss!1204)) (size!4271 (buf!4714 (_2!8432 lt!276600)))))))

(assert (=> d!62851 (= (isPrefixOf!0 thiss!1204 (_2!8432 lt!276600)) e!125481)))

(declare-fun b!180575 () Bool)

(declare-fun res!149948 () Bool)

(assert (=> b!180575 (=> (not res!149948) (not e!125481))))

(assert (=> b!180575 (= res!149948 (bvsle (bitIndex!0 (size!4271 (buf!4714 thiss!1204)) (currentByte!8924 thiss!1204) (currentBit!8919 thiss!1204)) (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!276600))) (currentByte!8924 (_2!8432 lt!276600)) (currentBit!8919 (_2!8432 lt!276600)))))))

(declare-fun b!180576 () Bool)

(declare-fun e!125482 () Bool)

(assert (=> b!180576 (= e!125481 e!125482)))

(declare-fun res!149947 () Bool)

(assert (=> b!180576 (=> res!149947 e!125482)))

(assert (=> b!180576 (= res!149947 (= (size!4271 (buf!4714 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!180577 () Bool)

(assert (=> b!180577 (= e!125482 (arrayBitRangesEq!0 (buf!4714 thiss!1204) (buf!4714 (_2!8432 lt!276600)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4271 (buf!4714 thiss!1204)) (currentByte!8924 thiss!1204) (currentBit!8919 thiss!1204))))))

(assert (= (and d!62851 res!149949) b!180575))

(assert (= (and b!180575 res!149948) b!180576))

(assert (= (and b!180576 (not res!149947)) b!180577))

(assert (=> b!180575 m!280931))

(assert (=> b!180575 m!280929))

(assert (=> b!180577 m!280931))

(assert (=> b!180577 m!280931))

(declare-fun m!281095 () Bool)

(assert (=> b!180577 m!281095))

(assert (=> b!180479 d!62851))

(declare-fun d!62853 () Bool)

(declare-fun e!125483 () Bool)

(assert (=> d!62853 e!125483))

(declare-fun res!149951 () Bool)

(assert (=> d!62853 (=> (not res!149951) (not e!125483))))

(declare-fun lt!276789 () (_ BitVec 64))

(declare-fun lt!276788 () (_ BitVec 64))

(declare-fun lt!276786 () (_ BitVec 64))

(assert (=> d!62853 (= res!149951 (= lt!276789 (bvsub lt!276788 lt!276786)))))

(assert (=> d!62853 (or (= (bvand lt!276788 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!276786 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!276788 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!276788 lt!276786) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62853 (= lt!276786 (remainingBits!0 ((_ sign_extend 32) (size!4271 (buf!4714 (_1!8433 lt!276599)))) ((_ sign_extend 32) (currentByte!8924 (_1!8433 lt!276599))) ((_ sign_extend 32) (currentBit!8919 (_1!8433 lt!276599)))))))

(declare-fun lt!276785 () (_ BitVec 64))

(declare-fun lt!276787 () (_ BitVec 64))

(assert (=> d!62853 (= lt!276788 (bvmul lt!276785 lt!276787))))

(assert (=> d!62853 (or (= lt!276785 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!276787 (bvsdiv (bvmul lt!276785 lt!276787) lt!276785)))))

(assert (=> d!62853 (= lt!276787 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62853 (= lt!276785 ((_ sign_extend 32) (size!4271 (buf!4714 (_1!8433 lt!276599)))))))

(assert (=> d!62853 (= lt!276789 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8924 (_1!8433 lt!276599))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8919 (_1!8433 lt!276599)))))))

(assert (=> d!62853 (invariant!0 (currentBit!8919 (_1!8433 lt!276599)) (currentByte!8924 (_1!8433 lt!276599)) (size!4271 (buf!4714 (_1!8433 lt!276599))))))

(assert (=> d!62853 (= (bitIndex!0 (size!4271 (buf!4714 (_1!8433 lt!276599))) (currentByte!8924 (_1!8433 lt!276599)) (currentBit!8919 (_1!8433 lt!276599))) lt!276789)))

(declare-fun b!180578 () Bool)

(declare-fun res!149950 () Bool)

(assert (=> b!180578 (=> (not res!149950) (not e!125483))))

(assert (=> b!180578 (= res!149950 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!276789))))

(declare-fun b!180579 () Bool)

(declare-fun lt!276790 () (_ BitVec 64))

(assert (=> b!180579 (= e!125483 (bvsle lt!276789 (bvmul lt!276790 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!180579 (or (= lt!276790 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!276790 #b0000000000000000000000000000000000000000000000000000000000001000) lt!276790)))))

(assert (=> b!180579 (= lt!276790 ((_ sign_extend 32) (size!4271 (buf!4714 (_1!8433 lt!276599)))))))

(assert (= (and d!62853 res!149951) b!180578))

(assert (= (and b!180578 res!149950) b!180579))

(declare-fun m!281097 () Bool)

(assert (=> d!62853 m!281097))

(declare-fun m!281099 () Bool)

(assert (=> d!62853 m!281099))

(assert (=> b!180469 d!62853))

(declare-fun d!62855 () Bool)

(declare-fun e!125484 () Bool)

(assert (=> d!62855 e!125484))

(declare-fun res!149953 () Bool)

(assert (=> d!62855 (=> (not res!149953) (not e!125484))))

(declare-fun lt!276795 () (_ BitVec 64))

(declare-fun lt!276792 () (_ BitVec 64))

(declare-fun lt!276794 () (_ BitVec 64))

(assert (=> d!62855 (= res!149953 (= lt!276795 (bvsub lt!276794 lt!276792)))))

(assert (=> d!62855 (or (= (bvand lt!276794 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!276792 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!276794 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!276794 lt!276792) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62855 (= lt!276792 (remainingBits!0 ((_ sign_extend 32) (size!4271 (buf!4714 (_2!8432 lt!276600)))) ((_ sign_extend 32) (currentByte!8924 (_2!8432 lt!276600))) ((_ sign_extend 32) (currentBit!8919 (_2!8432 lt!276600)))))))

(declare-fun lt!276791 () (_ BitVec 64))

(declare-fun lt!276793 () (_ BitVec 64))

(assert (=> d!62855 (= lt!276794 (bvmul lt!276791 lt!276793))))

(assert (=> d!62855 (or (= lt!276791 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!276793 (bvsdiv (bvmul lt!276791 lt!276793) lt!276791)))))

(assert (=> d!62855 (= lt!276793 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62855 (= lt!276791 ((_ sign_extend 32) (size!4271 (buf!4714 (_2!8432 lt!276600)))))))

(assert (=> d!62855 (= lt!276795 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8924 (_2!8432 lt!276600))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8919 (_2!8432 lt!276600)))))))

(assert (=> d!62855 (invariant!0 (currentBit!8919 (_2!8432 lt!276600)) (currentByte!8924 (_2!8432 lt!276600)) (size!4271 (buf!4714 (_2!8432 lt!276600))))))

(assert (=> d!62855 (= (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!276600))) (currentByte!8924 (_2!8432 lt!276600)) (currentBit!8919 (_2!8432 lt!276600))) lt!276795)))

(declare-fun b!180580 () Bool)

(declare-fun res!149952 () Bool)

(assert (=> b!180580 (=> (not res!149952) (not e!125484))))

(assert (=> b!180580 (= res!149952 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!276795))))

(declare-fun b!180581 () Bool)

(declare-fun lt!276796 () (_ BitVec 64))

(assert (=> b!180581 (= e!125484 (bvsle lt!276795 (bvmul lt!276796 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!180581 (or (= lt!276796 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!276796 #b0000000000000000000000000000000000000000000000000000000000001000) lt!276796)))))

(assert (=> b!180581 (= lt!276796 ((_ sign_extend 32) (size!4271 (buf!4714 (_2!8432 lt!276600)))))))

(assert (= (and d!62855 res!149953) b!180580))

(assert (= (and b!180580 res!149952) b!180581))

(declare-fun m!281101 () Bool)

(assert (=> d!62855 m!281101))

(assert (=> d!62855 m!281007))

(assert (=> b!180480 d!62855))

(declare-fun d!62857 () Bool)

(declare-fun e!125485 () Bool)

(assert (=> d!62857 e!125485))

(declare-fun res!149955 () Bool)

(assert (=> d!62857 (=> (not res!149955) (not e!125485))))

(declare-fun lt!276801 () (_ BitVec 64))

(declare-fun lt!276800 () (_ BitVec 64))

(declare-fun lt!276798 () (_ BitVec 64))

(assert (=> d!62857 (= res!149955 (= lt!276801 (bvsub lt!276800 lt!276798)))))

(assert (=> d!62857 (or (= (bvand lt!276800 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!276798 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!276800 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!276800 lt!276798) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62857 (= lt!276798 (remainingBits!0 ((_ sign_extend 32) (size!4271 (buf!4714 thiss!1204))) ((_ sign_extend 32) (currentByte!8924 thiss!1204)) ((_ sign_extend 32) (currentBit!8919 thiss!1204))))))

(declare-fun lt!276797 () (_ BitVec 64))

(declare-fun lt!276799 () (_ BitVec 64))

(assert (=> d!62857 (= lt!276800 (bvmul lt!276797 lt!276799))))

(assert (=> d!62857 (or (= lt!276797 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!276799 (bvsdiv (bvmul lt!276797 lt!276799) lt!276797)))))

(assert (=> d!62857 (= lt!276799 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62857 (= lt!276797 ((_ sign_extend 32) (size!4271 (buf!4714 thiss!1204))))))

(assert (=> d!62857 (= lt!276801 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8924 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8919 thiss!1204))))))

(assert (=> d!62857 (invariant!0 (currentBit!8919 thiss!1204) (currentByte!8924 thiss!1204) (size!4271 (buf!4714 thiss!1204)))))

(assert (=> d!62857 (= (bitIndex!0 (size!4271 (buf!4714 thiss!1204)) (currentByte!8924 thiss!1204) (currentBit!8919 thiss!1204)) lt!276801)))

(declare-fun b!180582 () Bool)

(declare-fun res!149954 () Bool)

(assert (=> b!180582 (=> (not res!149954) (not e!125485))))

(assert (=> b!180582 (= res!149954 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!276801))))

(declare-fun b!180583 () Bool)

(declare-fun lt!276802 () (_ BitVec 64))

(assert (=> b!180583 (= e!125485 (bvsle lt!276801 (bvmul lt!276802 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!180583 (or (= lt!276802 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!276802 #b0000000000000000000000000000000000000000000000000000000000001000) lt!276802)))))

(assert (=> b!180583 (= lt!276802 ((_ sign_extend 32) (size!4271 (buf!4714 thiss!1204))))))

(assert (= (and d!62857 res!149955) b!180582))

(assert (= (and b!180582 res!149954) b!180583))

(declare-fun m!281103 () Bool)

(assert (=> d!62857 m!281103))

(assert (=> d!62857 m!280939))

(assert (=> b!180480 d!62857))

(declare-fun b!180593 () Bool)

(declare-fun res!149965 () Bool)

(declare-fun e!125490 () Bool)

(assert (=> b!180593 (=> (not res!149965) (not e!125490))))

(declare-fun lt!276814 () (_ BitVec 64))

(declare-fun lt!276812 () (_ BitVec 64))

(declare-fun lt!276811 () tuple2!15574)

(assert (=> b!180593 (= res!149965 (= (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!276811))) (currentByte!8924 (_2!8432 lt!276811)) (currentBit!8919 (_2!8432 lt!276811))) (bvadd lt!276814 lt!276812)))))

(assert (=> b!180593 (or (not (= (bvand lt!276814 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!276812 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!276814 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!276814 lt!276812) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!180593 (= lt!276812 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!180593 (= lt!276814 (bitIndex!0 (size!4271 (buf!4714 thiss!1204)) (currentByte!8924 thiss!1204) (currentBit!8919 thiss!1204)))))

(declare-fun d!62859 () Bool)

(assert (=> d!62859 e!125490))

(declare-fun res!149964 () Bool)

(assert (=> d!62859 (=> (not res!149964) (not e!125490))))

(assert (=> d!62859 (= res!149964 (= (size!4271 (buf!4714 thiss!1204)) (size!4271 (buf!4714 (_2!8432 lt!276811)))))))

(declare-fun choose!16 (BitStream!7650 Bool) tuple2!15574)

(assert (=> d!62859 (= lt!276811 (choose!16 thiss!1204 lt!276589))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!62859 (validate_offset_bit!0 ((_ sign_extend 32) (size!4271 (buf!4714 thiss!1204))) ((_ sign_extend 32) (currentByte!8924 thiss!1204)) ((_ sign_extend 32) (currentBit!8919 thiss!1204)))))

(assert (=> d!62859 (= (appendBit!0 thiss!1204 lt!276589) lt!276811)))

(declare-fun b!180596 () Bool)

(declare-fun e!125491 () Bool)

(declare-fun lt!276813 () tuple2!15576)

(assert (=> b!180596 (= e!125491 (= (bitIndex!0 (size!4271 (buf!4714 (_1!8433 lt!276813))) (currentByte!8924 (_1!8433 lt!276813)) (currentBit!8919 (_1!8433 lt!276813))) (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!276811))) (currentByte!8924 (_2!8432 lt!276811)) (currentBit!8919 (_2!8432 lt!276811)))))))

(declare-fun b!180594 () Bool)

(declare-fun res!149966 () Bool)

(assert (=> b!180594 (=> (not res!149966) (not e!125490))))

(assert (=> b!180594 (= res!149966 (isPrefixOf!0 thiss!1204 (_2!8432 lt!276811)))))

(declare-fun b!180595 () Bool)

(assert (=> b!180595 (= e!125490 e!125491)))

(declare-fun res!149967 () Bool)

(assert (=> b!180595 (=> (not res!149967) (not e!125491))))

(assert (=> b!180595 (= res!149967 (and (= (_2!8433 lt!276813) lt!276589) (= (_1!8433 lt!276813) (_2!8432 lt!276811))))))

(assert (=> b!180595 (= lt!276813 (readBitPure!0 (readerFrom!0 (_2!8432 lt!276811) (currentBit!8919 thiss!1204) (currentByte!8924 thiss!1204))))))

(assert (= (and d!62859 res!149964) b!180593))

(assert (= (and b!180593 res!149965) b!180594))

(assert (= (and b!180594 res!149966) b!180595))

(assert (= (and b!180595 res!149967) b!180596))

(declare-fun m!281105 () Bool)

(assert (=> d!62859 m!281105))

(declare-fun m!281107 () Bool)

(assert (=> d!62859 m!281107))

(declare-fun m!281109 () Bool)

(assert (=> b!180594 m!281109))

(declare-fun m!281111 () Bool)

(assert (=> b!180593 m!281111))

(assert (=> b!180593 m!280931))

(declare-fun m!281113 () Bool)

(assert (=> b!180596 m!281113))

(assert (=> b!180596 m!281111))

(declare-fun m!281115 () Bool)

(assert (=> b!180595 m!281115))

(assert (=> b!180595 m!281115))

(declare-fun m!281117 () Bool)

(assert (=> b!180595 m!281117))

(assert (=> b!180480 d!62859))

(declare-fun d!62861 () Bool)

(declare-fun res!149970 () Bool)

(declare-fun e!125492 () Bool)

(assert (=> d!62861 (=> (not res!149970) (not e!125492))))

(assert (=> d!62861 (= res!149970 (= (size!4271 (buf!4714 (_2!8432 lt!276600))) (size!4271 (buf!4714 (_2!8432 lt!276601)))))))

(assert (=> d!62861 (= (isPrefixOf!0 (_2!8432 lt!276600) (_2!8432 lt!276601)) e!125492)))

(declare-fun b!180597 () Bool)

(declare-fun res!149969 () Bool)

(assert (=> b!180597 (=> (not res!149969) (not e!125492))))

(assert (=> b!180597 (= res!149969 (bvsle (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!276600))) (currentByte!8924 (_2!8432 lt!276600)) (currentBit!8919 (_2!8432 lt!276600))) (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!276601))) (currentByte!8924 (_2!8432 lt!276601)) (currentBit!8919 (_2!8432 lt!276601)))))))

(declare-fun b!180598 () Bool)

(declare-fun e!125493 () Bool)

(assert (=> b!180598 (= e!125492 e!125493)))

(declare-fun res!149968 () Bool)

(assert (=> b!180598 (=> res!149968 e!125493)))

(assert (=> b!180598 (= res!149968 (= (size!4271 (buf!4714 (_2!8432 lt!276600))) #b00000000000000000000000000000000))))

(declare-fun b!180599 () Bool)

(assert (=> b!180599 (= e!125493 (arrayBitRangesEq!0 (buf!4714 (_2!8432 lt!276600)) (buf!4714 (_2!8432 lt!276601)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!276600))) (currentByte!8924 (_2!8432 lt!276600)) (currentBit!8919 (_2!8432 lt!276600)))))))

(assert (= (and d!62861 res!149970) b!180597))

(assert (= (and b!180597 res!149969) b!180598))

(assert (= (and b!180598 (not res!149968)) b!180599))

(assert (=> b!180597 m!280929))

(assert (=> b!180597 m!280891))

(assert (=> b!180599 m!280929))

(assert (=> b!180599 m!280929))

(declare-fun m!281119 () Bool)

(assert (=> b!180599 m!281119))

(assert (=> b!180470 d!62861))

(declare-fun d!62863 () Bool)

(assert (=> d!62863 (= (invariant!0 (currentBit!8919 thiss!1204) (currentByte!8924 thiss!1204) (size!4271 (buf!4714 (_2!8432 lt!276601)))) (and (bvsge (currentBit!8919 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8919 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8924 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8924 thiss!1204) (size!4271 (buf!4714 (_2!8432 lt!276601)))) (and (= (currentBit!8919 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8924 thiss!1204) (size!4271 (buf!4714 (_2!8432 lt!276601))))))))))

(assert (=> b!180481 d!62863))

(declare-fun d!62865 () Bool)

(assert (=> d!62865 (= (invariant!0 (currentBit!8919 thiss!1204) (currentByte!8924 thiss!1204) (size!4271 (buf!4714 thiss!1204))) (and (bvsge (currentBit!8919 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8919 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8924 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8924 thiss!1204) (size!4271 (buf!4714 thiss!1204))) (and (= (currentBit!8919 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8924 thiss!1204) (size!4271 (buf!4714 thiss!1204)))))))))

(assert (=> b!180471 d!62865))

(declare-fun d!62867 () Bool)

(declare-fun e!125494 () Bool)

(assert (=> d!62867 e!125494))

(declare-fun res!149972 () Bool)

(assert (=> d!62867 (=> (not res!149972) (not e!125494))))

(declare-fun lt!276816 () (_ BitVec 64))

(declare-fun lt!276818 () (_ BitVec 64))

(declare-fun lt!276819 () (_ BitVec 64))

(assert (=> d!62867 (= res!149972 (= lt!276819 (bvsub lt!276818 lt!276816)))))

(assert (=> d!62867 (or (= (bvand lt!276818 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!276816 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!276818 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!276818 lt!276816) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62867 (= lt!276816 (remainingBits!0 ((_ sign_extend 32) (size!4271 (buf!4714 (_2!8432 lt!276601)))) ((_ sign_extend 32) (currentByte!8924 (_2!8432 lt!276601))) ((_ sign_extend 32) (currentBit!8919 (_2!8432 lt!276601)))))))

(declare-fun lt!276815 () (_ BitVec 64))

(declare-fun lt!276817 () (_ BitVec 64))

(assert (=> d!62867 (= lt!276818 (bvmul lt!276815 lt!276817))))

(assert (=> d!62867 (or (= lt!276815 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!276817 (bvsdiv (bvmul lt!276815 lt!276817) lt!276815)))))

(assert (=> d!62867 (= lt!276817 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62867 (= lt!276815 ((_ sign_extend 32) (size!4271 (buf!4714 (_2!8432 lt!276601)))))))

(assert (=> d!62867 (= lt!276819 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8924 (_2!8432 lt!276601))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8919 (_2!8432 lt!276601)))))))

(assert (=> d!62867 (invariant!0 (currentBit!8919 (_2!8432 lt!276601)) (currentByte!8924 (_2!8432 lt!276601)) (size!4271 (buf!4714 (_2!8432 lt!276601))))))

(assert (=> d!62867 (= (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!276601))) (currentByte!8924 (_2!8432 lt!276601)) (currentBit!8919 (_2!8432 lt!276601))) lt!276819)))

(declare-fun b!180600 () Bool)

(declare-fun res!149971 () Bool)

(assert (=> b!180600 (=> (not res!149971) (not e!125494))))

(assert (=> b!180600 (= res!149971 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!276819))))

(declare-fun b!180601 () Bool)

(declare-fun lt!276820 () (_ BitVec 64))

(assert (=> b!180601 (= e!125494 (bvsle lt!276819 (bvmul lt!276820 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!180601 (or (= lt!276820 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!276820 #b0000000000000000000000000000000000000000000000000000000000001000) lt!276820)))))

(assert (=> b!180601 (= lt!276820 ((_ sign_extend 32) (size!4271 (buf!4714 (_2!8432 lt!276601)))))))

(assert (= (and d!62867 res!149972) b!180600))

(assert (= (and b!180600 res!149971) b!180601))

(declare-fun m!281121 () Bool)

(assert (=> d!62867 m!281121))

(assert (=> d!62867 m!280925))

(assert (=> b!180482 d!62867))

(declare-fun d!62869 () Bool)

(declare-fun res!149975 () Bool)

(declare-fun e!125495 () Bool)

(assert (=> d!62869 (=> (not res!149975) (not e!125495))))

(assert (=> d!62869 (= res!149975 (= (size!4271 (buf!4714 thiss!1204)) (size!4271 (buf!4714 (_2!8432 lt!276601)))))))

(assert (=> d!62869 (= (isPrefixOf!0 thiss!1204 (_2!8432 lt!276601)) e!125495)))

(declare-fun b!180602 () Bool)

(declare-fun res!149974 () Bool)

(assert (=> b!180602 (=> (not res!149974) (not e!125495))))

(assert (=> b!180602 (= res!149974 (bvsle (bitIndex!0 (size!4271 (buf!4714 thiss!1204)) (currentByte!8924 thiss!1204) (currentBit!8919 thiss!1204)) (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!276601))) (currentByte!8924 (_2!8432 lt!276601)) (currentBit!8919 (_2!8432 lt!276601)))))))

(declare-fun b!180603 () Bool)

(declare-fun e!125496 () Bool)

(assert (=> b!180603 (= e!125495 e!125496)))

(declare-fun res!149973 () Bool)

(assert (=> b!180603 (=> res!149973 e!125496)))

(assert (=> b!180603 (= res!149973 (= (size!4271 (buf!4714 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!180604 () Bool)

(assert (=> b!180604 (= e!125496 (arrayBitRangesEq!0 (buf!4714 thiss!1204) (buf!4714 (_2!8432 lt!276601)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4271 (buf!4714 thiss!1204)) (currentByte!8924 thiss!1204) (currentBit!8919 thiss!1204))))))

(assert (= (and d!62869 res!149975) b!180602))

(assert (= (and b!180602 res!149974) b!180603))

(assert (= (and b!180603 (not res!149973)) b!180604))

(assert (=> b!180602 m!280931))

(assert (=> b!180602 m!280891))

(assert (=> b!180604 m!280931))

(assert (=> b!180604 m!280931))

(declare-fun m!281123 () Bool)

(assert (=> b!180604 m!281123))

(assert (=> b!180482 d!62869))

(declare-fun d!62871 () Bool)

(assert (=> d!62871 (isPrefixOf!0 thiss!1204 (_2!8432 lt!276601))))

(declare-fun lt!276823 () Unit!12961)

(declare-fun choose!30 (BitStream!7650 BitStream!7650 BitStream!7650) Unit!12961)

(assert (=> d!62871 (= lt!276823 (choose!30 thiss!1204 (_2!8432 lt!276600) (_2!8432 lt!276601)))))

(assert (=> d!62871 (isPrefixOf!0 thiss!1204 (_2!8432 lt!276600))))

(assert (=> d!62871 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8432 lt!276600) (_2!8432 lt!276601)) lt!276823)))

(declare-fun bs!15675 () Bool)

(assert (= bs!15675 d!62871))

(assert (=> bs!15675 m!280893))

(declare-fun m!281125 () Bool)

(assert (=> bs!15675 m!281125))

(assert (=> bs!15675 m!280935))

(assert (=> b!180482 d!62871))

(declare-fun b!180751 () Bool)

(declare-fun lt!277242 () tuple2!15576)

(declare-fun lt!277283 () tuple2!15574)

(assert (=> b!180751 (= lt!277242 (readBitPure!0 (readerFrom!0 (_2!8432 lt!277283) (currentBit!8919 (_2!8432 lt!276600)) (currentByte!8924 (_2!8432 lt!276600)))))))

(declare-fun lt!277288 () Bool)

(declare-fun res!150108 () Bool)

(assert (=> b!180751 (= res!150108 (and (= (_2!8433 lt!277242) lt!277288) (= (_1!8433 lt!277242) (_2!8432 lt!277283))))))

(declare-fun e!125583 () Bool)

(assert (=> b!180751 (=> (not res!150108) (not e!125583))))

(declare-fun e!125581 () Bool)

(assert (=> b!180751 (= e!125581 e!125583)))

(declare-fun b!180752 () Bool)

(declare-fun res!150098 () Bool)

(declare-fun e!125580 () Bool)

(assert (=> b!180752 (=> (not res!150098) (not e!125580))))

(declare-fun lt!277268 () tuple2!15574)

(declare-fun lt!277249 () (_ BitVec 64))

(declare-fun lt!277256 () (_ BitVec 64))

(assert (=> b!180752 (= res!150098 (= (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!277268))) (currentByte!8924 (_2!8432 lt!277268)) (currentBit!8919 (_2!8432 lt!277268))) (bvsub lt!277256 lt!277249)))))

(assert (=> b!180752 (or (= (bvand lt!277256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!277249 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!277256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!277256 lt!277249) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!180752 (= lt!277249 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!277271 () (_ BitVec 64))

(declare-fun lt!277234 () (_ BitVec 64))

(assert (=> b!180752 (= lt!277256 (bvadd lt!277271 lt!277234))))

(assert (=> b!180752 (or (not (= (bvand lt!277271 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!277234 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!277271 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!277271 lt!277234) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!180752 (= lt!277234 ((_ sign_extend 32) nBits!348))))

(assert (=> b!180752 (= lt!277271 (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!276600))) (currentByte!8924 (_2!8432 lt!276600)) (currentBit!8919 (_2!8432 lt!276600))))))

(declare-fun b!180753 () Bool)

(declare-fun e!125579 () Bool)

(assert (=> b!180753 (= e!125580 e!125579)))

(declare-fun res!150100 () Bool)

(assert (=> b!180753 (=> (not res!150100) (not e!125579))))

(declare-datatypes ((tuple2!15590 0))(
  ( (tuple2!15591 (_1!8440 BitStream!7650) (_2!8440 (_ BitVec 64))) )
))
(declare-fun lt!277264 () tuple2!15590)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!180753 (= res!150100 (= (_2!8440 lt!277264) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!277280 () tuple2!15572)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7650 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15590)

(assert (=> b!180753 (= lt!277264 (readNBitsLSBFirstsLoopPure!0 (_1!8431 lt!277280) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!277253 () Unit!12961)

(declare-fun lt!277245 () Unit!12961)

(assert (=> b!180753 (= lt!277253 lt!277245)))

(declare-fun lt!277278 () (_ BitVec 64))

(assert (=> b!180753 (validate_offset_bits!1 ((_ sign_extend 32) (size!4271 (buf!4714 (_2!8432 lt!277268)))) ((_ sign_extend 32) (currentByte!8924 (_2!8432 lt!276600))) ((_ sign_extend 32) (currentBit!8919 (_2!8432 lt!276600))) lt!277278)))

(assert (=> b!180753 (= lt!277245 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8432 lt!276600) (buf!4714 (_2!8432 lt!277268)) lt!277278))))

(declare-fun e!125584 () Bool)

(assert (=> b!180753 e!125584))

(declare-fun res!150109 () Bool)

(assert (=> b!180753 (=> (not res!150109) (not e!125584))))

(assert (=> b!180753 (= res!150109 (and (= (size!4271 (buf!4714 (_2!8432 lt!276600))) (size!4271 (buf!4714 (_2!8432 lt!277268)))) (bvsge lt!277278 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!180753 (= lt!277278 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!180753 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!180753 (= lt!277280 (reader!0 (_2!8432 lt!276600) (_2!8432 lt!277268)))))

(declare-fun b!180754 () Bool)

(declare-fun e!125582 () tuple2!15574)

(declare-fun Unit!12970 () Unit!12961)

(assert (=> b!180754 (= e!125582 (tuple2!15575 Unit!12970 (_2!8432 lt!276600)))))

(declare-fun lt!277263 () Unit!12961)

(assert (=> b!180754 (= lt!277263 (lemmaIsPrefixRefl!0 (_2!8432 lt!276600)))))

(declare-fun call!2941 () Bool)

(assert (=> b!180754 call!2941))

(declare-fun lt!277282 () Unit!12961)

(assert (=> b!180754 (= lt!277282 lt!277263)))

(declare-fun b!180755 () Bool)

(declare-fun e!125578 () Bool)

(declare-fun lt!277236 () tuple2!15590)

(declare-fun lt!277254 () tuple2!15572)

(assert (=> b!180755 (= e!125578 (= (_1!8440 lt!277236) (_2!8431 lt!277254)))))

(declare-fun b!180756 () Bool)

(declare-fun res!150099 () Bool)

(assert (=> b!180756 (= res!150099 (= (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!277283))) (currentByte!8924 (_2!8432 lt!277283)) (currentBit!8919 (_2!8432 lt!277283))) (bvadd (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!276600))) (currentByte!8924 (_2!8432 lt!276600)) (currentBit!8919 (_2!8432 lt!276600))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!180756 (=> (not res!150099) (not e!125581))))

(declare-fun b!180757 () Bool)

(declare-fun res!150103 () Bool)

(assert (=> b!180757 (=> (not res!150103) (not e!125580))))

(assert (=> b!180757 (= res!150103 (isPrefixOf!0 (_2!8432 lt!276600) (_2!8432 lt!277268)))))

(declare-fun b!180759 () Bool)

(declare-fun res!150102 () Bool)

(assert (=> b!180759 (=> (not res!150102) (not e!125580))))

(assert (=> b!180759 (= res!150102 (= (size!4271 (buf!4714 (_2!8432 lt!276600))) (size!4271 (buf!4714 (_2!8432 lt!277268)))))))

(declare-fun b!180760 () Bool)

(declare-fun res!150105 () Bool)

(assert (=> b!180760 (= res!150105 call!2941)))

(assert (=> b!180760 (=> (not res!150105) (not e!125581))))

(declare-fun b!180761 () Bool)

(assert (=> b!180761 (= e!125579 (= (_1!8440 lt!277264) (_2!8431 lt!277280)))))

(declare-fun b!180762 () Bool)

(declare-fun e!125586 () Bool)

(declare-fun lt!277277 () tuple2!15576)

(declare-fun lt!277265 () tuple2!15576)

(assert (=> b!180762 (= e!125586 (= (_2!8433 lt!277277) (_2!8433 lt!277265)))))

(declare-fun b!180763 () Bool)

(assert (=> b!180763 (= e!125583 (= (bitIndex!0 (size!4271 (buf!4714 (_1!8433 lt!277242))) (currentByte!8924 (_1!8433 lt!277242)) (currentBit!8919 (_1!8433 lt!277242))) (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!277283))) (currentByte!8924 (_2!8432 lt!277283)) (currentBit!8919 (_2!8432 lt!277283)))))))

(declare-fun b!180764 () Bool)

(declare-fun e!125585 () (_ BitVec 64))

(assert (=> b!180764 (= e!125585 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!180758 () Bool)

(declare-fun lt!277285 () tuple2!15574)

(assert (=> b!180758 (= e!125582 (tuple2!15575 (_1!8432 lt!277285) (_2!8432 lt!277285)))))

(assert (=> b!180758 (= lt!277288 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!180758 (= lt!277283 (appendBit!0 (_2!8432 lt!276600) lt!277288))))

(declare-fun res!150106 () Bool)

(assert (=> b!180758 (= res!150106 (= (size!4271 (buf!4714 (_2!8432 lt!276600))) (size!4271 (buf!4714 (_2!8432 lt!277283)))))))

(assert (=> b!180758 (=> (not res!150106) (not e!125581))))

(assert (=> b!180758 e!125581))

(declare-fun lt!277284 () tuple2!15574)

(assert (=> b!180758 (= lt!277284 lt!277283)))

(assert (=> b!180758 (= lt!277285 (appendBitsLSBFirstLoopTR!0 (_2!8432 lt!277284) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!277279 () Unit!12961)

(assert (=> b!180758 (= lt!277279 (lemmaIsPrefixTransitive!0 (_2!8432 lt!276600) (_2!8432 lt!277284) (_2!8432 lt!277285)))))

(assert (=> b!180758 (isPrefixOf!0 (_2!8432 lt!276600) (_2!8432 lt!277285))))

(declare-fun lt!277272 () Unit!12961)

(assert (=> b!180758 (= lt!277272 lt!277279)))

(assert (=> b!180758 (invariant!0 (currentBit!8919 (_2!8432 lt!276600)) (currentByte!8924 (_2!8432 lt!276600)) (size!4271 (buf!4714 (_2!8432 lt!277284))))))

(declare-fun lt!277262 () BitStream!7650)

(assert (=> b!180758 (= lt!277262 (BitStream!7651 (buf!4714 (_2!8432 lt!277284)) (currentByte!8924 (_2!8432 lt!276600)) (currentBit!8919 (_2!8432 lt!276600))))))

(assert (=> b!180758 (invariant!0 (currentBit!8919 lt!277262) (currentByte!8924 lt!277262) (size!4271 (buf!4714 (_2!8432 lt!277285))))))

(declare-fun lt!277274 () BitStream!7650)

(assert (=> b!180758 (= lt!277274 (BitStream!7651 (buf!4714 (_2!8432 lt!277285)) (currentByte!8924 lt!277262) (currentBit!8919 lt!277262)))))

(assert (=> b!180758 (= lt!277277 (readBitPure!0 lt!277262))))

(assert (=> b!180758 (= lt!277265 (readBitPure!0 lt!277274))))

(declare-fun lt!277247 () Unit!12961)

(assert (=> b!180758 (= lt!277247 (readBitPrefixLemma!0 lt!277262 (_2!8432 lt!277285)))))

(declare-fun res!150104 () Bool)

(assert (=> b!180758 (= res!150104 (= (bitIndex!0 (size!4271 (buf!4714 (_1!8433 lt!277277))) (currentByte!8924 (_1!8433 lt!277277)) (currentBit!8919 (_1!8433 lt!277277))) (bitIndex!0 (size!4271 (buf!4714 (_1!8433 lt!277265))) (currentByte!8924 (_1!8433 lt!277265)) (currentBit!8919 (_1!8433 lt!277265)))))))

(assert (=> b!180758 (=> (not res!150104) (not e!125586))))

(assert (=> b!180758 e!125586))

(declare-fun lt!277248 () Unit!12961)

(assert (=> b!180758 (= lt!277248 lt!277247)))

(declare-fun lt!277270 () tuple2!15572)

(assert (=> b!180758 (= lt!277270 (reader!0 (_2!8432 lt!276600) (_2!8432 lt!277285)))))

(declare-fun lt!277257 () tuple2!15572)

(assert (=> b!180758 (= lt!277257 (reader!0 (_2!8432 lt!277284) (_2!8432 lt!277285)))))

(declare-fun lt!277237 () tuple2!15576)

(assert (=> b!180758 (= lt!277237 (readBitPure!0 (_1!8431 lt!277270)))))

(assert (=> b!180758 (= (_2!8433 lt!277237) lt!277288)))

(declare-fun lt!277251 () Unit!12961)

(declare-fun Unit!12976 () Unit!12961)

(assert (=> b!180758 (= lt!277251 Unit!12976)))

(declare-fun lt!277267 () (_ BitVec 64))

(assert (=> b!180758 (= lt!277267 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!277235 () (_ BitVec 64))

(assert (=> b!180758 (= lt!277235 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!277260 () Unit!12961)

(assert (=> b!180758 (= lt!277260 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8432 lt!276600) (buf!4714 (_2!8432 lt!277285)) lt!277235))))

(assert (=> b!180758 (validate_offset_bits!1 ((_ sign_extend 32) (size!4271 (buf!4714 (_2!8432 lt!277285)))) ((_ sign_extend 32) (currentByte!8924 (_2!8432 lt!276600))) ((_ sign_extend 32) (currentBit!8919 (_2!8432 lt!276600))) lt!277235)))

(declare-fun lt!277252 () Unit!12961)

(assert (=> b!180758 (= lt!277252 lt!277260)))

(declare-fun lt!277286 () tuple2!15590)

(assert (=> b!180758 (= lt!277286 (readNBitsLSBFirstsLoopPure!0 (_1!8431 lt!277270) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!277267))))

(declare-fun lt!277239 () (_ BitVec 64))

(assert (=> b!180758 (= lt!277239 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!277258 () Unit!12961)

(assert (=> b!180758 (= lt!277258 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8432 lt!277284) (buf!4714 (_2!8432 lt!277285)) lt!277239))))

(assert (=> b!180758 (validate_offset_bits!1 ((_ sign_extend 32) (size!4271 (buf!4714 (_2!8432 lt!277285)))) ((_ sign_extend 32) (currentByte!8924 (_2!8432 lt!277284))) ((_ sign_extend 32) (currentBit!8919 (_2!8432 lt!277284))) lt!277239)))

(declare-fun lt!277244 () Unit!12961)

(assert (=> b!180758 (= lt!277244 lt!277258)))

(declare-fun lt!277238 () tuple2!15590)

(assert (=> b!180758 (= lt!277238 (readNBitsLSBFirstsLoopPure!0 (_1!8431 lt!277257) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!277267 (ite (_2!8433 lt!277237) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!277241 () tuple2!15590)

(assert (=> b!180758 (= lt!277241 (readNBitsLSBFirstsLoopPure!0 (_1!8431 lt!277270) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!277267))))

(declare-fun c!9323 () Bool)

(assert (=> b!180758 (= c!9323 (_2!8433 (readBitPure!0 (_1!8431 lt!277270))))))

(declare-fun lt!277243 () tuple2!15590)

(assert (=> b!180758 (= lt!277243 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8431 lt!277270) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!277267 e!125585)))))

(declare-fun lt!277246 () Unit!12961)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7650 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!12961)

(assert (=> b!180758 (= lt!277246 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8431 lt!277270) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!277267))))

(assert (=> b!180758 (and (= (_2!8440 lt!277241) (_2!8440 lt!277243)) (= (_1!8440 lt!277241) (_1!8440 lt!277243)))))

(declare-fun lt!277255 () Unit!12961)

(assert (=> b!180758 (= lt!277255 lt!277246)))

(assert (=> b!180758 (= (_1!8431 lt!277270) (withMovedBitIndex!0 (_2!8431 lt!277270) (bvsub (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!276600))) (currentByte!8924 (_2!8432 lt!276600)) (currentBit!8919 (_2!8432 lt!276600))) (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!277285))) (currentByte!8924 (_2!8432 lt!277285)) (currentBit!8919 (_2!8432 lt!277285))))))))

(declare-fun lt!277276 () Unit!12961)

(declare-fun Unit!12982 () Unit!12961)

(assert (=> b!180758 (= lt!277276 Unit!12982)))

(assert (=> b!180758 (= (_1!8431 lt!277257) (withMovedBitIndex!0 (_2!8431 lt!277257) (bvsub (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!277284))) (currentByte!8924 (_2!8432 lt!277284)) (currentBit!8919 (_2!8432 lt!277284))) (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!277285))) (currentByte!8924 (_2!8432 lt!277285)) (currentBit!8919 (_2!8432 lt!277285))))))))

(declare-fun lt!277281 () Unit!12961)

(declare-fun Unit!12983 () Unit!12961)

(assert (=> b!180758 (= lt!277281 Unit!12983)))

(assert (=> b!180758 (= (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!276600))) (currentByte!8924 (_2!8432 lt!276600)) (currentBit!8919 (_2!8432 lt!276600))) (bvsub (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!277284))) (currentByte!8924 (_2!8432 lt!277284)) (currentBit!8919 (_2!8432 lt!277284))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!277240 () Unit!12961)

(declare-fun Unit!12984 () Unit!12961)

(assert (=> b!180758 (= lt!277240 Unit!12984)))

(assert (=> b!180758 (= (_2!8440 lt!277286) (_2!8440 lt!277238))))

(declare-fun lt!277275 () Unit!12961)

(declare-fun Unit!12985 () Unit!12961)

(assert (=> b!180758 (= lt!277275 Unit!12985)))

(assert (=> b!180758 (invariant!0 (currentBit!8919 (_2!8432 lt!277285)) (currentByte!8924 (_2!8432 lt!277285)) (size!4271 (buf!4714 (_2!8432 lt!277285))))))

(declare-fun lt!277233 () Unit!12961)

(declare-fun Unit!12986 () Unit!12961)

(assert (=> b!180758 (= lt!277233 Unit!12986)))

(assert (=> b!180758 (= (size!4271 (buf!4714 (_2!8432 lt!276600))) (size!4271 (buf!4714 (_2!8432 lt!277285))))))

(declare-fun lt!277287 () Unit!12961)

(declare-fun Unit!12987 () Unit!12961)

(assert (=> b!180758 (= lt!277287 Unit!12987)))

(assert (=> b!180758 (= (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!277285))) (currentByte!8924 (_2!8432 lt!277285)) (currentBit!8919 (_2!8432 lt!277285))) (bvsub (bvadd (bitIndex!0 (size!4271 (buf!4714 (_2!8432 lt!276600))) (currentByte!8924 (_2!8432 lt!276600)) (currentBit!8919 (_2!8432 lt!276600))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!277273 () Unit!12961)

(declare-fun Unit!12988 () Unit!12961)

(assert (=> b!180758 (= lt!277273 Unit!12988)))

(declare-fun lt!277250 () Unit!12961)

(declare-fun Unit!12989 () Unit!12961)

(assert (=> b!180758 (= lt!277250 Unit!12989)))

(assert (=> b!180758 (= lt!277254 (reader!0 (_2!8432 lt!276600) (_2!8432 lt!277285)))))

(declare-fun lt!277259 () (_ BitVec 64))

(assert (=> b!180758 (= lt!277259 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!277266 () Unit!12961)

(assert (=> b!180758 (= lt!277266 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8432 lt!276600) (buf!4714 (_2!8432 lt!277285)) lt!277259))))

(assert (=> b!180758 (validate_offset_bits!1 ((_ sign_extend 32) (size!4271 (buf!4714 (_2!8432 lt!277285)))) ((_ sign_extend 32) (currentByte!8924 (_2!8432 lt!276600))) ((_ sign_extend 32) (currentBit!8919 (_2!8432 lt!276600))) lt!277259)))

(declare-fun lt!277261 () Unit!12961)

(assert (=> b!180758 (= lt!277261 lt!277266)))

(assert (=> b!180758 (= lt!277236 (readNBitsLSBFirstsLoopPure!0 (_1!8431 lt!277254) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!150101 () Bool)

(assert (=> b!180758 (= res!150101 (= (_2!8440 lt!277236) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!180758 (=> (not res!150101) (not e!125578))))

(assert (=> b!180758 e!125578))

(declare-fun lt!277269 () Unit!12961)

(declare-fun Unit!12990 () Unit!12961)

(assert (=> b!180758 (= lt!277269 Unit!12990)))

(declare-fun d!62873 () Bool)

(assert (=> d!62873 e!125580))

(declare-fun res!150107 () Bool)

(assert (=> d!62873 (=> (not res!150107) (not e!125580))))

(assert (=> d!62873 (= res!150107 (invariant!0 (currentBit!8919 (_2!8432 lt!277268)) (currentByte!8924 (_2!8432 lt!277268)) (size!4271 (buf!4714 (_2!8432 lt!277268)))))))

(assert (=> d!62873 (= lt!277268 e!125582)))

(declare-fun c!9324 () Bool)

(assert (=> d!62873 (= c!9324 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!62873 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!62873 (= (appendBitsLSBFirstLoopTR!0 (_2!8432 lt!276600) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!277268)))

(declare-fun b!180765 () Bool)

(assert (=> b!180765 (= e!125585 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun bm!2938 () Bool)

(assert (=> bm!2938 (= call!2941 (isPrefixOf!0 (_2!8432 lt!276600) (ite c!9324 (_2!8432 lt!276600) (_2!8432 lt!277283))))))

(declare-fun b!180766 () Bool)

(assert (=> b!180766 (= e!125584 (validate_offset_bits!1 ((_ sign_extend 32) (size!4271 (buf!4714 (_2!8432 lt!276600)))) ((_ sign_extend 32) (currentByte!8924 (_2!8432 lt!276600))) ((_ sign_extend 32) (currentBit!8919 (_2!8432 lt!276600))) lt!277278))))

(assert (= (and d!62873 c!9324) b!180754))

(assert (= (and d!62873 (not c!9324)) b!180758))

(assert (= (and b!180758 res!150106) b!180756))

(assert (= (and b!180756 res!150099) b!180760))

(assert (= (and b!180760 res!150105) b!180751))

(assert (= (and b!180751 res!150108) b!180763))

(assert (= (and b!180758 res!150104) b!180762))

(assert (= (and b!180758 c!9323) b!180765))

(assert (= (and b!180758 (not c!9323)) b!180764))

(assert (= (and b!180758 res!150101) b!180755))

(assert (= (or b!180754 b!180760) bm!2938))

(assert (= (and d!62873 res!150107) b!180759))

(assert (= (and b!180759 res!150102) b!180752))

(assert (= (and b!180752 res!150098) b!180757))

(assert (= (and b!180757 res!150103) b!180753))

(assert (= (and b!180753 res!150109) b!180766))

(assert (= (and b!180753 res!150100) b!180761))

(assert (=> b!180754 m!281077))

(declare-fun m!281265 () Bool)

(assert (=> b!180752 m!281265))

(assert (=> b!180752 m!280929))

(declare-fun m!281273 () Bool)

(assert (=> b!180763 m!281273))

(declare-fun m!281277 () Bool)

(assert (=> b!180763 m!281277))

(declare-fun m!281281 () Bool)

(assert (=> b!180753 m!281281))

(declare-fun m!281283 () Bool)

(assert (=> b!180753 m!281283))

(declare-fun m!281287 () Bool)

(assert (=> b!180753 m!281287))

(declare-fun m!281290 () Bool)

(assert (=> b!180753 m!281290))

(declare-fun m!281293 () Bool)

(assert (=> b!180753 m!281293))

(declare-fun m!281297 () Bool)

(assert (=> b!180753 m!281297))

(assert (=> b!180756 m!281277))

(assert (=> b!180756 m!280929))

(declare-fun m!281303 () Bool)

(assert (=> b!180766 m!281303))

(declare-fun m!281305 () Bool)

(assert (=> b!180757 m!281305))

(declare-fun m!281311 () Bool)

(assert (=> b!180758 m!281311))

(declare-fun m!281315 () Bool)

(assert (=> b!180758 m!281315))

(declare-fun m!281317 () Bool)

(assert (=> b!180758 m!281317))

(declare-fun m!281323 () Bool)

(assert (=> b!180758 m!281323))

(declare-fun m!281329 () Bool)

(assert (=> b!180758 m!281329))

(declare-fun m!281331 () Bool)

(assert (=> b!180758 m!281331))

(declare-fun m!281335 () Bool)

(assert (=> b!180758 m!281335))

(declare-fun m!281341 () Bool)

(assert (=> b!180758 m!281341))

(declare-fun m!281345 () Bool)

(assert (=> b!180758 m!281345))

(assert (=> b!180758 m!281283))

(declare-fun m!281349 () Bool)

(assert (=> b!180758 m!281349))

(declare-fun m!281355 () Bool)

(assert (=> b!180758 m!281355))

(declare-fun m!281359 () Bool)

(assert (=> b!180758 m!281359))

(declare-fun m!281363 () Bool)

(assert (=> b!180758 m!281363))

(declare-fun m!281365 () Bool)

(assert (=> b!180758 m!281365))

(declare-fun m!281371 () Bool)

(assert (=> b!180758 m!281371))

(declare-fun m!281377 () Bool)

(assert (=> b!180758 m!281377))

(declare-fun m!281383 () Bool)

(assert (=> b!180758 m!281383))

(declare-fun m!281387 () Bool)

(assert (=> b!180758 m!281387))

(declare-fun m!281391 () Bool)

(assert (=> b!180758 m!281391))

(declare-fun m!281397 () Bool)

(assert (=> b!180758 m!281397))

(assert (=> b!180758 m!281290))

(declare-fun m!281401 () Bool)

(assert (=> b!180758 m!281401))

(declare-fun m!281405 () Bool)

(assert (=> b!180758 m!281405))

(assert (=> b!180758 m!280929))

(declare-fun m!281411 () Bool)

(assert (=> b!180758 m!281411))

(declare-fun m!281413 () Bool)

(assert (=> b!180758 m!281413))

(assert (=> b!180758 m!281329))

(declare-fun m!281415 () Bool)

(assert (=> b!180758 m!281415))

(declare-fun m!281417 () Bool)

(assert (=> b!180758 m!281417))

(declare-fun m!281419 () Bool)

(assert (=> b!180758 m!281419))

(declare-fun m!281421 () Bool)

(assert (=> b!180758 m!281421))

(declare-fun m!281423 () Bool)

(assert (=> b!180758 m!281423))

(declare-fun m!281425 () Bool)

(assert (=> b!180758 m!281425))

(declare-fun m!281427 () Bool)

(assert (=> b!180758 m!281427))

(declare-fun m!281429 () Bool)

(assert (=> bm!2938 m!281429))

(declare-fun m!281431 () Bool)

(assert (=> b!180751 m!281431))

(assert (=> b!180751 m!281431))

(declare-fun m!281433 () Bool)

(assert (=> b!180751 m!281433))

(declare-fun m!281435 () Bool)

(assert (=> d!62873 m!281435))

(assert (=> b!180482 d!62873))

(declare-fun d!62945 () Bool)

(assert (=> d!62945 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4271 (buf!4714 thiss!1204))) ((_ sign_extend 32) (currentByte!8924 thiss!1204)) ((_ sign_extend 32) (currentBit!8919 thiss!1204)) lt!276596) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4271 (buf!4714 thiss!1204))) ((_ sign_extend 32) (currentByte!8924 thiss!1204)) ((_ sign_extend 32) (currentBit!8919 thiss!1204))) lt!276596))))

(declare-fun bs!15687 () Bool)

(assert (= bs!15687 d!62945))

(assert (=> bs!15687 m!281103))

(assert (=> b!180483 d!62945))

(assert (=> b!180473 d!62855))

(assert (=> b!180473 d!62857))

(assert (=> b!180474 d!62851))

(check-sat (not b!180566) (not d!62857) (not b!180597) (not d!62827) (not d!62837) (not d!62825) (not d!62845) (not d!62843) (not b!180564) (not b!180758) (not b!180754) (not d!62945) (not b!180753) (not b!180602) (not b!180550) (not b!180752) (not b!180599) (not d!62833) (not d!62871) (not d!62835) (not b!180595) (not d!62867) (not d!62873) (not b!180567) (not b!180548) (not d!62859) (not b!180751) (not b!180593) (not d!62855) (not b!180568) (not b!180604) (not b!180537) (not d!62831) (not b!180552) (not d!62853) (not d!62819) (not b!180757) (not b!180577) (not d!62847) (not b!180766) (not b!180594) (not b!180756) (not b!180596) (not bm!2938) (not d!62841) (not d!62817) (not d!62829) (not b!180551) (not b!180575) (not b!180763) (not d!62849))
(check-sat)
