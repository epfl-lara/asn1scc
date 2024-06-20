; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52210 () Bool)

(assert start!52210)

(declare-fun b!240378 () Bool)

(declare-fun e!166616 () Bool)

(declare-datatypes ((array!13141 0))(
  ( (array!13142 (arr!6742 (Array (_ BitVec 32) (_ BitVec 8))) (size!5755 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10432 0))(
  ( (BitStream!10433 (buf!6215 array!13141) (currentByte!11569 (_ BitVec 32)) (currentBit!11564 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20382 0))(
  ( (tuple2!20383 (_1!11113 BitStream!10432) (_2!11113 Bool)) )
))
(declare-fun lt!375443 () tuple2!20382)

(declare-datatypes ((tuple2!20384 0))(
  ( (tuple2!20385 (_1!11114 BitStream!10432) (_2!11114 BitStream!10432)) )
))
(declare-fun lt!375447 () tuple2!20384)

(assert (=> b!240378 (= e!166616 (not (or (not (_2!11113 lt!375443)) (not (= (_1!11113 lt!375443) (_2!11114 lt!375447))))))))

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun bit!21 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10432 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20382)

(assert (=> b!240378 (= lt!375443 (checkBitsLoopPure!0 (_1!11114 lt!375447) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!17611 0))(
  ( (Unit!17612) )
))
(declare-datatypes ((tuple2!20386 0))(
  ( (tuple2!20387 (_1!11115 Unit!17611) (_2!11115 BitStream!10432)) )
))
(declare-fun lt!375446 () tuple2!20386)

(declare-fun thiss!982 () BitStream!10432)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240378 (validate_offset_bits!1 ((_ sign_extend 32) (size!5755 (buf!6215 (_2!11115 lt!375446)))) ((_ sign_extend 32) (currentByte!11569 thiss!982)) ((_ sign_extend 32) (currentBit!11564 thiss!982)) nBits!288)))

(declare-fun lt!375440 () Unit!17611)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10432 array!13141 (_ BitVec 64)) Unit!17611)

(assert (=> b!240378 (= lt!375440 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6215 (_2!11115 lt!375446)) nBits!288))))

(declare-fun reader!0 (BitStream!10432 BitStream!10432) tuple2!20384)

(assert (=> b!240378 (= lt!375447 (reader!0 thiss!982 (_2!11115 lt!375446)))))

(declare-fun b!240379 () Bool)

(declare-fun res!200673 () Bool)

(assert (=> b!240379 (=> (not res!200673) (not e!166616))))

(declare-fun isPrefixOf!0 (BitStream!10432 BitStream!10432) Bool)

(assert (=> b!240379 (= res!200673 (isPrefixOf!0 thiss!982 (_2!11115 lt!375446)))))

(declare-fun b!240380 () Bool)

(declare-fun res!200669 () Bool)

(declare-fun e!166615 () Bool)

(assert (=> b!240380 (=> (not res!200669) (not e!166615))))

(assert (=> b!240380 (= res!200669 (validate_offset_bits!1 ((_ sign_extend 32) (size!5755 (buf!6215 thiss!982))) ((_ sign_extend 32) (currentByte!11569 thiss!982)) ((_ sign_extend 32) (currentBit!11564 thiss!982)) nBits!288))))

(declare-fun res!200671 () Bool)

(assert (=> start!52210 (=> (not res!200671) (not e!166615))))

(assert (=> start!52210 (= res!200671 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52210 e!166615))

(assert (=> start!52210 true))

(declare-fun e!166613 () Bool)

(declare-fun inv!12 (BitStream!10432) Bool)

(assert (=> start!52210 (and (inv!12 thiss!982) e!166613)))

(declare-fun b!240381 () Bool)

(assert (=> b!240381 (= e!166615 (not true))))

(declare-fun lt!375445 () tuple2!20384)

(assert (=> b!240381 (= lt!375445 (reader!0 thiss!982 (_2!11115 lt!375446)))))

(declare-fun lt!375441 () Bool)

(assert (=> b!240381 (= lt!375441 (isPrefixOf!0 thiss!982 (_2!11115 lt!375446)))))

(declare-fun lt!375444 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240381 (= lt!375444 (bitIndex!0 (size!5755 (buf!6215 (_2!11115 lt!375446))) (currentByte!11569 (_2!11115 lt!375446)) (currentBit!11564 (_2!11115 lt!375446))))))

(declare-fun lt!375442 () (_ BitVec 64))

(assert (=> b!240381 (= lt!375442 (bitIndex!0 (size!5755 (buf!6215 thiss!982)) (currentByte!11569 thiss!982) (currentBit!11564 thiss!982)))))

(assert (=> b!240381 e!166616))

(declare-fun res!200672 () Bool)

(assert (=> b!240381 (=> (not res!200672) (not e!166616))))

(assert (=> b!240381 (= res!200672 (= (size!5755 (buf!6215 thiss!982)) (size!5755 (buf!6215 (_2!11115 lt!375446)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10432 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20386)

(assert (=> b!240381 (= lt!375446 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240382 () Bool)

(declare-fun res!200670 () Bool)

(assert (=> b!240382 (=> (not res!200670) (not e!166616))))

(assert (=> b!240382 (= res!200670 (= (bitIndex!0 (size!5755 (buf!6215 (_2!11115 lt!375446))) (currentByte!11569 (_2!11115 lt!375446)) (currentBit!11564 (_2!11115 lt!375446))) (bvadd (bitIndex!0 (size!5755 (buf!6215 thiss!982)) (currentByte!11569 thiss!982) (currentBit!11564 thiss!982)) nBits!288)))))

(declare-fun b!240383 () Bool)

(declare-fun array_inv!5496 (array!13141) Bool)

(assert (=> b!240383 (= e!166613 (array_inv!5496 (buf!6215 thiss!982)))))

(assert (= (and start!52210 res!200671) b!240380))

(assert (= (and b!240380 res!200669) b!240381))

(assert (= (and b!240381 res!200672) b!240382))

(assert (= (and b!240382 res!200670) b!240379))

(assert (= (and b!240379 res!200673) b!240378))

(assert (= start!52210 b!240383))

(declare-fun m!362859 () Bool)

(assert (=> b!240381 m!362859))

(declare-fun m!362861 () Bool)

(assert (=> b!240381 m!362861))

(declare-fun m!362863 () Bool)

(assert (=> b!240381 m!362863))

(declare-fun m!362865 () Bool)

(assert (=> b!240381 m!362865))

(declare-fun m!362867 () Bool)

(assert (=> b!240381 m!362867))

(declare-fun m!362869 () Bool)

(assert (=> b!240383 m!362869))

(assert (=> b!240382 m!362865))

(assert (=> b!240382 m!362863))

(declare-fun m!362871 () Bool)

(assert (=> b!240380 m!362871))

(assert (=> b!240379 m!362861))

(declare-fun m!362873 () Bool)

(assert (=> start!52210 m!362873))

(declare-fun m!362875 () Bool)

(assert (=> b!240378 m!362875))

(declare-fun m!362877 () Bool)

(assert (=> b!240378 m!362877))

(declare-fun m!362879 () Bool)

(assert (=> b!240378 m!362879))

(assert (=> b!240378 m!362859))

(push 1)

(assert (not start!52210))

(assert (not b!240383))

(assert (not b!240380))

(assert (not b!240381))

(assert (not b!240379))

(assert (not b!240382))

(assert (not b!240378))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

